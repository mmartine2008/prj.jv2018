unit UMensajeHuella;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ActnList, StdCtrls, HtmlHlp, DB, IBCustomDataSet,
  IBStoredProc, DataExport, WinXP, jpeg, UDMSoftvet, Variants,
  AppEvnts, UBDBGrid, DBGrids, TypInfo, Buttons, Registry, PngImage;

type
  TTipoMensaje = (tmConsulta, tmInformacion, tmAdvertencia, tmError,tmTodos, tmSNC);
  TFMensaje = class(TForm)
    PBotones: TPanel;
    PTitulo: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    LTitulo: TLabel;
    PTexto: TPanel;
    BBSi: TBitBtn;
    BBAceptar: TBitBtn;
    BBNo: TBitBtn;
    GroupBox2: TGroupBox;
    BBSiaTodo: TBitBtn;
    BBCancelar: TBitBtn;
    IFondoBottom: TImage;
    IbordeTop: TImage;
    ISiATodo: TImage;
    LSiATodo: TLabel;
    LSi: TLabel;
    Isi: TImage;
    INo: TImage;
    LNo: TLabel;
    ICancel: TImage;
    LCancel: TLabel;
    IAceptar: TImage;
    LAceptar: TLabel;
    Panel1: TPanel;
    ImageError: TImage;
    LTextoMensaje: TStaticText;
    Image1: TImage;
    ImageConsulta: TImage;
    ImageInfo: TImage;
    ImageAdvertencia: TImage;
    procedure BBAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ISiATodoClick(Sender: TObject);
    procedure IsiClick(Sender: TObject);
    procedure INoClick(Sender: TObject);
    procedure ICancelClick(Sender: TObject);
  private
    procedure SetTipo(const tipo: TTipoMensaje);
  public
  published
    constructor Create(owner : TComponent; tipo : TTipoMensaje; msg : string); reintroduce;
  end;

function MostrarMensaje(tipo : TTipoMensaje; msg : string): TModalResult;


var
  FMensaje: TFMensaje;

implementation

uses UPrincipal,uTiposGlobales, UTraduccion;

{$R *.dfm}

(*
  Crea un mensaje con el texto "msg" según el tipo "tipo",
  asegurandose de destruirlo al finalizar
*)
function MostrarMensaje(tipo : TTipoMensaje; msg : string): TModalResult;
var
   retorno : TModalResult;
begin
   FMensaje := TFMensaje.create(FPrincipal, tipo, msg);
   FMensaje.ShowModal;
   retorno := FMensaje.ModalResult;
   FMensaje.Destroy;
   Result := retorno;
end;

{ TForm1 }

(*
  Crea el mensaje y lo configura
*)
constructor TFMensaje.Create(owner : TComponent; tipo : TTipoMensaje; msg : string);
var
  IndComp, I : Integer;
  D : Double;
  Comp : TComponent;
begin
   inherited Create(owner);

   for indComp := 0 to ComponentCount-1 do
   begin
    Comp := Components[indComp];
    if Comp <> nil then
     // if Comp is TControl then
      begin
        if IsPublishedProp(Comp,'Caption') then //Labels, CheckBox y RadioButtons
          if (GetPropValue(Comp,'Caption') <> '') and not (VarIsNumeric(GetPropValue(Comp,'Caption'))) then
            SetPropValue(Comp,'Caption',Traducir(GetPropValue(Comp,'Caption')));
          if IsPublishedProp(Comp,'Text') then  //Edits
            if (GetPropValue(Comp,'Text') <> '') then
            begin
              if not TryStrToInt(GetPropValue(Comp,'Text'),I) then
                SetPropValue(Comp,'Text',Traducir(GetPropValue(Comp,'Text')));
              if not TryStrToFloat(GetPropValue(Comp,'Text'),D) then
                SetPropValue(Comp,'Text',Traducir(GetPropValue(Comp,'Text')));
            end;
        {  if (Comp is TBitDBGrid) then
          begin
            SetLength(Traducibles,IndTrad+1);
            Traducibles[IndTrad].Componente := Comp;
            Traducibles[IndTrad].Propiedad := 'DBGrid';
            Inc(IndTrad);
          end; }
      end;
  end;

   LTextoMensaje.Caption := Traducir(msg);
   LTextoMensaje.Height:=500;//length(msj)
   SetTipo(tipo);
end;

