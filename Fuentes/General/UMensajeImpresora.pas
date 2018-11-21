unit UMensajeImpresora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UMensajeHuella, StdCtrls, ExtCtrls, Buttons, Printers, Shellapi, Shlobj,
  jpeg, PngImage;

type
  TFMensajeImpresora = class(TFMensaje)
    Label1: TLabel;
    procedure Label1Click(Sender: TObject);
  private
    procedure EjecutarAgregarImpresora();
  public
    { Public declarations }
  end;

var
  FMensajeImpresora: TFMensajeImpresora;
  procedure MostrarMensajeImpresion();

implementation

{$R *.dfm}

procedure MostrarMensajeImpresion();
var
  F : TFMensajeImpresora;
  mensaje : String;
begin
  mensaje := 'No se ha detectado ninguna impresora instalada, esto puede ocasionar que los reportes no se '+
            'visualicen de la manera adecuada. Para agregar una nueva impresora seleccione "Agregar Impresora"';
  if (Printer.Printers.Count = 0) then
  begin
    F := TFMensajeImpresora.Create(nil,tmInformacion,mensaje);
    F.ShowModal;
    Printer.Refresh;
    F.Destroy;
  end;
end;

procedure TFMensajeImpresora.EjecutarAgregarImpresora();
var
  identificadorVentana : PItemIDList;
  informacionObtenida : TShellExecuteInfo;
  punteroInformacionObtenida : PShellExecuteInfo;
begin
  //Obtenemos el PIDL de la carpeta
  SHGetSpecialFolderLocation(Handle, CSIDL_PRINTERS, identificadorVentana);
  { Para abrir cualquier otra ventana (papelera de reciclaje,
  impresoras, Menú de inicio, favoritos,
  archivos temporales de Internet, escritorio,
  documentos recientes, carpetas de red, carpeta de fuentes,
  etc, es suficiente con cambiar CSIDL_CONTROLS
  por la correspondiente constante de ventana:
  CSIDL_DESKTOP, CSIDL_INTERNET, CSIDL_PROGRAMS,
  CSIDL_PRINTERS, CSIDL_PERSONAL, CSIDL_FAVORITES,
  CSIDL_STARTUP, CSIDL_RECENT,
  CSIDL_SENDTO, CSIDL_BITBUCKET, CSIDL_STARTMENU,
  CSIDL_DESKTOPDIRECTORY, CSIDL_DRIVES, CSIDL_NETWORK,
  CSIDL_NETHOOD, CSIDL_FONTS, CSIDL_TEMPLATES,
  CSIDL_COMMON_STARTMENU, CSIDL_COMMON_PROGRAMS,
  CSIDL_COMMON_STARTUP, CSIDL_COMMON_DESKTOPDIRECTORY,
  CSIDL_APPDATA, CSIDL_PRINTHOOD,  CSIDL_ALTSTARTUP,
  CSIDL_COMMON_ALTSTARTUP, CSIDL_COMMON_FAVORITES,
  CSIDL_INTERNET_CACHE, CSIDL_COOKIES, CSIDL_HISTORY}

  punteroInformacionObtenida := @informacionObtenida;
  with informacionObtenida do
  begin
    cbSize := SizeOf(informacionObtenida);
    fMask := SEE_MASK_NOCLOSEPROCESS + SEE_MASK_IDLIST;
    wnd := Handle;
    lpVerb := nil;
    lpFile := nil;
    lpParameters := nil;
    lpDirectory := nil;
    nShow := SW_ShowNormal;
    hInstApp := 0;
    lpIDList := identificadorVentana;
  end;
  ShellExecuteEx (punteroInformacionObtenida);
end;

procedure TFMensajeImpresora.Label1Click(Sender: TObject);
begin
  inherited;
  EjecutarAgregarImpresora();
end;

end.
