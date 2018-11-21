unit UAbmRodeos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, IBStoredProc, WinXP, DataExport,
  DataToXLS, JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFABMRodeos = class(TFABMSimple)
    DBENombre: TDBEditAuto;
    DBEDescripcion: TDBEditAuto;
    Label5: TLabel;
    Label7: TLabel;
    CBVisible: TCheckBox;
    IBQAbmSimpleID_RODEO: TIntegerField;
    IBQAbmSimpleESTABLECIMIENTO: TIntegerField;
    IBQAbmSimpleDESCRIPCION: TIBStringField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleVISIBLE: TIntegerField;
	IBQUltimo: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure AcSalirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
  private
    procedure HabilitarComponentesVersionBasica; override;
  protected
    procedure InsertarRegistro; override;
    procedure CargarParametrosSimple; override;
    procedure EditarRegistro; override;    
  public
    property nombre:string read nom write nom;
  end;

var
  FABMRodeos: TFABMRodeos;

implementation

uses UAbmEstablecimientos, UPrincipal, UDMSoftVet,UImportacion,UMensajeHuella,UEveSimple;

{$R *.dfm}

(*
  Los Rodeos son modificables por el usuario
*)
procedure TFABMRodeos.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := True;
  CampoRetorno := 'id_rodeo';
end;

(*
  Ponemos el rodeo en el establecimiento actual
*)
procedure TFABMRodeos.InsertarRegistro;
begin
  inherited;
  IBQAbmSimple.FieldByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;

  CBVisible.Checked:= true;
  if(CBVisible.Checked) then
    IBQAbmSimple.FieldByName('visible').AsInteger := 1
   else
     IBQAbmSimple.FieldByName('visible').AsInteger := 0
end;


procedure TFABMRodeos.EditarRegistro;
begin
  inherited;
  IBQAbmSimple.FieldByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;

  if(IBQAbmSimple.FieldByName('visible').AsInteger = 1) then
    CBVisible.Checked:= true
   else
     CBVisible.Checked:= false;

{  if(CBVisible.Checked) then
    IBQAbmSimple.FieldByName('visible').AsInteger := 1
   else
     IBQAbmSimple.FieldByName('visible').AsInteger := 0  }
end;


(*
  Los Rodeos pertenecen a un establecimiento y por eso abrimos el query filtrado
*)
procedure TFABMRodeos.CargarParametrosSimple;
begin
  inherited;
  IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
end;

procedure TFABMRodeos.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    begin
     DBENOMBRE.Text:=nombre;
    end;
end;

procedure TFABMRodeos.AcGuardarExecute(Sender: TObject);
var strings : TStringList;
    final  : string;
    straux : pchar;
    i : integer;
begin
//  dmsoftvet.IBQRodeo.Close;
//  dmsoftvet.IBQRodeo.ParamByName('esta').AsInteger:=FPrincipal.EstablecimientoActual;
//  dmsoftvet.IBQRodeo.Open;
  //if not dmsoftvet.IBQRodeo.Locate('NOMBRE',trim(DBENombre.Text),[loCaseInsensitive]) then
    //begin
    if(CBVisible.Checked) then
      IBQAbmSimple.FieldByName('visible').AsInteger := 1
     else
       IBQAbmSimple.FieldByName('visible').AsInteger := 0;


    //**********************************SACAMOS LOS ESAPACION DEL NOMBRE DEL RODEO
  
    {strings := TStringList.Create;
    straux := pchar(DBENombre.Text);
    ExtractStrings([' '],[' '],straux,TStrings(strings));
    final := '';
    for i:=0 to strings.Count - 1 do
     begin
      final := final + ' '+ strings[i];
     end;
     DBENombre.Text := final; }
     //************************************


    inherited;
    //if cargaDeMovil then
    //  TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:=DBENombre.Text;
    //end;

    IBQUltimo.close;
    IBQUltimo.Open;
    FPrincipal.Rodeo_creado := IBQUltimo.fieldByName('ultimo').AsInteger;
  //else
   // MostrarMensaje(tmError,'El rodeo '+trim(DBENombre.Text)+' ya existe en este establecimiento');
end;

procedure TFABMRodeos.AcSalirExecute(Sender: TObject);
begin
  if cargaDeMovil then
    TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:='INDEFINIDO';
  inherited;
end;

procedure TFABMRodeos.FormShow(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    begin;
    AcInsertar.Visible:=true;
    AcInsertar.Enabled:=true;
    AcInsertarExecute(Sender);
    end;
end;

procedure TFABMRodeos.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_RODEO'];
end;

procedure TFABMRodeos.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

procedure TFABMRodeos.HabilitarComponentesVersionBasica;
begin
  inherited;
//  {$IFDEF BASICO}
  if (FPrincipal.TipoVersionLicencia = 'Basico') then
      CBVisible.Enabled:= false;
//  {$ELSE}
    //
//  {$ENDIF}
end;

end.
