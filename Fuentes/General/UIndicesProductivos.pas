unit UIndicesProductivos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, Buttons, PngImage, JvExExtCtrls, JvImage, jpeg,
  ComboBoxAuto, EditAuto, DateUtils, ImgList, PngImageList;

type
  TFIndicesProductivos = class(TFUniversal)
    PBotones: TPanel;
    lbl_Remaining: TLabel;
    Image5: TImage;
    JvCancelar: TJvImage;
    JvAceptar: TJvImage;
    Label1: TLabel;
    Label2: TLabel;
    JvImage1: TJvImage;
    Label3: TLabel;
    ProgressBar: TProgressBar;
    BBAceptar: TBitBtn;
    BBCancelar: TBitBtn;
    BBAyuda: TBitBtn;
    PCli: TPanel;
    Label4: TLabel;
    LFechaStock: TLabel;
    ETeros: TEdit;
    EKgTero: TEdit;
    EPrecioTero: TEdit;
    ETeras: TEdit;
    EKgTera: TEdit;
    EPrecioTera: TEdit;
    ENovillos: TEdit;
    EKgNovillos: TEdit;
    EPrecioNovillos: TEdit;
    EVaqs: TEdit;
    EKgVaqs: TEdit;
    EPrecioVqs: TEdit;
    EVacas: TEdit;
    EKgVaca: TEdit;
    EPrecioVaca: TEdit;
    EToros: TEdit;
    EKgToro: TEdit;
    EPrecioToro: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    IBQAnimales: TIBQuery;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    LTotal: TLabel;
    ESuperficie: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit1: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    EServicioA: TEdit;
    Label20: TLabel;
    EpreniezA: TEdit;
    Label21: TLabel;
    EParicionA: TEdit;
    Label22: TLabel;
    EDesteteA: TEdit;
    Label23: TLabel;
    ECargaKgA: TEdit;
    Label24: TLabel;
    ECargaCabA: TEdit;
    Label25: TLabel;
    ECargaEVA: TEdit;
    Label26: TLabel;
    EEficienciaA: TEdit;
    IBQIndiceProc: TIBQuery;
    Label27: TLabel;
    EServicioC: TEdit;
    EpreniezC: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    EPartoC: TEdit;
    EDesteteC: TEdit;
    Label30: TLabel;
    Ptop: TPanel;
    EAAnio: TEditAuto;
    Label31: TLabel;
    CBAServicio: TComboBoxAuto;
    Label32: TLabel;
    Label33: TLabel;
    LFin: TLabel;
    LIni: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    IBQTipoServicios: TIBQuery;
    IBQExistPromEV: TIBQuery;
    IBQExistPromEVPROMEDIOEXISTENCIA: TFloatField;
    IBQExistPromEVTOTALEXISTENCIA: TFloatField;
    Label36: TLabel;
    LTeroPrenA: TLabel;
    LTeroParA: TLabel;
    LTeroDestA: TLabel;
    Label37: TLabel;
    LCapTeroPreA: TLabel;
    LCapTeroParA: TLabel;
    LCapTeroDestA: TLabel;
    LCapServA: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    LCapServ: TLabel;
    LCapPren: TLabel;
    LTeroPren: TLabel;
    LTeroPar: TLabel;
    LTeroDest: TLabel;
    LCapDest: TLabel;
    LCapPar: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure EAAnioChange(Sender: TObject);
    procedure CBAServicioChange(Sender: TObject);
    procedure ESuperficieChange(Sender: TObject);
    procedure EKgChange(Sender: TObject);
    procedure EPrecioChange(Sender: TObject);
    procedure EServicioCChange(Sender: TObject);
    procedure EpreniezCChange(Sender: TObject);
    procedure EPartoCChange(Sender: TObject);
    procedure EDesteteCChange(Sender: TObject);
    procedure JvCancelarClick(Sender: TObject);
  private
    cant_animales : Integer;
    Anio : Integer;
    Fecha_Ini, Fecha_Fin : TDate;
    ServicioPrimavera : Boolean;
    cant_servicio, cant_preniez, cant_parto, cant_dest : Integer;
    superficie : Integer;
    kgtero, kgtera, kgvq, kgnov, kgvaca, kgtoro : double;
    preciotero, preciotera, precionov, preciovq, preciovaca, preciotoro : double;
    cant_servicio_S, por_pren_S, por_par_S, por_dest_S : Double;
    procedure CalcularIndicesRep;
    procedure BuscarTipoServicio;
    procedure ActualizarConsulta;
    procedure ActualizarDatosSuperficies;
    procedure ActualizarCapital;
    procedure CalcularDatosSimulados;
  public
    { Public declarations }
  end;

var
  FIndicesProductivos: TFIndicesProductivos;

implementation

{$R *.dfm}

