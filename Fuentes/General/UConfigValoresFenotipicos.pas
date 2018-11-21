unit UConfigValoresFenotipicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, PngImage, jpeg, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, StrUtils, ImgList,
  PngImageList, JvExExtCtrls, JvImage;

type
  TFConfigValoresFenotipicos = class(TFUniversal)
    PBottom: TPanel;
    PTop: TPanel;
    PCli: TPanel;
    IFondo: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    LPata: TLabel;
    LHueso: TLabel;
    LPrepucio: TLabel;
    LOmbligo: TLabel;
    LColor: TLabel;
    LConformacion: TLabel;
    LOjos: TLabel;
    LTamanio: TLabel;
    LFertilidad: TLabel;
    IBQConfiguracion: TIBQuery;
    IAceptar: TImage;
    LAceptar: TLabel;
    IBQModifConfig: TIBQuery;
    LHuesoSinonimo: TLabel;
    LPrepucioSinonimo: TLabel;
    LOmbligoSinonimo: TLabel;
    LColorSinonimo: TLabel;
    LConformacionSinonimo: TLabel;
    LOjosSinonimo: TLabel;
    LTamanioSinonimo: TLabel;
    LFertilidadSinonimo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    CBPata: TCheckBox;
    CBHueso: TCheckBox;
    CBPrepucio: TCheckBox;
    CBOmbligo: TCheckBox;
    CBColor: TCheckBox;
    CBConformacion: TCheckBox;
    CBOjos: TCheckBox;
    CBTamanio: TCheckBox;
    CBFertilidad: TCheckBox;
    LPataSinonimo: TLabel;
    LSelecEsc: TLabel;
    RBDeUnoADiez: TRadioButton;
    RBDeMenosCincoACinco: TRadioButton;
    IBQActualizaEscala: TIBQuery;
    IBQEscalaEnUso: TIBQuery;
    IBQResetValores: TIBQuery;
    IBQModif: TIBQuery;
    procedure ISalirClick(Sender: TObject);
    procedure LabelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IAceptarClick(Sender: TObject);
    procedure CBClick(Sender: TObject);
    procedure RBDeUnoADiezClick(Sender: TObject);
    procedure RBDeMenosCincoACincoClick(Sender: TObject);
  private
    { Private declarations }
    procedure ReacomodarEscala(id_fenotipo : integer);
    procedure ActualizarValoresFenotipos;
  public
    { Public declarations }
  end;

var
  FConfigValoresFenotipicos: TFConfigValoresFenotipicos;
  inicioEscala : integer;


implementation

uses
  UConfigDescValores, UPrincipal;

{$R *.dfm}

procedure TFConfigValoresFenotipicos.ISalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFConfigValoresFenotipicos.LabelClick(Sender: TObject);
var
  F : TFConfigDescValores;
begin
  inherited;
  F := TFConfigDescValores.Create(self,(Sender as TLabel).Tag,(Sender as TLabel).Name,inicioEscala);
  F.ShowModal;
  F.Destroy;
end;

procedure TFConfigValoresFenotipicos.FormShow(Sender: TObject);
var
  C, L, LS : TComponent;
  cad : string;
begin
  inherited;

  IBQEscalaEnUso.Close;
  IBQEscalaEnUso.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQEscalaEnUso.Open;

  if (IBQEscalaEnUso.FieldByName('valor').Value = '0,10') then
    RBDeUnoADiez.Checked := true
  else
    RBDeMenosCincoACinco.Checked := true;
  
  IBQConfiguracion.Close;
  IBQConfiguracion.Open;
  while not IBQConfiguracion.Eof do
  begin
    if IBQConfiguracion.FieldValues['nombre'] = 'TAMAÑO' then
    begin
      C := FindComponent('CBTamanio');
      L := FindComponent('LTamanio');
      LS := FindComponent('LTamanioSinonimo');
    end
    else
    begin
      C := FindComponent('CB'+IBQConfiguracion.FieldValues['nombre']);
      L := FindComponent('L'+IBQConfiguracion.FieldValues['nombre']);
      LS := FindComponent('L'+IBQConfiguracion.FieldValues['nombre']+'Sinonimo');
    end;

    (C as TCheckBox).Checked := IBQConfiguracion.FieldValues['en_uso'] = 'S';
    (L as TLabel).Enabled := IBQConfiguracion.FieldValues['en_uso'] = 'S';

    (LS as TLabel).Enabled := IBQConfiguracion.FieldValues['en_uso'] = 'S';
    cad := AnsiLowerCase(IBQConfiguracion.FieldValues['sinonimo']);
    (LS as TLabel).Caption := StuffString(cad,1,1,UpperCase(LeftStr(cad,1)));
    
    IBQConfiguracion.Next;
  end;
