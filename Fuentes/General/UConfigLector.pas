unit UConfigLector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, PngImage, JvExExtCtrls, JvImage, jpeg, Registry,
  UPrincipal, VaComm, ULectorAllFlexSerie, ImgList, PngImageList;

type
 { TBaudRate = (br110, br300, br600, br1200, br2400, br4800, br9600, br14400,
               br19200, br38400, br56000, br57600, br115200, br128000, br256000);}
 // TParity   = (paEven, paMark, paNone, paOdd, paSpace);
  TStopBit  = (sb1, sb15, sb2);
  TDataBit  = (db4, db5, db6, db7, db8);

  TFConfigLector = class(TFUniversal)
    PBotones: TPanel;
    IFondoB: TImage;
    JvCancelar: TJvImage;
    JvAceptar: TJvImage;
    LAceptar: TLabel;
    LCancelar: TLabel;
    JvIAyuda: TJvImage;
    LAyuda: TLabel;
    PCli: TPanel;
    PLectores: TPanel;
    Label8: TLabel;
    LBDispositivos: TListBox;
    LDispositivo: TLabel;
    PTop: TPanel;
    CBIDE: TCheckBox;
    PPuerto: TPanel;
    GBConfig: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    IRefresh: TImage;
    LRefresh: TLabel;
    LResult: TLabel;
    EBPS: TEdit;
    EBitParidad: TEdit;
    Eparidad: TEdit;
    EBDatos: TEdit;
    EFlujo: TEdit;
    GBPuertos: TGroupBox;
    LBPuertosSerie: TListBox;
    Label2: TLabel;
    LPuerto: TLabel;
    IClic: TImage;
    IClicOff: TImage;
    IMas: TImage;
    Lconfig: TLabel;
    Imenos: TImage;
    Label1: TLabel;
    LMarcaLector: TLabel;
    LBDispositivosModel: TListBox;
    procedure FormShow(Sender: TObject);
    procedure JvCancelarClick(Sender: TObject);
    procedure LRefreshClick(Sender: TObject);
    procedure LBPuertosSerieClick(Sender: TObject);
    procedure LBDispositivosClick(Sender: TObject);
    procedure JvAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBIDEClick(Sender: TObject);
    procedure IClicOffClick(Sender: TObject);
    procedure IMasClick(Sender: TObject);
    procedure ImenosClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    procedure GetPorts();
    function GetBaud(Val : Integer) : TVaBaudrate;
    function GetParity(Val : Integer) : TVaParity;
    function GetStopBit(Val : Integer) : TStopBit;
    function GetDataBit(Val : Integer) : TDataBit;
    procedure ConectarLector;
  public
    { Public declarations }
  end;

var
  FConfigLector: TFConfigLector;

implementation

{$R *.dfm}

procedure TFConfigLector.GetPorts;
var
  R : TRegistry;
  I : Integer;
begin
  R := TRegistry.Create;
  LBPuertosSerie.Items.Clear;
  try
    R.RootKey := HKEY_LOCAL_MACHINE;
    if R.OpenKey('HARDWARE\DEVICEMAP\SERIALCOMM', false) then
    begin
      R.GetValueNames(LBPuertosSerie.Items);
      for I := 0 to LBPuertosSerie.Items.Count - 1 do
        LBPuertosSerie.Items[i] := R.ReadString(LBPuertosSerie.Items[i]);
    end;
  finally
    R.Free;
  end;
end;

procedure TFConfigLector.FormShow(Sender: TObject);
begin
  inherited;
  GetPorts;
end;

procedure TFConfigLector.JvCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFConfigLector.LRefreshClick(Sender: TObject);
begin
  inherited;
  GetPorts;
end;

function TFConfigLector.GetBaud(Val : Integer) : TVaBaudrate;
begin
  Result := br9600;
  case Val of
    110 : Result := br110;
    300 : Result := br300;
    600 : Result := br600;
    1200 : Result := br1200;
    2400 : Result := br2400;
    4800 : Result := br4800;
    9600 : Result := br9600;
    14400 : Result := br14400;
    19200 : Result := br19200;
    38400 : Result := br38400;
    56000 : Result := br56000;
    57600 : Result := br57600;
    115200 : Result := br115200;
    128000 : Result := br128000;
    256000 : Result := br256000;
  end;
end;

function TFConfigLector.GetParity(Val : Integer) : TVaParity;
begin
  case Val of
    0 : begin
          Result := paNone;
          Eparidad.Text := 'Ninguno';
        end;
    1 : begin
          Result := paOdd;
          Eparidad.Text := 'Impar';
        end;
    2 : begin
          Result := paEven;
          Eparidad.Text := 'Par';
        end;
    3 : begin
          Result := paMark;
          Eparidad.Text := 'Marca';
        end;
    4 : begin
          Result := paSpace;
          Eparidad.Text := 'Espacio';
        end;
  end;
end;

function TFConfigLector.GetDataBit(Val : Integer) : TDataBit;
begin
  case Val of
    4 : Result := db4;
    5 : Result := db5;
    6 : Result := db6;
    7 : Result := db7;
    8 : Result := db8;
  end;
end;

function TFConfigLector.GetStopBit(Val : Integer) : TStopBit;
begin
  case Val of
    0 : Result := sb1;
    1 : begin
          Result := sb15;
          EBitParidad.Text := '1,5';
        end;
    2 : Result := sb2;
  end;
end;

