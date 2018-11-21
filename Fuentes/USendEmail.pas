unit USendEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, ExtCtrls, IdMessage,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,UMensajeHuella,
  IdMessageClient, IdSMTP,UPrincipal, JvGIF, JvExControls, JvLabel, jpeg,
  ImgList, PngImageList, pngimage, JvExExtCtrls, JvImage, IdIOHandler,
  IdIOHandlerSocket, IdSSLOpenSSL;

type
  TFSendEmail = class(TFUniversal)
    PClient: TPanel;
    MemoTo: TMemo;
    Label1: TLabel;
    MemoCC: TMemo;
    Label2: TLabel;
    MemoCCO: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    ESubject: TEdit;
    Label5: TLabel;
    LAttachments: TLabel;
    Image1: TImage;
    MBody: TMemo;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    IBQPropietario: TIBQuery;
    IBQPropietarioID_PROPIETARIO: TIntegerField;
    IBQPropietarioNOMBRE: TIBStringField;
    IBQPropietarioEMPRESA: TIBStringField;
    IBQPropietarioDIRECCION: TIBStringField;
    IBQPropietarioTELEFONO: TIBStringField;
    IBQPropietarioCELULAR: TIBStringField;
    IBQPropietarioEMAIL: TIBStringField;
    IBQPropietarioURL: TIBStringField;
    PBotones: TPanel;
    BtnCancel: TButton;
    BtnSend: TButton;
    IFondo: TImage;
    Ptop: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    LabelPor: TLabel;
    LabelDesde: TLabel;
    LabelFalta: TLabel;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MemoToChange(Sender: TObject);
  private
  public
    result: Boolean;
    filename : String;
    Completo : Boolean;
    function Send() : Boolean;
  end;

var
  FSendEmail: TFSendEmail;

implementation

{$R *.dfm}
uses
  UCartel, UABMPropietario;

procedure TFSendEmail.FormCreate(Sender: TObject);
begin
  inherited;
  self.result := false;
end;

procedure TFSendEmail.BtnCancelClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TFSendEmail.BtnSendClick(Sender: TObject);
begin
  inherited;
  if not Send() then
    MostrarMensaje(tmError,'No se pudo enviar el email. Por favor, intente nuevamente o verifique su conexion')
  else
    BtnCancel.Click;
end;


function TFSendEmail.Send() : Boolean;
var
  attach: TIdAttachment;
  C : TCartel;
begin
  inherited;
  C := TCartel.getInstance;
  C.abrircartel('Enviando mensaje...');
  Result := false;
  with IdMessage1 do
  begin
    Subject := Self.ESubject.Text;
    Body.Text := Self.MBody.Text;
    From.Name := IBQPropietarioNOMBRE.AsString;
    From.Address := IBQPropietarioEMAIL.AsString;
    //Sender.Address := IdSMTP1.Username;
    Sender.Address := IBQPropietarioEMAIL.AsString;
    Sender.Name := IBQPropietarioNOMBRE.AsString;
    Recipients.EMailAddresses := Trim(Self.MemoTo.Text);
    CCList.EMailAddresses := Trim(Self.MemoCC.Text);
    BccList.EMailAddresses := Trim(Self.MemoCCO.Text);
  end;
  IBQPropietario.Close;
  attach := TIdAttachment.Create(IdMessage1.MessageParts,filename);
  try
    IdSMTP1.Connect();
    IdSMTP1.Send(IdMessage1);
    IdSMTP1.Disconnect;
    if FileExists(filename) then
      DeleteFile(filename);
    Result := true;
    MostrarMensaje(tmInformacion,'El mensaje ha sido enviado correctamente');
    C.cerrarcartel;
    C.FreeInstance;
  except
    Result := false;
    C.cerrarcartel;
    C.FreeInstance;
  end;
  attach.Destroy;
end;

procedure TFSendEmail.FormShow(Sender: TObject);
var
  F : TFABMPropietario;
begin
  inherited;
  BtnSend.Visible := true;
  BtnCancel.Visible := true;
  BtnSend.Enabled := false;
  Completo := false;
  IBQPropietario.Close;
  IBQPropietario.Open;
  while IBQPropietario.IsEmpty do
  begin
    if MostrarMensaje(tmConsulta,'No podrá enviar el mail hasta no completar los datos del Propietario. Desea hacerlo ahora?') = mrYes then
    begin
      F := TFABMPropietario.Create(self);
      F.ShowModal;
      F.Destroy;
    end
    else
      break;
    IBQPropietario.Close;
    IBQPropietario.Open;
  end;
  Completo := not IBQPropietario.IsEmpty;
  if Completo then
  begin
    LabelPor.Caption := IBQPropietarioNOMBRE.AsString;
    LabelDesde.Caption := IBQPropietarioEMAIL.AsString;
  end
  else
  begin
    LabelPor.Caption := 'No Definido';
    LabelDesde.Caption := 'No Definido';
    LabelFalta.Visible := true;
    LabelFalta.Caption := 'Por favor complete los datos del Propietario para poder enviar el email';
  end;
end;

procedure TFSendEmail.MemoToChange(Sender: TObject);
begin
  inherited;
  BtnSend.Enabled := (MemoTo.Text <> '') and Completo;
end;

end.
