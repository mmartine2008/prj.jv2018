unit URegistroLicencia;

interface
//{$DEFINE EC}
//{$DEFINE DEMO}
 


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, DCPsha1, DCPrc4, StdCtrls, Buttons,
  IBQuery, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc,
  ActnList, ComCtrls, ExtCtrls, DCPmd5, EditAuto, jpeg, Menus, OleCtrls,WinInet,
  IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP,IniFiles, Registry, JvExControls, JvLabel, JvGIF,
  JvExExtCtrls, JvImage, PngImage, DateUtils, ImgList, PngImageList;

type
  TFRegistroLicencia = class(TFUniversal)
    Panel1: TPanel;
    Image1: TImage;
    Panel4: TPanel;
    SDLicencia: TSaveDialog;
    PMLicencia: TPopupMenu;
    ReportedePedigree1: TMenuItem;
    ReporteIndividual1: TMenuItem;
    GuardarArchivo1: TMenuItem;
    PCGeneral: TPageControl;
    TSUsuario: TTabSheet;
    LUsuario: TLabel;
    Label5: TLabel;
    LTelefono: TLabel;
    LEmail: TLabel;
    EUsuario: TEdit;
    EApellido: TEdit;
    ETelefono: TEdit;
    EEmail: TEdit;
    TSClave: TTabSheet;
    LNumeroSerie: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    LClave: TLabel;
    ENumeroSerie1: TEdit;
    ENumeroSerie2: TEdit;
    ENumeroSerie3: TEdit;
    ENumeroSerie4: TEdit;
    EClave: TEdit;
    TSEnvio: TTabSheet;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    BBOnline: TBitBtn;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    BBEmail: TBitBtn;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    BBoffline: TBitBtn;
    TSLicencia: TTabSheet;
    LLicencia: TLabel;
    ELicencia: TEdit;
    Label3: TLabel;
    LCiudad: TLabel;
    Label6: TLabel;
    LProvincia: TLabel;
    LPais: TLabel;
    EPais: TEdit;
    EProvincia: TEdit;
    ECP: TEdit;
    ECiudad: TEdit;
    EDireccion: TEdit;
    BBAceptar: TBitBtn;
    LNumeroInvalido: TLabel;
    INroSerie: TImage;
    Label10: TLabel;
    LPegarLicencia: TLabel;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    PBotones: TPanel;
    IFondoB: TImage;
    ICancelar: TImage;
    LCancelar: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    JvAnteriror: TJvImage;
    LBBAnterior: TLabel;
    LBBSiguiente: TLabel;
    JvSiguiente: TJvImage;
    ITerminar: TImage;
    LTerminar: TLabel;
    Label11: TLabel;
    procedure BBAceptarClick(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EUsuarioChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ENumeroSerie1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ELicenciaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ENumeroSerie1KeyPress(Sender: TObject; var Key: Char);
    procedure BBEnvioMailLicenciaClick(Sender: TObject);
    procedure EDireccionExit(Sender: TObject);
    procedure EClaveKeyPress(Sender: TObject; var Key: Char);
    procedure EEmailExit(Sender: TObject);
    procedure ELicenciaExit(Sender: TObject);
    procedure ELicenciaChange(Sender: TObject);
    procedure EClaveChange(Sender: TObject);
    procedure EDireccionChange(Sender: TObject);
    procedure ETelefonoChange(Sender: TObject);
    procedure EEmailChange(Sender: TObject);
    procedure ECiudadChange(Sender: TObject);
    procedure EProvinciaChange(Sender: TObject);
    procedure EPaisChange(Sender: TObject);
    procedure ECPChange(Sender: TObject);
    procedure ECPExit(Sender: TObject);
    procedure ReportedePedigree1Click(Sender: TObject);
    procedure ReporteIndividual1Click(Sender: TObject);
    procedure GuardarArchivo1Click(Sender: TObject);
    procedure EUsuarioExit(Sender: TObject);
    procedure BBOnlineClick(Sender: TObject);
    procedure BBEmailClick(Sender: TObject);
    procedure BBofflineClick(Sender: TObject);
    procedure BBAnteriorClick(Sender: TObject);
    procedure BBSiguienteClick(Sender: TObject);
    procedure PCGeneralChange(Sender: TObject);
    procedure TSLicenciaShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    versionHuella: String;
    TipoRegistro: Integer;
    function habilitarBotonMail():boolean;
    procedure guardarLicencia();

    function ControlUsuario : Boolean;
    function ControlClave : Boolean;

    function volverAcaracter(valor_original: integer): string;
    function aBase36(original: string): integer;
    function CrearCheckSun (Modulo: String): String;
    function ChequearClave: Boolean;
    function GetVersionHuella: String;
    {$IFDEF PEN}
    procedure guardarLicenciaEncriptada(Lic,Us,Ap,Dir,CP,Tel,Ciu,Prov,Pais,Email,
                              NS1,NS2,NS3,NS4,verHuella: string;HDSN: Longint);
    function leerLicenciaEncriptada(flag: integer): string;
    procedure regenerarLicenciaIni();
    function encriptar(s: string):string;
    function desencriptar(s: string):string;
    function VerificarSiHayConexion : Boolean;
    function sendEmail(ini: TIniFile): boolean;
    {$ENDIF}
    procedure ControlarBotones;
    procedure CrearArchivoVLF(ID: String);
  public
    { Public declarations }
    EstadoLicencia: string;
    function registrado(keystr,lic:string): boolean;
    function verificacopia:boolean;
    function GivemeHDSerialNumber: LongInt;
    function generarKey(usuario:string):string;
    procedure envioLicencia(tipoEnvio:Integer);
  end;

var
  FRegistroLicencia: TFRegistroLicencia;

implementation

uses
  DCPcrypt2, DCPbase64, UMensajeHuella, UFunctions, UCartel, UPrincipal,
  shellapi,DCPrijndael, Math, UTraduccion;

// Some constants that are dependant on the cipher being used
// Assuming MCRYPT_RIJNDAEL_128 (i.e., 128bit blocksize, 256bit keysize)
const
  KeySize = 32; // 32 bytes = 256 bits
  BlockSize = 16; // 16 bytes = 128 bits

{$R *.dfm}

procedure TFRegistroLicencia.EUsuarioChange(Sender: TObject);
begin
  inherited;
  if ((Trim(EUsuario.Text) <> '') and (Trim(EApellido.Text) <> '') and (Length(Trim(ENumeroSerie1.Text)) = 4) and
      (Length(Trim(ENumeroSerie2.Text)) = 4) and (Length(Trim(ENumeroSerie3.Text)) = 4) and
      (Length(Trim(ENumeroSerie4.Text)) = 4) and (ChequearClave))then
    EClave.Text:=generarKey(EUsuario.Text + EApellido.Text + ENumeroSerie1.Text+ENumeroSerie2.Text+ENumeroSerie3.Text+ENumeroSerie4.Text + versionHuella)
   else
     EClave.Text:= '';

   if ((Trim(EUsuario.Text) <> '') and (Trim(EApellido.Text) <> '') and (Length(Trim(ENumeroSerie1.Text)) = 4) and
      (Length(Trim(ENumeroSerie2.Text)) = 4) and (Length(Trim(ENumeroSerie3.Text)) = 4) and
      (Length(Trim(ENumeroSerie4.Text)) = 4) and not (ChequearClave)) then
   begin
    INroSerie.Visible := true;
    LNumeroInvalido.Visible := true;
   end
   else
   begin
    INroSerie.Visible := false;
    LNumeroInvalido.Visible := false;
   end;

   TSClave.TabVisible := ControlUsuario;
   habilitarBotonMail;
end;

procedure TFRegistroLicencia.BBAceptarClick(Sender: TObject);

begin
  inherited;
  guardarLicencia();

  if registrado(EClave.Text,'') then
    begin
      MostrarMensaje(tmInformacion, 'El producto ha sido registrado a su nombre. Muchas gracias.');
    end
   else
    begin
     MostrarMensaje(tmError, 'La Clave de Registraci�n es inv�lida. Verifique los datos o consulte a su proveedor del producto.');
     Application.Terminate;
    end;

  self.Close;
end;

// Pad a string with zeros so that it is a multiple of size
function PadWithZeros(const str : string; size : integer) : string;
var
  origsize, i : integer;
begin
  Result := str;
  origsize := Length(Result);
  if ((origsize mod size) <> 0) or (origsize = 0) then
  begin
    SetLength(Result,((origsize div size)+1)*size);
    for i := origsize+1 to Length(Result) do
      Result[i] := #0;
  end;
end;


// Encrypt a string and return the Base64 encoded result
function TFRegistroLicencia.registrado(keystr,lic:string): boolean;
var
  Cipher : TDCP_rijndael;
  Data, DataInicial, Key, IV : string;
  ini:TIniFile;
  licencia: String;
begin
  result := false;
  //Ini := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'licencia.ini');
  licencia := lic;
  if (lic = '') then
  begin
  try
    Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'licencia.ini');
    licencia:= Ini.ReadString('config','licencia','');
  finally
    Ini.Destroy;
  end;
  end;

  if length(licencia)=0 then
    licencia:='ni idea';

  // Pad Key and IV with zeros as appropriate
  Key := PadWithZeros(keystr,KeySize);
  IV := PadWithZeros('abcdefghijklmnop',BlockSize);
  // Decode the Base64 encoded string
  Data := Base64DecodeStr(licencia);
  DataInicial:= 'zoilo mas grande que hay';

  // Create the cipher and initialise according to the key length
  Cipher := TDCP_rijndael.Create(Self);
  if Length(keystr) <= 16 then
    Cipher.Init(Key[1],128,@IV[1])
  else if Length(keystr) <= 24 then
    Cipher.Init(Key[1],192,@IV[1])
  else
    Cipher.Init(Key[1],256,@IV[1]);
  // Decrypt the data
  Cipher.DecryptCBC(Data[1],Data[1],Length(Data));
  // Free the cipher and clear sensitive information
  Cipher.Free;
  FillChar(Key[1],Length(Key),0);
  // Display the result

  if strcomp(pchar(Data),pchar(DataInicial))=0 then
    result:=true;
