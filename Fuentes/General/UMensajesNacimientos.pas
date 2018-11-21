unit UMensajesNacimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UMensajeHuella, StdCtrls, ExtCtrls, Buttons, UPrincipal, jpeg,
  PngImage;

type
  TFMensajeNacimientos = class(TFMensaje)
    MRps: TMemo;
  private
    { Private declarations }
  public

  published
    constructor Create(owner : TComponent; tipo : TTipoMensaje; msg : string; ListaRps : TStringList); reintroduce;
  end;

var
  FMensajeNacimientos: TFMensajeNacimientos;
  function MostrarMensajeNacimientos(tipo : TTipoMensaje; msg : String; ListaRp : TStringList): TModalResult;

implementation

function MostrarMensajeNacimientos(tipo : TTipoMensaje; msg : String; ListaRp : TStringList): TModalResult;
var
   retorno : TModalResult;
begin
  FMensajeNacimientos := TFMensajeNacimientos.Create(FPrincipal,tipo,msg,ListaRp);
  FMensajeNacimientos.ShowModal;
  retorno := FMensajeNacimientos.ModalResult;
  FMensajeNacimientos.Destroy;
  Result := retorno;
end;


constructor TFMensajeNacimientos.Create(owner : TComponent; tipo : TTipoMensaje; msg : string; ListaRps : TStringList);
begin
  inherited Create(owner,tipo,msg);
  MRps.Lines.AddStrings(ListaRps);
end;
{$R *.dfm}

end.
