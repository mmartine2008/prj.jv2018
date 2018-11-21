unit URepDenunciaBaja;

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
  TFREPDenunciaBaja = class(TFUniversal)
    ACSalir: TAction;
    PopupMenu1: TPopupMenu;
    Salir1: TMenuItem;
    GBFechas: TGroupBox;
    DTPInicio: TDateTimePicker;
    DTPFin: TDateTimePicker;
    LabelDesde: TLabel;
    LabelHasta: TLabel;
    DSDenunciaBaja: TDataSource;
    IBQDenunciaBaja: TIBQuery;
    ACImprimirReporte: TAction;
    IBQAux: TIBQuery;
    DBLCBATipodeBaja: TDBLookupComboBoxAuto;
    DSConsultaTiposServicios: TDataSource;
    IBQConsultaTiposBaja: TIBQuery;
    CBTipodeBaja: TCheckBox;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
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
    procedure ACSalirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ACImprimirReporteExecute(Sender: TObject);
    procedure activarQuery;
    procedure calcularFechas;
    procedure IBQDenunciaBajaAfterOpen(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure CBTipodeBajaClick(Sender: TObject);
    procedure DBLCBATipodeBajaCloseUp(Sender: TObject);
    procedure DBLCBATipodeBajaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DTPCloseUpFechas(Sender: TObject);
    procedure DTPInicioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LActividadClick(Sender: TObject);
    procedure LActividadMouseEnter(Sender: TObject);
    procedure LActividadMouseLeave(Sender: TObject);
    procedure CBActividadClick(Sender: TObject);
    procedure DBLCBAActividadCloseUp(Sender: TObject);
    procedure DBLCBAActividadKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    SQLBase : String;
    SQLGeneral : String;
    conBaja : Boolean;
    conActividad : Boolean;    
    cantidadAnimales: Integer;
  protected
    procedure ComponentesVisiblesPorPais(pais: Integer);override;    
  public
    { Public declarations }
  end;

var
  FREPDenunciaBaja: TFREPDenunciaBaja;

implementation

uses UPrincipal,uTiposGlobales, DateUtils, UREPFichaAnimal, UCartel,
     UABMActividad, UABMSimple, UTraduccion,
     UDOSRADenunciaBajaNuevosPreview;

{$R *.dfm}

procedure TFREPDenunciaBaja.ACSalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

procedure TFREPDenunciaBaja.FormShow(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  inherited;
  {cartel:= TCartel.getInstance();
  msje:= 'Calculando la denuncia de servicio ...';
  cartel.abrircartel(msje); }
  //calcularFechas;
  DTPInicio.Date := IncYear(now,-1);
  DTPFin.Date := now;

  self.Caption := Traducir('Huella - Denuncia de Baja');
  self.PTitulo.Caption := Traducir('Denuncia de Baja');

  IBQConsultaTiposBaja.Close;
  IBQConsultaTiposBaja.Open;

  DMSoftvet.IBQAfterOpen(IBQConsultaTiposBaja);

  SQLBase := 'select * from get_denuncia_baja(:esta, :inicio, :fin, :tipo_baja, :actividad)';
  SQLGeneral := SQLBase + ' order by rp_animal Asc';

  {cartel.cerrarcartel();
  cartel.FreeInstance();    }
  ComponentesVisiblesPorPais(FPrincipal.Pais);
  activarQuery;

end;

procedure TFREPDenunciaBaja.ACImprimirReporteExecute(Sender: TObject);
var
  cartel : TCartel;
  val : Integer;
  F1 : TFDOSRADenunciaBajaNuevosPreview;
begin
  MostrarMensajeImpresion();
  inherited;
  cartel := TCartel.getInstance();
  cartel.abrircartel('Generando Reporte de Denuncia de Servicios...');


              F1 := TFDOSRADenunciaBajaNuevosPreview.Create(self);
              cartel.cerrarcartel;
              cartel.FreeInstance;
              F1.qrlabel25.Caption:= '';
              F1.qrlabel26.Caption:= '';
              F1.qrlabel4.Caption:= '';
              F1.qrlabel28.Caption:= '';
              F1.qrlabel13.Caption:= '';
              F1.qrlabel26.Caption:= EARaza.Text;
              //F1.qrlabel4.Caption:= EACriador.Text;
              F1.qrlabel25.Caption:= EACriadorNumero.Text+' '+EACriador.Text;
              F1.qrlabel28.Caption:= EAFolio.Text;
              F1.QRLabel13.Caption:= IntToStr(cantidadAnimales);
              if TryStrToInt(EAFolio.Text,val) then
                F1.nro_folio := val
              else
                F1.nro_folio := -1;
              F1.ShowModal;
              //F.QR.PreviewModal;
              F1.Destroy;



end;

// calcula automaticamente las fechas
procedure TFREPDenunciaBaja.calcularFechas;
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
procedure TFREPDenunciaBaja.activarQuery;
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Calculando la denuncia de servicio ...';
  cartel.abrircartel(msje);

  IBQDenunciaBaja.Active := false;
  IBQDenunciaBaja.SQL.Clear;
  IBQDenunciaBaja.SQL.Add(SQLGeneral);
  if (conBaja) then
    IBQDenunciaBaja.ParamByName('tipo_baja').Value := DBLCBATipodeBaja.KeyValue
  else
    IBQDenunciaBaja.ParamByName('tipo_baja').Value := null;
  IBQDenunciaBaja.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDenunciaBaja.ParamByName('inicio').AsDateTime := DTPInicio.DateTime;
  IBQDenunciaBaja.ParamByName('fin').AsDateTime := DTPFin.DateTime;

  if (conActividad) then
    IBQDenunciaBaja.ParamByName('actividad').Value := DBLCBAActividad.KeyValue
  else
      IBQDenunciaBaja.ParamByName('actividad').Value := null;
     
  cantidadAnimales := 0;
  IBQDenunciaBaja.Active := true;

  cartel.cerrarcartel();
  cartel.FreeInstance();
end;


procedure TFREPDenunciaBaja.IBQDenunciaBajaAfterOpen(DataSet: TDataSet);

begin
  inherited;

  IBQDenunciaBaja.First;
  while (not IBQDenunciaBaja.Eof) do
    begin
      if (DataSet.FieldByName('rp_animal').value <> null) then
         inc(cantidadAnimales);

      IBQDenunciaBaja.Next;
    end;
  IBQDenunciaBaja.First;
  //  IBQDenunciaServicio.Last;
//  IBQDenunciaServicio.First;
  DBGrid1.DataSource := DSDenunciaBaja;
  GroupBox1.Caption := Traducir('Animales [')+IntToStr(cantidadAnimales){IntToStr(IBQDenunciaServicio.RecordCount)}+']';
  {BBImprimirReporte.Enabled := not(IBQDenunciaBaja.IsEmpty);
  BBXls.Enabled := not(IBQDenunciaBaja.IsEmpty);}
  IPreview.Enabled := not(IBQDenunciaBaja.IsEmpty);
  LPreview.Enabled := not(IBQDenunciaBaja.IsEmpty);
  LExpExcel.Enabled := not(IBQDenunciaBaja.IsEmpty);
  IExpExcel.Enabled := not(IBQDenunciaBaja.IsEmpty);
end;

procedure TFREPDenunciaBaja.DBGrid1DblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (DBGrid1.SelectedIndex = 0) then
    if not(IBQDenunciaBaja.eof) then
     begin
      if (IBQDenunciaBaja.fieldByName('id_animal').AsInteger <> 0) then
        begin
          F := TFREPFichaAnimal.Create(self);
          F.animal := IBQDenunciaBaja.fieldByName('id_animal').AsInteger;
          F.ShowModal;
          F.Destroy;
        end;  
     end;
end;

procedure TFREPDenunciaBaja.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPDenunciaBaja.CBTipodeBajaClick(Sender: TObject);
begin
  inherited;
  if (CBTipodeBaja.Checked) then
  begin
    DBLCBATipodeBaja.Enabled := true;
    //SQLGeneral := SQLBase+' where tipo=:servicio order by rp_animal Asc';
    conBaja := true;

  end
  else
  begin
    DBLCBATipodeBaja.Enabled := false;
    DBLCBATipodeBaja.KeyValue:=-1;
    conBaja := false;
    //SQLGeneral := SQLBase + ' order by rp_animal Asc';
    activarQuery();
  end;

end;

procedure TFREPDenunciaBaja.DBLCBATipodeBajaCloseUp(
  Sender: TObject);
begin
  inherited;
  activarQuery();
end;

procedure TFREPDenunciaBaja.DBLCBATipodeBajaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBATipodeBaja.ListVisible) then
     activarQuery();
end;

procedure TFREPDenunciaBaja.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    DBGrid1DblClick(nil);
end;

procedure TFREPDenunciaBaja.DTPCloseUpFechas(Sender: TObject);
begin
  inherited;
  activarQuery;
end;

procedure TFREPDenunciaBaja.DTPInicioKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePicker(Sender).DroppedDown) then
    DTPcloseUpFechas(Sender);