procedure TFConfigLector.LBPuertosSerieClick(Sender: TObject);
var
  CC : _COMMCONFIG;
  C : Cardinal;
begin
  inherited;
  CC.dwSize := SizeOf(CC);
  LPuerto.Caption := LBPuertosSerie.Items[LBPuertosSerie.ItemIndex];
  FPrincipal._PUERTO_S.Puerto := LBPuertosSerie.Items[LBPuertosSerie.ItemIndex];
  GetDefaultCommConfig(PAnsiChar(LBPuertosSerie.Items[LBPuertosSerie.ItemIndex]),CC,CC.dwSize);

  FPrincipal._PUERTO_S.Brate := br9600;//TVaBaudRate(GetBaud(CC.dcb.BaudRate));
  FPrincipal._PUERTO_S.Btooth := false;
  FPrincipal._PUERTO_S.CPort := StrToInt(StringReplace(LBPuertosSerie.Items[LBPuertosSerie.ItemIndex],'COM','',[rfReplaceAll]));
  FPrincipal._PUERTO_S.DBits := TVaDatabits(GetDataBit(CC.dcb.ByteSize));
  FPrincipal._PUERTO_S.FControl := 0;
  FPrincipal._PUERTO_S.IdFabri := 982;
  FPrincipal._PUERTO_S.Pari := paNone;//TvaParity(GetParity(CC.dcb.Parity));
  FPrincipal._PUERTO_S.Puerto := LBPuertosSerie.Items[LBPuertosSerie.ItemIndex];
  FPrincipal._PUERTO_S.SBits := TVaStopbits(GetStopBit(CC.dcb.StopBits));

  EBPS.Text := IntToStr(CC.dcb.BaudRate);
  EBDatos.Text := IntToStr(CC.dcb.ByteSize);
  EBitParidad.Text := IntToStr(CC.dcb.Parity);

  FPrincipal._LECTOR_ONLINE := true;

  ConectarLector;
end;

procedure TFConfigLector.ConectarLector;
var
  F : TLectorAllFlexSerie;
begin
 { F := TLectorAllFlexSerie.Create();//creo segun el que estamos usando
  F.ConfigurarVaComm();
  if F.OpenVAComm = 0 then
    LResult.Caption := 'No se pudo conectar a ningún dispositivo'
  else
    LResult.Caption := 'Se estableció un conexión con el dispositivo';}
end;

procedure TFConfigLector.LBDispositivosClick(Sender: TObject);
var
  L : String;
  D : String;
begin
  inherited;
  L := LBDispositivos.Items[LBDispositivos.ItemIndex];

  if (LBDispositivosModel.ItemIndex <> -1) then
  begin
    D := LBDispositivosModel.Items[LBDispositivosModel.ItemIndex];
  end
  else
  begin
    D := '';
  end;
  
  if L = 'Balanza' then
    begin
      FPrincipal._DISPOSITIVO_EL := 'VSA';
      LMarcaLector.Visible := false;
      //LBListaMarcasLector.Visible := false;
      LBDispositivosModel.visible := false;
      D := '';
    end;
  if L = 'Lector' then
    begin
      FPrincipal._DISPOSITIVO_EL := 'GES';
      FPrincipal._DISPOSITIVO_MODEL := D;
      LMarcaLector.Visible := true;
      //LBListaMarcasLector.Visible := true;
      LBDispositivosModel.visible := true;
    end;
  LDispositivo.Caption := 'Dispositivo seleccionado: '+L +' '+D;
  PPuerto.Visible := true;
end;

procedure TFConfigLector.JvAceptarClick(Sender: TObject);
begin
  inherited;

  FPrincipal._USO_DISP := CBIDE.Checked;
  FPrincipal._LECTOR_ONLINE := FPrincipal._USO_DISP and FPrincipal._LECTOR_ONLINE;
  //FPrincipal.marcalector := 'Allflex';
  //if (LBListaMarcasLector.Visible = true) then
  //  FPrincipal.MarcaLector := LBListaMarcasLector.Items[LBListaMarcasLector.ItemIndex];

  FPrincipal.crearLector;
  Close;
end;

procedure TFConfigLector.FormCreate(Sender: TObject);
begin
  inherited;
  CBIDE.Checked := FPrincipal._USO_DISP;
  FPrincipal._LECTOR_ONLINE := false;
end;

procedure TFConfigLector.CBIDEClick(Sender: TObject);
begin
  inherited;
  IClic.Visible := CBIDE.Checked;
  IClicOff.Visible := not CBIDE.Checked;
  if CBIDE.Checked then
    PLectores.Visible := true;
end;

procedure TFConfigLector.IClicOffClick(Sender: TObject);
begin
  inherited;
  CBIDE.Checked := not CBIDE.Checked;
  CBIDEClick(nil);
end;

procedure TFConfigLector.IMasClick(Sender: TObject);
begin
  inherited;
  IMas.Visible := false;
  IMenos.Visible := true;
  GBConfig.Visible := true;
  Lconfig.Caption := 'Menos opciones';
end;

procedure TFConfigLector.ImenosClick(Sender: TObject);
begin
  inherited;
  Imas.Visible := true;
  Imenos.Visible := false;
  GBConfig.Visible := false;
  Lconfig.Caption := 'Más opciones';
end;

procedure TFConfigLector.Label1Click(Sender: TObject);
begin
  inherited;
  CBIDE.Checked := not CBIDE.Checked;
  CBIDEClick(nil);
end;

end.
