unit UMensajeEdades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UMensajeHuella, StdCtrls, ExtCtrls, Buttons, UPrincipal, Grids,
  DBGrids, DB, DBClient, IBCustomDataSet, ComCtrls, BaseGrid, AdvGrid,
  ValEdit, IBQuery, UBDBGrid, DBCtrls, jpeg, PngImage;

type
  TFMensajeEdades = class(TFMensaje)
    GBCats: TGroupBox;
    GBEdad: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GBCond: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    procedure BBSiClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
    procedure BBAceptarClick(Sender: TObject);
    procedure BBNoClick(Sender: TObject);
    procedure BBSiaTodoClick(Sender: TObject);
  private
    max,min:integer;
    arrMax,arrMin:array of integer;
    { Private declarations }
  public

  published
    constructor Create(owner : TComponent; tipo : TTipoMensaje; msg : string; ListaCats : TStringList); reintroduce;
  end;

var
  FMensajeEdades: TFMensajeEdades;
  function MostrarMensajeEdades(owner : TComponent; tipo : TTipoMensaje; msg : String; ListaCats : TStringList): TModalResult;

implementation

uses UAvanceTerminar,UImportacion,UDMSoftvet,UEveAltaMasiva, UTraduccion;

{$R *.dfm}

function MostrarMensajeEdades(owner : TComponent;tipo : TTipoMensaje; msg : String; ListaCats : TStringList): TModalResult;
var
   retorno : TModalResult;
begin
  FMensajeEdades := TFMensajeEdades.Create(owner,tipo,msg,ListaCats);
  FMensajeEdades.ShowModal;
  retorno := FMensajeEdades.ModalResult;
  FMensajeEdades.Destroy;
  Result := retorno;
end;


constructor TFMensajeEdades.Create(owner : TComponent; tipo : TTipoMensaje; msg : string; ListaCats : TStringList);
var lb:TLabel;
    edit:TEdit;
    i,t,l:integer;
begin
  inherited Create(owner,tipo,msg);
  BBSi.Caption:=Traducir('Aceptar');
  BBSi.Visible:=true;
  bbsi.Enabled:=false;
  setLength(arrMax,6);
  setLength(arrMin,6);
  bbaceptar.visible:=false;
  bbcancelar.visible:=true;
  for i:=0 to ListaCats.Count-1 do
    begin
    TLabel(GBCats.Controls[i]).Visible:=true;
    TLabel(GBCats.Controls[i]).Caption:=ListaCats.Strings[i];
    TEdit(GBEdad.Controls[i]).Visible:=true;
    TEdit(GBEdad.Controls[i]).Text:='';
    if (ListaCats.Strings[i]='TERNERA') or (ListaCats.Strings[i]='TERNERO') then
      begin
      TLabel(GBCond.Controls[i]).Caption:=Traducir('entre 0 y 9 meses');
      arrMax[i]:=9;
      arrMin[i]:=0;
      end;
    if (ListaCats.Strings[i]='VAQUILLONA') or (ListaCats.Strings[i]='TORO') then
      begin
      TLabel(GBCond.Controls[i]).Caption:=Traducir('mayor a 9 meses');
      arrMax[i]:=10000;
      arrMin[i]:=10;
      end;
    if ListaCats.Strings[i]='VACA' then
      begin
      TLabel(GBCond.Controls[i]).Caption:=Traducir('mayor a 24 meses');
      arrMax[i]:=10000;
      arrMin[i]:=24;
      end;
    if ListaCats.Strings[i]='NOVILLO' then
      begin
      TLabel(GBCond.Controls[i]).Caption:=Traducir('mayor a 7 meses');
      arrMax[i]:=10000;
      arrMin[i]:=8;
      end;
    TLabel(GBCond.Controls[i]).Visible:=true;
    end;
  //GBCats.Top:=LTextoMensaje.Top+LTextoMensaje.Height+5;
  //GBEdad.Top:=GBCats.Top;
  GBCats.Height:=TLabel(GBCats.Controls[ListaCats.Count-1]).Top+TLabel(GBCats.Controls[ListaCats.Count-1]).Height+8;
  GBEdad.Height:=GBCats.Height;
  GBCond.Height:=GBCats.Height;
end;

