unit UFrameGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, IBQuery, ExtCtrls, StdCtrls, Chart, StrUtils, Jpeg;

type
  TFFrameGrafico = class(TFrame)
    PGrafico: TImage;
  private
    { Private declarations }
    function TransformarCadena(cad : string) : string;
    procedure DibujarLineaVertical(vtop, vleft : integer; vlparent : TImage; val : string);
    procedure DibujarLineaHorizontal(vtop, vleft, vini, vfin : integer; vlparent : TImage);
    procedure CrearEjeReferencia(vtop,inicio,fin,num_div,val : integer; vlparent : TImage);
    function getTamBarraGrafica(inicio, fin, incremento : integer) : integer;

    procedure CrearCeldaTexto(vltop, vlleft, vlheigth, vlwidth : integer; texto : string; vlparent : TImage);
    procedure CrearCeldaGrafica(vtop, vleft, vheigth, vwidth : integer; vparent : TImage; vcolor : TColor);
    procedure GuardarGrafico;
  public
    { Public declarations }
    procedure ArmarGraficoDatosFenotipicos(ibq : TIBQuery; val : integer; factor : integer);
    procedure Limpiar;
  end;

var arrComponentes : array of TComponent;
    cantComponent : integer = 0;
    f : integer;

implementation

{$R *.dfm}

procedure TFFrameGrafico.CrearCeldaGrafica(vtop, vleft, vheigth, vwidth : integer; vparent : TImage; vcolor : TColor);
var celda : TShape;
begin

    celda := TShape.Create(vparent);

    celda.Shape := stRectangle;
    celda.Height := vheigth;
    celda.Width := vwidth;
    celda.Left := vleft;
    celda.Top := vtop;
    celda.Brush.Color := vcolor;
//    celda.Owner := vparent;
//    celda.Parent := vparent;

    Inc(cantComponent);
    SetLength(arrComponentes,cantComponent);
    arrComponentes[cantComponent-1] := celda;
end;

procedure TFFrameGrafico.CrearCeldaTexto(vltop, vlleft, vlheigth, vlwidth : integer; texto : string; vlparent : TImage);
var txt : TLabel;
begin

    txt := TLabel.Create(vlparent);
    txt.AutoSize := false;
    txt.Top := vltop+2;
    txt.Left := vlleft+5;
    txt.Height := vlheigth;
    txt.Width := vlwidth;
    txt.Layout := tlCenter;
    txt.Alignment := taCenter;
    txt.Caption := texto;
    txt.Transparent := true;

    if ((f = 0) or (f = 1) or (f = 2)) then
      txt.Font.Size := 10;

    if ((f = 3) or (f = 4) or (f = 5)) then
      txt.Font.Size := 9;

    if ((f = 6) or (f = 7) or (f = 8)) then
      txt.Font.Size := 8;

    Inc(cantComponent);
    SetLength(arrComponentes,cantComponent);
    arrComponentes[cantComponent-1] := txt;

end;

procedure TFFrameGrafico.ArmarGraficoDatosFenotipicos(ibq : TIBQuery; val : integer; factor : integer);
var vLleft, val_num_fenot, tamBarra : integer;
    val_des_fenot, sinonimo_fenot : string;
    x, xsi, ysi, xid, yid : integer;
