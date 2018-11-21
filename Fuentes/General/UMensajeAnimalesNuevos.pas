unit UMensajeAnimalesNuevos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UMensajeHuella, StdCtrls, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, jpeg, PngImage;

type

  TRegDatos = record
    id_animal : integer;
    id_padre : integer;
    nom_p, rp_p, hba_p : String;
    id_madre : integer;
    nom_m, rp_m, hba_m : String;
    cargado_m, cargado_p : Boolean;
  end;

  TArrDatos = Array of TRegDatos;

  TFMensajeAnimalesNuevos = class(TFMensaje)
    MAnimales: TMemo;
    IBQGenId: TIBQuery;
    IBQInsertExterno: TIBQuery;
    IBQRNIdentificacionExternos: TIBQuery;
    MErrores: TMemo;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BBSiClick(Sender: TObject);
    procedure IsiClick(Sender: TObject);
  private
    Arr : TArrDatos;
    Errores : Integer;
    function BuscarAnimal(id_animal : Integer) : Integer;
    procedure InicRegistro(I : Integer);
    procedure CheckIdent();
    procedure Cargar();
    procedure EliminarRepetidos;
    procedure ActualizarIDsMadres;
    procedure ActualizarIDsPadres;
  public
    Termina : Boolean;
    procedure AgregarMadre(id_animal : Integer; rp, hba, nombre : String);
    procedure AgregarPadre(id_animal : Integer; rp, hba, nombre : String);
    function Padre(id_animal : Integer) : Integer;
    function Madre(id_animal : Integer) : Integer;
  published
    constructor Create(Owner : TComponent); reintroduce;
  end;

var
  FMensajeAnimalesNuevos: TFMensajeAnimalesNuevos;

implementation

{$R *.dfm}

uses
  UPrincipal;

constructor TFMensajeAnimalesNuevos.Create(Owner : TComponent);
var
  Indice : Integer;
begin
  inherited Create(Owner,tmConsulta,'Los siguientes animales no existen en el sistema. ¿Desea Ingresarlos?');
  SetLength(Arr,0);
  Termina := false;
end;

function TFMensajeAnimalesNuevos.BuscarAnimal(id_animal : Integer) : Integer;
var
  I, Res : Integer;
begin
  Res := -1;
  for I := 0 to Length(Arr)-1 do
    if Arr[I].id_animal = id_animal then
    begin
      Res := I;
      break;
    end;
  Result := Res;
end;

procedure TFMensajeAnimalesNuevos.InicRegistro(I : Integer);
begin
  Arr[I].id_padre := -1;
  Arr[I].id_madre := -1;
  Arr[I].nom_m := '';
  Arr[I].nom_p := '';
  Arr[I].rp_m := '';
  Arr[I].rp_p := '';
  Arr[I].hba_m := '';
  Arr[I].hba_p := '';
  Arr[I].cargado_m := false;
  Arr[I].cargado_p := false;
end;

procedure TFMensajeAnimalesNuevos.AgregarMadre(id_animal : integer; rp, hba, nombre : String);
var
  I : Integer;
begin
  I := BuscarAnimal(id_animal);
  if I = -1 then
  begin
    I := Length(Arr);
    SetLength(Arr,I+1);
    Arr[I].id_animal := id_animal;
    InicRegistro(I);
  end;
  Arr[I].id_madre := -1;
  Arr[I].nom_m := nombre;
  Arr[I].rp_m := rp;
  Arr[I].hba_m := hba;
end;

procedure TFMensajeAnimalesNuevos.AgregarPadre(id_animal : Integer; rp, hba, nombre : String);
var
  I : Integer;
begin
  I := BuscarAnimal(id_animal);
  if I = -1 then
  begin
    I := Length(Arr);
    SetLength(Arr,I+1);
    Arr[I].id_animal := id_animal;
    InicRegistro(I);
  end;
  Arr[I].id_padre := -1;
  Arr[I].nom_p := nombre;
  Arr[I].rp_p := rp;
  Arr[I].hba_p := hba;
end;

function TFMensajeAnimalesNuevos.Padre(id_animal : Integer) : Integer;
var
  I : Integer;
begin
  I := BuscarAnimal(id_animal);
  if I = -1 then
    Result := -1
  else
    Result := Arr[I].id_padre;
end;

function TFMensajeAnimalesNuevos.Madre(id_animal : Integer) : Integer;
var
  I : Integer;