uses
  UPrincipal, UMensajeHuella;

procedure TFIndicesProductivos.FormCreate(Sender: TObject);
begin
  inherited;
  kgnov := 0;
  kgtera := 0;
  kgtero := 0;
  kgtoro := 0;
  kgvaca := 0;
  kgvq := 0;
  precionov := 0;
  preciotera := 0;
  preciotero := 0;
  preciotoro := 0;
  preciovaca := 0;
  preciovq := 0;

  IBQAnimales.Close;
  IBQAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAnimales.Open;
  cant_animales := 0;
  LFechaStock.Caption := DateToStr(Date());
  IBQAnimales.First;
  while not IBQAnimales.Eof do
  begin
    case IBQAnimales.FieldValues['categoria'] of
      1 : ETeros.Text := IntToStr(IBQAnimales.FieldValues['cant']);
      2 : ENovillos.Text := IntToStr(IBQAnimales.FieldValues['cant']);
      3 : EToros.Text := IntToStr(IBQAnimales.FieldValues['cant']);
      4 : ETeras.Text := IntToStr(IBQAnimales.FieldValues['cant']);
      5 : EVaqs.Text := IntToStr(IBQAnimales.FieldValues['cant']);
      6 : EVacas.Text := IntToStr(IBQAnimales.FieldValues['cant']);
    end;
    cant_animales := cant_animales + IBQAnimales.FieldValues['cant'];
    IBQAnimales.Next;
  end;
  LTotal.Caption := IntToStr(cant_animales);
end;

procedure TFIndicesProductivos.EAAnioChange(Sender: TObject);
var
  valor : Integer;
begin
  inherited;
  if TryStrToInt(EAAnio.Text,valor) then
    if (valor > 1990) and  (valor < 9999) then
    begin
      Anio := Word(valor);
      BuscarTipoServicio();
    end;
end;

procedure TFIndicesProductivos.CBAServicioChange(Sender: TObject);
begin
  inherited;
  if CBAServicio.ItemIndex = 0 then ServicioPrimavera := true;
  if CBAServicio.ItemIndex = 1 then ServicioPrimavera := false;

  if (EAAnio.Text <> '') then
    BuscarTipoServicio()
  else
    MostrarMensaje(tmAdvertencia,'No se especificó el año del servicio.');
end;

procedure TFIndicesProductivos.BuscarTipoServicio();
var
  Fecha : TDate;
  Dia, Mes, a : Word;
  FS : TFormatSettings;
begin
  GetLocaleFormatSettings(Windows.GetSystemDefaultLCID,FS);
  IBQTipoServicios.Close;
  IBQTipoServicios.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  if ServicioPrimavera then
    IBQTipoServicios.ParamByName('PARAM').AsInteger := 50
  else
    IBQTipoServicios.ParamByName('PARAM').AsInteger := 52;
  IBQTipoServicios.Open;
  Fecha := StrToDate(IBQTipoServicios.FieldValues['VALOR']);
  DecodeDate(Fecha,a,Mes,Dia);
  Fecha_Ini := EncodeDate(Anio,Mes,Dia);
  Fecha_Fin := IncMonth(Fecha_Ini,6);
  Fecha_Fin := IncDay(Fecha_Fin,-1);
  FS.ShortDateFormat := 'dd - MMMM - yyyy';
  LIni.Caption := DateToStr(Fecha_Ini,FS);
  LFin.Caption := DateToStr(Fecha_Fin,FS);
  ActualizarConsulta();
end;

procedure TFIndicesProductivos.ActualizarConsulta;
begin
  IBQIndiceProc.Close;
  IBQIndiceProc.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  IBQIndiceProc.ParamByName('FECHA_INI').AsDate := Fecha_Ini;
  IBQIndiceProc.ParamByName('FECHA_FIN').AsDate := Fecha_Fin;
  IBQIndiceProc.Open;
  IBQExistPromEV.Close;
  IBQExistPromEV.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQExistPromEV.ParamByName('ACTIVIDAD').AsInteger := 2;
  IBQExistPromEV.ParamByName('DESDE').AsDate := EncodeDate(Anio,1,1);
  IBQExistPromEV.ParamByName('HASTA').AsDate := IncYear(EncodeDate(Anio,1,1),1);
  IBQExistPromEV.Open;
  CalcularIndicesRep;
  ActualizarDatosSuperficies;
  ActualizarCapital;
  CalcularDatosSimulados;
end;