end;



{function TFRegistroLicencia.registrado2(keystr:string): boolean;
var
  Cipher: TDCP_rc4;
  res,clave,licencia,usu: string;
  ini:TIniFile;

begin
//   licencia:=ELicencia.text;//'';//ini.readstring('config','licencia','');

  Ini := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'licencia.ini');
  licencia:= Ini.ReadString('config','licencia','');

  if length(licencia)=0 then
    licencia:='ni idea';

   Cipher:= TDCP_rc4.Create(Self);
   Cipher.InitStr(KeyStr,TDCP_sha1);         // initialize the cipher with a hash of the passphrase
   res:= Cipher.DecryptString(licencia);
   Cipher.Burn;
   Cipher.Free;
   clave:='zoilo mas grande que hay';
   result:=false;
   if strcomp(pchar(res),pchar(clave))=0 then
      result:=true;
   
   //ini.Destroy;
end;  }

function TFRegistroLicencia.generarKey(usuario: string): string;
var
    Hash: TDCP_md5;
    Digest: array[0..15] of byte;  // md5 produces a 128bit digest (16bytes)
    Source,s: string;
    i: integer;
 {	{$IFDEF CLOUD}                   // para huella las lilas TermServ cloud
	{	crypt: TRegistry;              // diferente registracion
	{$ELSE}
		hd:longint;                  //  original
 {	{$ENDIF}
begin
{ //$IFDEF CLOUD}                              //inicio modif Jose
 {		crypt := TRegistry.Create(KEY_READ);
		try
			crypt.RootKey := HKEY_LOCAL_MACHINE;
			if crypt.OpenKeyReadOnly('\SOFTWARE\Microsoft\Cryptography') then
			begin
				source:=crypt.ReadString('MachineGuid');             //uuid windows
			end;
			crypt.CloseKey;
		finally
			crypt.Free;
		end;
	{$ELSE}
	{	hd:=self.GivemeHDSerialNumber;          // original     //uuid disco rigido
		source := inttostr(hd);                 // original
	{$ENDIF}                                //   Fin  modif Jose


    hd:=-1205522404;

  /// esto es lo que quedo para lic las lilas

//// anterior agregado para no check licencia----


    source := source + usuario;
    s:= '';
    Hash:= TDCP_md5.Create(Self);          // create the hash
    Hash.Init;                                   // initialize it
    if length(source)>0 then
    begin
      Hash.UpdateStr(Source);       // hash the stream contents
      Hash.Final(Digest);                          // produce the digest
      for i:= 0 to 15 do
        s:= s + IntToHex(Digest[i],2);
    end;
    hash.Burn;
    hash.Free;
    Result:= s;
end;

function TFRegistroLicencia.GivemeHDSerialNumber: LongInt;
var
  pdw1 : Windows.pDWord;
  mc1, fl : Windows.dword;
begin
  New(pdw1);
  GetVolumeInformation(nil,nil,0,pdw1,mc1,fl,nil,0);
  Result := pdw1^;
  dispose(pdw1);
end;

procedure TFRegistroLicencia.BBCancelarClick(Sender: TObject);
begin
  inherited;
  guardarLicencia();
  MostrarMensaje(tmInformacion,'No podra utilizar Huella hasta que no haya finalizado el registro de la licencia.');
  Self.Close;
end;

procedure TFRegistroLicencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 // if (Length(Trim(ELicencia.Text))<=3) then
   // application.Terminate;
  if not registrado(EClave.Text,'') then
    application.Terminate;
end;

function TFRegistroLicencia.verificacopia: boolean;
var ini,huellaini:TIniFile;
  u, apellido, ns1, ns2, ns3, ns4, versionAux:string;
  {$IFDEF PEN}
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  res: cardinal;
  randomNumber: integer;
  {$ENDIF}
begin
  try
    //Ini := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'licencia.ini');
    Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'licencia.ini');
    u:=ini.ReadString('config','usuario','');
    apellido:=ini.ReadString('config','apellido','');
    ns1:=ini.ReadString('config','nroserie1','');
    ns2:=ini.ReadString('config','nroserie2','');
    ns3:=ini.ReadString('config','nroserie3','');
    ns4:=ini.ReadString('config','nroserie4','');
    versionHuella:= GetVersionHuella;
    versionAux:=ini.ReadString('config','version','');

    {$IFDEF DEMO}
      Result := true;
      exit;
    {$ENDIF}


  {$IFDEF PEN}
    try
      huellaini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'huella.ini');
      EstadoLicencia := huellaini.ReadString('Sistema','EstadoLicencia','');
      if (EstadoLicencia = '') then //No existe la clave en el ini
      begin
        huellaini.WriteString('Sistema','EstadoLicencia','1'); // Creo la clave en el ini
        EstadoLicencia := huellaini.ReadString('Sistema','EstadoLicencia','');
      end;
    finally
      huellaini.Destroy;
    end;

    if FileExists(ExtractFilePath(Application.ExeName)+'Licencia.exe') then
    begin
      EstadoLicencia := '3';
      Randomize;
      randomNumber := Random(2147029311);
      FillChar(StartInfo, SizeOf(StartInfo), 0);
      StartInfo.cb := SizeOf(StartInfo);
      StartInfo.dwFlags := STARTF_USESHOWWINDOW;
      StartInfo.wShowWindow := SW_HIDE;
      if CreateProcess(Nil,pChar(ExtractFilePath(Application.ExeName)+'Licencia.exe '+IntToStr(randomNumber)), nil, nil, false, 0,nil, nil, StartInfo, ProcInfo) then
      begin
        if (ProcInfo.hProcess <> 0) then
          WaitForSingleObject(ProcInfo.hProcess,INFINITE);
        GetExitCodeProcess(ProcInfo.hProcess,res);
        if ((res - randomNumber) = 454335) then
          Result := true
        else
          Result := false;
      end;
      exit;
    end
    else if EstadoLicencia = '3' then
      try
        huellaini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'huella.ini');
        huellaini.WriteString('Sistema','EstadoLicencia','1');
        EstadoLicencia := huellaini.ReadString('Sistema','EstadoLicencia','');
      finally
        huellaini.Destroy;
      end;

  {$ENDIF}
    {$IFDEF PEN}
    if EstadoLicencia <> '3' then
    begin
    {$ENDIF}
      if (versionAux = versionHuella) then
      begin
        result:=registrado(generarKey(u+apellido+ns1+ns2+ns3+ns4+versionHuella),'');
        {$IFDEF PEN}
        if Result then //si la licencia del ini esta OK
        begin
          //y no existe el archivo de respaldo, entonces lo creo
          if not FileExists(ExtractFilePath(Application.ExeName)+'licencia.rhp') then
            guardarLicenciaEncriptada(ini.ReadString('config','licencia',''),u,
                                  apellido,ini.ReadString('config','direccion',''),
                                  ini.ReadString('config','cp',''),
                                  ini.ReadString('config','telefono',''),
                                  ini.ReadString('config','ciudad',''),
                                  ini.ReadString('config','provincia',''),
                                  ini.ReadString('config','pais',''),
                                  ini.ReadString('config','email',''),ns1,ns2,ns3,ns4,
                                  versionAux,GivemeHDSerialNumber);
          if EstadoLicencia = '1' then
          begin
            //chequeo conexion a internet
            if VerificarSiHayConexion then
              if sendEmail(TIniFile.Create(ExtractFilePath(Application.ExeName)+'licencia.ini')) then //Envio el mail
              begin
                try
                  huellaini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'huella.ini');
                  huellaini.WriteString('Sistema','EstadoLicencia','2'); // Creo la clave en el ini
                finally
                  huellaini.Destroy;
                end;
              end;
          end;
        end
        else
        begin
          Result := registrado(generarKey(leerLicenciaEncriptada(0)),leerLicenciaEncriptada(1));
          if Result then
          begin
            regenerarLicenciaIni();
            if EstadoLicencia = '1' then
            begin
              //chequeo conexion a internet
              if VerificarSiHayConexion then
                if sendEmail(TIniFile.Create(ExtractFilePath(Application.ExeName)+'licencia.ini')) then //Envio el mail
                begin
                  try
                    huellaini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'huella.ini');
                    huellaini.WriteString('Sistema','EstadoLicencia','2'); // Creo la clave en el ini
                  finally
                    huellaini.Destroy;
                  end;
                end;
            end;
          end;
        end;
        {$ENDIF}
      end
      else
        result:= false;
    {$IFDEF PEN}
    end
    else
      Result := false;
    {$ENDIF}
  finally
    Ini.Destroy;
  end;
end;

{$IFDEF PEN}
procedure TFRegistroLicencia.regenerarLicenciaIni;
var
  f: TextFile;
  l,u,a,d,cp,t,c,pr,p,e,s1,s2,s3,s4,v,G: string;
  ini: TIniFile;
begin
  AssignFile(f,ExtractFilePath(Application.ExeName)+'licencia.rhp');
  Reset(f);
  readln(f,l); //licencia
  readln(f,u); //usuario
  readln(f,a); //apellido
  readln(f,d); //direccion
  readln(f,cp); //cod postal
  readln(f,t); //tel
  readln(f,c); //ciudad
  readln(f,pr); //prov
  readln(f,p);  //pais
  readln(f,e);  //email
  readln(f,s1); //serie1
  readln(f,s2); //serie1
  readln(f,s3); //serie1
  readln(f,s4); //serie1
  readln(f,v); //version
 { readln(f,g);
  showmessage(desencriptar(g));}
  CloseFile(f);
  try
    //Ini := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'licencia.ini');
    Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'licencia.ini');
    //if (Length(Trim(ELicencia.Text))>3) then

    Ini.WriteString('config','licencia',desencriptar(l));
    Ini.WriteString('config','usuario',desencriptar(u));
    Ini.WriteString('config','apellido',desencriptar(a));
    Ini.WriteString('config','direccion',desencriptar(d));
    Ini.WriteString('config','cp',desencriptar(cp));
    Ini.WriteString('config','telefono',desencriptar(t));
    Ini.WriteString('config','ciudad',desencriptar(c));
    Ini.WriteString('config','provincia',desencriptar(pr));
    Ini.WriteString('config','pais',desencriptar(p));
    Ini.WriteString('config','email',desencriptar(e));
    Ini.WriteString('config','nroserie1',desencriptar(s1));
    Ini.WriteString('config','nroserie2',desencriptar(s2));
    Ini.WriteString('config','nroserie3',desencriptar(s3));
    Ini.WriteString('config','nroserie4',desencriptar(s4));
    Ini.WriteString('config','version',desencriptar(v));
  finally
    ini.Destroy;
  end;
