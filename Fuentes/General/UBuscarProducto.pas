unit UBuscarProducto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, Grids, DBGrids, PngImage, jpeg, JvExExtCtrls,
  JvImage, ImgList, PngImageList;

type

  TRegBusqueda = record
    Fondo : TImage;
    Leyenda, Categoria, Desc : TLabel;
    Icono, Icono2 : TJvImage;
    Accion : TAction;
    Top, Left : Integer;
  end;

  TArrBusqueda = Array of TRegBusqueda;

  TFBusquedaProd = class(TFUniversal)
    PTop: TPanel;
    Label1: TLabel;
    ETipoTrat: TEdit;
    Label2: TLabel;
    EProducto: TEdit;
    PBotones: TPanel;
    PProductos: TPanel;
    IElegir: TImage;
    LElegir: TLabel;
    ICancelar: TImage;
    LCancelar: TLabel;
    IBQProductos: TIBQuery;
    DSProductos: TDataSource;
    SBProductos: TScrollBox;
    IFondoBusqueda: TImage;
    IFonodB1: TImage;
    IFondoB2: TImage;
    ISelector: TImage;
    INotFound: TImage;
    Label3: TLabel;
    IDoc: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ETipoTratChange(Sender: TObject);
    procedure EProductoChange(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
    procedure IElegirClick(Sender: TObject);
    procedure LabelClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    tipo, prod : String;
    Busqueda : TArrBusqueda;
    procedure ActualizarConsulta;
    procedure ActualizarBusqueda;
    procedure RedimensionarBusqueda;
    procedure EliminarBusqueda;
  public
    IdProducto : Integer;
    NombreProducto : String;
    NombreTipo : String;
    TipoProducto : Integer;
  end;

var
  FBusquedaProd: TFBusquedaProd;

implementation

{$R *.dfm}

uses
  UPrincipal, UABMDescTipoTratamiento, UCartel;

procedure TFBusquedaProd.FormCreate(Sender: TObject);
begin
  inherited;
  tipo := '%';
  prod := '%';
  ActualizarConsulta;
end;

procedure TFBusquedaProd.ActualizarConsulta;
var
  C : TCartel;
begin
  C := TCartel.getInstance;
  C.abrircartel('Obteniendo Listado de Productos;');

  IBQProductos.Close;
  IBQProductos.ParamByName('tipo').AsString := tipo;
  IBQProductos.ParamByName('prod').AsString := prod;
  IBQProductos.Open;
  ActualizarBusqueda;

  C.cerrarcartel;
  C.FreeInstance;
end;

procedure TFBusquedaProd.ETipoTratChange(Sender: TObject);
begin
  inherited;
  tipo := UpperCase(ETipoTrat.Text) + '%';
  ActualizarConsulta;
end;

procedure TFBusquedaProd.EProductoChange(Sender: TObject);
begin
  inherited;
  prod := UpperCase(EProducto.Text) + '%';
  ActualizarConsulta;
end;

procedure TFBusquedaProd.ICancelarClick(Sender: TObject);
begin
  inherited;
  IdProducto := -1;
  Close;
end;

procedure TFBusquedaProd.IElegirClick(Sender: TObject);
var
  F : TFABMDescTipoTratamiento;
begin
  inherited;
  {IdProducto := IBQProductos.FieldValues['id_tratamiento'];
  NombreProducto := IBQProductos.FieldValues['nombre'];
  Close;}
  F := TFABMDescTipoTratamiento.Create(self);
  F.ShowModal;
  F.Destroy;
  ActualizarConsulta;
end;

procedure TFBusquedaProd.ActualizarBusqueda;
var
  I, cant : Integer;
  L : TLabel;
  Img : TImage;
  TA, LA : Integer;
  HayBusquedas : Boolean;
begin
  IBQProductos.First;
  EliminarBusqueda;
  LA := 30;
  cant := 0;
  TA := 0;
  HayBusquedas := false;
  while not IBQProductos.Eof do
  begin
    HayBusquedas := true;
    SetLength(Busqueda,cant+1);
    Busqueda[cant].Fondo := TImage.Create(self);
    Busqueda[cant].Fondo.Parent := SBProductos;
    if (cant mod 2) = 0 then
      Busqueda[cant].Fondo.Picture := IFonodB1.Picture
    else
      Busqueda[cant].Fondo.Picture := IFondoB2.Picture;
    Busqueda[cant].Fondo.Top := TA;
    Busqueda[cant].Fondo.Left := 0;
    Busqueda[cant].Fondo.Width := SBProductos.Width;
    Busqueda[cant].Fondo.Height := 76;
    Busqueda[cant].Fondo.Stretch := true;
    Busqueda[cant].Fondo.SendToBack;

    Busqueda[cant].Categoria := Tlabel.Create(self);
    Busqueda[cant].Categoria.Parent := SBProductos;
    Busqueda[cant].Categoria.Font.Size := 10;
    Busqueda[cant].Categoria.Font.Name := 'Arial';
    Busqueda[cant].Categoria.Font.Style := [fsItalic];

    Busqueda[cant].Icono := TJvImage.Create(self);
    Busqueda[cant].Icono.Parent := SBProductos;
    Busqueda[cant].Icono.Picture := ISelector.Picture;
    Busqueda[cant].Icono.Left := 30;
    Busqueda[cant].Icono.Tag := IBQProductos.FieldValues['id_tratamiento'];
    Busqueda[cant].Icono.Top := TA + (Busqueda[cant].Fondo.Height div 2) - 28;
    //Busqueda[cant].Icono.OnClick := IClick;
    Busqueda[cant].Icono.Cursor := crHandPoint;

    Busqueda[cant].Icono2 := TJvImage.Create(self);
    Busqueda[cant].Icono2.Parent := SBProductos;
    Busqueda[cant].Icono2.Picture := IDoc.Picture;
    Busqueda[cant].Icono2.Left := Busqueda[cant].Icono.Left+Busqueda[cant].Icono.Width+5;
    Busqueda[cant].Icono2.Tag := IBQProductos.FieldValues['id_tratamiento'];
    Busqueda[cant].Icono2.Top := TA + (Busqueda[cant].Fondo.Height div 2) - 28;
    //Busqueda[cant].Icono2.OnClick := IClick;
    Busqueda[cant].Icono2.Cursor := crHandPoint;

    Busqueda[cant].Leyenda := Tlabel.Create(self);
    Busqueda[cant].Leyenda.Parent := SBProductos;
    Busqueda[cant].Leyenda.Left := Busqueda[cant].Icono2.Left + Busqueda[cant].Icono2.Width + 5;
    Busqueda[cant].Leyenda.Top := TA + (Busqueda[cant].Fondo.Height div 2) - (Busqueda[cant].Leyenda.Height div 2);
    Busqueda[cant].Leyenda.Cursor := crHandPoint;
    Busqueda[cant].Leyenda.Font.Size := 14;
    Busqueda[cant].Leyenda.Font.Name := 'Arial';
    Busqueda[cant].Leyenda.Font.Style := [fsUnderline];
    Busqueda[cant].Leyenda.Caption := IBQProductos.FieldValues['nombre'];


    Busqueda[cant].Desc := Tlabel.Create(self);
    Busqueda[cant].Desc.Parent := SBProductos;
    Busqueda[cant].Desc.Font.Size := 10;
    Busqueda[cant].Desc.Font.Name := 'Arial';
    Busqueda[cant].Desc.Font.Style := [fsBold,fsItalic];
    Busqueda[cant].Desc.Left := Busqueda[cant].Leyenda.Left + Busqueda[cant].Leyenda.Width + 20;//Busqueda[cant].Icono.Left + Busqueda[cant].Icono.Width + 5;
    Busqueda[cant].Desc.Top := TA + (Busqueda[cant].Fondo.Height div 2) - (Busqueda[cant].Categoria.Height div 2);
    Busqueda[cant].Desc.Transparent := true;
    if IBQProductos.FieldByName('periodoretirada').Value <> null then
      Busqueda[cant].Desc.Caption := Busqueda[cant].Desc.Caption + ' - Periodo de Retirada: '+FormatFloat('##.##',IBQProductos.FieldValues['periodoretirada'])+' días';
    if IBQProductos.FieldByName('precio').Value <> null then
      if IBQProductos.FieldByName('precio').Value > 0 then
        Busqueda[cant].Desc.Caption := Busqueda[cant].Desc.Caption + ' - Precio: $'+FormatFloat('##.##',IBQProductos.FieldValues['precio']);

    Busqueda[cant].Categoria.Left := Busqueda[cant].Desc.Left + Busqueda[cant].Desc.Width + 20;//Busqueda[cant].Icono.Left + Busqueda[cant].Icono.Width + 5;
    Busqueda[cant].Categoria.Top := TA + (Busqueda[cant].Fondo.Height div 2) - (Busqueda[cant].Categoria.Height div 2);
    Busqueda[cant].Categoria.Caption := IBQProductos.FieldValues['tipo'];
    Busqueda[cant].Categoria.Transparent := true;

    Busqueda[cant].Leyenda.OnClick := LabelClick;
    Busqueda[cant].Leyenda.Tag := IBQProductos.FieldValues['id_tratamiento'];
    Busqueda[cant].Leyenda.Transparent := true;
    Busqueda[cant].Accion := nil;
    Busqueda[cant].Top := TA;
    Busqueda[cant].Left := LA;
    TA := TA+76 ;
    Inc(cant);
    IBQProductos.Next;
    Application.ProcessMessages;
  end;
  if not HayBusquedas then
  begin
    SetLength(Busqueda,1);
    Busqueda[0].Fondo := TImage.Create(self);
    Busqueda[0].Fondo.Parent := SBProductos;
    Busqueda[0].Fondo.Picture := IFondoB2.Picture;
    Busqueda[0].Fondo.Top := TA;
    Busqueda[0].Fondo.Left := 0;
    Busqueda[0].Fondo.Width := SBProductos.Width;
    Busqueda[0].Fondo.Height := 76;
    Busqueda[0].Fondo.Stretch := true;
    Busqueda[0].Fondo.SendToBack;

    Busqueda[0].Categoria := Tlabel.Create(self);
    Busqueda[0].Categoria.Parent := SBProductos;
    Busqueda[0].Categoria.Font.Size := 10;
    Busqueda[0].Categoria.Font.Name := 'Arial';
    Busqueda[0].Categoria.Font.Style := [fsItalic];

    Busqueda[0].Icono := TJvImage.Create(self);
    Busqueda[0].Icono.Parent := SBProductos;
    Busqueda[0].Icono.Picture := INotFound.Picture;
    Busqueda[0].Icono.Left := 30;
    Busqueda[0].Icono.Top := TA + (Busqueda[0].Fondo.Height div 2) - 28;
    //Busqueda[0].Icono.OnClick := IClick;

    Busqueda[0].Icono2 := nil;

    Busqueda[0].Categoria.Left := Busqueda[0].Icono.Left + Busqueda[0].Icono.Width + 5;
    Busqueda[0].Categoria.Top := TA + (Busqueda[0].Fondo.Height div 2) - (Busqueda[0].Categoria.Height div 2);
    Busqueda[0].Categoria.Caption := 'No hay Resultados';
    Busqueda[0].Categoria.Transparent := true;

    Busqueda[0].Leyenda := Tlabel.Create(self);
    Busqueda[0].Leyenda.Parent := SBProductos;
    Busqueda[0].Leyenda.Left := Busqueda[0].Categoria.Left + Busqueda[0].Categoria.Width + 20;
    Busqueda[0].Leyenda.Top := TA + (Busqueda[0].Fondo.Height div 2) - (Busqueda[0].Leyenda.Height div 2);
    Busqueda[0].Leyenda.Cursor := crHandPoint;
    Busqueda[0].Leyenda.Font.Size := 14;
    Busqueda[0].Leyenda.Font.Name := 'Arial';
    Busqueda[0].Leyenda.Transparent := true;
    Busqueda[0].Leyenda.Font.Style := [fsUnderline];
    if IBQProductos.IsEmpty then
      Busqueda[0].Leyenda.Caption := 'No hay ninguna coincidencia con la búsqueda';
    Busqueda[0].Leyenda.OnClick := nil;
    Busqueda[0].Accion := nil;
    Busqueda[0].Top := TA;
    Busqueda[0].Left := LA;

    Busqueda[0].Desc := nil;
  end;
end;

procedure TFBusquedaProd.LabelClick(Sender: TObject);
begin
  inherited;
  IdProducto := (Sender as TLabel).Tag;
  NombreProducto := (Sender as TLabel).Caption;
  TipoProducto := IBQProductos.Lookup('id_tratamiento',IdProducto,'id_tipo_tratamiento');
  Close;
end;

procedure TFBusquedaProd.EliminarBusqueda;
var
  I : Integer;
begin
  try
  for I := 0 to Length(Busqueda)-1 do
  begin
    if Busqueda[I].Fondo <> nil then
      Busqueda[I].Fondo.Destroy;
    if Busqueda[I].Leyenda <> nil then
      Busqueda[I].Leyenda.Destroy;
    if Busqueda[I].Icono <> nil then
      Busqueda[I].Icono.Destroy;
    if Busqueda[I].Icono2 <> nil then
      Busqueda[I].Icono2.Destroy;
    if Busqueda[I].Categoria <> nil then
      Busqueda[I].Categoria.Destroy;
    if Busqueda[I].Desc <> nil then
      Busqueda[I].Desc.Destroy;
  end;
  except
  end;
end;

procedure TFBusquedaProd.RedimensionarBusqueda;
var
  I : Integer;
  TA : Integer;
begin
  TA := 0;
  for I := 0 to Length(Busqueda)-1 do
  begin
    Busqueda[I].Fondo.Width := SBProductos.Width;
    Busqueda[I].Icono.Top := TA + (Busqueda[I].Fondo.Height div 2) - 28;
    Busqueda[I].Leyenda.Top := TA + (Busqueda[I].Fondo.Height div 2) - (Busqueda[I].Leyenda.Height div 2);
    Busqueda[I].Categoria.Top := TA + (Busqueda[I].Fondo.Height div 2) - (Busqueda[I].Categoria.Height div 2);
    Busqueda[I].Desc.Top := TA + (Busqueda[I].Fondo.Height div 2) - (Busqueda[I].Categoria.Height div 2);
    TA := TA + 76;
  end;
end;

procedure TFBusquedaProd.FormResize(Sender: TObject);
begin
  inherited;
  RedimensionarBusqueda;
end;

end.