procedure TFIndicesProductivos.CalcularIndicesRep;
begin
  cant_dest := 0;
  cant_parto := 0;
  cant_preniez := 0;
  cant_servicio := 0;
  IBQIndiceProc.First;
  while not IBQIndiceProc.Eof do
  begin
    {if IBQIndiceProc.FieldValues['tactado'] <> null then
      if IBQIndiceProc.FieldValues['tactado'] = 'S' then}
    Inc(cant_servicio);
    if IBQIndiceProc.FieldValues['preniada'] <> null then
      if IBQIndiceProc.FieldValues['preniada'] = 'S' then
        Inc(cant_preniez);
    if IBQIndiceProc.FieldValues['parto'] <> null then
      if IBQIndiceProc.FieldValues['parto'] = 'S' then
        Inc(cant_parto);
    if IBQIndiceProc.FieldValues['destete_1'] <> null then
      if IBQIndiceProc.FieldValues['destete_1'] = 'S' then
        Inc(cant_dest);
    if IBQIndiceProc.FieldValues['destete_2'] <> null then
      if IBQIndiceProc.FieldValues['destete_2'] = 'S' then
        Inc(cant_dest);
    if IBQIndiceProc.FieldValues['destete_3'] <> null then
      if IBQIndiceProc.FieldValues['destete_3'] = 'S' then
        Inc(cant_dest);
    IBQIndiceProc.Next;
  end;
  if cant_servicio > 0 then
    EServicioA.Text := IntToStr(cant_servicio);
  if cant_servicio > 0 then
  begin
    if cant_preniez > 0 then
      EpreniezA.Text := FormatFloat('##.##',((cant_preniez*100)/cant_servicio));
    if cant_parto > 0 then
      EParicionA.Text := FormatFloat('##.##',((cant_parto*100)/cant_servicio));
    if cant_dest > 0 then
      EDesteteA.Text := FormatFloat('##.##',((cant_dest*100)/cant_servicio));
  end;
  LTeroPrenA.Caption := IntToStr(cant_preniez);
  LTeroParA.Caption := IntToStr(cant_parto);
  LTeroDestA.Caption := IntToStr(cant_dest);
end;

procedure TFIndicesProductivos.ESuperficieChange(Sender: TObject);
var
  valor : Integer;
begin
  inherited;
  if TryStrToInt(ESuperficie.Text,valor) then
    if valor >  0 then
    begin
      superficie := valor;
      ActualizarConsulta;
    end;
end;

procedure TFIndicesProductivos.ActualizarDatosSuperficies;
var
  promkg : Double;
  cant_dato : integer;
begin
  promkg := 0;
  cant_dato := 0;
  if kgnov > 0 then
    Inc(cant_dato);
  if kgtera > 0 then
    Inc(cant_dato);
  if kgtero > 0 then
    Inc(cant_dato);
  if kgtoro > 0 then
    Inc(cant_dato);
  if kgvaca > 0 then
    Inc(cant_dato);
  if kgvq > 0 then
    Inc(cant_dato);

  if cant_dato > 0 then
    promkg := (kgnov+kgtera+kgtero+kgtoro+kgvaca+kgvq)/cant_dato;
  if superficie > 0 then
    ECargaKgA.Text := FormatFloat('##.##',promkg/superficie);
  if superficie > 0 then
    ECargaCabA.Text := FormatFloat('##.##',cant_animales/superficie);
  if IBQExistPromEV.FieldValues['TOTALEXISTENCIA'] <> null then
    if superficie > 0 then
      ECargaEVA.Text := FormatFloat('##.##',IBQExistPromEV.FieldValues['TOTALEXISTENCIA']/superficie);
end;

procedure TFIndicesProductivos.EPrecioChange(Sender: TObject);
var
  d : double;
begin
  inherited;
  if TryStrToFloat((Sender as TEdit).Text,d) then
    if d > 0 then
    begin
      case (Sender as TEdit).Tag of
        1 : preciotero := d;
        2 : preciotera := d;
        3 : precionov := d;
        4 : preciovq := d;
        5 : preciovaca := d;
        6 : preciotoro := d;
      end;
      //ActualizarConsulta;
      CalcularDatosSimulados;
      ActualizarCapital;
    end;
end;

procedure TFIndicesProductivos.ActualizarCapital;
var
  precioPromTero, precioPromVAc, pesoPromVAc, pesoPromTero : Double;
  Cant : Integer;
