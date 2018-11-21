unit UCoordenadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, DBCtrls, UDBLookupComboBoxAuto, GISShape,
  GISImage, DynamicArrayUnit, PngImage, jpeg, ImgList, PngImageList,
  JvExStdCtrls, JvListComb, JvExExtCtrls, JvImage;

type
  TValorCoord = record
    Grado : Double;
    Minuto : Double;
    Segundo : Double;
    Orientacion : String;
  end;

  TCoordenada = record
    Latitud : TValorCoord;
    Longitud : TValorCoord;
    Orden : Integer;
  end;

  TArrCoords = Array of TCoordenada;

  TFCoordenadas = class(TFUniversal)
    PBotones: TPanel;
    IBQPotreros: TIBQuery;
    DSPotreros: TDataSource;
    IBQGuardarCoordenadas: TIBQuery;
    IBQGenIdCoord: TIBQuery;
    IBQDeleteCoord: TIBQuery;
    Image1: TImage;
    IAceptar: TImage;
    ICancelar: TImage;
    LAceptar: TLabel;
    LCancelar: TLabel;
    PCCoordenadas: TPageControl;
    TSPotreros: TTabSheet;
    PPotrero: TPanel;
    LPotrero: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DBLCBAPotreros: TDBLookupComboBoxAuto;
    PPreview: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    SVOGISIPrev: TSVOGISImage;
    TSReferencias: TTabSheet;
    GBCoord: TGroupBox;
    ESegLong: TEdit;
    Label11: TLabel;
    EMinLong: TEdit;
    Label10: TLabel;
    EGradoLong: TEdit;
    Label9: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    EGradoLat: TEdit;
    Label6: TLabel;
    EMinLat: TEdit;
    Label7: TLabel;
    ESegLat: TEdit;
    Label8: TLabel;
    Label5: TLabel;
    GBReferencia: TGroupBox;
    ILBReferencias: TJvImageListBox;
    PLReferencia: TPngImageList;
    IBQGetCoordenadas: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure DBLCBAPotrerosCloseUp(Sender: TObject);
    procedure IAceptarClick(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
  private
    Coordenadas : TArrCoords;
    EdTop, EdLeft : Integer;
    Indice : Integer;
    SBCoordenadas : TScrollBox;
    procedure AgregarCoords(GradLat, MinLat, SegLat, GradLong, MinLong, SegLong : Double; OrLat, OrLong : String);
    procedure DibujarPreview;
    procedure GuardarPotreros;
    procedure GuardarReferencias;
    procedure ModificarCoordenadas(Potrero : Integer);
    procedure AgregarAArreglo(Indice : Integer);
  public
    { Public declarations }
  end;

var
  FCoordenadas: TFCoordenadas;
  datosCompletos : boolean;

implementation

{$R *.dfm}

uses
  UPrincipal, StrUtils, UMensajeHuella;

procedure TFCoordenadas.FormCreate(Sender: TObject);
begin
  inherited;
  SBCoordenadas := TScrollBox.Create(self);
  SBCoordenadas.Parent := TSPotreros;
  SBCoordenadas.Align := alClient;

  IBQPotreros.Close;
  IBQPotreros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotreros.Open;
  IBQPotreros.Last;
  IBQPotreros.First;
  EdTop := 32;
  EdLeft := 40;
  Indice := 1;
end;

procedure TFCoordenadas.DibujarPreview;
var
  I : Integer;
  Lista, Lista1 : TSVOShapeList;
  Linea : TSVOLineShape;
  Punto : TDoublePoint;
  PShape : TSVOPointShape;
  X, Y : Double;
  Arr : TDoublePointArray;
begin
  if Length(Coordenadas) > 1 then
  begin
    SVOGISIPrev.ClearShapes;
    Lista := TSVOShapeList.Create;
    Lista1 := TSVOShapeList.Create;
    SVOGISIPrev.AddShapeList(Lista);
    SVOGISIPrev.AddShapeList(Lista1);
    Arr := TDoublePointArray.Create(Length(Coordenadas));
    for I := 0 to Length(Coordenadas)-1 do
    begin
      X := (((Coordenadas[I].Longitud.Segundo/60)+Coordenadas[I].Longitud.Minuto)/60)+Coordenadas[I].Longitud.Grado;
      if Coordenadas[I].Longitud.Orientacion = 'O' then
        X := X*-1;
      Y := (((Coordenadas[I].Latitud.Segundo/60)+Coordenadas[I].Latitud.Minuto)/60)+Coordenadas[I].Latitud.Grado;
      if Coordenadas[I].Latitud.Orientacion = 'S' then
        Y := Y*-1;
      Punto.x := X;
      Punto.y := Y;
      Arr[I] := Punto;

      PShape := TSVOPointShape.Create(Lista1);
      PShape.SetShape(Punto);
      PShape.Labels.Create;
      PShape.Labels.LineCount := 2;
      PShape.Labels.Caption := 'Lat: '+FormatFloat('##.##',Coordenadas[I].Latitud.Grado)+'º '+FormatFloat('##.##',Coordenadas[I].Latitud.Minuto)+'´ '+FormatFloat('##.##',Coordenadas[I].Latitud.Segundo)+'´´ '+Coordenadas[I].Latitud.Orientacion+
                               ' Long: '+FormatFloat('##.##',Coordenadas[I].Longitud.Grado)+'º '+FormatFloat('##.##',Coordenadas[I].Longitud.Minuto)+'´ '+FormatFloat('##.##',Coordenadas[I].Longitud.Segundo)+'´´ '+Coordenadas[I].Longitud.Orientacion;
      PShape.DrawLabel(SVOGISIPrev.Canvas,SVOGISIPrev.ScaleParams);
    end;
    if Length(Coordenadas) > 2 then
      Arr.Add(Arr[0]);
    Linea := TSVOLineShape.Create(Lista,Arr);
    Linea.ShowNodes := true;
    Linea.GraphicStyles.Pen.Width := 2;
    SVOGISIPrev.Boundary := Lista.BoundaryBox;
    SVOGISIPrev.Draw;
  end;
end;

procedure TFCoordenadas.AgregarCoords(GradLat, MinLat, SegLat, GradLong, MinLong, SegLong : Double; OrLat, OrLong : String);
var
  I : Integer;
  L : TLabel;
begin
  for I := 1 to 6 do
  begin
    with TEdit.Create(self) do
    begin
      Parent := SBCoordenadas;
      Left := EdLeft;
      Top := EdTop;
      Width := 33;
      Height := 22;
      Tag := Indice;
      OnExit := EditExit;
      case I of
        1 : begin
              Name := 'GradoLat'+IntToStr(Indice);
              Text := FormatFloat('##.##',GradLat);
            end;
        2 : begin
              Name := 'MinLat'+IntToStr(Indice);
              Text := FormatFloat('##.##',MinLat);
            end;
        3 : begin
              Name := 'SegLat'+IntToStr(Indice);
              Text := FormatFloat('##.##',SegLat);
            end;
        4 : begin
              Name := 'GradoLong'+IntToStr(Indice);
              Text := FormatFloat('##.##',GradLong);
            end;
        5 : begin
              Name := 'MinLong'+IntToStr(Indice);
              Text := FormatFloat('##.##',MinLong);
            end;
        6 : begin
              Name := 'SegLong'+IntToStr(Indice);
              Text := FormatFloat('##.##',SegLong);
            end;
      end;
    end;
    EdLeft := EdLeft + 33 + 23;

    L := TLabel.Create(self);
    L.Parent := SBCoordenadas;
    L.AutoSize := false;
    L.Left := EdLeft - 23;
    L.Top := EdTop;
    L.Width := 8;
    L.Height := 22;
    case I of
      1,4 : L.Caption := 'º';
      2,5 : L.Caption := '´';
      3,6 : L.Caption := '´´';
    end;

    if I = 3 then
    begin
      with TComboBox.Create(self) do
      begin
        Parent := SBCoordenadas;
        Name := 'CBLatitud'+IntToStr(Indice);
        Width := 66;
        Top := EdTop;
        Left := EdLeft;
        Items.Add('Norte');
        Items.Add('Sur');
        Tag := Indice;
        if OrLat = 'N' then
          ItemIndex := 0
        else if OrLat = 'S' then
                ItemIndex := 1
              else
                ItemIndex := -1;
      end;
      with TShape.Create(self) do
      begin
        Parent := SBCoordenadas;
        Top := EdTop - 48;
        Left := EdLeft + 66 + 2;
        Width := 2;
        Height := EdTop + 48;
      end;
      EdLeft := EdLeft + 47 + 33;
    end;
    if I = 6 then
    begin
      with TComboBox.Create(self) do
      begin
        Parent := SBCoordenadas;
        Name := 'CBLongitud'+IntToStr(Indice);
        Width := 60;
        Top := EdTop;
        Left := EdLeft;
        Items.Add('Este');
        Items.Add('Oeste');
        Tag := Indice;
        if OrLong = 'E' then
          ItemIndex := 0
        else if OrLong = 'O' then
              ItemIndex := 1
             else
              ItemIndex := -1;
      end;
    end;
  end;
  with TButton.Create(self) do
  begin
    Parent := SBCoordenadas;
    Left := EdLeft + 70;
    Top := EdTop;
    Caption := 'Aceptar';
    Width := 51;
    Height := 25;
    Tag := Indice;
    OnClick := ButtonClick;
  end;
  EdTop := EdTop + 48;
  EdLeft := 40;
  Indice := Indice + 1;
  SBCoordenadas.Repaint;

  with TShape.Create(self) do
  begin
    Parent := SBCoordenadas;
    Top := EdTop-8;
    Left := 0;
    Width := SBCoordenadas.Width;
    Height := 2;
  end;

end;

procedure TFCoordenadas.EditExit(Sender: TObject);
var
  d : Double;
  Ind : Integer;
begin
  inherited;
  if (Sender as TEdit).Text <> '' then
    if not TryStrToFloat((Sender as TEdit).Text,d) then
      (Sender as TEdit).Text := '';
end;

procedure TFCoordenadas.AgregarAArreglo(Indice : Integer);
var
  Comp : TComponent;
  I : Integer;
begin
  if Indice > Length(Coordenadas) then
    SetLength(Coordenadas,Indice);
  for I := 1 to 8 do
  begin
    case I of
      1 : Comp := FindComponent('GradoLat'+IntToStr(Indice));
      2 : Comp := FindComponent('MinLat'+IntToStr(Indice));
      3 : Comp := FindComponent('SegLat'+IntToStr(Indice));
      4 : Comp := FindComponent('GradoLong'+IntToStr(Indice));
      5 : Comp := FindComponent('MinLong'+IntToStr(Indice));
      6 : Comp := FindComponent('SegLong'+IntToStr(Indice));
      7 : Comp := FindComponent('CBLongitud'+IntToStr(Indice));
      8 : Comp := FindComponent('CBLatitud'+IntToStr(Indice));
    end;
    if Comp <> nil then
    begin
      case I of
        1 : if ((Comp as TEdit).Text <> '') then
            begin
                Coordenadas[Indice-1].Latitud.Grado := StrToFloat((Comp as TEdit).Text);
                datosCompletos := true;
            end
            else
                datosCompletos := false;

        2 : if (((Comp as TEdit).Text <> '') and datosCompletos)then
            begin
                datosCompletos := true;
                Coordenadas[Indice-1].Latitud.Minuto := StrToFloat((Comp as TEdit).Text);
            end
            else
                datosCompletos := false;

        3 : if (((Comp as TEdit).Text <> '') and datosCompletos) then
            begin
                datosCompletos := true;
                Coordenadas[Indice-1].Latitud.Segundo := StrToFloat((Comp as TEdit).Text);
            end
            else
                datosCompletos := false;

        4 : if (((Comp as TEdit).Text <> '') and datosCompletos) then
            begin
                datosCompletos := true;
                Coordenadas[Indice-1].Longitud.Grado := StrToFloat((Comp as TEdit).Text);
            end
            else
                datosCompletos := false;

        5 : if (((Comp as TEdit).Text <> '') and datosCompletos) then
            begin
                datosCompletos := true;
                Coordenadas[Indice-1].Longitud.Minuto := StrToFloat((Comp as TEdit).Text);
            end
            else
                datosCompletos := false;

        6 : if (((Comp as TEdit).Text <> '') and datosCompletos) then
            begin
                datosCompletos := true;
                Coordenadas[Indice-1].Longitud.Segundo := StrToFloat((Comp as TEdit).Text)
            end
            else
                datosCompletos := false;

        7 : begin
              if ((Comp as TComboBox).Text <> 'CBLongitud') then
                case (Comp as TComboBox).ItemIndex of
                  0 : Coordenadas[Indice-1].Longitud.Orientacion := 'E';
                  1 : Coordenadas[Indice-1].Longitud.Orientacion := 'O';
                end
              else
                datosCompletos := false;
            end;

        8 : begin
              if ((Comp as TComboBox).Text <> 'CBLatitud') then
                case (Comp as TComboBox).ItemIndex of
                  0 : Coordenadas[Indice-1].Latitud.Orientacion := 'N';
                  1 : Coordenadas[Indice-1].Latitud.Orientacion := 'S';
                end
              else
                 datosCompletos := false;
            end;
            
      end;
    end;
  end;
  Coordenadas[Indice-1].Orden := Indice;
end;

procedure TFCoordenadas.ButtonClick(Sender: TObject);
var
  I, Indice : Integer;
begin
  inherited;
  Indice := (Sender as TButton).Tag;
  AgregarAArreglo(Indice);
  if (datosCompletos) then
  begin
    DibujarPreview;
    AgregarCoords(Coordenadas[Indice-1].Latitud.Grado,Coordenadas[Indice-1].Latitud.Minuto,0,Coordenadas[Indice-1].Longitud.Grado,
                  Coordenadas[Indice-1].Longitud.Minuto,0,Coordenadas[Indice-1].Latitud.Orientacion,Coordenadas[Indice-1].Longitud.Orientacion);
    datosCompletos := false;  
  end
  else
       MostrarMensaje(tmError,'Faltan algunos datos requeridos.'+#13+''+#13+'(*) Tal vez falten valores en las coordenadas.'+#13+'(*) Tal vez no se especificó tipo de Latitud o de Longitud.');

end;

procedure TFCoordenadas.DBLCBAPotrerosCloseUp(Sender: TObject);
begin
  inherited;
  datosCompletos := false;
  if DBLCBAPotreros.KeyValue <> null then
    ModificarCoordenadas(DBLCBAPotreros.KeyValue);
end;

procedure TFCoordenadas.GuardarPotreros;
var
  I : Integer;
begin
  inherited;
  try
    IBQDeleteCoord.Close;
    IBQDeleteCoord.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDeleteCoord.ParamByName('pot').AsInteger := DBLCBAPotreros.KeyValue;
    IBQDeleteCoord.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
  for I := 0 to Length(Coordenadas)-1 do
  begin
    IBQGenIdCoord.Close;
    IBQGenIdCoord.Open;
    try
      IBQGuardarCoordenadas.Close;
      IBQGuardarCoordenadas.ParamByName('id').AsInteger := IBQGenIdCoord.FieldValues['id'];
      IBQGuardarCoordenadas.ParamByName('gradoLong').Value := Coordenadas[I].Longitud.Grado;
      IBQGuardarCoordenadas.ParamByName('minLong').Value := Coordenadas[I].Longitud.Minuto;
      IBQGuardarCoordenadas.ParamByName('segLong').Value := Coordenadas[I].Longitud.Segundo;
      IBQGuardarCoordenadas.ParamByName('orLong').Value := Coordenadas[I].Longitud.Orientacion;
      IBQGuardarCoordenadas.ParamByName('gradoLat').Value := Coordenadas[I].Latitud.Grado;
      IBQGuardarCoordenadas.ParamByName('minLat').Value := Coordenadas[I].Latitud.Minuto;
      IBQGuardarCoordenadas.ParamByName('segLat').Value := Coordenadas[I].Latitud.Segundo;
      IBQGuardarCoordenadas.ParamByName('orLat').Value := Coordenadas[I].Latitud.Orientacion;
      IBQGuardarCoordenadas.ParamByName('potrero').Value := DBLCBAPotreros.KeyValue;
      IBQGuardarCoordenadas.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
      IBQGuardarCoordenadas.ParamByName('orden').Value := Coordenadas[I].Orden;
      IBQGuardarCoordenadas.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;
  Close;
end;

procedure TFCoordenadas.GuardarReferencias;
var
  Pot : Integer;
begin
  case ILBReferencias.ItemIndex of
    0 : Pot := -2; //Bebida
    1 : Pot := -1; //Casa
    2 : Pot := -7; //Entrada
    3 : Pot := -6; //Galpon
    4 : Pot := -8; //Molino
    5 : Pot := -5; //Puesto
    6 : Pot := -3; //Silos
    7 : Pot := -4; //Tranquera
  end;


  IBQGenIdCoord.Close;
  IBQGenIdCoord.Open;
  try
    IBQGuardarCoordenadas.Close;
    IBQGuardarCoordenadas.ParamByName('id').AsInteger := IBQGenIdCoord.FieldValues['id'];
    IBQGuardarCoordenadas.ParamByName('gradoLong').Value := StrToFloat(EGradoLong.Text);
    IBQGuardarCoordenadas.ParamByName('minLong').Value := StrToFloat(EMinLong.Text);
    IBQGuardarCoordenadas.ParamByName('segLong').Value := StrToFloat(ESegLong.Text);
    IBQGuardarCoordenadas.ParamByName('orLong').Value := 'O';
    IBQGuardarCoordenadas.ParamByName('gradoLat').Value := StrToFloat(EGradoLat.Text);
    IBQGuardarCoordenadas.ParamByName('minLat').Value := StrToFloat(EMinLat.Text);
    IBQGuardarCoordenadas.ParamByName('segLat').Value := StrToFloat(ESegLat.Text);
    IBQGuardarCoordenadas.ParamByName('orLat').Value := 'S';
    IBQGuardarCoordenadas.ParamByName('potrero').Value := Pot;
    IBQGuardarCoordenadas.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
    IBQGuardarCoordenadas.ParamByName('orden').Value := 1;
    IBQGuardarCoordenadas.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFCoordenadas.IAceptarClick(Sender: TObject);
begin
  if PCCoordenadas.ActivePage = TSPotreros then
    GuardarPotreros;
  if PCCoordenadas.ActivePage = TSReferencias then
    GuardarReferencias;
end;

procedure TFCoordenadas.ICancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFCoordenadas.ModificarCoordenadas(Potrero : Integer);
var
  I : Integer;
begin

  SBCoordenadas.Destroy;

  EdTop := 32;
  EdLeft := 40;
  Indice := 1;
  SetLength(Coordenadas,1);
  SBCoordenadas := TScrollBox.Create(self);
  SBCoordenadas.Parent := TSPotreros;
  SBCoordenadas.Align := alClient;

  IBQGetCoordenadas.Close;
  IBQGetCoordenadas.ParamByName('pot').AsInteger := Potrero;
  IBQGetCoordenadas.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGetCoordenadas.Open;
  if IBQGetCoordenadas.IsEmpty then
    AgregarCoords(0,0,0,0,0,0,'','')
  else
  begin
    while not IBQGetCoordenadas.Eof do
    begin
      AgregarCoords(IBQGetCoordenadas.FieldValues['GRADO_LAT'],IBQGetCoordenadas.FieldValues['MIN_LAT'],IBQGetCoordenadas.FieldValues['SEG_LAT'],
                    IBQGetCoordenadas.FieldValues['GRADO_LONG'],IBQGetCoordenadas.FieldValues['MIN_LONG'],IBQGetCoordenadas.FieldValues['SEG_LONG'],
                    IBQGetCoordenadas.FieldValues['UBICACION_LAT'],IBQGetCoordenadas.FieldValues['UBICACION_LONG']);
      AgregarAArreglo(Indice-1);
      //Inc(Indice);
      IBQGetCoordenadas.Next;
    end;
    DibujarPreview;
    AgregarCoords(0,0,0,0,0,0,'','');
  end;

end;

end.
