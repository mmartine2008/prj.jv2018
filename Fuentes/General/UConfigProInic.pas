unit UConfigProInic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, PngImage, jpeg, JvExExtCtrls, JvImage,
  ImgList, PngImageList;

type
  TRecProductos = record
    ID_Prod : Integer;
    Nom_Prod : String;
    Tipo : Integer;
    eliminado : Boolean;
    L1, L2 : Tlabel;
    S : TShape;
    IE : TImage;
  end;

  TArrProductos = Array of TRecProductos;

  TFConfigProInic = class(TFUniversal)
    PBotones: TPanel;
    Image1: TImage;
    IAceptar: TImage;
    ICancelar: TImage;
    LAceptar: TLabel;
    LCancelar: TLabel;
    IBQSYSProtocoloInic: TIBQuery;
    Pcli: TPanel;
    IBQDelSysProcIni: TIBQuery;
    IBQSYSInsert: TIBQuery;
    IEliminar: TImage;
    SBProductos: TScrollBox;
    LProd2: TLabel;
    IProd: TImage;
    LProd1: TLabel;
    Label1: TLabel;
    LIngreso: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure LClick(Sender: TObject);
    procedure LClickEliminarL(Sender: TObject);
    procedure LClickEliminarI(Sender: TObject);
    procedure IAceptarClick(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
  private
    Productos : TArrProductos;
    procedure CargarProtocolo;
    procedure EliminarProducto(I : Integer);
  public
    { Public declarations }
  end;

var
  FConfigProInic: TFConfigProInic;

implementation

{$R *.dfm}

uses
  UPrincipal, UBuscarProducto;

procedure TFConfigProInic.FormCreate(Sender: TObject);
begin
  inherited;
  CargarProtocolo;
end;

procedure TFConfigProInic.CargarProtocolo;
var
  I : Integer;
  NextTopL, NextTopS : Integer;
  L1, L2 : TLabel;
  S1, S2 : TShape;
  IE : TImage;
begin
 try

    for I := 0 to Length(Productos)-1 do
    begin
      if Productos[I].L1 <> nil then
      begin
        Productos[I].L1.Destroy;
        Productos[I].L1 := nil;
      end;
      Productos[I].L2.Visible := false;
     { if Productos[I].L2 <> nil then
      begin
        Productos[I].L2.Destroy;
        Productos[I].L2 := nil;
      end;   }
      if Productos[I].S <> nil then
      begin
        Productos[I].S.Destroy;
        Productos[I].S := nil;
      end;
      Productos[I].IE.Visible := false;
     { if Productos[I].IE <> nil then
      begin
        Productos[I].IE.Destroy;
        Productos[I].IE := nil;
      end;}
    end;

  except
  end;

  try

  SetLength(Productos,0);
  IBQSYSProtocoloInic.Close;
  IBQSYSProtocoloInic.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSYSProtocoloInic.Open;
  NextTopL := 126;
  NextTopS := 102;

  LProd1.Top := NextTopL;
  LProd2.Top := NextTopL;
  IProd.Top := NextTopL-16;

  I := 0;
  if IBQSYSProtocoloInic.IsEmpty then
  begin
    LIngreso.Caption := 'Seleccione los tratamientos sanitarios';
    LProd2.Caption := 'para seleccionar un producto';
  end
  else
  begin
    LIngreso.Caption := 'Tratamientos sanitarios seleccionados';
    LProd2.Caption := 'para seleccionar otro producto';
    while not IBQSYSProtocoloInic.Eof do
    begin

      SetLength(Productos,I+1);
      Productos[I].ID_Prod := IBQSYSProtocoloInic.FieldValues['PRODUCTO'];
      Productos[I].Nom_Prod := IBQSYSProtocoloInic.FieldValues['NOMBRE'];
      Productos[I].Tipo := IBQSYSProtocoloInic.FieldValues['TIPO_TRAT'];
      Productos[I].eliminado := false;


      Productos[I].S := TShape.Create(self);
      Productos[I].S := TShape.Create(self);
      Productos[I].S.Parent := SBProductos;
      Productos[I].S.Left := 248;
      Productos[I].S.Top := NextTopS;
      Productos[I].S.Width := 425;
      Productos[I].S.Height := 65;
      Productos[I].S.Brush.Color := clMoneyGreen;
      Productos[I].S.Brush.Style := bsSolid;
      Productos[I].S.Pen.Color := clTeal;

      Productos[I].L1 := TLabel.Create(self);
      Productos[I].L1.Parent := SBProductos;
      Productos[I].L1.AutoSize := false;
      Productos[I].L1.WordWrap := true;
      Productos[I].L1.Alignment := taCenter;
      Productos[I].L1.Transparent := true;
      Productos[I].L1.Font.Size := 10;
      Productos[I].L1.Font.Name := 'Trebuchet MS';
      Productos[I].L1.Font.Style := [fsBold];
      Productos[I].L1.Top := NextTopL;
      Productos[I].L1.Left := 256;
      Productos[I].L1.Height := 31;
      Productos[I].L1.Width := 409;
      Productos[I].L1.Caption := Productos[I].Nom_Prod;
      Productos[I].L1.Tag := I;
      Productos[I].L1.OnClick := LClick;
      Productos[I].L1.Cursor := crHandPoint;

      Productos[I].IE := TImage.Create(self);
      Productos[I].IE.Parent := SBProductos;
      Productos[I].IE.AutoSize := true;
      Productos[I].IE.Top := NextTopL-2;
      Productos[I].IE.Left := Productos[I].S.Left + Productos[I].S.Width + 3;
      Productos[I].IE.Picture :=IEliminar.Picture;
      Productos[I].IE.Cursor := crHandPoint;
      Productos[I].IE.Tag := I;
      Productos[I].IE.OnClick := LClickEliminarI;

      Productos[I].L2 := TLabel.Create(self);
      Productos[I].L2.Parent := SBProductos;
      Productos[I].L2.Transparent := true;
      Productos[I].L2.Font.Size := 10;
      Productos[I].L2.Left := Productos[I].IE.Left+Productos[I].IE.Width+5;
      Productos[I].L2.Caption := 'Eliminar Producto';
      Productos[I].L2.Top := Productos[I].IE.Top + (Productos[I].L2.Height div 2);
      Productos[I].L2.Tag := I;
      Productos[I].L2.OnClick := LClickEliminarL;
      Productos[I].L2.Cursor := crHandPoint;

      NextTopL := NextTopL + 65;
      NextTopS := NextTopS + 65;
      Inc(I);
      IBQSYSProtocoloInic.Next;
    end;
    LProd1.Top := NextTopL;
    LProd2.Top := NextTopL;
    IProd.Top := NextTopL-16;
  end;

  except
  end;
end;

procedure TFConfigProInic.LClick(Sender: TObject);
var
  F : TFBusquedaProd;
  I, T : Integer;
  L, L2 : TLabel;
  S : TShape;
  Tipo : Integer;
  IE : TImage;
begin
  inherited;


  if (Sender is TLabel) then
    Tipo := (Sender as TLabel).Tag;
  if (Sender is TImage) then
    Tipo := (Sender as TImage).Tag;


  F := TFBusquedaProd.Create(self);
  F.ShowModal;
  if F.IdProducto <> -1 then
  begin
    if Tipo = -1 then
    begin
      I := Length(Productos);
      SetLength(Productos,I+1);
      Productos[I].ID_Prod := F.IdProducto;
      Productos[I].Nom_Prod := F.NombreProducto;
      Productos[I].Tipo := F.TipoProducto;

      if (Sender is TLabel) then
        T := (Sender as TLabel).Top;
      if (Sender is TImage) then
        T := (Sender as TImage).Top+16;

      Productos[I].S := TShape.Create(self);
      Productos[I].S.Parent := SBProductos;
      Productos[I].S.Left := 248;
      Productos[I].S.Top := T-24;
      Productos[I].S.Width := 425;
      Productos[I].S.Height := 65;
      Productos[I].S.Brush.Color := clMoneyGreen;
      Productos[I].S.Brush.Style := bsSolid;
      Productos[I].S.Pen.Color := clTeal;
      
      Productos[I].L1 := TLabel.Create(self);
      Productos[I].L1.Parent := SBProductos;
      Productos[I].L1.AutoSize := false;
      Productos[I].L1.WordWrap := true;
      Productos[I].L1.Alignment := taCenter;
      Productos[I].L1.Transparent := true;
      Productos[I].L1.Font.Size := 10;
      Productos[I].L1.Font.Name := 'Trebuchet MS';
      Productos[I].L1.Font.Style := [fsBold];
      Productos[I].L1.Top := T;
      Productos[I].L1.Left := 256;
      Productos[I].L1.Height := 31;
      Productos[I].L1.Width := 409;
      Productos[I].L1.Caption := Productos[I].Nom_Prod;
      Productos[I].L1.Tag := I;
      Productos[I].L1.OnClick := LClick;
      Productos[I].L1.Cursor := crHandPoint;

      Productos[I].IE := TImage.Create(self);
      Productos[I].IE.Parent := SBProductos;
      Productos[I].IE.AutoSize := true;
      Productos[I].IE.Top := T-2;
      Productos[I].IE.Left := Productos[I].S.Left + Productos[I].S.Width + 3;
      Productos[I].IE.Picture := IEliminar.Picture;
      Productos[I].IE.Cursor := crHandPoint;
      Productos[I].IE.Tag := I;
      Productos[I].IE.OnClick := LClickEliminarI;

      Productos[I].L2 := TLabel.Create(self);
      Productos[I].L2.Parent := SBProductos;
      Productos[I].L2.Transparent := true;
      Productos[I].L2.Font.Size := 10;
      Productos[I].L2.Left := Productos[I].IE.Left+Productos[I].IE.Width+10;
      Productos[I].L2.Caption := 'Eliminar Producto';
      Productos[I].L2.Tag := I;
      Productos[I].L2.Top := Productos[I].IE.Top + (Productos[I].L2.Height div 2);
      Productos[I].L2.OnClick := LClickEliminarL;
      Productos[I].L2.Cursor := crHandPoint;

      LProd1.Top := T + 65;
      LProd2.Top := T + 65;
      IProd.Top := (T+65)-16;
      LProd2.Caption := 'para seleccionar otro producto';
    end
    else
    begin
      I := Tipo;
      (Sender as TLabel).Caption := F.NombreProducto;
      Productos[I].ID_Prod := F.IdProducto;
      Productos[I].Nom_Prod := F.NombreProducto;
    end;
  end;
  F.Destroy;
end;

procedure TFConfigProInic.LClickEliminarL(Sender: TObject);
begin
  inherited;
  EliminarProducto((Sender as TLabel).Tag);
end;

procedure TFConfigProInic.LClickEliminarI(Sender: TObject);
begin
  inherited;
  ELiminarProducto((Sender as TImage).Tag);
end;

procedure TFConfigProInic.EliminarProducto(I : Integer);
var
  k : Integer;
begin
  try
    Productos[I].eliminado := true;
    Application.ProcessMessages;
      try
      IBQDelSysProcIni.Close;
      IBQDelSysProcIni.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQDelSysProcIni.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;

    for K := 0 to Length(Productos)-1 do
    begin
      if not Productos[K].eliminado then
      begin
        try
          IBQSYSInsert.Close;
          IBQSYSInsert.ParamByName('prod').AsInteger := Productos[K].ID_Prod;
          IBQSYSInsert.ParamByName('nom').AsString := Productos[K].Nom_Prod;
          IBQSYSInsert.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
          IBQSYSInsert.ParamByName('tipo').AsInteger := Productos[K].Tipo;
          IBQSYSInsert.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
      end;
    end;
    CargarProtocolo;
  except
  end;
end;

procedure TFConfigProInic.IAceptarClick(Sender: TObject);
var
  I : Integer;
begin
  inherited;
  try
    IBQDelSysProcIni.Close;
    IBQDelSysProcIni.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDelSysProcIni.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;

  for I := 0 to Length(Productos)-1 do
  begin
    try
      IBQSYSInsert.Close;
      IBQSYSInsert.ParamByName('prod').AsInteger := Productos[I].ID_Prod;
      IBQSYSInsert.ParamByName('nom').AsString := Productos[I].Nom_Prod;
      IBQSYSInsert.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQSYSInsert.ParamByName('tipo').AsInteger := Productos[I].Tipo;
      IBQSYSInsert.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;

  Close;
end;

procedure TFConfigProInic.ICancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
