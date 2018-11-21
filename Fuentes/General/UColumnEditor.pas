unit UColumnEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, Buttons, ActnList, ComCtrls, ExtCtrls, DB,
  UDBLookupComboBoxAuto, UDBEditAuto, UDBDateTimePickerAuto, Mask, DBCtrls,
  EditAuto, ImgList, PngImageList, IBQuery, WinXP, DataExport, DataToXLS,
  IBCustomDataSet, IBStoredProc, pngimage, JvExExtCtrls, JvImage,
  JvExControls, JvLabel, JvGIF;

type
  TFColumnEditor = class(TFUniversal)
    PBotones: TPanel;
    BBTerminar: TBitBtn;
    BBCancelar: TButton;
    ATerminar: TAction;
    ASiguiente: TAction;
    Button1: TButton;
    AAnterior: TAction;
    GroupBox1: TGroupBox;
    LabelRPAnimal: TLabel;
    PEditores: TScrollBox;
    EARPAnimal: TEditAuto;
    BBAyuda: TBitBtn;
    procedure FormCreate(Sender: TObject);
    constructor Create(AOwner: TComponent; DSMaster:TDataSource); reintroduce;
    procedure FormShow(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure ASiguienteExecute(Sender: TObject);
    procedure AAnteriorExecute(Sender: TObject);
    procedure EARPAnimalChange(Sender: TObject);
  private
    controles : TStringList;
    FDataSource: TDataSource;
    procedure addGeneral(lab: string; control: TWinControl);
    procedure actualizarBotones;
    procedure ActualizarComponentes(encontrado : boolean);
  public
    property DataSource: TDataSource read FDataSource write FDataSource;
    procedure addEdit(lab: string; field: string);
    procedure addCombo(lab: string; fieldDestino: string; DSCombo: TDataSource; fieldOrigen: string);
    procedure addDate(lab: string; field: string);
  end;

var
  FColumnEditor: TFColumnEditor;
  indiceTabs : integer;
  PrimerControl: TWinControl;

implementation

{$R *.dfm}


{ TFColumnEditor }

procedure TFColumnEditor.FormCreate(Sender: TObject);
begin
  inherited;
  controles := TStringList.Create();

end;

procedure TFColumnEditor.addGeneral(lab: string; control: TWinControl);
var
  etiqueta : TLabel;
begin
  etiqueta := TLabel.Create(self);
  with etiqueta do begin
    Caption  := lab;
    AutoSize := false;
    Left     := 16;
    Top      := 8 + (controles.Count * 25);
    Height   := 21;
    Layout   := tlCenter;
    Parent   := PEditores;
  end;
  with control do begin
    width   := 150;
    Left    := 150;
    Top     := 8 + (controles.Count * 25);
    Parent  := PEditores;
    control.TabStop := true;
    control.TabOrder := indiceTabs;
  end;
  if (PrimerControl = nil) then
    PrimerControl := control;
  inc(indiceTabs);
  controles.AddObject(control.Name, control);
  Height := 124 + (controles.Count * 25);
end;

procedure TFColumnEditor.addEdit(lab: string; field: string);
var
  control : TDBEditAuto;
begin
  control := TDBEditAuto.Create(self);
  control.DataSource := FDataSource;
  control.DataField := field;
  addGeneral(lab, control);
end;

// genera un TDBLookupComboBoxAuto
procedure TFColumnEditor.addCombo(lab: string; fieldDestino: string; DSCombo: TDataSource; fieldOrigen: string);
var
  control : TDBLookupComboBoxAuto;
begin
  control := TDBLookupComboBoxAuto.Create(self);
  // donde escribo
  control.DataSource := FDataSource;
  control.DataField := fieldDestino;

  // que muestro
  control.ListSource := DSCombo;
  control.KeyField := fieldOrigen;
  control.KeyValue := fieldOrigen;
  addGeneral(lab, control);
end;

procedure TFColumnEditor.addDate(lab: string; field: string);
var
  control  : TDBDateTimePicker;
begin
  control := TDBDateTimePicker.Create(self);
  control.DataSource := FDataSource;
  control.DataField  := field;
  addGeneral(lab, control);
end;

// sobrecarga del constructor para soportar un parametro mas
constructor TFColumnEditor.Create(AOwner: TComponent; DSMaster: TDataSource);
begin
  inherited Create(AOwner);
  controles := TStringList.Create();
  FDataSource := DSMaster;
  indiceTabs := 1;
  PrimerControl := nil;
end;

procedure TFColumnEditor.FormShow(Sender: TObject);
begin
  inherited;
  FDataSource.DataSet.Edit;
  actualizarBotones;
end;

procedure TFColumnEditor.ATerminarExecute(Sender: TObject);
begin
  inherited;
  close;
end;

// para ir al siguiente
procedure TFColumnEditor.ASiguienteExecute(Sender: TObject);
begin
  inherited;
  if not(FDataSource.DataSet.Eof) then
    FDataSource.DataSet.Next;
  actualizarBotones;
end;

// para ir al anterior
procedure TFColumnEditor.AAnteriorExecute(Sender: TObject);
begin
  inherited;
  if not(FDataSource.DataSet.Bof)then
    FDataSource.DataSet.Prior;
  actualizarBotones;
end;

// para deshactivar los botones
procedure TFColumnEditor.actualizarBotones;
begin
  AAnterior.Enabled := not(FDataSource.DataSet.Bof);
  ASiguiente.Enabled := not(FDataSource.DataSet.eof);
  EARPAnimal.Text := FDataSource.DataSet.FieldValues['ID_RP'];
  PrimerControl.SetFocus;
end;

// metodo para la busqueda de un animal
procedure TFColumnEditor.EARPAnimalChange(Sender: TObject);
begin
  inherited;
  actualizarComponentes(FdataSource.DataSet.Locate('ID_RP',VarArrayOf([UpperCase(EARPAnimal.Text)]), [] ));
end;

// metodo para activar o deshactivar componentes de base de datos cuando se busca un rp
procedure TFColumnEditor.ActualizarComponentes (encontrado : boolean);
var i : integer;
begin
  for i:= 0 to Self.ComponentCount - 1 do
    begin
      if not(encontrado) then
        begin
          if (Self.Components[i] is TDBLookupComboBoxAuto) then
            TDBLookupComboBoxAuto (Self.Components[i]).DataSource := nil;
          if (Self.Components[i] is TDBEditAuto) then
            TDBEditAuto (Self.Components[i]).DataSource := nil;
          if (Self.Components[i] is TDBDateTimePicker) then
            TDBDateTimePicker (Self.Components[i]).DataSource := nil;
        end
      else
        begin
          if (Self.Components[i] is TDBLookupComboBoxAuto) then
            TDBLookupComboBoxAuto (Self.Components[i]).DataSource := FdataSource;
          if (Self.Components[i] is TDBEditAuto) then
            TDBEditAuto (Self.Components[i]).DataSource := FdataSource;
          if (Self.Components[i] is TDBDateTimePicker) then
            TDBDateTimePicker (Self.Components[i]).DataSource := FdataSource;
          FDataSource.DataSet.Edit;
        end;
    end
end;
end.