end;

procedure TFConfigValoresFenotipicos.IAceptarClick(Sender: TObject);
var
  C : TComponent;
begin
  inherited;
  IBQConfiguracion.First;
  while not IBQConfiguracion.Eof do
  begin

    if IBQConfiguracion.FieldValues['nombre'] = 'TAMAÑO' then
      C := FindComponent('CBTamanio')
    else
      C := FindComponent('CB'+IBQConfiguracion.FieldValues['nombre']);

    try
      IBQModifConfig.Close;
      if (C as TCheckBox).Checked then
        IBQModifConfig.ParamByName('uso').AsString := 'S'
      else
        IBQModifConfig.ParamByName('uso').AsString := 'N';
      IBQModifConfig.ParamByName('id').AsInteger := IBQConfiguracion.FieldValues['id_fenotipo'];
      IBQModifConfig.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;

    IBQConfiguracion.Next;

  end;
  Close;
end;

procedure TFConfigValoresFenotipicos.CBClick(Sender: TObject);
var
  L, LS : TComponent;
begin
  inherited;
  L := FindComponent(StringReplace((Sender as TCheckBox).Name,'CB','L',[]));
  LS := FindComponent(StringReplace((Sender as TCheckBox).Name+'Sinonimo','CB','L',[]));
  if L <> nil then
  begin
    (L as TLabel).Enabled := (Sender as TCheckBox).Checked;
    (LS as TLabel).Enabled := (Sender as TCheckBox).Checked;
  end;
end;



procedure TFConfigValoresFenotipicos.RBDeUnoADiezClick(Sender: TObject);
begin
  inherited;
  inicioEscala := 0;

  IBQActualizaEscala.Close;
  IBQActualizaEscala.ParamByName('aux_val').AsString := '0,10';
  IBQActualizaEscala.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQActualizaEscala.Open;

  ActualizarValoresFenotipos;

end;

procedure TFConfigValoresFenotipicos.RBDeMenosCincoACincoClick(
  Sender: TObject);
begin
  inherited;
  inicioEscala := -5;

  IBQActualizaEscala.Close;
  IBQActualizaEscala.ParamByName('aux_val').AsString := '-5,5';
  IBQActualizaEscala.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQActualizaEscala.Open;

  ActualizarValoresFenotipos;

end;

procedure TFConfigValoresFenotipicos.ReacomodarEscala(id_fenotipo : integer);
var i, inicio: integer;
begin

  inicio := inicioEscala+1;

  for i:=1 to 10 do
  begin
      IBQResetValores.Close;
      IBQResetValores.ParamByName('fenotipo').AsInteger := id_fenotipo;
      IBQResetValores.ParamByName('val').AsInteger := i+1;
      IBQResetValores.Open;

      if (IBQResetValores.FieldByName('valor_original_modificado').Value = 'N') then
      begin
        try
          IBQModif.Close;
          IBQModif.ParamByName('id').AsInteger := IBQResetValores.FieldValues['id_valor'];
          IBQModif.ParamByName('valor').AsString := IntToStr(inicio);
          IBQModif.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
          Inc(inicio);
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
      end;
  end;
end;

procedure TFConfigValoresFenotipicos.ActualizarValoresFenotipos;
begin

    IBQConfiguracion.Close;
    IBQConfiguracion.Open;
    IBQConfiguracion.First;

    while not(IBQConfiguracion.Eof) do
    begin
      ReacomodarEscala(IBQConfiguracion.FieldValues['id_fenotipo']);
      IBQConfiguracion.Next;
    end;


end;
end.