(*
  Configura el mensaje según el tipo
*)
procedure TFMensaje.SetTipo(const tipo: TTipoMensaje);
begin
   ImageConsulta.Visible    := (tipo = tmConsulta) or (tipo = tmTodos);
   ImageInfo.Visible        := tipo = tmInformacion;
   ImageAdvertencia.Visible := tipo = tmAdvertencia;
   ImageError.Visible       := tipo = tmError;

   BBSiaTodo.Visible  := false;
   BBCancelar.Visible := false;
   LSiATodo.Visible := false;
   ISiATodo.Visible := false;
   LCancel.Visible := false;
   ICancel.Visible := false;
   {LSi.Visible := false;
   Isi.Visible := false;
   LNo.Visible := false;
   INo.Visible := false;}

   case tipo of
      tmConsulta: begin

         Caption := 'Huella - Consulta.';
         //LTitulo.Caption := Traducir('Consulta');
         PTitulo.Caption := Traducir('Consulta');

         BBAceptar.Visible := False;
         BBSi.Visible      := True;
         BBNo.Visible      := True;

         LAceptar.Visible := false;
         IAceptar.Visible := false;
         LSi.Visible := true;
         Isi.Visible := true;
         LNo.Visible := true;
         INo.Visible := true;

      end;
      tmTodos: begin
         Caption := 'Huella - Consulta.';
         //LTitulo.Caption := Traducir('Consulta');
         PTitulo.Caption := Traducir('Consulta');

         BBAceptar.Visible := False;
         BBSiaTodo.Visible := true;
         BBSi.Visible      := True;
         BBCancelar.Visible:= true;
         BBNo.Visible      := True;

         LAceptar.Visible := false;
         IAceptar.Visible := false;
         LSi.Visible := true;
         Isi.Visible := true;
         LNo.Visible := true;
         INo.Visible := true;
         LSiATodo.Visible := true;
         ISiATodo.Visible := true;
         LCancel.Visible := true;
         ICancel.Visible := true;

      end;
      tmInformacion: begin
         Caption := 'Huella - Información.';
         //LTitulo.Caption := Traducir('Información');
         PTitulo.Caption := Traducir('Información');
      end;
      tmAdvertencia: begin
         Caption := 'Huella - Advertencia.';
         //LTitulo.Caption := Traducir('Advertencia');
         PTitulo.Caption := Traducir('Advertencia');
      end;
      tmError: begin
         Caption := 'Huella - Error.';
         LTitulo.Caption := Traducir('Error');

      end;
      tmSNC: begin
         Caption := 'Huella - Consulta.';
         //LTitulo.Caption := Traducir('Consulta');
         PTitulo.Caption := Traducir('Consulta');

         BBAceptar.Visible := False;
         BBSiaTodo.Visible := False;
         BBSi.Visible      := True;
         BBCancelar.Visible:= true;
         BBNo.Visible      := True;

         LAceptar.Visible := false;
         IAceptar.Visible := false;
         LSiATodo.Visible := false;
         ISiATodo.Visible := false;
         LSi.Visible := true;
         Isi.Visible := true;
         LCancel.Visible := true;
         ICancel.Visible := true;
         LNo.Visible := true;
         INo.Visible := true;

      end;
   end;
end;

(*
  Cerramos al aceptar
*)
procedure TFMensaje.BBAceptarClick(Sender: TObject);
begin
   self.ModalResult := mrOk;
   Close;
end;

(*
  Abrimos las imagenes, esto debiera heredar de TUniversal
  y por lo tanto esto no existiria
*)
procedure TFMensaje.FormShow(Sender: TObject);
var
  AppPath : String;
begin
  AppPath := ExtractFilePath(Application.ExeName)+'imagenes\';
  Image2.Picture.LoadFromFile(AppPath+'barra_izquierda.png');
  Image3.Picture.LoadFromFile(AppPath+'barra_derecha.png');
  IbordeTop.Picture.LoadFromFile(AppPath+'borde_up.png');

  
  //Image4.Picture.LoadFromFile(AppPath+'barra_centro.jpg');
end;


procedure TFMensaje.ISiATodoClick(Sender: TObject);
begin
  self.ModalResult := mrAll;
  //Close;
end;

procedure TFMensaje.IsiClick(Sender: TObject);
begin
  self.ModalResult := mrYes;
  //Close;
end;

procedure TFMensaje.INoClick(Sender: TObject);
begin
  self.ModalResult := mrNo;
  //Close;
end;

procedure TFMensaje.ICancelClick(Sender: TObject);
begin
  self.ModalResult := mrCancel;
  //Close;
end;

end.