begin
  I := BuscarAnimal(id_animal);
  if I = -1 then
    Result := -1
  else
    Result := Arr[I].id_madre;
end;

procedure TFMensajeAnimalesNuevos.FormShow(Sender: TObject);
var
  I : Integer;
  Str : String;
begin
  inherited;
  EliminarRepetidos;
  for I := 0 to Length(Arr)-1 do
  begin
    if (Arr[I].rp_m <> '') and not Arr[I].cargado_m then
    begin
      Str := ' Madre - RP: '+Arr[I].rp_m;
      if Arr[I].hba_m <> '' then
        Str := Str+', HBA: '+Arr[I].hba_m;
      if Arr[I].nom_m <> '' then
        Str := Str+', Nombre: '+Arr[I].nom_m;
      MAnimales.Lines.Add(Str);
    end;
    if (Arr[I].rp_p <> '') and not Arr[I].cargado_p then
    begin
      Str := ' Padre - RP: '+Arr[I].rp_p;
      if Arr[I].hba_p <> '' then
        Str := Str+', HBA: '+Arr[I].hba_p;
      if Arr[I].nom_p <> '' then
        Str := ', Nombre: '+Arr[I].nom_p;
      MAnimales.Lines.Add(Str);
    end;
  end;
end;

procedure TFMensajeAnimalesNuevos.EliminarRepetidos;
var
  I, J : Integer;
begin
  I := 0;
  while I <= Length(Arr)-1 do
  begin
    J := I + 1;
    while J <= Length(Arr)-1 do
    begin
      {if I <> J then
      begin}
        if (Arr[I].rp_p = Arr[J].rp_p) and not Arr[J].cargado_p then
        begin
          Arr[J].id_padre := Arr[I].id_padre;
          Arr[J].cargado_p := true;
        end;
        if (Arr[I].rp_m = Arr[J].rp_m) and not Arr[J].cargado_m then
        begin
          Arr[J].id_madre := Arr[I].id_madre;
          Arr[J].cargado_m := true;
        end;
      //end;
      Inc(J);
    end;
    Inc(I);
  end;
end;

procedure TFMensajeAnimalesNuevos.CheckIdent;
var
  I : Integer;
begin
  Errores := 0;
  for I := 0 to Length(Arr)-1 do
  begin
    if (Arr[I].rp_m <> '') and not Arr[I].cargado_m then
    begin
      IBQRNIdentificacionExternos.Close;
      IBQRNIdentificacionExternos.ParamByName('animal').AsInteger := Arr[I].id_madre;
      IBQRNIdentificacionExternos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQRNIdentificacionExternos.ParamByName('rp').AsString := Arr[I].rp_m;
      IBQRNIdentificacionExternos.ParamByName('senasa').Value := null;
      IBQRNIdentificacionExternos.ParamByName('pc').Value := null;
      if Arr[I].hba_m <> '' then
        IBQRNIdentificacionExternos.ParamByName('hba').AsString := Arr[I].hba_m
      else
        IBQRNIdentificacionExternos.ParamByName('hba').Value := null;
      IBQRNIdentificacionExternos.ParamByName('ra').Value := null;
      IBQRNIdentificacionExternos.ParamByName('otro').Value := null;
      IBQRNIdentificacionExternos.Open;
      IBQRNIdentificacionExternos.First;
      while not IBQRNIdentificacionExternos.Eof do
      begin
        if IBQRNIdentificacionExternos.FieldByName('RESULT').AsString = 'E' then
        begin
          Inc(Errores);
          MErrores.Lines.Add(IBQRNIdentificacionExternos.FieldValues['Result'] + ':  '+Arr[I].rp_m+': '+ IBQRNIdentificacionExternos.FieldValues['mensaje'])
        end;
        IBQRNIdentificacionExternos.Next;
      end;
    end;
    if (Arr[I].rp_p <> '') and not Arr[I].cargado_p then
    begin
      IBQRNIdentificacionExternos.Close;
      IBQRNIdentificacionExternos.ParamByName('animal').AsInteger := Arr[I].id_padre;
      IBQRNIdentificacionExternos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQRNIdentificacionExternos.ParamByName('rp').AsString := Arr[I].rp_p;
      IBQRNIdentificacionExternos.ParamByName('senasa').Value := null;
      IBQRNIdentificacionExternos.ParamByName('pc').Value := null;
      if Arr[I].hba_p <> '' then
        IBQRNIdentificacionExternos.ParamByName('hba').AsString := Arr[I].hba_p
      else
        IBQRNIdentificacionExternos.ParamByName('hba').Value := null;
      IBQRNIdentificacionExternos.ParamByName('ra').Value := null;
      IBQRNIdentificacionExternos.ParamByName('otro').Value := null;
      IBQRNIdentificacionExternos.Open;
      IBQRNIdentificacionExternos.First;
      while not IBQRNIdentificacionExternos.Eof do
      begin
        if IBQRNIdentificacionExternos.FieldByName('RESULT').AsString = 'E' then
        begin
          Inc(Errores);
          MErrores.Lines.Add(IBQRNIdentificacionExternos.FieldValues['Result'] + ':  '+Arr[I].rp_p+': '+ IBQRNIdentificacionExternos.FieldValues['mensaje'])
        end;
        IBQRNIdentificacionExternos.Next;
      end;
    end;
  end;
  if (Errores > 0) then
    Height := 455;