end;

function TFRegistroLicencia.leerLicenciaEncriptada(flag: integer): string;
var
  f: TextFile;
  s: string;
begin
  Result := '';
  if (FileExists(ExtractFilePath(Application.ExeName)+'licencia.rhp')) then
  begin
    AssignFile(f,ExtractFilePath(Application.ExeName)+'licencia.rhp');
    Reset(f);
    readln(f,s);
    if (flag = 1) then
      Result := Result + desencriptar(s)
    else
    begin
      readln(f,s); //usuario [1]
      Result := Result + desencriptar(s);
      readln(f,s); //apellido [2]
      Result := Result + desencriptar(s);
      readln(f);
      readln(f);
      readln(f);
      readln(f);
      readln(f);
      readln(f);
      readln(f);
      readln(f,s); //serie1 [10]
      Result := Result + desencriptar(s);
      readln(f,s); //serie1 [11]
      Result := Result + desencriptar(s);
      readln(f,s); //serie1 [12]
      Result := Result + desencriptar(s);
      readln(f,s); //serie1 [13]
      Result := Result + desencriptar(s);
      readln(f,s); //version [14]
      Result := Result + desencriptar(s);
    end;
    CloseFile(f);
  end;
end;
{$ENDIF}

procedure TFRegistroLicencia.FormShow(Sender: TObject);
var ini:TIniFile;
    versionAux: String;
