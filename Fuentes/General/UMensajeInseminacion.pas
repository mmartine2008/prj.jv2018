unit UMensajeInseminacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UMensajeHuella, StdCtrls, ExtCtrls, Buttons,
  UPrincipal, UEveMovimientoSemenCompra, UEveMovimientoSemenExtraccion,
  UEveInseminacionArtificial, UDMSoftvet, DB, IBCustomDataSet, IBQuery,
  jpeg, PngImage;

type
  TFMensajeInseminacion = class(TFMensaje)
    MToros: TMemo;
    BBExtraccion: TBitBtn;
    BBCompra: TBitBtn;
    IBQToros: TIBQuery;
    IBQTorosNOMBRE: TIBStringField;
    IBQTorosANIMAL: TIntegerField;
    IBQTorosANIMAL_EXTERNO: TIntegerField;
    IBQTorosID_SEMEN: TIntegerField;
    IBQTorosCANTIDAD: TIntegerField;
    ICompra: TImage;
    LCompra: TLabel;
    IExtrac: TImage;
    LExtract: TLabel;
    procedure BBExtraccionClick(Sender: TObject);
    procedure BBCompraClick(Sender: TObject);
  private
    Toros : ListaToros;
    RestoDosis: Integer;
    procedure Actualizar();
  public
    procedure PasarToros(var LToros : ListaToros);
    function GetRestoDosis():Integer;
  published
    constructor Create(owner : TComponent; tipo : TTipoMensaje; msg : string; LToros : ListaToros); reintroduce;
  end;

var
  FMensajeInseminacion: TFMensajeInseminacion;
  function MostrarMensajeInseminacion(tipo : TTipoMensaje; msg : String; LToros : ListaToros): TModalResult;

implementation

function MostrarMensajeInseminacion(tipo : TTipoMensaje; msg : String; LToros : ListaToros): TModalResult;
var
   retorno : TModalResult;
begin
  FMensajeInseminacion := TFMensajeInseminacion.Create(FPrincipal,tipo,msg,LToros);
  FMensajeInseminacion.ShowModal;
  retorno := FMensajeInseminacion.ModalResult;
  FMensajeInseminacion.PasarToros(LToros);
  FMensajeInseminacion.Destroy;
  Result := retorno;
end;

constructor TFMensajeInseminacion.Create(owner : TComponent; tipo : TTipoMensaje; msg : string;
                LToros : ListaToros);
var
  ind, resto : integer;
  ext : String;
  e, i : boolean;
begin
  inherited Create(owner,tipo,msg);
  RestoDosis:= 0;//
  i := false;
  e := false;
  for ind := 0 to Length(LToros)-1 do
  begin
    SetLength(Toros,ind+1);
    Toros[ind].dosis_disponibles := LToros[ind].dosis_disponibles;
    Toros[ind].dosis_requeridas := LToros[ind].dosis_requeridas;
    Toros[ind].id_toro := LToros[ind].id_toro;
    Toros[ind].nombre := LToros[ind].nombre;
    Toros[ind].externo := LToros[ind].externo;
    resto := Toros[ind].dosis_requeridas-Toros[ind].dosis_disponibles;
    if Toros[ind].externo = 'S' then
    begin
      ext := 'Compra';
      e := true;
    end
    else
    begin
      ext := 'Extraccion';
      i := true;
    end;
    MToros.Lines.Add(' Faltan '+IntToStr(resto)+' dosis de '+Toros[ind].nombre+', debe realizar una '+ext);
  end;
  //BBExtraccion.Visible := i = true;
  //BBCompra.Visible := e = true;

  LCompra.Visible := i = true;
  ICompra.Visible := i = true;
  LExtract.Visible := e = true;
  IExtrac.Visible := e = true;

end;

{$R *.dfm}

procedure TFMensajeInseminacion.BBExtraccionClick(Sender: TObject);
var
  abm : TFMovimientosdeSemenExtraccion;
begin
  inherited;
  abm := TFMovimientosdeSemenExtraccion.Create(self);
  abm.ShowModal;
  abm.Destroy;
  Actualizar();
  if (RestoDosis <= 0) then
    begin
      self.ModalResult:= mrYes;
      self.Close;
    end;
  if (RestoDosis = 0) then
    begin
      self.ModalResult:= mrYes;
      self.Close;
    end;
  RestoDosis:= 0;    
end;

procedure TFMensajeInseminacion.BBCompraClick(Sender: TObject);
var
  abm : TFMovimientosdeSemenCompra;
begin
  inherited;
  abm := TFMovimientosdeSemenCompra.Create(self);
  abm.ActDosisSemen(Toros);
  abm.Destroy;
  Actualizar();
  if (RestoDosis = 0) then
    begin
      self.ModalResult:= mrYes;
      self.Close;
    end;
  RestoDosis:= 0;  
end;

procedure TFMensajeInseminacion.Actualizar();
var
  indice, resto : integer;
  ext : String;
begin
  try
    IBQToros.Close;
    IBQToros.ParamByName('idEstablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQToros.Open;
    MToros.Lines.Clear;
    for indice := 0 to Length(Toros)-1 do
    begin
      IBQToros.Locate('id_semen',Toros[indice].id_toro,[loCaseInsensitive]);
      Toros[indice].nombre := IBQToros.FieldValues['nombre'];
      Toros[indice].dosis_disponibles := IBQToros.FieldValues['cantidad'];
      if Toros[indice].dosis_disponibles >= Toros[indice].dosis_requeridas then
        resto := 0
      else
        resto := Toros[indice].dosis_requeridas-Toros[indice].dosis_disponibles;
      if Toros[indice].externo = 'S' then ext := 'Compra'
      else ext := 'Extraccion';
      MToros.Lines.Add(' Faltan '+IntToStr(resto)+' dosis de '+Toros[indice].nombre+', debe realizar una '+ext);
      RestoDosis:= RestoDosis + resto;
    end;
  except
  end;
end;

procedure TFMensajeInseminacion.PasarToros(var LToros : ListaToros);
var
  indice : integer;
begin
  for indice := 0 to Length(Toros)-1 do
  begin
    LToros[indice].id_toro := Toros[indice].id_toro;
    LToros[indice].nombre := Toros[indice].nombre;
    LToros[indice].dosis_disponibles := Toros[indice].dosis_disponibles;
  end;
end;

function TFMensajeInseminacion.GetRestoDosis: Integer;
begin
  result:= RestoDosis;
end;

end.
