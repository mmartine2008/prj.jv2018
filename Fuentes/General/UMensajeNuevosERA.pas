unit UMensajeNuevosERA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UMensajeHuella, DB, IBCustomDataSet, ExtCtrls, Grids, DBGrids,
  UBDBGrid, StdCtrls, Buttons, Uprincipal, jpeg, PngImage;

type
  TFMensajeNuevosERA = class(TFMensaje)
    Grilla: TBitDBGrid;
    RGAccion: TRadioGroup;
    LNuevos: TLabel;
    LNroNuevos: TLabel;
    DataSetNuevos: TIBDataSet;
    DSNuevos: TDataSource;
    DataSetNuevosID_AUX: TIntegerField;
    DataSetNuevosESTABLECIMIENTO: TIntegerField;
    DataSetNuevosID_ANIMAL: TIntegerField;
    DataSetNuevosID_RP: TIBStringField;
    DataSetNuevosID_PC: TIBStringField;
    DataSetNuevosID_HBA: TIBStringField;
    DataSetNuevosID_RA: TIBStringField;
    DataSetNuevosFECHA_NACIMIENTO: TDateField;
    DataSetNuevosFECHA_ALTA: TDateField;
    DataSetNuevosSEXO: TIntegerField;
    DataSetNuevosLOTE: TIntegerField;
    DataSetNuevosCATEGORIA: TIntegerField;
    DataSetNuevosRAZA: TIntegerField;
    DataSetNuevosOBSERVACION: TIBStringField;
    DataSetNuevosV1: TIBStringField;
    DataSetNuevosV16: TIBStringField;
    DataSetNuevosV17: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure DataSetNuevosV1SetText(Sender: TField; const Text: String);
    procedure GrillaCellClick(Column: TColumn);
    procedure RGAccionClick(Sender: TObject);
    procedure GrillaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    Opciones : TStringList;
    procedure Prueba();
    procedure listarParecidos(rp:string;var sl:TStringList);
    function comparacionLetras(rp:string;rpLista:string):integer;
    procedure TodosAlta();
    procedure TodosActualizar();
    procedure TodosIgnorar();
  public
    { Public declarations }
  end;

var
  FMensajeNuevosERA: TFMensajeNuevosERA;
  function MostrarMensajeNuevosERA(tipo : TTipoMensaje; msg : String) : TModalResult;

implementation

{$R *.dfm}

function MostrarMensajeNuevosERA(tipo : TTipoMensaje; msg : String) : TModalResult;
var
   retorno : TModalResult;
begin
  FMensajeNuevosERA := TFMensajeNuevosERA.Create(nil,tipo,msg);
  FMensajeNuevosERA.ShowModal;
  retorno := FMensajeNuevosERA.ModalResult;
  FMensajeNuevosERA.Destroy;
  Result := retorno;
end;