begin
  inherited;
  TipoRegistro := 1;
  versionHuella:= GetVersionHuella;
  try
    PCGeneral.ActivePageIndex := 0;
    //Ini := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'licencia.ini');
    Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'licencia.ini');
    EUsuario.Text:= ini.ReadString('config','usuario','');
    EApellido.Text:= ini.ReadString('config','apellido','');

    EDireccion.Text:= ini.ReadString('config','direccion','');
    ECP.Text:= ini.ReadString('config','cp','');
    ETelefono.Text:= ini.ReadString('config','telefono','');
    ECiudad.Text:= ini.ReadString('config','ciudad','');
    EProvincia.Text:= ini.ReadString('config','provincia','');
    EPais.Text:= ini.ReadString('config','pais','');
    EEmail.Text:= ini.ReadString('config','email','');
    versionAux:= ini.ReadString('config','version',versionHuella);

    ENumeroSerie1.Text:= ini.ReadString('config','nroserie1','');
    ENumeroSerie2.Text:= ini.ReadString('config','nroserie2','');
    ENumeroSerie3.Text:= ini.ReadString('config','nroserie3','');
    ENumeroSerie4.Text:= ini.ReadString('config','nroserie4','');

    Image1.Picture.LoadFromFile(pathDirExe+'imagenes\logoregistro.jpg');
    EUsuarioExit(EUsuario);
    habilitarBotonMail();
    if ControlUsuario and ControlClave then
      PCGeneral.ActivePage := TSLicencia;
  finally
    ini.Destroy;
  end;
//  ELicencia.Text:= ini.ReadString('config','licencia','');  
end;

procedure TFRegistroLicencia.ENumeroSerie1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Length(TEdit(Sender).Text)= 4) and (key <> 9) and (key <> 32)) then
    begin
       if (TEdit(Sender).Name = 'ENumeroSerie1') then
           ENumeroSerie2.SetFocus
         else
       if (TEdit(Sender).Name = 'ENumeroSerie2') then
           ENumeroSerie3.SetFocus
         else
       if (TEdit(Sender).Name = 'ENumeroSerie3') then
           ENumeroSerie4.SetFocus;
    end;
   habilitarBotonMail();
end;

procedure TFRegistroLicencia.ELicenciaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   {if registrado(EClave.Text) then
     BBEnvioMailLicencia.Enabled:= false
    else
      if (trim(EClave.Text)<> '') then
        BBEnvioMailLicencia.Enabled:= true;  }
end;

procedure TFRegistroLicencia.ENumeroSerie1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key = ' ') then
     key:= #0;
end;

procedure TFRegistroLicencia.BBEnvioMailLicenciaClick(Sender: TObject);
begin
  inherited;
  //PMLicencia.Popup(BBEnvioMailLicencia.Left+self.Left+4,self.Top+Ptitulo.Height+self.Height-GroupBox1.Height+BBEnvioMailLicencia.Top-SBUniversal.Height-5);
end;


