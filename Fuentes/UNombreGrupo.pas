unit UNombreGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, ActnList, ComCtrls, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBStoredProc, WinXP, DataExport, DataToXLS, IBQuery,
  JvGIF, PngImage, jpeg, JvExControls, JvLabel, ImgList, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFNombredelGrupo = class(TFUniversal)
    PControles: TPanel;
    LNombreGrupo: TLabel;
    PBotones: TPanel;
    BBAceptar: TBitBtn;
    ENombreGrupo: TEdit;
    BBAyuda: TBitBtn;
    IFondo: TImage;
    ITerminar: TImage;
    LTerminar: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    procedure BBAceptarClick(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FNombredelGrupo: TFNombredelGrupo;

implementation

uses
  UMensajeHuella, UEveAltaMasiva, UPrincipal;

{$R *.dfm}

procedure TFNombredelGrupo.BBAceptarClick(Sender: TObject);
begin
  inherited;
  if ((Length(ENombreGrupo.Text)<=50) and (Length(ENombreGrupo.Text)<>0)) then
  begin
    ModalResult := mrOk;
    if Owner is TFEveAltaMasiva then
    begin
      (Owner as TFEveAltaMasiva).PANombreGrupo.Visible:=false;
      if FPrincipal.AsistenteCargaMasiva or FPrincipal.AsistenteCMasivaPlanilla or FPrincipal.AsistenteMapa then
      begin
       (Owner as TFEveAltaMasiva).PAFinalizarCM.Visible:= true;
       FPrincipal.AsistenteCargaMasiva:= false;
       FPrincipal.AsistenteCMasivaPlanilla:= false;
      end;
    end;
  end
  else
    begin
      MostrarMensaje(tmError, 'El nombre de grupo no puede ser vacío, ni superar los 50 caracteres');
      ENombreGrupo.SetFocus;
    end;
end;

procedure TFNombredelGrupo.BBCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFNombredelGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  if Owner is TFEveAltaMasiva then
  begin
    (self.Owner as TFEveAltaMasiva).PAPlanillaAM.Visible:= false;
    if FPrincipal.AsistenteCargaMasiva or FPrincipal.AsistenteCMasivaPlanilla or FPrincipal.AsistenteMapa then
      (self.Owner as TFEveAltaMasiva).PANombreGrupo.Visible:=true;
  end;
end;

end.