begin

    //x := 185;
    x := 0;

    PGrafico.Canvas.Pen.Color := clBlack;
    PGrafico.Canvas.Pen.Width := 1;
    PGrafico.Canvas.Brush.Color := clWhite;
    PGrafico.Canvas.Rectangle(x,0,x+740,16);

    PGrafico.Canvas.TextOut(x+360,2,'Carga lineal');

    PGrafico.Canvas.Pen.Color := clBlack;
    PGrafico.Canvas.Pen.Width := 1;
    PGrafico.Canvas.Brush.Color := clWhite;
    PGrafico.Canvas.Rectangle(x,16,x+185,32);
    PGrafico.Canvas.TextOut(x+80,18,'Descriptor');

    PGrafico.Canvas.Pen.Color := clBlack;
    PGrafico.Canvas.Pen.Width := 1;
    PGrafico.Canvas.Brush.Color := clWhite;
    PGrafico.Canvas.Rectangle(x+185,16,x+555,32);
    PGrafico.Canvas.TextOut(x+370-5,18,'Gráfica');

    PGrafico.Canvas.Pen.Color := clBlack;
    PGrafico.Canvas.Pen.Width := 1;
    PGrafico.Canvas.Brush.Color := clWhite;
    PGrafico.Canvas.Rectangle(x+555,16,x+740,32);
    PGrafico.Canvas.TextOut(x+637,18,'Valores');

    PGrafico.Canvas.Font.Size := 9;
    ysi := 32;

    while not(IBQ.Eof) do
    begin

        if ((ysi+20) > PGrafico.Height) then
        begin
          PGrafico.Height := PGrafico.Height + 28;
          self.Height := self.Height + 30;
        end;

        val_num_fenot := IBQ.FieldValues['valor_numerico'];
        val_des_fenot := IBQ.FieldValues['valor'];
        sinonimo_fenot := IBQ.FieldValues['sinonimo'];

        xsi := 0;

        PGrafico.Canvas.Pen.Color := clBlack;
        PGrafico.Canvas.Pen.Width := 1;
        PGrafico.Canvas.Brush.Color := clWhite;

        xid := xsi + 185;
        yid := ysi + 18;

        PGrafico.Canvas.Rectangle(x+xsi,ysi,x+xid,yid);
        PGrafico.Canvas.TextOut(x+xsi+92,ysi+2,TransformarCadena(sinonimo_fenot));

//-----------------------

        xsi := 185;

        PGrafico.Canvas.Pen.Color := clBlack;
        PGrafico.Canvas.Pen.Width := 1;
        PGrafico.Canvas.Brush.Color := clInfoBk;

        xid := xsi + 185;
        yid := ysi + 18;

        PGrafico.Canvas.Rectangle(x+xsi,ysi,x+xid,yid);

//-----------------------

        xsi := 370;

        PGrafico.Canvas.Pen.Color := clBlack;
        PGrafico.Canvas.Pen.Width := 1;
        PGrafico.Canvas.Brush.Color := clInfoBk;

        xid := xsi + 185;
        yid := ysi + 18;

        PGrafico.Canvas.Rectangle(x+xsi,ysi,x+xid,yid);

//-----------------------

        if (val_num_fenot < 6) then
        begin
          tamBarra := getTamBarraGrafica(val_num_fenot,5,37);
          vLleft := x + 185 + 185 - tamBarra;

          PGrafico.Canvas.Pen.Color := clBlack;
          PGrafico.Canvas.Pen.Width := 1;
          PGrafico.Canvas.Brush.Color := clGreen;

          PGrafico.Canvas.Rectangle(vLleft,ysi,vLleft+tamBarra,yid);

        end;

        if (val_num_fenot > 6) then
        begin
          tamBarra := getTamBarraGrafica(7,val_num_fenot,37);

          PGrafico.Canvas.Pen.Color := clBlack;
          PGrafico.Canvas.Pen.Width := 1;
          PGrafico.Canvas.Brush.Color := clGreen;

          PGrafico.Canvas.Rectangle(x+xsi,ysi,x+xsi+tamBarra,yid);
        end;

//-----------------------

        xsi := 555;

        PGrafico.Canvas.Pen.Color := clBlack;
        PGrafico.Canvas.Pen.Width := 1;
        PGrafico.Canvas.Brush.Color := clWhite;

        xid := xsi + 185;
        yid := ysi + 18;

        PGrafico.Canvas.Rectangle(x+xsi,ysi,x+xid,yid);
        PGrafico.Canvas.TextOut(x+xsi+92,ysi+2,TransformarCadena(val_des_fenot));

        IBQ.Next;

        ysi := ysi + 18;
    end;

    CrearEjeReferencia(ysi+5,x+185,x+xsi,11,val,PGrafico);

    PGrafico.Height := ysi + 30;
    PGrafico.Width := xid;

    GuardarGrafico;
end;

function TFFrameGrafico.getTamBarraGrafica(inicio, fin, incremento : integer) : integer;
var i, res : integer;
begin
     res := 0;
     for i := inicio to fin do
        res := res + incremento;

    Result := res;
end;

procedure TFFrameGrafico.CrearEjeReferencia(vtop,inicio,fin,num_div,val : integer; vlparent : TImage);
var i, incremento, valor : integer;
begin

    PGrafico.Canvas.Pen.Color := clBlack;
    PGrafico.Canvas.Pen.Width := 1;
    PGrafico.Canvas.Brush.Color := clBlack;
    PGrafico.Canvas.Rectangle(inicio,vtop,fin,vtop+1);

