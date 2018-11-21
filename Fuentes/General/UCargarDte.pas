{ DAIANA - 22.12.2014 - Incidencia 412 - Inicio
  Reporte de Movimientos }

unit UCargarDte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, pngimage,
  JvExExtCtrls, JvImage, JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF,
  jpeg, Mask, DBCtrls, UDBEditAuto, EditAuto;

type
  TFCargarDte = class(TFUniversal)
    Panel: TPanel;
    PBotones: TPanel;
    IFondo: TImage;
    LCancelar: TLabel;
    LAceptar: TLabel;
    ICancelar: TImage;
    BtnCancel: TButton;
    IAceptar: TImage;
    ICargarDte: TImage;
    LCargarDte: TLabel;
    LDte: TLabel;
    LInfo: TLabel;
    ODdte: TOpenDialog;
    IBQDte: TIBQuery;
    EADTE: TEditAuto;
    procedure CargarParametros(Grupo: Integer; Establecimiento: Integer; Path: String; NumeroDte: String);
    procedure ICargarDteClick(Sender: TObject);
    procedure IAceptarClick(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
    procedure EADTEKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Grupo, Establecimiento: Integer;
    Path, NroDte: String;
  end;

var
  FCargarDte: TFCargarDte;

implementation

uses UPrincipal, UMensajeHuella;

{$R *.dfm}

procedure TFCargarDte.CargarParametros(Grupo: Integer; Establecimiento: Integer; Path: String; NumeroDte: String);
begin
  self.Grupo := Grupo;
  self.Establecimiento := Establecimiento;
  self.Path := Path;
  self.NroDte := NumeroDte;
  EADTE.Text := NumeroDte;
  if (Path <> '') then
  begin
    LInfo.Caption := 'Ya existe un Documento de Tránsito Electrónico asociado';
    LInfo.Visible := true;
  end;
end;

procedure TFCargarDte.ICargarDteClick(Sender: TObject);
var nomDestino, archivo : string;
begin
  if (ODdte.Execute) then
    begin
      nomDestino := 'DTE'+IntToStr(Establecimiento)+'_Grupo'+IntToStr(Grupo)+'.pdf';
      archivo := ExtractFilePath(Application.ExeName)+'SIFTA\'+nomDestino;
      CopyFile(pchar(ODdte.FileName),pchar(archivo),true);
      SetFileAttributes(Pchar(archivo),FILE_ATTRIBUTE_READONLY);
      Path := 'SIFTA\'+nomDestino;
      LInfo.Visible := true;
    end;
end;

procedure TFCargarDte.IAceptarClick(Sender: TObject);
var Nro: Integer;
begin
  inherited;
  NroDte := StringReplace(EADTE.Text, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  NroDte := StringReplace(NroDte, '-', '', [rfReplaceAll, rfIgnoreCase]);
  if ((NroDte <> '') and (Path <> '')) then
  begin
    try
      Nro := StrToInt(NroDte);
    finally
      IBQDte.ParamByName('path').AsString := Path;
      IBQDte.ParamByName('nro').AsInteger := Nro;
      IBQDte.ParamByName('id_grupo').AsInteger := Grupo;
      IBQDte.ParamByName('establecimiento').AsInteger := Establecimiento;
      IBQDte.ExecSQL;
      FPrincipal.IBTPrincipal.CommitRetaining;
      Close;
    end;
  end
  else
  begin
    if (NroDte = '') and (Path = '') then
      MostrarMensaje(tmError, 'Debe completar el número de DTE y cargar un DTE en formato PDF')
    else if (NroDte = '') then
      MostrarMensaje(tmError, 'Debe completar el número de DTE')
    else if (Path = '') then
      MostrarMensaje(tmError, 'Debe cargar un DTE en formato PDF')
  end;
end;

procedure TFCargarDte.ICancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFCargarDte.EADTEKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key <#48) or (key >#57) then
    if (key<>#8) then
    begin
      MostrarMensaje(tmError, 'El DTE debe ser un valor numérico positivo');
      key:=#0;
    end;
end;

end.

{ DAIANA - 22.12.2014 - Incidencia 412 - Fin }