procedure TFMensajeNuevosERA.Prueba;
begin
  {       try
            for I := 0 to 10 do
            begin
              IBQExisteAnimal.Close;
              IBQExisteAnimal.ParamByName('RP').Value := RP.Value+'R'+IntToStr(I);
              IBQExisteAnimal.Open;
              if IBQExisteAnimal.IsEmpty then
                break;
            end;
            RPGral := RP.Value+'R'+IntToStr(I);
            IBQGenId.Close;
            IBQGenId.Open;
            IBQAltaDirecta.Close;
            Animal := IBQGenId.FieldValues['IDANIMAL'];
            IBQAltaDirecta.ParamByName('animal').AsInteger := Animal;
            IBQAltaDirecta.ParamByName('RP').Value := RPGral;
            if Sirve(HBA) then
            begin
              if HBA.Value = 0 then
                IBQAltaDirecta.ParamByName('ID_HBA').Value := null
              else
                IBQAltaDirecta.ParamByName('ID_HBA').Value := HBA.Value;
            end;
            IBQAltaDirecta.ParamByName('FECHA').AsDate := FechaN.AsDateTime;
            if Color.Value = 'N' then
              IBQAltaDirecta.ParamByName('Raza').AsInteger := 2
            else
            begin
              if Color.Value = 'C' then
                IBQAltaDirecta.ParamByName('Raza').AsInteger := 3
              else
                IBQAltaDirecta.ParamByName('Raza').AsInteger := 0;
            end;
            if Sexo.Value = 1 then
              IBQAltaDirecta.ParamByName('Categoria').AsInteger := 1
            else
              IBQAltaDirecta.ParamByName('Categoria').AsInteger := 4;
            IBQAltaDirecta.ParamByName('sexo').AsInteger := Sexo.Value;
            IBQAltaDirecta.ParamByName('Observacion').AsString := '';
            IBQAltaDirecta.ParamByName('Establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
            IBQAltaDirecta.ParamByName('Responsable').AsInteger := 0;
            IBQAltaDirecta.ParamByName('Log_Usuario').AsInteger := 1;
            IBQAltaDirecta.ParamByName('Log_Fecha_Modificado').AsDate := Today();
            IBQAltaDirecta.Open;
            FPrincipal.IBTPrincipal.CommitRetaining;}





            {        case Sexo.Value of
          1 : SexoVal := 'Macho';
          2 : SexoVal := 'Hembra';
        end;
        RPGral := RP.Value;
        IBQGenId.Close;
        IBQGenId.Open;
        IBQAltaDirecta.Close;
        Animal := IBQGenId.FieldValues['IDANIMAL'];
        IBQAltaDirecta.ParamByName('animal').AsInteger := Animal;
        IBQAltaDirecta.ParamByName('RP').Value := RPGral;
        if Sirve(HBA) then
        begin
          if HBA.Value = 0 then
            IBQAltaDirecta.ParamByName('ID_HBA').Value := null
          else
            IBQAltaDirecta.ParamByName('ID_HBA').Value := HBA.Value;
        end;
        IBQAltaDirecta.ParamByName('FECHA').AsDate := FechaN.AsDateTime;
        if Color.Value = 'N' then
          IBQAltaDirecta.ParamByName('Raza').AsInteger := 2
        else
        begin
          if Color.Value = 'C' then
            IBQAltaDirecta.ParamByName('Raza').AsInteger := 3
          else
            IBQAltaDirecta.ParamByName('Raza').AsInteger := 0;
        end;
        if Sexo.Value = 1 then
          IBQAltaDirecta.ParamByName('Categoria').AsInteger := 1
        else
          IBQAltaDirecta.ParamByName('Categoria').AsInteger := 4;
        IBQAltaDirecta.ParamByName('sexo').AsInteger := Sexo.Value;
        IBQAltaDirecta.ParamByName('Observacion').AsString := '';
        IBQAltaDirecta.ParamByName('Establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
        IBQAltaDirecta.ParamByName('Responsable').AsInteger := 0;
        IBQAltaDirecta.ParamByName('Log_Usuario').AsInteger := 1;
        IBQAltaDirecta.ParamByName('Log_Fecha_Modificado').AsDate := Today();
        IBQAltaDirecta.Open;}


end;

procedure TFMensajeNuevosERA.FormCreate(Sender: TObject);
begin
  inherited;
  Opciones := TStringList.Create;
  Opciones.Add('Dar de Alta');
  Opciones.Add('Actualizar');
  Opciones.Add('Ignorar');
  Grilla.Columns[0].PickList := Opciones;
  DataSetNuevos.Close;
  DataSetNuevos.Open;
  DataSetNuevos.Last;
  DataSetNuevos.First;
  LNroNuevos.Caption := IntToStr(DataSetNuevos.RecordCount);
end;

procedure TFMensajeNuevosERA.DataSetNuevosV1SetText(Sender: TField;
  const Text: String);
var
  sl:TStringList;
begin
  inherited;
  if (Grilla.Columns[0].PickList.IndexOf(Text)<>-1) and (Sender.AsString<>Text) then
  begin
    RGAccion.ItemIndex := 3;
    sl:=TStringList.Create;
    sl.AddStrings(Grilla.Columns[0].PickList);
    if (Text<>'Dar de Alta') and (Text<>'Actualizar') and (Text <> 'Ignorar') and (Text<>'') then
      sl.Delete(sl.IndexOf(Text));
    if (Sender.AsString<>'Dar de Alta') and (Sender.AsString<>'Actualizar') and (Sender.AsString <> 'Ignorar') and (Sender.AsString<>'') then
      sl.Add(Sender.AsString);
    sl.Sort;
    sl.Move(sl.indexof('Dar de Alta'),0);
    sl.Move(sl.indexof('Actualizar'),1);
    sl.Move(sl.IndexOf('Ignorar'),2);
    Grilla.Columns[0].PickList := sl;
    if (DataSetNuevos.FieldByName('id_aux').AsInteger = -1) and (Text = 'Actualizar') then
      Sender.AsString := 'Dar de Alta'
    else
      Sender.AsString := Text;
  end;
end;

procedure TFMensajeNuevosERA.GrillaCellClick(Column: TColumn);
var
  i:integer;
  str:string;
  sl:TStringList;
begin
  inherited;
  if Column.Title.Caption = 'Accion' then
  begin
    str := DAtasetNuevos.FieldByName('V1').AsString;//[1]+DAtasetNuevos.FieldByName('ID_RP').AsString[2];
    sl := TStringList.Create;
    sl.AddStrings(Grilla.Columns[0].PickList);
    listarParecidos(str,sl);
    Grilla.Columns[0].PickList := sl;
  end;
end;

procedure TFMensajeNuevosERA.listarParecidos(rp:string;var sl:TStringList);
var
  i,pos:integer;
begin
  pos:=0;
  for i:=0 to sl.Count-1 do
    if(length(sl.Strings[i])>2)then
        if (comparacionLetras(rp,sl.Strings[i])>=length(rp)-1) then //si se quiere mas precision poner -1 en vez de -2
        begin
          sl.Move(i,pos);
          pos:=pos+1;
        end;
  pos:=0;
  for i:=0 to sl.Count-1 do
    if(length(sl.Strings[i])>2)then
        if ((ansipos(rp,sl.Strings[i])<>0) or (ansipos(sl.Strings[i],rp)<>0)) then
        begin
          sl.Move(i,pos);
          pos:=pos+1;
        end;
  sl.Move(sl.indexof('Dar de Alta'),0);
  sl.Move(sl.indexof('Actualizar'),1);
  sl.Move(sl.IndexOf('Ignorar'),2);
end;

function TFMensajeNuevosERA.comparacionLetras(rp:string;rpLista:string):integer;
var
  i,iguales,long:integer;
begin
  iguales := 0;
  if length(rpLista)>=length(rp) then
    long := length(rp)-1
  else
    long := length(rpLista)-1;
  for i:=1 to long do
    if rp[i] = rpLista[i] then
      iguales := iguales+1;
  comparacionLetras := iguales;
end;

procedure TFMensajeNuevosERA.TodosActualizar;
begin
  DataSetNuevos.First;
  DSNuevos.Enabled:=false;
  while not Datasetnuevos.Eof do
  begin
    DataSetNuevos.Edit;
    DataSetNuevosV1SetText(DataSetNuevos.FieldByName('V1'),'Actualizar');
    DataSetNuevos.Next;
  end;
  DSNuevos.Enabled:=true;
  DataSetNuevos.First;
end;

procedure TFMensajeNuevosERA.TodosAlta;
begin
  DataSetNuevos.First;
  DSNuevos.Enabled:=false;
  while not Datasetnuevos.Eof do
  begin
    DataSetNuevos.Edit;
    DataSetNuevosV1SetText(DataSetNuevos.FieldByName('V1'),'Dar de Alta');
    DataSetNuevos.Next;
  end;
  DSNuevos.Enabled:=true;
  DataSetNuevos.First;
end;

procedure TFMensajeNuevosERA.TodosIgnorar;
begin
  DataSetNuevos.First;
  DSNuevos.Enabled:=false;
  while not Datasetnuevos.Eof do
  begin
    DataSetNuevos.Edit;
    DataSetNuevosV1SetText(DataSetNuevos.FieldByName('V1'),'Ignorar');
    DataSetNuevos.Next;
  end;
  DSNuevos.Enabled:=true;
  DataSetNuevos.First;
end;

procedure TFMensajeNuevosERA.RGAccionClick(Sender: TObject);
begin
  inherited;
    case RGAccion.ItemIndex of
    0:begin
        TodosAlta();
//        RGAccion.ItemIndex := 0;
      end;
    1:begin
        TodosActualizar();
//        RGAccion.ItemIndex := 1;
      end;
    2:begin
        TodosIgnorar();
//        RGAccion.ItemIndex := 2
      end;
    end;
end;

procedure TFMensajeNuevosERA.GrillaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (DataSetNuevos.FieldValues['id_aux'] = -3) then
    Grilla.Canvas.Brush.Color := RGB(255, 110, 110);    // rojo
  if (DataSetNuevos.FieldValues['id_aux'] = -2) then
    Grilla.Canvas.Brush.Color := RGB(255, 255, 210);    // amarillo


  Grilla.Canvas.FillRect(Rect);
  Grilla.Canvas.Font.Color := clBlack;
  Grilla.Canvas.TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
end;

end.
