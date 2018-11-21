unit UEnviarMail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IdMessage, IdBaseComponent, IdComponent, WinInet,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, WinXP, StdCtrls,
  jpeg, ExtCtrls, Buttons, QRCtrls, QuickRpt, acPNG, PngImage,
  JvComponentBase, JvMail, IdIntercept, ImgList, PngImageList, IBQuery,
  DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList,
  ComCtrls, JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFEnviarMail = class(TFUniversal)
    SMTP: TIdSMTP;
    Mensaje: TIdMessage;
    Panel1: TPanel;
    BBEnviar: TBitBtn;
    BBSalir: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    EDireccion: TEdit;
    CBCalendario: TCheckBox;
    CBCostos: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    EAsunto: TEdit;
    MTexto: TMemo;
    LAdjuntos: TLabel;
    IAceptar: TImage;
    LAceptar: TLabel;
    ICancelar: TImage;
    LCancel: TLabel;
    LAdjunto: TLabel;
    IBarraFondo: TImage;
    Image6: TImage;
    Image5: TImage;
    IdConnectionIntercept1: TIdConnectionIntercept;
    procedure BBSalirClick(Sender: TObject);
    procedure BBEnviarClick(Sender: TObject);
    procedure EDireccionChange(Sender: TObject);
    procedure CBCalendarioClick(Sender: TObject);
    procedure CBCostosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function Verif : Boolean;
    function VerificarSiHayConexion() : Boolean;
  public
    Calendario, Costos : String;
    historial : boolean;
  end;

var
  FEnviarMail: TFEnviarMail;

implementation


{$R *.dfm}

function TFEnviarMail.VerificarSiHayConexion : Boolean;
var
  ConnectedState: Integer;
begin
  ConnectedState := INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_PROXY;
  Result := InternetGetConnectedState(@ConnectedState, 0);
end;

procedure TFEnviarMail.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFEnviarMail.BBEnviarClick(Sender: TObject);
var
  attach1, attach2 : TidAttachment;
begin
  inherited;
try
  if VerificarSiHayConexion then
  begin
    with Mensaje do
    begin
        if not historial then
        begin
          Subject := EAsunto.Text;
          Body.AddStrings(MTexto.Lines);
          From.Name := 'Biogénesis Bagó';
          From.Address := 'biogenesisbago@biogenesishuella.com.ar';
          Recipients.EMailAddresses := EDireccion.Text;
        end;
        Sender.Address := 'biogenesisbago@biogenesishuella.com.ar';
      end;
      if Calendario <> ''  then
        attach1 := TIdAttachment.Create(Mensaje.MessageParts,Calendario);
      if Costos <> '' then
        attach2 := TIdAttachment.Create(Mensaje.MessageParts,Costos);

      try
        SMTP.Connect();
        SMTP.Send(Mensaje);
      except

      end;
      SMTP.Disconnect;
    end;
    //Mensaje.Free;
  except
  end;
  Close;
end;

function TFEnviarMail.Verif : Boolean;
begin
  if CBCalendario.Visible and CBCostos.Visible then
    Result := (EDireccion.Text <> '') and ((CBCalendario.Checked) or (CBCostos.Checked))
  else
    Result := (EDireccion.Text <> '');
end;

procedure TFEnviarMail.EDireccionChange(Sender: TObject);
begin
  inherited;
  BBEnviar.Enabled := Verif;
  LAceptar.Enabled := Verif;
  IAceptar.Enabled := Verif;
end;

procedure TFEnviarMail.CBCalendarioClick(Sender: TObject);
begin
  inherited;
  BBEnviar.Enabled := Verif;
  LAceptar.Enabled := Verif;
  IAceptar.Enabled := Verif;
end;

procedure TFEnviarMail.CBCostosClick(Sender: TObject);
begin
  inherited;
  BBEnviar.Enabled := Verif;
  LAceptar.Enabled := Verif;
  IAceptar.Enabled := Verif;
end;

procedure TFEnviarMail.FormCreate(Sender: TObject);
begin
  inherited;
  historial := false;
  Costos := '';
  Calendario := '';
end;

procedure TFEnviarMail.FormShow(Sender: TObject);
begin
  inherited;
  if Calendario <> '' then
    LAdjunto.Caption := 'Archivo Adjunto: '+ExtractFileName(Calendario);
  if Costos <> '' then
    LAdjunto.Caption := LAdjunto.Caption+'; '+ExtractFileName(Costos);
end;

end.