function TFRegistroLicencia.habilitarBotonMail: boolean;
begin
  result:= false;
  if ((Length(EnumeroSerie1.Text) = 4) and (Length(EnumeroSerie2.Text) = 4) and
      (Length(EnumeroSerie3.Text) = 4) and (Length(EnumeroSerie4.Text) = 4) and
      (length(trim(Eclave.Text)) <> 0) and (length(trim(EDireccion.Text)) <> 0) and
      (length(trim(ETelefono.Text)) <> 0) and (length(trim(ECiudad.Text)) <> 0) and
      (length(trim(EProvincia.Text)) <> 0) and (length(trim(EPais.Text)) <> 0) and
      (length(trim(EEmail.Text)) <> 0) and (length(trim(EApellido.Text)) <> 0) and
      (length(trim(ECP.Text)) <> 0) and (ChequearClave))then
      begin
        if (not ChequearClave) then
          begin
            //BBAceptar.Enabled:= false;
            LTerminar.Enabled := false;
            ITerminar.Enabled := false;
            //BBEnvioMailLicencia.Enabled:= false;
            ELicencia.Enabled:= false;
            TSEnvio.TabVisible := false;
            TSLicencia.TabVisible := false;
            //BBCancelar.Enabled:= true;
            //TSEnvio.TabVisible := false;
            //PCGeneral.ActivePage := TSClave;
          end
         else
           begin
              ELicencia.Enabled:= true;
              //BBAceptar.Enabled:= false;
              LTerminar.Enabled := false;
              ITerminar.Enabled := false;
              //BBEnvioMailLicencia.Enabled:= true;
              TSEnvio.TabVisible := true;
              TSLicencia.TabVisible := true;
              PCGeneral.ActivePage := TSEnvio;
              //TSEnvio.TabVisible := true;
              //PCGeneral.ActivePage := TSEnvio;
              //BBCancelar.Enabled:= true;
              if (Length(Trim(ELicencia.Text))>3) then
                  if (registrado(EClave.Text,'')) then
                    begin
                       //BBAceptar.Enabled:= true;
                       LTerminar.Enabled := true;
                       ITerminar.Enabled := true;
                       //BBEnvioMailLicencia.Enabled:= false;
                       PCGeneral.ActivePage := TSLicencia;
                       //BBCancelar.Enabled:= false;
                      // TSEnvio.TabVisible := false;
                      // PCGeneral.ActivePage := TSClave;
                    end;
           end;
        result:= true;
      end
  else
    begin
      //BBEnvioMailLicencia.Enabled:= false;
      //BBAceptar.Enabled:= false;
      ITerminar.Enabled := false;
      LTerminar.Enabled := false;
      //BBCancelar.Enabled:= true;
      ELicencia.Enabled:= false;
     // TSEnvio.TabVisible := false;
     // PCGeneral.ActivePage := TSClave;
    end;  
end;

procedure TFRegistroLicencia.EDireccionExit(Sender: TObject);
begin
  inherited;
  habilitarBotonMail();
end;

procedure TFRegistroLicencia.EClaveKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

If not(((GetKeyState(VK_CONTROL) AND 128)=128) and
        (((GetKeyState(vKKeyscan('C'))   AND 128)=128) or
         ((GetKeyState(vKKeyscan('c'))   AND 128)=128)))
    then
      key:= #0;

end;

procedure TFRegistroLicencia.EEmailExit(Sender: TObject);
var mailValido: Boolean;
begin
  inherited;
  habilitarBotonMail();
  mailValido:= true;
  if (length(EEmail.Text)> 0) then
     mailValido:= EsUnEmailValido(EEmail.Text);

  if not(mailValido) then
    begin
       MostrarMensaje(tmError, 'Direcci�n de mail inv�lida. Debe ingresar un mail v�lido.');
       EEmail.SetFocus;
       EEmail.SelectAll;
    end;
end;

procedure TFRegistroLicencia.guardarLicencia;
var ini:TIniFile;
begin
  try
    //Ini := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'licencia.ini');
    Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'licencia.ini');
    //if (Length(Trim(ELicencia.Text))>3) then
    Ini.WriteString('config','licencia',ELicencia.Text);

    Ini.WriteString('config','usuario',EUsuario.Text);
    Ini.WriteString('config','apellido',EApellido.Text);

    Ini.WriteString('config','direccion',EDireccion.Text);
    Ini.WriteString('config','cp',ECP.Text);
    Ini.WriteString('config','telefono',ETelefono.Text);
    Ini.WriteString('config','ciudad',ECiudad.Text);
    Ini.WriteString('config','provincia',EProvincia.Text);
    Ini.WriteString('config','pais',EPais.Text);
    Ini.WriteString('config','email',EEmail.Text);

    Ini.WriteString('config','nroserie1',ENumeroSerie1.Text);
    Ini.WriteString('config','nroserie2',ENumeroSerie2.Text);
    Ini.WriteString('config','nroserie3',ENumeroSerie3.Text);
    Ini.WriteString('config','nroserie4',ENumeroSerie4.Text);

    Ini.WriteString('config','version',versionHuella);
    {$IFDEF PEN}
    guardarLicenciaEncriptada(ELicencia.Text,EUsuario.Text,EApellido.Text,
                              EDireccion.Text,ECP.Text,ETelefono.Text,ECiudad.Text,
                              EProvincia.Text,EPais.Text,EEmail.Text,ENumeroSerie1.Text,
                              ENumeroSerie2.Text,ENumeroSerie3.Text,ENumeroSerie4.Text,
                              versionHuella,GivemeHDSerialNumber);
    {$ENDIF}
  finally
    Ini.Destroy;
  end;
end;

{$IFDEF PEN}
procedure TFRegistroLicencia.guardarLicenciaEncriptada(Lic,Us,Ap,Dir,CP,Tel,Ciu,Prov,Pais,Email,
                                    NS1,NS2,NS3,NS4,verHuella: string; HDSN: Longint);
var
  f: TextFile;
begin
  AssignFile(f,ExtractFilePath(Application.ExeName)+'licencia.rhp');
  Rewrite(f);
  Writeln(f,encriptar(Lic)); //0
  Writeln(f,encriptar(Us)); //0
  Writeln(f,encriptar(Ap)); //0
  Writeln(f,encriptar(Dir)); //0
  Writeln(f,encriptar(CP)); //0
  Writeln(f,encriptar(Tel)); //0
  Writeln(f,encriptar(Ciu)); //0
  Writeln(f,encriptar(Prov)); //0
  Writeln(f,encriptar(Pais)); //0
  Writeln(f,encriptar(Email)); //0
  Writeln(f,encriptar(NS1)); //0
  Writeln(f,encriptar(NS2)); //0
  Writeln(f,encriptar(NS3)); //0
  Writeln(f,encriptar(NS4)); //0
  Writeln(f,encriptar(verHuella)); //0
  Writeln(f,encriptar(IntToStr(HDSN))); //0
  CloseFile(f);
end;
{$ENDIF}

function TFRegistroLicencia.aBase36(original: string): integer;
var Valor_entero : integer;
    Valor_char : char;
begin
    Valor_entero := 0;
    // si es numerico lo devuelvo como esta
    if TryStrToInt(original,Valor_entero) then
       aBase36 := Valor_entero
      else
       begin
         // ya se que es caracter.
         original:= UpperCase(original);
         Valor_char := original[1];
         Valor_entero := Ord(valor_char)- 55;
         aBase36 := Valor_entero;
       end
end;

function TFRegistroLicencia.ChequearClave: Boolean;  //chequea el n�mero de serie
var Mod_1ok, Mod2_ok , Mod3_ok , Mod4_ok :String;
    mod1_ack, mod2_ack, mod3_ack, mod4_ack :string;
