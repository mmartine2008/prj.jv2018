unit UAbmUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, DBCtrls, UDBLookupComboBoxAuto, EditAuto,
  IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus, ImgList, ActnList,
  StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask,
  UDBEditAuto, EditAutoMinuscula, DBEditMinuscula, IBStoredProc, UFunctions,
  WinXP, DataExport, DataToXLS, UPrincipal, JvExControls, JvLabel,
  PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMUsuarios = class(TFABMSimple)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBCBHabilitado: TDBCheckBox;
    DBLCBARol: TDBLookupComboBoxAuto;
    IBQRol: TIBQuery;
    DSRol: TDataSource;
    EANombre: TEditAuto;
    EAConfClave: TEditAutoMinuscula;
    DBEAClave: TDBEditMinuscula;
    IBQGen_Usuario: TIBQuery;
    IBSPActualizarAcciones: TIBStoredProc;
    IBQDelAccionUsuario: TIBQuery;
    procedure EAConfClaveExit(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure AcEliminarExecute(Sender: TObject);
    procedure EANombreExit(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EANombreKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBARolKeyPress(Sender: TObject; var Key: Char);
    procedure DBEAClaveKeyPress(Sender: TObject; var Key: Char);
    procedure IBQAbmSimpleBeforeDelete(DataSet: TDataSet);
  private
    function ControlarClaves: boolean;
  protected
    procedure PasarAEditar; override;
    procedure InsertarRegistro; override;
    procedure GuardarRegistro; override;
    procedure EditarRegistro; override;
    procedure ReabrirQuerys; override;
  public
  end;

var
  FABMUsuarios: TFABMUsuarios;

implementation

uses UMensajeHuella;

{$R *.dfm}

(*
  Revisamos que las claves conicidan, de no ser asi avisamos y limpiamos
*)
function TFABMUsuarios.ControlarClaves: boolean;
begin
   if (EAConfClave.Text = DBEAClave.Text) then begin
      Result := True;
   end else begin
      MostrarMensaje(tmError, 'Las claves ingresadas no coinciden');
      DBEAClave.Text   := '';
      EAConfClave.Text := '';
      DBEAClave.SetFocus;
      Result := False;
   end
end;


(*
  Al salir de la edicion de la confirmacion, controlamos las claves
*)
procedure TFABMUsuarios.EAConfClaveExit(Sender: TObject);
begin
   inherited;
 //  ControlarClaves;
end;

(*
  Solamente guardamos si las claves coniciden
*)
procedure TFABMUsuarios.AcGuardarExecute(Sender: TObject);
var estadoAnterior: TEstadoAbm;
begin
   if ControlarClaves then
   begin
      IBQAbmSimple.FieldByName('ROL').AsInteger := DBLCBARol.KeyValue;
      IBQAbmSimple.FieldByName('NOMBREROL').AsString := trim(DBLCBARol.Text);
      IBQAbmSimple.FieldByName('clave').AsString := encriptar(EAConfClave.Text, 19);
      IBQAbmSimple.FieldByName('NOMUSR').AsString := trim(EANombre.Text);
      if(DBCBHabilitado.Checked)then
         IBQAbmSimple.FieldByName('valor').AsString := 'SI'
      else
         IBQAbmSimple.FieldByName('valor').AsString := 'NO';
      // el inherited pasa a eaNavegar, por eso guardamos si entramos
      // por insertar o editar para ejecutar el procedure de las acciones
      estadoAnterior := Estado;
      inherited;
      IBQGen_Usuario.Open;
      IBSPActualizarAcciones.ParamByName('ID_ROL_USUARIO').AsInteger := DBLCBARol.KeyValue;
      if (estadoAnterior = eaInsertar) then
        IBSPActualizarAcciones.ParamByName('ID_USUARIO_NUEVO').AsInteger := IBQGen_Usuario.FieldValues['IDNUEVOUSUARIO'];
      if (estadoAnterior = eaEditar) then
        IBSPActualizarAcciones.ParamByName('ID_USUARIO_NUEVO').AsInteger := IBQAbmSimple.FieldValues['ID_USUARIO'];
      IBSPActualizarAcciones.ExecProc;
      IBQGen_Usuario.Close;
   end;
end;

(*
  Al editar, nos aseguramos de que se vean el nombre y la confirmacion
  de clave igual que en la base.
  Ademas habilitamos nombre, rol y activo para todos excepto para administrador
*)
procedure TFABMUsuarios.PasarAEditar;
begin
  inherited;
  EAConfClave.Text := DBEAClave.Text;
  EANombre.Text := IBQAbmSimple.FieldValues['NOMUSR'];
  EANombre.Enabled  := IBQAbmSimple.FieldValues['id_usuario'] <> 1;
  DBLCBARol.Enabled := IBQAbmSimple.FieldValues['id_usuario'] <> 1;
  DBCBHabilitado.Enabled := IBQAbmSimple.FieldValues['id_usuario'] <> 1;
end;


(*
  Permitimos borrar usuarios excepto el administrador
*)
procedure TFABMUsuarios.AcEliminarExecute(Sender: TObject);
begin
   if IBQAbmSimple.FieldValues['id_usuario'] <> 1 then
      inherited
   else
      MostrarMensaje(tmAdvertencia, 'No se puede Eliminar el Administrador de Huella !!!');
end;

(*
  Impedimos que se pueda insertar otro administrador,
  si se entra por editar puede quedar dobre administrador
  pero al sacar la condicion (Estado <> eaEditar) no deja
  entrar a editar el administrador y por ende no se puede cambiar la clave
*)
procedure TFABMUsuarios.EANombreExit(Sender: TObject);
begin
   inherited;
   if ((EANombre.Text = 'ADMINISTRADOR') and (Estado <> eaEditar)) then begin
      MostrarMensaje(tmError, 'Nombre inválido');
      EANombre.SetFocus;
   end
end;

(*
  Al insertar un usuario nos aseguramos de limpiar el nombre
  y de que esté habilitado si poder tocarse
*)
procedure TFABMUsuarios.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  EANombre.Enabled:=true;
  DBLCBARol.Enabled:=true;
  EANombre.SetFocus;
  EANombre.Text := '';
  DBCBHabilitado.Checked := True;
  DBCBHabilitado.Enabled := False;
end;

(*
  Los Usuarios son modificables por el usuario
*)
procedure TFABMUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := True;
end;

(*
  El nuevo usuario está habilitado por defecto
*)
procedure TFABMUsuarios.InsertarRegistro;
begin
  inherited;
  IBQAbmSimple.FieldByName('HABILITADO').AsString := 'S';
//  IBQAbmSimple.FieldByName('ROL').AsInteger := DBLCBARol.GetDato;
end;

(*
  Antes de guardan en la base, sacamos los blancos del nombre
  y encriptamos la clave.
  Esto se DEBE hacer antes del inherited que realiza el ApplyUpdates
*)
procedure TFABMUsuarios.GuardarRegistro;
begin
  IBQAbmSimple.FieldByName('NOMUSR').AsString := trim(EANombre.Text);
  IBQAbmSimple.FieldByName('CLAVE').AsString := encriptar(EAConfClave.Text, 19);
  inherited;
end;

(*
  Vaciamos la clave cuando entra por Editar, porque sino le encripta la clave
  encriptada, y no se loguea nunca mas.
  De esta forma forzamos el cambio de clave cada vez que se modifica un usuario
*)
procedure TFABMUsuarios.EditarRegistro;
begin
  inherited;
  IBQAbmSimple.FieldByName('CLAVE').AsString := '';
end;

(*
  Abrimos el query de roles
  Martin: Esto hay que generalizarlo en ABMSimple, ademas de asegurarse
          que el evento AfterOpen quede asignado.
*)
procedure TFABMUsuarios.ReabrirQuerys;
begin
  inherited;
  IBQRol.Close;
  IBQRol.Open;
  IBQRol.Last;
  IBQRol.First;
end;

procedure TFABMUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  DBCBHabilitado.Checked := False;
  IBQRol.Active := True;
  IBQRol.Last;
  IBQRol.First;
  { se desabilita el boton SBFiltrar x q surgen problemas de campos ambiguos U.nombre y R.nombre,
  al generar el query para filtrar, el like que se adiciona al query no distingue
  (al elegir filtar por nombre) por cual de los dos filtrar}
  //SBFiltrar.Visible := false;

end;


procedure TFABMUsuarios.EANombreKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) then
   begin
     DBLCBARol.SetFocus;
     key:= #0;
   end;
end;

procedure TFABMUsuarios.DBLCBARolKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) then
   begin
     DBEAClave.SetFocus;
     key:= #0;
   end;
end;

procedure TFABMUsuarios.DBEAClaveKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) then
   begin
     EAConfClave.SetFocus;
     key:= #0;
   end;
end;

procedure TFABMUsuarios.IBQAbmSimpleBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  IBQDelAccionUsuario.Close;
  IBQDelAccionUsuario.ParamByName('usuario').AsInteger := BDBGAbm.DataSource.DataSet.FieldValues['ID_USUARIO'];
  IBQDelAccionUsuario.Open;
end;

end.