end;

procedure TFREPDenunciaBaja.ComponentesVisiblesPorPais(pais: Integer);
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
     end
   else
       begin
          GroupBox3.Visible:= False;
       end;
end;

procedure TFREPDenunciaBaja.LActividadClick(Sender: TObject);
var abm:TFABMActividad;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm:=TFABMActividad.Create(Self);
      abm.abrir(faAbm);
      //FPrincipal.AbrirFormNormal(TFABMActividad.Create(Self));
      DMSoftvet.IBQActividad.Close;
      DMSoftvet.IBQActividad.Open;
      if nroID>-1 then
        begin
        DBLCBAActividad.KeyValue:=nroID;
        nroID:=-1;
        //GetEvent(DBLCBAActividad);
        end;
    end;
end;

procedure TFREPDenunciaBaja.LActividadMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LActividad.Font.Color:= $00606C02;
      LActividad.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFREPDenunciaBaja.LActividadMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LActividad.Font.Color:= clWindowText;
      LActividad.Font.Style:= [fsUnderline];
    end;
end;

procedure TFREPDenunciaBaja.CBActividadClick(Sender: TObject);
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
    activarQuery();
  end;
end;

procedure TFREPDenunciaBaja.DBLCBAActividadCloseUp(Sender: TObject);
begin
  inherited;
  activarQuery();
end;

procedure TFREPDenunciaBaja.DBLCBAActividadKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBAActividad.ListVisible) then
     activarQuery();
end;

end.