begin
    ChequearClave := False;
    mod1_ack := ENumeroSerie1.Text;
    mod2_ack := ENumeroSerie2.Text;
    mod3_ack := ENumeroSerie3.Text;
    mod4_ack := ENumeroSerie4.Text;
    if (mod1_ack <> '') and (mod2_ack <> '') and (mod3_ack <> '') and (mod4_ack <> '') then
    begin
      Mod2_ok := CrearCheckSun(mod1_ack);
      Mod4_ok := CrearCheckSun(mod3_ack);
      if (mod2_ack = Mod2_ok) and (mod4_ack = Mod4_ok) then
          ChequearClave := True;
    end;
end;

function TFRegistroLicencia.CrearCheckSun(Modulo: String): String;
var
    caracter_1, caracter_2, caracter_3, caracter_4 :string;
    v1,v2,v3,v4 :integer;
    v_SUMADO : integer;
Const
  Primo_1 = 95773;
  Primo_2 = 1500047;
  Primo_3 = 98213;
  Primo_4 = 99877;
  Modulo364 = 1679616;
  Modulo363 = 46656;
  Modulo362 = 1296;
  Modulo361 = 36;
begin
   caracter_1 := Modulo[1];
   caracter_2 := Modulo[2];
   caracter_3 := Modulo[3];
   caracter_4 := Modulo[4];
   v1 := aBase36(caracter_1);
   v2 := aBase36(caracter_2);
   v3 := aBase36(caracter_3);
   v4 := aBase36(caracter_4);
   V1 := V1*Primo_1;
   v2 := V2*Primo_2;
   v3 := V3*Primo_3;
   v4 := V4*Primo_4;
   v_SUMADO := 0;
   v_SUMADO := v1+v2+v3+v4;
   v_SUMADO := v_SUMADO mod Modulo364;
   v1 := v_SUMADO;
   v1 := v1 mod Modulo361;
   v_SUMADO := v_SUMADO div Modulo361;
   v2 := v_SUMADO;
   v2 := v2 mod Modulo361;
   v_SUMADO := v_SUMADO div Modulo361;
   v3 := v_SUMADO;
   v3 := v3 mod Modulo361;
   v_SUMADO := v_SUMADO div Modulo361;
   v4 := v_SUMADO;
   CrearCheckSun :=  volverAcaracter(V1) + volverAcaracter(V2) + volverAcaracter(V3) + volverAcaracter(V4);
end;

function TFRegistroLicencia.volverAcaracter(
  valor_original: integer): string;
begin
     if valor_original in [0..9] then
        volverAcaracter := IntToStr(valor_original)
     else
        volverAcaracter := CHR(valor_original + 55);
end;

procedure TFRegistroLicencia.ELicenciaExit(Sender: TObject);
begin
  inherited;
  guardarLicencia();
  if (not ITerminar.Enabled) then //BBAceptar.Enabled) then
    habilitarBotonMail();
end;

procedure TFRegistroLicencia.ELicenciaChange(Sender: TObject);
begin
  inherited;
  guardarLicencia();
  habilitarBotonMail();
end;

procedure TFRegistroLicencia.EClaveChange(Sender: TObject);
begin
  inherited;
  habilitarBotonMail();
end;

procedure TFRegistroLicencia.EDireccionChange(Sender: TObject);
begin
  inherited;
  habilitarBotonMail();
end;

procedure TFRegistroLicencia.ETelefonoChange(Sender: TObject);
begin
  inherited;
  habilitarBotonMail();
end;

procedure TFRegistroLicencia.EEmailChange(Sender: TObject);
begin
  inherited;
  habilitarBotonMail();
end;

procedure TFRegistroLicencia.ECiudadChange(Sender: TObject);
begin
  inherited;
  habilitarBotonMail();
end;

procedure TFRegistroLicencia.EProvinciaChange(Sender: TObject);
begin
  inherited;
  habilitarBotonMail();
end;

procedure TFRegistroLicencia.EPaisChange(Sender: TObject);
begin
  inherited;
  habilitarBotonMail();
end;

function TFRegistroLicencia.GetVersionHuella: String;
begin
  versionHuella:= FPrincipal.TipoVersionLicencia;

//  {$IFDEF BASICO}
//    {$IFDEF PRODUCTORES}
//       versionHuella:= 'MODULO BASE PRODUCTORES';
//    {$ELSE}
//        versionHuella:= 'MODULO BASE VETERINARIOS';
//    {$ENDIF}
//  {$ELSE}
//    {$IFDEF ESTANDAR}
//      {$IFDEF PRODUCTORES}
//         versionHuella:= 'MODULO ESTANDAR PRODUCTORES';
//      {$ELSE}
//          versionHuella:= 'MODULO ESTANDAR VETERINARIOS';
//      {$ENDIF}
//    {$ENDIF}
//  {$ENDIF}

  result:= versionHuella;
end;

procedure TFRegistroLicencia.ECPChange(Sender: TObject);
begin
  inherited;
  habilitarBotonMail();
end;

procedure TFRegistroLicencia.ECPExit(Sender: TObject);
begin
  inherited;
  habilitarBotonMail();
end;

procedure TFRegistroLicencia.CrearArchivoVLF(ID: String);
var
  Archivo : TextFile;
begin
  try
    AssignFile(Archivo,ExtractFilePath(Application.ExeName)+'VersionControl.vlf');
    Rewrite(Archivo);
    Writeln(Archivo,ID);
    Writeln(Archivo,IntToStr(Trunc(Date)));
    Writeln(Archivo,IntToStr(Trunc(IncYear(Date,1))));
  finally
    CloseFile(Archivo);
  end;
end;

procedure TFRegistroLicencia.envioLicencia(tipoEnvio: Integer);
var
  mail : TIDMessage;
  smtp : TIdSMTP;
  cartel: TCartel;
  msje, extension: String;
  dir,tipoversion: String;