procedure TFMensajeEdades.BBSiClick(Sender: TObject);
var i:integer;
begin
  inherited;
  for i:=0 to GBEdad.ControlCount-1 do
    begin
    {if TLabel(GBCats.Controls[i]).Caption='VACA' then TFEveAltaMasiva(self.owner).edadVaca:=strtoint(TEdit(GBEdad.Controls[i]).Text);
    if TLabel(GBCats.Controls[i]).Caption='VAQUILLONA' then TFEveAltaMasiva(self.owner).edadVaquillona:=strtoint(TEdit(GBEdad.Controls[i]).Text);
    if TLabel(GBCats.Controls[i]).Caption='TERNERA' then TFEveAltaMasiva(self.owner).edadTernera:=strtoint(TEdit(GBEdad.Controls[i]).Text);
    if TLabel(GBCats.Controls[i]).Caption='TERNERO' then TFEveAltaMasiva(self.owner).edadTernero:=strtoint(TEdit(GBEdad.Controls[i]).Text);
    if TLabel(GBCats.Controls[i]).Caption='NOVILLO' then TFEveAltaMasiva(self.owner).edadNovillo:=strtoint(TEdit(GBEdad.Controls[i]).Text);
    if TLabel(GBCats.Controls[i]).Caption='TORO' then TFEveAltaMasiva(self.owner).edadToro:=strtoint(TEdit(GBEdad.Controls[i]).Text);}
    if TLabel(GBCats.Controls[i]).Caption='VACA' then tryStrToInt(TEdit(GBEdad.Controls[i]).Text,TFEveAltaMasiva(self.owner).edadVaca);
    if TLabel(GBCats.Controls[i]).Caption='VAQUILLONA' then tryStrToInt(TEdit(GBEdad.Controls[i]).Text,TFEveAltaMasiva(self.owner).edadVaquillona);
    if TLabel(GBCats.Controls[i]).Caption='TERNERA' then tryStrToInt(TEdit(GBEdad.Controls[i]).Text,TFEveAltaMasiva(self.owner).edadTernera);
    if TLabel(GBCats.Controls[i]).Caption='TERNERO' then tryStrToInt(TEdit(GBEdad.Controls[i]).Text,TFEveAltaMasiva(self.owner).edadTernero);
    if TLabel(GBCats.Controls[i]).Caption='NOVILLO' then tryStrToInt(TEdit(GBEdad.Controls[i]).Text,TFEveAltaMasiva(self.owner).edadNovillo);
    if TLabel(GBCats.Controls[i]).Caption='TORO' then tryStrToInt(TEdit(GBEdad.Controls[i]).Text,TFEveAltaMasiva(self.owner).edadToro);
    end;
  ModalResult := mrYes;
end;

procedure TFMensajeEdades.Edit1Exit(Sender: TObject);
var i,j:integer;
begin
  inherited;
  {if Tedit(Sender).text<>'' then
    for i:=0 to GBEdad.ControlCount-1 do
      if (TEdit(GBEdad.Controls[i]).Visible) then
      if GBEdad.Controls[i].Name=TEdit(Sender).Name then
        if ((strtoint(TEdit(Sender).text)<>10000)and(strtoint(TEdit(Sender).text)>arrMax[i])) or (strtoint(TEdit(Sender).text)< arrMin[i]) then
        //if ((TEdit(GBEdad.Controls[i]).text<>'')and((TEdit(GBEdad.Controls[i]).text)<>'10000')and((TEdit(GBEdad.Controls[i]).text)>inttostr(arrMax[i]))) or ((TEdit(GBEdad.Controls[i]).text)< inttostr(arrMin[i])) then
          //begin
          bbsi.Enabled:=false;}
          //MostrarMensaje(tmError,'La edad no esta dentro del rango permitido. Por favor introduzca un valor '+TLabel(GBCond.Controls[i]).Caption);
          //TEdit(Sender).SetFocus;
          //Tedit(Sender).text:='';
          //end
        //else
          {begin
          bbsi.enabled:=true;
          end;}

      //mostrarMensaje(tmerror,'Por favor verifique que las edades estén dentro del rango correspondiente');
end;

procedure TFMensajeEdades.Edit1Change(Sender: TObject);
var i,validos,cant:integer;
begin
  inherited;
  validos:=0;
  cant:=0;
  for i:=0 to GBEdad.ControlCount-1 do
    if (TEdit(GBEdad.Controls[i]).Visible) then
      begin
      cant:=cant+1;
      if (TEdit(GBEdad.Controls[i]).Text<>'')and(strtoint(TEdit(GBEdad.Controls[i]).text)<=arrMax[i]) and (strtoint(TEdit(GBEdad.Controls[i]).text)>= arrMin[i]) then
         validos:=validos+1;
      end;
  if validos=cant then BBSi.Enabled:=True else BBSi.Enabled:=false;
end;

procedure TFMensajeEdades.BBCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFMensajeEdades.BBAceptarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFMensajeEdades.BBNoClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNo;
end;

procedure TFMensajeEdades.BBSiaTodoClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrAll;
end;

end.