end;

procedure TFMensajeAnimalesNuevos.Cargar();
var
  I, id : Integer;
begin
  for I := 0 to Length(Arr)-1 do
  begin
    if (Arr[I].rp_m <> '') and not Arr[I].cargado_m then
    begin
      try
        IBQGenId.Close;
        IBQGenId.Open;
        id := IBQGenId.FieldValues['IDANIMAL'];
        Arr[I].id_madre := id;
        IBQInsertExterno.Close;
        IBQInsertExterno.ParamByName('id').AsInteger := id;
        IBQInsertExterno.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
        IBQInsertExterno.ParamByName('rp').AsString := Arr[I].rp_m;
        IBQInsertExterno.ParamByName('hba').AsString := Arr[I].hba_m;
        IBQInsertExterno.ParamByName('nombre').AsString := Arr[I].nom_m;
        IBQInsertExterno.ParamByName('raza').AsInteger := 0;
        IBQInsertExterno.ParamByName('sexo').AsInteger := 2;
        IBQInsertExterno.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
    if (Arr[I].rp_p <> '') and not Arr[I].cargado_p then
    begin
      try
        IBQGenId.Close;
        IBQGenId.Open;
        id := IBQGenId.FieldValues['IDANIMAL'];
        Arr[I].id_padre := id;
        IBQInsertExterno.Close;
        IBQInsertExterno.ParamByName('id').AsInteger := id;
        IBQInsertExterno.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
        IBQInsertExterno.ParamByName('rp').AsString := Arr[I].rp_p;
        IBQInsertExterno.ParamByName('hba').AsString := Arr[I].hba_p;
        IBQInsertExterno.ParamByName('nombre').AsString := Arr[I].nom_p;
        IBQInsertExterno.ParamByName('raza').AsInteger := 0;
        IBQInsertExterno.ParamByName('sexo').AsInteger := 1;
        IBQInsertExterno.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
  end;
end;

procedure TFMensajeAnimalesNuevos.BBSiClick(Sender: TObject);
begin
  CheckIdent();
  if (Errores = 0) then
  begin
    Termina := true;
    Cargar;
    ActualizarIDsMadres();
    ActualizarIDsPadres();
    Close;
  end;
end;

procedure TFMensajeAnimalesNuevos.ActualizarIDsMadres;
var
  I, J : Integer;
begin
  I := 0;
  while I <= Length(Arr)-1 do
  begin
    J := I+1;
    while J <= Length(Arr)-1 do
    begin
      if (Arr[I].rp_m = Arr[J].rp_m) then
        Arr[J].id_madre := Arr[I].id_madre;
      Inc(J)
    end;
    Inc(I);
  end;
end;

procedure TFMensajeAnimalesNuevos.ActualizarIDsPadres;
var
  I, J : Integer;
begin
  I := 0;
  while I <= Length(Arr)-1 do
  begin
    J := I+1;
    while J <= Length(Arr)-1 do
    begin
      if (Arr[I].rp_p = Arr[J].rp_p) then
        Arr[J].id_padre := Arr[I].id_padre;
      Inc(J)
    end;
    Inc(I);
  end;
end;

procedure TFMensajeAnimalesNuevos.IsiClick(Sender: TObject);
begin
  inherited;

  Cargar;

end;

end.