begin
  inherited;

  {$IFDEF PRODUCTORES}
      tipoversion:='Productores';
  {$ELSE}
      tipoversion:='Veterinarios';
  {$ENDIF}
  dir:= '';

  smtp := TIdSMTP.Create(self);
  // ASIGNO EVENTOS
{  smtp.OnWork := mailEvent.OnWork;
  smtp.OnWorkBegin := mailEvent.OnWorkBegin;
  smtp.OnWorkEnd := mailEvent.OnWorkEnd;
  smtp.OnStatus := mailEvent.OnStatus; }
  smtp.Name := 'Smtp';
  // CONFIGURACION DEL SERVIDOR AL QUE SE ENVIA EL CORREO
  with smtp do begin
    AuthenticationType := atLogin;
    Host := 'mail.softhuella.com.ar';//eHost.Text;
    port := 25;
    Username := 'sac@softhuella.com.ar';//eUser.Text;
    Password := 'ac123456';//ePass.Text;
  end;

  mail := TIdMessage.Create(Self);
  // CONFIGURACION DEL MENSAJE A ENVIAR
  with mail do begin
    From.Address := EEmail.Text;
    Recipients.EMailAddresses := 'sac@softhuella.com.ar';
    Subject := 'Licencia a nombre de: ' + EUsuario.Text;
    body.text := 'Nombre: ' + EUsuario.Text;
    body.text := body.text + #13 + 'Apellido: ' + EApellido.Text;
    body.text := body.text + #13 + 'N�mero Serie: ' + ENumeroSerie1.Text + ' - ' + ENumeroSerie2.Text + ' - ' + ENumeroSerie3.Text + ' - ' + ENumeroSerie4.Text;
    body.text := body.text + #13 + 'Clave: ' + EClave.Text;
    body.text := body.text + #13 + #13 + 'Direcci�n: ' + EDireccion.Text;
    body.text := body.text + #13 + 'CP: ' + ECP.Text;    
    body.text := body.text + #13 + 'Tel�fono: ' + ETelefono.Text;
    body.text := body.text + #13 + 'E-mail: ' + EEmail.Text;
    body.text := body.text + #13 + 'Ciudad: ' + ECiudad.Text;
    body.text := body.text + #13 + 'Provincia: ' + EProvincia.Text;
    body.text := body.text + #13 + 'Pa�s: ' + EPais.Text;
    body.text := body.text + #13 + 'Versi�n: ' + versionHuella;                        
  end;

{  IF ABRIR.Execute then
    if FileExists(abrir.FileName) then
      TIdAttachment.create(mail.MessageParts,abrir.filename);    }

   CrearArchivoVLF(EClave.Text);

 if (tipoEnvio = 1) then   //envio por mail
   begin
    try
      cartel:= TCartel.getInstance();
      msje:= 'Enviando datos licencia ...';
      cartel.abrircartel(msje);
      // CONEXION CON EL SERVIDOR DE CORREO
      smtp.Connect(10000);
      try
        // ENVIO DEL MENSAJE
        smtp.Send(mail);
        MostrarMensaje(tmInformacion, 'La licencia ha sido enviada con �xito. En instantes se verificar� el c�digo. Verificaremos los datos y antes de las 72 hs se enviar� la licencia.');
        cartel.cerrarcartel();
        cartel.FreeInstance();
      except
        on E: Exception do
          begin
            MostrarMensaje(tmError, Traducir('Fallo al enviar licencia: ') + E.Message);

            cartel.cerrarcartel();

            cartel.FreeInstance();
          end;
      end;
    except 
     on E: Exception do
       begin

       end;
    {finally
      if SMTP.Connected then SMTP.Disconnect;
      smtp.free;
      mail.free;}
    end;
   end
 else
   if (tipoEnvio = 2) then    //guardando archivo
     begin
        if (MostrarMensaje(tmConsulta, 'Guarde la licencia y luego env�elo por correo electr�nico a sac@softhuella.com.ar. Verificaremos los datos y antes de las 72 hs se enviar� la licencia. ') = mrYes) then
          if (SDLicencia.Execute) then
           begin
             extension:= ExtractFileExt(SDLicencia.FileName);
             if (StrComp(PChar(extension), PChar('.txt')) <> 0) then
               SDLicencia.FileName:= SDLicencia.FileName + '.txt';

             try
               mail.Body.SaveToFile(SDLicencia.FileName);
               MostrarMensaje(tmInformacion, 'La licencia ha sido guardada con �xito. Env�ela por correo electr�nico a sac@softhuella.com.ar.');
             except
               on E: Exception do
                  MostrarMensaje(tmError, 'Fallo al guardar la licencia:');
             end;
          end;   
     end
   else
     if (tipoEnvio = 3) then    //por pagina
       begin
         dir:='http://www.softhuella.com.ar/registro/registro.php';
//         dir:='http://www.softhuella.com.ar/registro/registrarseca.php';
         dir:= dir + '?nombre='+EUsuario.Text+'&apellido='+EApellido.Text+'&direccion='+EDireccion.Text;
         dir:= dir + '&cp='+ECP.Text+'&telefono='+ETelefono.Text+'&email='+EEmail.Text;
         dir:= dir + '&ciudad='+ECiudad.Text+'&provincia='+EProvincia.Text+'&pais='+EPais.Text;
         dir:= dir + '&nroserie1='+ENumeroSerie1.Text+'&nroserie2='+ENumeroSerie2.Text+'&nroserie3='+ENumeroSerie3.Text;
         dir:= dir + '&nroserie4='+ENumeroSerie4.Text+'&clave='+EClave.Text+'&tipoversion='+tipoversion+'&version='+versionHuella;


         ShellExecute(Application.MainForm.Handle , 'open',PChar(dir), nil, nil, SW_MAXIMIZE);
       end;

  if SMTP.Connected then
    SMTP.Disconnect;
  smtp.free;
  mail.free;
end;

procedure TFRegistroLicencia.ReportedePedigree1Click(Sender: TObject);
begin
  inherited;
  envioLicencia(3);
end;

procedure TFRegistroLicencia.ReporteIndividual1Click(Sender: TObject);
begin
  inherited;
  envioLicencia(1);
end;

procedure TFRegistroLicencia.GuardarArchivo1Click(Sender: TObject);
begin
  inherited;
  envioLicencia(2);
end;

function TFRegistroLicencia.ControlUsuario : Boolean;
begin
  Result := (EUsuario.Text <> '') and (EApellido.Text <> '') and (ETelefono.Text <> '') and (EEmail.Text <> '') and
            (EDireccion.Text <> '') and (ECiudad.Text <> '') and (ECP.Text <> '') and (EProvincia.Text <> '') and
            (EPais.Text <> '');
end;

function TFRegistroLicencia.ControlClave : Boolean;
begin
  Result := (ENumeroSerie1.Text <> '') and (ENumeroSerie2.Text <> '') and (ENumeroSerie3.Text <> '') and
            (ENumeroSerie4.Text <> '');
end;


{$IFDEF PEN}
function TFRegistroLicencia.encriptar(s: string):string;
var
  Cipher : TDCP_rijndael;
  Data, Key, IV, keystr : string;
