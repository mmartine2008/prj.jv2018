unit UUbicacionBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, Buttons, DBCtrls, UDBLookupComboBoxAuto,
  jpeg, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc,
  ActnList, ComCtrls, ExtCtrls, EditAuto, IBQuery, JvExControls, JvLabel,
  JvGIF;

type
  TFUbicacionBD = class(TFUniversal)
    PControles: TPanel;
    LUbicacionBD: TLabel;
    Image1: TImage;
    PBotones: TPanel;
    GroupBox1: TGroupBox;
    BBAyuda: TBitBtn;
    BBAceptar: TBitBtn;
    BBCancelar: TBitBtn;
    EAUbicacionBD: TEditAuto;
    procedure FormShow(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
    procedure BBAceptarClick(Sender: TObject);
  private
    { Private declarations }
    FIPServidorBD : string;
  public
    { Public declarations }
    function leerIPServidorBD():String;
    procedure escribirIPServidorBD(ipServidor:String);
    property IPServidorBD:String read FIPServidorBD write FIPServidorBD;
  end;

var
  FUbicacionBD: TFUbicacionBD;

implementation

{$R *.dfm}

uses IniFiles, UPrincipal, UMensajeHuella;

procedure TFUbicacionBD.FormShow(Sender: TObject);
begin
  inherited;
  Image1.Picture.LoadFromFile(pathDirExe+'imagenes/logored.jpg');
  IPServidorBD:= leerIPServidorBD();
  EAUbicacionBD.Text:= IPServidorBD;
  EAUbicacionBD.SetFocus;
  EAUbicacionBD.SelectAll;
end;

procedure TFUbicacionBD.BBCancelarClick(Sender: TObject);
begin
  inherited;
  //Self.Close;
  FPrincipal.Close;
  Application.Terminate;
end;

function TFUbicacionBD.leerIPServidorBD: String;
var Ini : TiniFile;
begin
  Ini := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'huella.ini');
  result := Ini.ReadString('Red', 'IPServidorBD', '');
end;

procedure TFUbicacionBD.escribirIPServidorBD(ipServidor:String);
var Ini : TiniFile;
begin
  Ini := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'huella.ini');
  Ini.WriteString('Red', 'IPServidorBD', ipServidor);
  IPServidorBD:= ipServidor;
end;

procedure TFUbicacionBD.BBAceptarClick(Sender: TObject);
begin
  inherited;
  if (EAUbicacionBD.Text <> '') then
    begin
      escribirIPServidorBD(EAUbicacionBD.Text);

      try
        UPrincipal.FPrincipal.conectarBD();
        Self.Close;
      except
      end;  
    end
   else
     MostrarMensaje(tmError, 'Debe ingresar la dirección IP o Nombre de Equipo donde se encuentra el servidor de Huella. ');      
end;

end.
