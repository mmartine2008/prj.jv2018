unit UDatosClienteComprador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, PngImage, jpeg,
  JvEnterTab, JvExExtCtrls, JvImage;

type
  TFDatosClienteComprador = class(TFUniversal)
    PPrincipal: TPanel;
    PBotones: TPanel;
    IFondoB: TImage;
    ITerminar: TImage;
    LTerminar: TLabel;
    LCancelar: TLabel;
    ICancelar: TImage;
    IBQInsertarCliente: TIBQuery;
    LNombreCliente: TLabel;
    LApellidoCliente: TLabel;
    LTelefonoCliente: TLabel;
    LDireccionCliente: TLabel;
    LRazoSocialCliente: TLabel;
    ENombreCliente: TEdit;
    EApellidoCliente: TEdit;
    ETelefonoCliente: TEdit;
    EDireccionCliente: TEdit;
    ERazonSocialCliente: TEdit;
    IBQGetIdCliente: TIBQuery;
    JvEnterAsTab1: TJvEnterAsTab;
    LMailCliente: TLabel;
    EMailCliente: TEdit;
    LCuitCuil: TLabel;
    ECuitCuil: TEdit;
    procedure ENombreClienteChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ITerminarClick(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDatosClienteComprador: TFDatosClienteComprador;

implementation

{$R *.dfm}

uses UPrincipal,uTiposGlobales, UMensajeHuella;

procedure TFDatosClienteComprador.ENombreClienteChange(Sender: TObject);
begin
  inherited;

  if ((ENombreCliente.Text <> '') or (EApellidoCliente.Text <> '') or (ETelefonoCliente.Text <> '') or (EDireccionCliente.Text <> '') or (ERazonSocialCliente.Text <> '')) then
  begin
       LTerminar.Visible := true;
       ITerminar.Visible := true;
  end;

  if ((ENombreCliente.Text = '') and (EApellidoCliente.Text = '') and (ETelefonoCliente.Text = '') and (EDireccionCliente.Text = '') and (ERazonSocialCliente.Text = '')) then
  begin
       LTerminar.Visible := false;
       ITerminar.Visible := false;
  end;

end;

procedure TFDatosClienteComprador.FormShow(Sender: TObject);
begin
  inherited;

  ITerminar.Visible := false;
  LTerminar.Visible := false;
end;

procedure TFDatosClienteComprador.ITerminarClick(Sender: TObject);
var id : integer;
begin
  inherited;

  try
      IBQGetIdCliente.Close;
      IBQGetIdCliente.Open;

      if (IBQGetIdCliente.FieldValues['id_cliente'] = null) then
        id := 1
      else
        id := IBQGetIdCliente.FieldValues['id_cliente'] + 1;

      IBQInsertarCliente.Close;
      IBQInsertarCliente.ParamByName('id_cliente').AsInteger := id;

      if (ENombreCliente.Text <> '') then
        IBQInsertarCliente.ParamByName('nombre_cliente').AsString := ENombreCliente.Text
      else
        IBQInsertarCliente.ParamByName('nombre_cliente').AsString := '';

      if (EApellidoCliente.Text <> '') then
        IBQInsertarCliente.ParamByName('apellido_cliente').AsString := EApellidoCliente.Text
      else
        IBQInsertarCliente.ParamByName('apellido_cliente').AsString := '';

      if (ETelefonoCliente.Text <> '') then
        IBQInsertarCliente.ParamByName('telefono_cliente').AsString := ETelefonoCliente.Text
      else
        IBQInsertarCliente.ParamByName('telefono_cliente').AsString := '';

      if (EDireccionCliente.Text <> '') then
        IBQInsertarCliente.ParamByName('direccion_cliente').AsString := EDireccionCliente.Text
      else
        IBQInsertarCliente.ParamByName('direccion_cliente').AsString := '';

      if (ERazonSocialCliente.Text <> '') then
        IBQInsertarCliente.ParamByName('razon_social_cliente').AsString := ERazonSocialCliente.Text
      else
        IBQInsertarCliente.ParamByName('razon_social_cliente').AsString := '';

      if (EMailCliente.Text <> '') then
        IBQInsertarCliente.ParamByName('mail_cliente').AsString := EMailCliente.Text
      else
        IBQInsertarCliente.ParamByName('mail_cliente').AsString := '';

      if (ECuitCuil.Text <> '') then
        IBQInsertarCliente.ParamByName('cuit_cuil_cliente').AsString := ECuitCuil.Text
      else
        IBQInsertarCliente.ParamByName('cuit_cuil_cliente').AsString := '';

      IBQInsertarCliente.Open;

      FPrincipal.IBTPrincipal.CommitRetaining;

      MostrarMensaje(tmInformacion,'Los datos se guardaron satisfactoriamente.');

      Close();

  except
      FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFDatosClienteComprador.ICancelarClick(Sender: TObject);
begin
  inherited;

  Close;
end;

end.