{    DibujarLineaHorizontal(vtop,inicio,inicio,fin,vlparent); }

    incremento := inicio;

    for i := 1 to num_div do
    begin
{      DibujarLineaVertical(vtop-3,incremento,vlparent,IntToStr(val));}

      PGrafico.Canvas.Pen.Color := clBlack;
      PGrafico.Canvas.Font.Size := 6;
      PGrafico.Canvas.Pen.Width := 2;
      PGrafico.Canvas.Brush.Color := clWhite;
      PGrafico.Canvas.Rectangle(incremento,vtop-5,incremento+1,vtop+6);
      PGrafico.Canvas.TextOut(incremento-4,vtop+6,IntToStr(val));

      incremento := incremento + 37;
      Inc(val);
    end;
    
end;

procedure TFFrameGrafico.DibujarLineaHorizontal(vtop, vleft, vini, vfin : integer; vlparent : TImage);
var lineaH : TShape;
begin
    lineaH := TShape.Create(vlparent);
//    lineaH.Owner := vlparent;
//    lineaH.Parent := vlparent;

    lineaH.Left := vleft;
    lineaH.Top := vtop;
    lineaH.Width := vfin-vini;
    lineaH.Height := 1;

    Inc(cantComponent);
    SetLength(arrComponentes,cantComponent);
    arrComponentes[cantComponent-1] := lineaH;

end;

procedure TFFrameGrafico.DibujarLineaVertical(vtop, vleft : integer; vlparent : TImage; val : string);
var lineaH : TShape;
    ref : TLabel;
begin

    lineaH := TShape.Create(vlparent);
//    lineaH.Owner := vlparent;
//    lineaH.Parent := vlparent;

    ref := TLabel.Create(vlparent);
//    ref.Owner := vlparent;
//    ref.Parent := vlparent;

    lineaH.Left := vleft;
    lineaH.Top := vtop;
    lineaH.Width := 1;
    lineaH.Height := 5;

    ref.Left := vleft-1;
    ref.Top := vtop + 6;


    if (f = 0) or (f = 1) or (f = 2) then
      ref.Font.Size := 9;

    if (f = 3) or (f = 4) or (f = 5) then
      ref.Font.Size := 8;

    if (f = 6) or (f = 7) or (f = 8) then
      ref.Font.Size := 7;

    ref.Caption := val;

    Inc(cantComponent);
    SetLength(arrComponentes,cantComponent);
    arrComponentes[cantComponent-1] := lineaH;

    Inc(cantComponent);
    SetLength(arrComponentes,cantComponent);
    arrComponentes[cantComponent-1] := ref;


end;

function TFFrameGrafico.TransformarCadena(cad : string) : string;
var i : integer;
    c, d : string;
begin

    d := '';
    c := LowerCase(cad);

    if (cad = 'TAMAÑO') then
      d := 'Tamaño'
    else
      d := StuffString(c,1,1,UpperCase(LeftStr(c,1)));

    Result := d;

end;

procedure TFFrameGrafico.Limpiar;
var C : TComponent;
    i : integer;
begin
    for i := 0 to cantComponent-1 do
    begin
        C := arrComponentes[i];
        C.Free;
        C.Destroy;
    end;

    SetLength(arrComponentes,0);
    cantComponent := 0;

    PGrafico.Height := 100;
    Self.Height := 100;
end;

procedure TFFrameGrafico.GuardarGrafico;
var ruta : string;
    jpg:TJPEGImage;
    bmp:TBitmap;
begin
    bmp := TBitmap.Create;
    bmp.Width:= PGrafico.Width;
    bmp.Height:= PGrafico.Height;
    bmp.Canvas.CopyRect(Rect(0,0, bmp.Width, bmp.Height),PGrafico.Canvas,Rect(0,0,PGrafico.Width,PGrafico.Height));
    //bmp.SetSize(640,480);
{    jpg := TJPEGImage.Create;
    jpg.CompressionQuality := 100;
    jpg.Compress;
    //asigna el bitmap al jpg, esto convierte el mapa de bit
    jpg.Assign(bmp);
    jpg.SaveToFile('D:\grafico.jpg');
    jpg.Free;  }
    ruta := ExtractFilePath(Application.ExeName);
    bmp.SaveToFile(ruta+'\grafico.bmp');
    bmp.Free;    
end;

end.