begin
  keystr := 's0f7hu3ll4_2010';
  // Pad Key and IV with zeros as appropriate
  Key := PadWithZeros(keystr,KeySize);
  IV := PadWithZeros('abcdefghijklmnop',BlockSize);
  //Data := PadWithZeros(s,BlockSize);
  Data := s;
  // Create the cipher and initialise according to the key length
  Cipher := TDCP_rijndael.Create(Self);
  if Length(key) <= 16 then
    Cipher.Init(Key[1],128,@IV[1])
  else if Length(key) <= 24 then
    Cipher.Init(Key[1],192,@IV[1])
  else
    Cipher.Init(Key[1],256,@IV[1]);
  // Encrypt the data
  Cipher.EncryptCBC(Data[1],Data[1],Length(Data));
  // Free the cipher and clear sensitive information
  Cipher.Free;
  FillChar(Key[1],Length(Key),0);
  // Display the Base64 encoded result
  Result := Base64EncodeStr(Data);
end;

function TFRegistroLicencia.desencriptar(s: string):string;
var
  Cipher : TDCP_rijndael;
  Data, Key, IV, keystr : string;
begin
  keystr := 's0f7hu3ll4_2010';
  // Pad Key and IV with zeros as appropriate
  Key := PadWithZeros(keystr,KeySize);
  IV := PadWithZeros('abcdefghijklmnop',BlockSize);
  // Decode the Base64 encoded string
  Data := Base64DecodeStr(s);
  // Create the cipher and initialise according to the key length
  Cipher := TDCP_rijndael.Create(Self);
  if Length(key) <= 16 then
    Cipher.Init(Key[1],128,@IV[1])
  else if Length(key) <= 24 then
    Cipher.Init(Key[1],192,@IV[1])
  else
    Cipher.Init(Key[1],256,@IV[1]);
  // Decrypt the data
  Cipher.DecryptCBC(Data[1],Data[1],Length(Data));
  // Free the cipher and clear sensitive information
  Cipher.Free;
  FillChar(Key[1],Length(Key),0);
  // Display the result
  Result := Data;
end;

function TFRegistroLicencia.VerificarSiHayConexion : Boolean;
var
  ConnectedState: Integer;
begin
  ConnectedState := INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_PROXY;
  Result := InternetGetConnectedState(@ConnectedState, 0);
end;

function TFRegistroLicencia.sendEmail(ini: TIniFile): boolean;
begin
  Result := false;
  with IdMessage1 do
  begin
    Subject := 'Obtenci�n de nueva licencia para PENDRIVE';
    Body.Add('Usuario: '+ini.ReadString('config','usuario',''));
    Body.Add('Apellido: '+ini.ReadString('config','apellido',''));
    Body.Add('Version: '+ini.ReadString('config','version',''));
    Body.Add('Email: '+ini.ReadString('config','email',''));
    Body.Add('Telefono: '+ini.readString('config','telefono',''));
    Body.Add('Serie del dispositivo: '+IntToStr(GivemeHDSerialNumber));
    From.Name := ini.ReadString('config','email','');
    From.Address := ini.ReadString('config','email','');
    Sender.Address := 'sac@softhuella.com.ar';
    Recipients.EMailAddresses := Trim('cdominguez@softhuella.com.ar');
  end;
  IdSMTP1.Connect();
  if IdSMTP1.Connected then
  begin
    IdSMTP1.Send(IdMessage1);
    Result := true;
    IdSMTP1.Disconnect;
  end;
  IdMessage1.Free;
  IdSMTP1.Free;
end;
{$ENDIF}

procedure TFRegistroLicencia.EUsuarioExit(Sender: TObject);
begin
  inherited;
  if ControlUsuario then
  begin
   //TSClave.TabVisible := true;
    PCGeneral.ActivePage := TSClave;
  end;
end;

procedure TFRegistroLicencia.BBOnlineClick(Sender: TObject);
begin
  inherited;
  envioLicencia(3);
  TipoRegistro := 3;
end;

procedure TFRegistroLicencia.BBEmailClick(Sender: TObject);
begin
  inherited;
  envioLicencia(1);
  TipoRegistro := 1;
end;

procedure TFRegistroLicencia.BBofflineClick(Sender: TObject);
begin
  inherited;
  envioLicencia(2);
  TipoRegistro := 2;
end;

procedure TFRegistroLicencia.ControlarBotones;
begin
  if PCGeneral.ActivePage = TSUsuario then
  begin
    //BBAnterior.Visible := false;
    //BBSiguiente.Visible := true;
    //LBBAnterior.Visible := false;
    JvAnteriror.Visible := false;
    //LBBSiguiente.Visible := true;
    JvSiguiente.Visible := true;
  end;
  if (PCGeneral.ActivePage = TSClave) or (PCGeneral.ActivePage = TSEnvio) then
  begin
    {BBAnterior.Visible := true;
    BBSiguiente.Visible := true;}
    //LBBAnterior.Visible := true;
    JvAnteriror.Visible := true;
    //LBBSiguiente.Visible := true;
    JvSiguiente.Visible := true;
  end;
  if PCGeneral.ActivePage = TSLicencia then
  begin
    //LBBAnterior.Visible := true;
    JvAnteriror.Visible := true;
    //LBBSiguiente.Visible := false;
    JvSiguiente.Visible := false;
  end;
end;

procedure TFRegistroLicencia.BBAnteriorClick(Sender: TObject);
begin
  inherited;
  PCGeneral.ActivePage := PCGeneral.FindNextPage(PCGeneral.ActivePage,false,true);
  PCGeneralChange(nil);
end;

procedure TFRegistroLicencia.BBSiguienteClick(Sender: TObject);
begin
  inherited;
  PCGeneral.ActivePage := PCGeneral.FindNextPage(PCGeneral.ActivePage,true,true);
  PCGeneralChange(nil);
end;

procedure TFRegistroLicencia.PCGeneralChange(Sender: TObject);
begin
  inherited;
  ControlarBotones;
end;

procedure TFRegistroLicencia.TSLicenciaShow(Sender: TObject);
begin
  inherited;
  LPegarLicencia.Caption := Traducir('Copiar el n�mero de licencia y pegarlo en el casillero de licencia para finalizar el proceso de registro');
  case TipoRegistro of
    1,2 : LPegarLicencia.Caption := Traducir('Copiar el n�mero de licencia que se le envio en el mail y pegarlo en el casillero de licencia para finalizar el proceso de registro');
    3 : LPegarLicencia.Caption := Traducir('Copiar el n�mero de licencia que aparece en la p�gina y pegarlo en el casillero de licencia para finalizar el proceso de registro');
  end;
end;

procedure TFRegistroLicencia.FormCreate(Sender: TObject);
begin
  inherited;
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\logoregistro.jpg');
end;

end.