begin
  Cant := 0;
  if preciotero > 0 then
    Inc(Cant);
  if preciotera > 0 then
    Inc(Cant);
  if Cant > 0 then
    precioPromTero := (preciotera+preciotero)/Cant;
  Cant := 0;
  if kgtera > 0 then
    Inc(Cant);
  if kgtero > 0 then
    Inc(Cant);
  if Cant > 0 then
    pesoPromTero := (kgtera+kgtero)/Cant;


  Cant := 0;
  if preciovaca > 0 then
    Inc(Cant);
  if preciovq > 0 then
    Inc(Cant);
  if Cant > 0 then
    precioPromVAc := (preciovaca+preciovq)/Cant;
  Cant := 0;
  if kgvaca > 0 then
    Inc(Cant);
  if kgvq > 0 then
    Inc(Cant);
  if Cant > 0 then
    pesoPromVAc := (kgvaca+kgvq)/Cant;


  if (EServicioA.Text <> '') then
    LCapServA.Caption := FormatFloat('##.##',StrToInt(EServicioA.Text)*pesoPromVAc*precioPromVAc)
  else
    LCapServA.Caption := '';

  if (LTeroPrenA.Caption <> '') then
    LCapTeroPreA.Caption := FormatFloat('##.##',StrToInt(LTeroPrenA.Caption)*pesoPromTero*precioPromTero);

  if (LTeroParA.Caption <> '') then
    LCapTeroParA.Caption := FormatFloat('##.##',StrToInt(LTeroParA.Caption)*pesoPromTero*precioPromTero);

  if (LTeroDestA.Caption <> '') then
    LCapTeroDestA.Caption := FormatFloat('##.##',StrToInt(LTeroDestA.Caption)*pesoPromTero*precioPromTero);
    
end;

procedure TFIndicesProductivos.EKgChange(Sender: TObject);
var
  d : double;
begin
  inherited;
  if TryStrToFloat((Sender as TEdit).Text,d) then
    if d > 0 then
    begin
      case (Sender as TEdit).Tag of
        1 : kgtero := d;
        2 : kgtera := d;
        3 : kgnov := d;
        4 : kgvq := d;
        5 : kgvaca := d;
        6 : kgtoro := d;
      end;
      ActualizarConsulta;
      CalcularDatosSimulados;
    end;
end;

procedure TFIndicesProductivos.CalcularDatosSimulados;
var
  precioPromTero, precioPromVAc, pesoPromVAc, pesoPromTero : Double;
  Cant : Integer;
begin
  Cant := 0;
  if preciotero > 0 then
    Inc(Cant);
  if preciotera > 0 then
    Inc(Cant);
  if Cant > 0 then
    precioPromTero := (preciotera+preciotero)/Cant;
  Cant := 0;
  if kgtera > 0 then
    Inc(Cant);
  if kgtero > 0 then
    Inc(Cant);
  if Cant > 0 then
    pesoPromTero := (kgtera+kgtero)/Cant;


  Cant := 0;
  if preciovaca > 0 then
    Inc(Cant);
  if preciovq > 0 then
    Inc(Cant);
  if Cant > 0 then
    precioPromVAc := (preciovaca+preciovq)/Cant;
  Cant := 0;
  if kgvaca > 0 then
    Inc(Cant);
  if kgvq > 0 then
    Inc(Cant);
  if Cant > 0 then
    pesoPromVAc := (kgvaca+kgvq)/Cant;

  LTeroPren.Caption := FormatFloat('##.##',((cant_servicio_S*por_pren_S)/100));
  LTeroPar.Caption := FormatFloat('##.##',((cant_servicio_S*por_par_S)/100));
  LTeroDest.Caption := FormatFloat('##.##',((cant_servicio_S*por_dest_S)/100));

  LCapServ.Caption := FormatFloat('##.##',(cant_servicio_S)*pesoPromVAc*precioPromVAc);
  LCapPren.Caption := FormatFloat('##.##',((cant_servicio_S*por_pren_S)/100)*pesoPromTero*precioPromTero);
  LCapPar.Caption := FormatFloat('##.##',((cant_servicio_S*por_par_S)/100)*pesoPromTero*precioPromTero);
  LCapDest.Caption := FormatFloat('##.##',((cant_servicio_S*por_dest_S)/100)*pesoPromTero*precioPromTero);

end;

procedure TFIndicesProductivos.EServicioCChange(Sender: TObject);
var
  d : double;
begin
  inherited;
  if TryStrToFloat(EServicioC.Text,d) then
    if d > 0 then
    begin
      cant_servicio_S := d;
      CalcularDatosSimulados;
    end;
end;

procedure TFIndicesProductivos.EpreniezCChange(Sender: TObject);
var
  d : double;
begin
  inherited;
  if TryStrToFloat(EpreniezC.Text,d) then
    if d > 0 then
    begin
      por_pren_S := d;
      CalcularDatosSimulados;
    end;
end;

procedure TFIndicesProductivos.EPartoCChange(Sender: TObject);
var
  d : double;
begin
  inherited;
  if TryStrToFloat(EPartoC.Text,d) then
    if d > 0 then
    begin
      por_par_S := d;
      CalcularDatosSimulados;
    end;
end;

procedure TFIndicesProductivos.EDesteteCChange(Sender: TObject);
var
  d : double;
begin
  inherited;
  if TryStrToFloat(EDesteteC.Text,d) then
    if d > 0 then
    begin
      por_dest_S := d;
      CalcularDatosSimulados;
    end;
end;

procedure TFIndicesProductivos.JvCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
