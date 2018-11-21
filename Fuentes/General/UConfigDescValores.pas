unit UConfigDescValores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, Mask, DBCtrls, PngImage, jpeg, IBQuery,
  WinXP, DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc,
  ActnList, ComCtrls, JvExControls, JvLabel, ExtCtrls, JvGIF, JvExStdCtrls,
  JvEdit, JvEnterTab, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFConfigDescValores = class(TFUniversal)
    PBottom: TPanel;
    IFondo: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    PTop: TPanel;
    PCli: TPanel;
    IBQValores: TIBQuery;
    LAceptar: TLabel;
    IAceptar: TImage;
    IBQModif: TIBQuery;
    GroupBox1: TGroupBox;
    ENombreSugerido: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    EPreferido: TEdit;
    GBValores: TGroupBox;
    Shape3: TShape;
    Shape4: TShape;
    Shape2: TShape;
    Shape1: TShape;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Image1: TImage;
    Edit9: TEdit;
    Edit8: TEdit;
    Edit7: TEdit;
    Edit6: TEdit;
    Edit5: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    IBQModifNombreFenot: TIBQuery;
    IBQDatosFenotipo: TIBQuery;
    JvEdit2: TJvEdit;
    JvEdit3: TJvEdit;
    JvEdit4: TJvEdit;
    JvEdit5: TJvEdit;
    JvEdit6: TJvEdit;
    JvEdit7: TJvEdit;
    JvEdit8: TJvEdit;
    JvEdit9: TJvEdit;
    JvEdit10: TJvEdit;
    JvEnterAsTab1: TJvEnterAsTab;
    Lbl1: TLabel;
    Lbl2: TLabel;
    Lbl3: TLabel;
    Lbl4: TLabel;
    Lbl5: TLabel;
    Lbl6: TLabel;
    Lbl7: TLabel;
    Lbl8: TLabel;
    Lbl9: TLabel;
    IBQActivarModificado: TIBQuery;
    Image5: TImage;
    procedure FormShow(Sender: TObject);
    procedure IAceptarClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
  private
    procedure CargarValores;
    procedure SetearLabels;
    
  public
    { Public declarations }
  published
    constructor Create(AOwner : TComponent; Fenotipo : Integer; nombre : string; indEscala : integer); reintroduce;
  end;

var
  FConfigDescValores: TFConfigDescValores;
  sinonimo : string;
  id_fenotipo : integer;
  indiceEscala : integer;

implementation

uses
  UPrincipal;

{$R *.dfm}

constructor TFConfigDescValores.Create(AOwner : TComponent; Fenotipo : Integer; nombre : string; indEscala : integer);
begin
  inherited Create(AOwner);
  
  id_fenotipo := Fenotipo;

  indiceEscala := indEscala+1;

  if (nombre = 'LTamanio') then
    ENombreSugerido.Text := 'TAMAÑO'
  else
    ENombreSugerido.Text := uppercase(StringReplace(nombre, 'L', '', [rfReplaceAll]));

  IBQDatosFenotipo.Close;
  IBQDatosFenotipo.ParamByName('id').AsInteger := id_fenotipo;
  IBQDatosFenotipo.Open;

  EPreferido.Text := IBQDatosFenotipo.FieldValues['sinonimo'];

  IBQValores.Close;
  IBQValores.ParamByName('fenotipo').AsInteger := Fenotipo;
  IBQValores.Open;

end;

procedure TFConfigDescValores.CargarValores;
var
  E : TComponent;
begin
  IBQValores.First;
  while not IBQValores.Eof do
  begin
    E := FindComponent('JvEdit'+IntToStr(IBQValores.FieldValues['valor_num']));
    if E <> nil then
    begin

     if (IBQValores.FieldValues['valor_num'] = 1) or (IBQValores.FieldValues['valor_num'] = 11) then
        (E as TJvEdit).Text := ''
     else
        (E as TJvEdit).Text := IBQValores.FieldValues['valor_desc'];

      (E as TJvEdit).Tag := IBQValores.FieldValues['id_valor'];

    end;
    IBQValores.Next;
  end;
end;

procedure TFConfigDescValores.FormShow(Sender: TObject);
begin
  inherited;
  CargarValores;
  SetearLabels;
  EPreferido.SetFocus;
end;

procedure TFConfigDescValores.IAceptarClick(Sender: TObject);
var
  E : TComponent;
begin
  inherited;
  IBQValores.First;
  while not IBQValores.Eof do
  begin
    E := FindComponent('JvEdit'+IntToStr(IBQValores.FieldValues['valor_num']));
    if E <> nil then
    begin

        if ((E as TJvEdit).Text <> IBQValores.FieldValues['valor_desc']) then
        begin
            try
              IBQActivarModificado.Close;
              IBQActivarModificado.ParamByName('valor').AsString := 'S';
              IBQActivarModificado.ParamByName('id').AsInteger := IBQValores.FieldValues['id_valor'];
              IBQActivarModificado.Open;
              FPrincipal.IBTPrincipal.CommitRetaining;
            except
              FPrincipal.IBTPrincipal.RollbackRetaining;
            end;

        end;

      try
        IBQModif.Close;
        IBQModif.ParamByName('valor').AsString := (E as TJvEdit).Text;
        IBQModif.ParamByName('id').AsInteger := IBQValores.FieldValues['id_valor'];
        IBQModif.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
    IBQValores.Next;
  end;

  try
    IBQModifNombreFenot.Close;
    IBQModifNombreFenot.ParamByName('sinonim').AsString := uppercase(EPreferido.Text);
    IBQModifNombreFenot.ParamByName('id_fenot').AsInteger := id_fenotipo;
    IBQModifNombreFenot.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;

  Close;
end;

procedure TFConfigDescValores.ISalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFConfigDescValores.SetearLabels;
var i, inicio: integer;
    L : TComponent;
begin
    inicio := indiceEscala;
    for i := 1 to 9 do
    begin
      L := FindComponent('Lbl'+IntToStr(i));
      (L as TLabel).Caption := IntToStr(inicio);
      Inc(inicio);
    end;

end;  

end.
