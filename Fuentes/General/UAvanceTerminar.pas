unit UAvanceTerminar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, DB,
  IBCustomDataSet, IBStoredProc, WinXP, DataExport, DataToXLS, Buttons,
  IBQuery, UTraduccion, JvGIF, PngImage, jpeg, JvExControls, JvLabel,
  ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TModoAvance = (maGuardando, maListo, maError, maVerificando, maDetalle,maManga);
  TFAvanceTerminar = class(TFUniversal)
    PBotones: TPanel;
    PAvance: TPanel;
    PBTerminar: TProgressBar;
    LEtiqueta: TLabel;
    AcAceptar: TAction;
    PDetalles: TPanel;
    BBDetalles: TButton;
    AcDetalles: TAction;
    MDetalles: TMemo;
    BBAceptar: TBitBtn;
    BBCancelar: TBitBtn;
    AcCancelar: TAction;
    IFondo: TImage;
    ITerminar: TImage;
    LTerminar: TLabel;
    ICancelar: TImage;
    LCancelar: TLabel;
    procedure AcAceptarExecute(Sender: TObject);
    procedure AcCancelarExecute(Sender: TObject);
    procedure AcDetallesExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FModo: TModoAvance;
    FDetalles: Boolean;
    procedure SetModo(const Value: TModoAvance);
    procedure mostrarError;
    procedure mostrarGuardando;
    procedure mostrarListo;
    procedure mostrarVerificando;
    procedure mostrarDetalle;
    procedure mostrarManga;
    function GetMax: Integer;
    function GetPos: Integer;
    procedure SetMax(const Value: Integer);
    procedure SetPos(const Value: Integer);
    procedure SetDetalles(const Value: Boolean);
  public
    cancelar:boolean;
    function GetEtiqueta():String;
    procedure SetEtiqueta(etiqueta:String);
    property Modo : TModoAvance read FModo write SetModo;
    property Max : Integer read GetMax write SetMax;
    property Pos : Integer read GetPos write SetPos;
    property Detalles : Boolean read FDetalles write SetDetalles;

  end;

var
  FAvanceTerminar: TFAvanceTerminar;

implementation

{$R *.dfm}

procedure TFAvanceTerminar.AcAceptarExecute(Sender: TObject);
begin
  inherited;
  if (TForm(Owner) <> nil) then
  begin
    TForm(Owner).SetFocus;
    TForm(Owner).BringToFront;
  end;
  Close;
end;

procedure TFAvanceTerminar.mostrarGuardando;
begin
  LEtiqueta.Caption := Traducir('Guardando:');
  //AcAceptar.Enabled := False;
  LTerminar.Enabled := false;
  ITerminar.Enabled := false;
//  AcCancelar.Enabled:= True;
//  AcCancelar.Visible:= True;
  AcDetalles.Visible := False;
  Hide;
  Show;
end;

procedure TFAvanceTerminar.mostrarListo;
begin
  LEtiqueta.Caption := Traducir('Listo:');
  //AcAceptar.Enabled := True;
  LTerminar.Enabled := true;
  ITerminar.Enabled := true;
//  AcCancelar.Enabled:= False;
  AcDetalles.Visible := False;
//  AcCancelar.Visible:= False;
  //BBAceptar.SetFocus;
  Hide;
  ShowModal;
end;

procedure TFAvanceTerminar.mostrarError;
begin
  LEtiqueta.Caption := Traducir('Error:');
  //AcAceptar.Enabled := True;
  LTerminar.Enabled := true;
  ITerminar.Enabled := true;
  AcDetalles.Visible := True;
//  AcCancelar.Visible:= False;
  BBDetalles.SetFocus;
  Hide;
  ShowModal;
end;

procedure TFAvanceTerminar.mostrarVerificando;
begin
  LEtiqueta.Caption := Traducir('Verificando:');
  //AcAceptar.Enabled := False;
  LTerminar.Enabled := false;
  ITerminar.Enabled := false;
  //AcCancelar.Enabled:= True;
  //AcCancelar.Visible:= True;
  LCancelar.Visible := true;
  ICancelar.Visible := true;
  AcDetalles.Visible := False;
  Hide;
  Show;
end;

procedure TFAvanceTerminar.mostrarDetalle;
begin
  LEtiqueta.Caption := Traducir('Cargando:');
  //AcAceptar.Enabled := False;
  LTerminar.Enabled := false;
  ITerminar.Enabled := false;
//  AcCancelar.Enabled:= True;
  AcDetalles.Visible:= False;
//  AcCancelar.Visible:= True;
  Hide;
  Show;
end;

procedure TFAvanceTerminar.mostrarManga;
begin
  LEtiqueta.Caption := Traducir('Cargando:');
  //AcAceptar.Enabled := False;
  LTerminar.Enabled := false;
  ITerminar.Enabled := false;
//  AcCancelar.Enabled:= True;
  AcDetalles.Visible := False;
//  AcCancelar.Visible:= True;
  Hide;
  Show;
end;


procedure TFAvanceTerminar.SetModo(const Value: TModoAvance);
begin
  FModo := Value;
  case FModo of
    maGuardando:   mostrarGuardando;
    maListo:       mostrarListo;
    maError:       mostrarError;
    maVerificando: mostrarVerificando;
    maDetalle:     mostrarDetalle;
    maManga:       mostrarManga;
  end;
end;

function TFAvanceTerminar.GetMax: Integer;
begin
  Result := PBTerminar.Max;
end;

function TFAvanceTerminar.GetPos: Integer;
begin
  Result := PBTerminar.Position;
end;

procedure TFAvanceTerminar.SetMax(const Value: Integer);
begin
  PBTerminar.Max := Value;
end;

procedure TFAvanceTerminar.SetPos(const Value: Integer);
begin
  PBTerminar.Position := Value;
end;

procedure TFAvanceTerminar.SetDetalles(const Value: Boolean);
begin
  if (FDetalles <> Value) then
    begin
      FDetalles := Value;
      PDetalles.Visible := FDetalles;
      if (FDetalles) then begin
        BBDetalles.Caption := Traducir('Detalles <<');
        Height := Height + 100
      end else begin
        BBDetalles.Caption := Traducir('Detalles >>');
        Height := Height - PDetalles.Height;
      end;
    end;
end;

procedure TFAvanceTerminar.AcDetallesExecute(Sender: TObject);
begin
  inherited;
  Detalles := not Detalles;
end;

procedure TFAvanceTerminar.FormCreate(Sender: TObject);
begin
  inherited;
  Detalles := False;
  cancelar:=false;
end;

procedure TFAvanceTerminar.FormShow(Sender: TObject);
begin
  inherited;
  Detalles := False;
  Height := Height - PDetalles.Height;

  if (FModo = maDetalle) then
    begin
      LTitulo.Caption:= Traducir('Generando Detalles');
      Self.Caption := 'Huella - ' + LTitulo.Caption;
    end
   else
    if (FModo = maManga) then
      begin
        LTitulo.Caption:= Traducir('Pasando Animales');
        Self.Caption := 'Huella - ' + LTitulo.Caption;
      end;
end;

function TFAvanceTerminar.GetEtiqueta: String;
begin
 result:= LEtiqueta.Caption;
end;

procedure TFAvanceTerminar.SetEtiqueta(etiqueta: String);
begin
  LEtiqueta.Caption:= etiqueta;
end;

procedure TFAvanceTerminar.AcCancelarExecute(Sender: TObject);
begin
  inherited;
//  self.ModalResult:=mrCancel;
//  cancelar:=true;
end;

end.
