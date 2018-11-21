unit UAbmEmpleados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, IBStoredProc, WinXP, DataExport,
  DataToXLS, UDBLookupComboBoxAuto, UMovCargarDatos, JvExControls, JvLabel,
  PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMEmpleados = class(TFABMSimple)
    DBEANombre: TDBEditAuto;
    DBEAApellido: TDBEditAuto;
    LNombre: TLabel;
    LApellido: TLabel;
    LTipo: TLabel;
    DBLCBATipo: TDBLookupComboBoxAuto;
    IBQTiposEmpleados: TIBQuery;
    DSTipoEmpleados: TDataSource;
    IBQAbmSimpleAPELLIDO: TIBStringField;
    IBQAbmSimpleESTABLECIMIENTO: TIntegerField;
    IBQAbmSimpleID_EMPLEADO: TIntegerField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleTIPO: TIBStringField;
    IBQAbmSimpleID_TIPOS_EMPLEADOS: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure DBEANombreKeyPress(Sender: TObject; var Key: Char);
    procedure DBEAApellidoKeyPress(Sender: TObject; var Key: Char);
    procedure IBQTiposEmpleadosAfterOpen(DataSet: TDataSet);
    procedure DBLCBATipoCloseUp(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure DBEAApellidoExit(Sender: TObject);
    procedure DBEANombreExit(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
  private
    tipo_empleado : integer;
  protected
    procedure CargarParametrosSimple; override;

  public
    ap:string;
    m:TFMovCargarDatos;
    procedure InsertarRegistro; override;

  end;

var
  FABMEmpleados: TFABMEmpleados;

implementation

uses UPrincipal,uTiposGlobales, UDMSoftVet, TypInfo, UImportacion, UFunctions,UMensajeHuella, UEveSimple;

{$R *.dfm}

(*
  Los Empleados son modificables por el usuario
*)
procedure TFABMEmpleados.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := True;
  PermiteInsertar := True;
  IBQTiposEmpleados.Close;
  IBQTiposEmpleados.Open;
  tipo_empleado := 0;
end;

(*
  El unico dato extra a los controles es el establecimiento
*)
procedure TFABMEmpleados.InsertarRegistro;
begin
  inherited;
  IBQAbmSimple.FieldByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
end;

(*
  Los Empleados pertenecen a un establecimiento y por eso abrimos el query filtrado
*)
procedure TFABMEmpleados.CargarParametrosSimple;
begin
  inherited;
  IBQAbmSimple.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;

  if IBQAbmSimple.State = dsInsert then
    IBQAbmSimple.FieldByName('ID_TIPOS_EMPLEADOS').Value := tipo_empleado;
end;

procedure TFABMEmpleados.DBEANombreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key = #13) then
   begin
     DBEAApellido.SetFocus;
     key:= #0;
   end;
end;

procedure TFABMEmpleados.DBEAApellidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key = #13) then
   begin
    if (BBGuardar.Enabled) then
     BBGuardar.SetFocus;
    key:= #0;
   end;

end;

procedure TFABMEmpleados.IBQTiposEmpleadosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQTiposEmpleados.Last;
  IBQTiposEmpleados.First;
end;

procedure TFABMEmpleados.DBLCBATipoCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBATipo.KeyValue <> null then
    tipo_empleado := DBLCBATipo.KeyValue;
end;

procedure TFABMEmpleados.AcGuardarExecute(Sender: TObject);
//var nombre:string;
begin
{nombre:=trim(DBEANombre.Text+' '+DBEAApellido.Text);
dmsoftvet.IBQResponsable.Close;
dmsoftvet.IBQResponsable.ParamByName('idestablecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
dmsoftvet.IBQResponsable.Open;}
//if not dmsoftvet.IBQResponsable.Locate('NOMBRE',nombre,[loCaseInsensitive]) then
  begin
  inherited;
  if cargaDeMovil then
    begin
    //TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:=DBEANombre.Text+' '+DBEAApellido.Text;;
    TFImportacion(self.Owner).nuevoResp:=DBEANombre.Text+' '+DBEAApellido.Text;;
    end;
  IBQAbmSimple.Close;
  IBQAbmSimple.Open;
  end;
//else
  //MostrarMensaje(tmError,'El empleado '+nombre+' ya existe en este establecimiento');
end;

procedure TFABMEmpleados.DBEAApellidoExit(Sender: TObject);
begin
  inherited;
  DBEAApellido.Text:=eliminarAcentos(DBEAApellido.Text);
end;

procedure TFABMEmpleados.DBEANombreExit(Sender: TObject);
begin
  inherited;
  DBEANombre.Text:=eliminarAcentos(DBEANombre.Text);
end;

procedure TFABMEmpleados.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    begin
     if ap='' then
       separarNombre(nom,nom,ap);
     DBEANombre.Text:=nom;
     DBEAApellido.Text:=ap;
    end;
end;

procedure TFABMEmpleados.FormShow(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    begin;
    AcInsertar.Visible:=true;
    AcInsertar.Enabled:=true;
    AcInsertarExecute(Sender);
    end;

    FormResize(self);
end;

procedure TFABMEmpleados.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
      desdeEvento:=IBQAbmSimple.FieldValues['ID_EMPLEADO'];
end;

procedure TFABMEmpleados.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

end.
