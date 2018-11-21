unit UAbmGrupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmCompuesto, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, UFrameDBSeleccion, Buttons, StdCtrls, Grids, DBGrids,
  UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls, UDBEditAuto, IBStoredProc,
  DataExport, DataToXLS, EditAuto, UDBLookupComboBoxAuto, WinXP,
  EditAutoMinuscula, JvExControls, JvLabel, PngImage, jpeg, JvGIF,
  PngImageList, JvExExtCtrls, JvImage;

type
  TObjeto = record
    combo : TDBLookupComboBoxAuto;
    sentencia : ansistring;
  end;
  TRegistroParametros = record
    nombre : string;
    valor : variant;
  end;
  TFABMGrupos = class(TFABMCompuesto)
    IBQGenIDAux: TIBQuery;
    GBComplejos: TGroupBox;
    LDesde2: TLabel;
    LDesde3: TLabel;
    Lhasta2: TLabel;
    Lhasta3: TLabel;
    CBSexo: TCheckBox;
    CBRaza: TCheckBox;
    CBCategoria: TCheckBox;
    CBCondCorp: TCheckBox;
    CBCronoDentaria: TCheckBox;
    CBEstadoRepro: TCheckBox;
    CBGdr: TCheckBox;
    CBRodeo: TCheckBox;
    CBPotrero: TCheckBox;
    DBLCBASexo: TDBLookupComboBoxAuto;
    DBLCBARaza: TDBLookupComboBoxAuto;
    DBLCBACategoria: TDBLookupComboBoxAuto;
    DBLCBACondCorporal: TDBLookupComboBoxAuto;
    DBLCBACronoDentaria: TDBLookupComboBoxAuto;
    DBLCBAEstadoRepro: TDBLookupComboBoxAuto;
    DBLCBAGdr: TDBLookupComboBoxAuto;
    DBLCBARodeo: TDBLookupComboBoxAuto;
    DBLCBAPotrero: TDBLookupComboBoxAuto;
    CBPeso: TCheckBox;
    CBFrame: TCheckBox;
    EAPesoDesde: TEditAuto;
    EAFrameDesde: TEditAuto;
    EAPesoHasta: TEditAuto;
    EAFrameHasta: TEditAuto;
    CBEstadoParicion: TCheckBox;
    DBLCBAEstadoParicion: TDBLookupComboBoxAuto;
    RGBusqueda: TRadioGroup;
    IBQAux: TIBQuery;
    Panel2: TPanel;
    DBEANombre: TDBEditAuto;
    LNombre: TLabel;
    LDescripcion: TLabel;
    DBEADescripcion: TDBEditAuto;
    EARP: TEditAutoMinuscula;
    IBQCommit: TIBQuery;
    IBQEliminarGrupo: TIBQuery;
    IBQActGrupo: TIBQuery;
    CBAnios: TCheckBox;
    LDesde1: TLabel;
    EAAniosDesde: TEditAuto;
    Lhasta1: TLabel;
    EAAniosHasta: TEditAuto;
    procedure AcGuardarExecute(Sender: TObject);
    procedure BBAgregarUnoClick(Sender: TObject);
    procedure BBAgregarTodosClick(Sender: TObject);
    procedure BBEliminarUnoClick(Sender: TObject);
    procedure BBEliminarTodosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure BDBGDisponiblesCellClick(Column: TColumn);
    procedure BDBGSelecciondosCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure AcEliminarExecute(Sender: TObject);
    procedure RGBusquedaClick(Sender: TObject);
    procedure CheckClick(Sender: TObject);
    procedure ComboCloseUp(Sender: TObject);
    procedure ComboKeyPress(Sender: TObject; var Key: Char);
    procedure ComboKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure EditChange(Sender: TObject);
    procedure Change(Sender: TObject);
    procedure EARPChange(Sender: TObject);
    procedure BDBGDisponiblesDblClick(Sender: TObject);
    procedure BDBGSelecciondosDblClick(Sender: TObject);
    procedure EAPesoDesdeChange(Sender: TObject);
    procedure EAFrameDesdeChange(Sender: TObject);
    procedure BBGuardarClick(Sender: TObject);
    procedure DBEANombreChange(Sender: TObject);
    procedure AcCancelarExecute(Sender: TObject);
    procedure EAAniosDesdeChange(Sender: TObject);
  private
    FIdGRUPO : Integer;
    modo : string;
    listaObjetos : array[1..16] of TObjeto;
    parametros : array of TRegistroParametros;
    procedure InicFiltros();
  protected
    procedure InsertarRegistro; override;
    procedure GuardarRegistro; override;
    procedure CargarParametrosSimple; override;
    procedure limpiarChecks;
    procedure habilitarLabel(cond: boolean);
    procedure CargarParametros;
    procedure GuardarParametros;
    procedure AgregarAconsulta(sentencia: AnsiString);
  public
    procedure SeleccionarAnimal(Sender: TObject);
    procedure DeSeleccionarAnimal(Sender: TObject);
    procedure CargarLista;
    function existeEnParams(nombre:string):boolean;
    procedure checkSolos(check : TCheckBox);
    procedure checkCombos(check: TCheckBox);
    procedure checkEdits(check: TCheckBox);
    procedure ComboChange(Combo:TDBLookupComboBoxAuto; Poner : boolean);
    procedure SacarDeConsulta(sentencia : Ansistring);
    function existeEnParametros(nombre:string; Var aca: integer):boolean;
    procedure BorrarDeParametros(tag : integer);
  end;

var
  FABMGrupos: TFABMGrupos;
  consulta : AnsiString;
  val1Edad : integer;
  val2Edad : integer;
  val1Peso : integer;
  val2peso : integer;
  val1frame : integer;
  val2frame : integer;

implementation

uses UAbmSimple, UPrincipal, UDMSoftvet, UMensajeHuella, UREPFichaAnimal;

{$R *.dfm}

(*
  Guardamos el grupo en la base
*)
procedure TFABMGrupos.AcGuardarExecute(Sender: TObject);
var
   LResult : boolean;
begin
  LResult := true;
   // Aplicamos los cambios
   try
      IBQSeleccionados.DataSource := nil;
      IBQAbmSimple.FieldByName('ID_GRUPO').AsInteger := FIdGRUPO;
      IBQAbmSimple.Database.ApplyUpdates([IBQAbmSimple,IBQSeleccionados]);
      LResult:= True;
   except
      LResult:= False;
   end;
   // Si todo anduvo bien, avisamos ...
   if LResult then begin
      // ... segun si estamos creando o actualizando
      if modo = 'N' then
         MostrarMensaje(tmInformacion, 'EL Grupo fue creado con exito');
      if modo = 'A' then
         MostrarMensaje(tmInformacion, 'EL Grupo fue actualizado con exito');
      IBQDisponibles.DataSource := DSAbmSimple;
      estado := eaNavegar;
   // Si algo fallo, avisamos ...
   end else begin
      // ... segun si estamos creando o actualizando
      if modo = 'N' then
          MostrarMensaje(tmError, 'No se pudo crear el Grupo');
      if modo = 'A' then
          MostrarMensaje(tmError, 'No se pudo actualizar el Grupo');
   end;
end;

(*
  Pasamos a modo insercion, generamos un Id para el grupo,
  abrimos los animales seleccionados y ponemos los parametros
  fijos del grupo.
*)
procedure TFABMGrupos.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  modo := 'N';
  estado := eaInsertar;
  IBQGenIDAux.Open;
  FIdGRUPO := IBQGenIDAux.FieldValues['ID_GRUPO'];
  IBQGenIDAux.Close;

  IBQAbmSimple.Edit;
  IBQAbmSimple.FieldByName('ID_GRUPO').Value := FIdGrupo;
  IBQAbmSimple.FieldByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQAbmSimple.FieldByName('NOMBRE').Value := 'GRUPO';
  IBQAbmSimple.FieldByName('DESCRIPCION').Value := 'DESCRIPCION';
  IBQAbmSimple.FieldByName('TIPO').Value := 'U';
  IBQAbmSimple.Database.ApplyUpdates([IBQAbmSimple]);

  DBEANombre.Clear;
  DBEADescripcion.Clear;

  {IBQDisponibles.Active:= false;
  IBQDisponibles.ParamByName('ID_GRUPO').AsInteger := FIdGRUPO;
  IBQDisponibles.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDisponibles.Active:= true;}
  InicFiltros();

  self.Height := self.Height+GBComplejos.Height;

end;

(*
  Se mueven los elementos marcados en la grilla disponibles
  a la grilla de seleccionados
*)
procedure TFABMGrupos.BBAgregarUnoClick(Sender: TObject);
begin
  OnSelectItem := SeleccionarAnimal;
  inherited;
  IBQSeleccionados.Database.ApplyUpdates([IBQSeleccionados]);
  BDBGDisponibles.DataSource.DataSet.Refresh;
  BBGuardar.Enabled := (not(DSSeleccionados.DataSet.IsEmpty)) and (DBEANombre.Text <> '');
  BBGuardar.Visible := (not(DSSeleccionados.DataSet.IsEmpty)) and (DBEANombre.Text <> '');  
  ActualizarCantidadAnimales;
end;

(*
  Se mueven todos los elementos de la grilla disponibles
  a la grilla seleccionados
*)
procedure TFABMGrupos.BBAgregarTodosClick(Sender: TObject);
begin
  OnSelectItem := SeleccionarAnimal;
  inherited;
  IBQSeleccionados.Database.ApplyUpdates([IBQSeleccionados]);
  BDBGDisponibles.DataSource.DataSet.Refresh;
  BBGuardar.Enabled := (not(DSSeleccionados.DataSet.IsEmpty)) and (DBEANombre.Text <> '');
  BBGuardar.Visible := (not(DSSeleccionados.DataSet.IsEmpty)) and (DBEANombre.Text <> '');  
  ActualizarCantidadAnimales;
end;

(*
  Se mueven los elementos marcados en la grilla seleccionados
  a la grilla de disponibles
*)
procedure TFABMGrupos.BBEliminarUnoClick(Sender: TObject);
begin
  OnSelectItem := DeSeleccionarAnimal;
  inherited;
  IBQSeleccionados.Database.ApplyUpdates([IBQSeleccionados]);

  IBQDisponibles.Close;
  IBQDisponibles.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDisponibles.ParamByName('id_grupo').AsInteger := FidGrupo;
  IBQDisponibles.Open;

  BBGuardar.Enabled := (not(DSSeleccionados.DataSet.IsEmpty)) and (DBEANombre.Text <> '');
  BBGuardar.Visible := (not(DSSeleccionados.DataSet.IsEmpty)) and (DBEANombre.Text <> '');
  ActualizarCantidadAnimales;
end;

(*
  Se mueven todos los elementos de la grilla seleccionados
  a la grilla disponibles
*)
procedure TFABMGrupos.BBEliminarTodosClick(Sender: TObject);
begin
  OnSelectItem := DeSeleccionarAnimal;
  inherited;
  IBQSeleccionados.Database.ApplyUpdates([IBQSeleccionados]);

  IBQDisponibles.Close;
  IBQDisponibles.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDisponibles.ParamByName('id_grupo').AsInteger := FidGrupo;
  IBQDisponibles.Open;

  BBGuardar.Enabled := (not(DSSeleccionados.DataSet.IsEmpty)) and (DBEANombre.Text <> '');
  BBGuardar.Visible := (not(DSSeleccionados.DataSet.IsEmpty)) and (DBEANombre.Text <> '');  
  ActualizarCantidadAnimales;
end;

procedure TFABMGrupos.InicFiltros();
begin
  val1edad := 0;
  val2edad := 30;
  EAAniosDesde.Text := intToStr(val1Edad);
  EAAniosHasta.Text := intToStr(val2Edad);

  // recupero el minimo peso de un animal
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :esta) and (sjp.nombre = ''BGPESANI1'')');
  IBQAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAux.Active := true;
  val1peso := IBQAux.fieldbyname('valor').AsInteger;
  EAPesoDesde.Text := IntToStr(val1peso);

  // recupero el maximo peso de un animal
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :esta) and (sjp.nombre = ''BGPESANI4'')');
  IBQAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAux.Active := true;
  val2peso := IBQAux.fieldbyname('valor').AsInteger;
  EAPesoHasta.Text := IntToStr(val2peso);

  // recupero el minimo frame de un animal
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :esta) and (sjp.nombre = ''BGFRAME1'')');
  IBQAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAux.Active := true;
  val1frame := IBQAux.fieldbyname('valor').AsInteger;
  EAframeDesde.Text := inttoStr(val1frame);

  // recupero el maximo frame de un animal
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :esta) and (sjp.nombre = ''BGFRAME4'')');
  IBQAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAux.Active := true;
  val2frame := IBQAux.fieldbyname('valor').AsInteger;
  EAframeHasta.Text := inttoStr(val2frame);

  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;

  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;

  DMSoftvet.IBQEstadoParicion.Close;
  DMSoftvet.IBQEstadoParicion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQEstadoParicion.Open;

  consulta := 'select ID_RP, ID_SENASA, ID_ANIMAL, ESTABLECIMIENTO, FECHA_NACIMIENTO '
             +'from TAB_ANIMALES WHERE '
             +'ID_ANIMAL NOT IN (SELECT ANIMAL  from REL_PERTENECE_GRUPO where (GRUPO = :ID_GRUPO)) '
             +'and (establecimiento = :establecimiento) and (ACTIVO=''S'')';

  IBQDisponibles.Close;
  IBQDisponibles.SQL.Clear;
  IBQDisponibles.SQL.Add(consulta);
  IBQDisponibles.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDisponibles.ParamByName('ID_GRUPO').AsInteger := FidGrupo; // por ahora luego va a ser desde el check para esto
  IBQDisponibles.Open;

  IBQSeleccionados.Close;
  IBQSeleccionados.ParamByName('id_grupo').AsInteger := FidGrupo;
  IBQSeleccionados.Open;

  RGBusqueda.ItemIndex := 0;
  RGBusquedaClick(nil);
  ActualizarCantidadAnimales;
  CargarLista;
end;

(*
  Abrimos los animales del grupo y permitimos cambios,
  Martin: Esto no debiera ser necesario ya que los seleccionados son utiles
          al ir a modo edicion o insercion
*)
procedure TFABMGrupos.FormCreate(Sender: TObject);
begin
   inherited;
   {IBQDisponibles.Active:= false;
   IBQDisponibles.ParamByName('ID_GRUPO').AsInteger := FIdGRUPO;
   IBQDisponibles.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
   IBQDisponibles.Active:= true;}
   modo := '';
   PermiteCambio := True;
   InicFiltros();
end;

(*
  Pasamos a modo edicion, abrimos los animales seleccionados y disponibles
*)
procedure TFABMGrupos.AcEditarExecute(Sender: TObject);
begin
if not(IBQAbmSimple.IsEmpty) then
 begin
  modo := 'A';
  FIdGRUPO := IBQAbmSimple.FieldValues['ID_GRUPO'];
  IBQDisponibles.Active:= false;
  IBQDisponibles.ParamByName('ID_GRUPO').AsInteger := FIdGRUPO;
  IBQDisponibles.ParamByName('establecimiento').AsInteger := Fprincipal.EstablecimientoActual;
  IBQDisponibles.Active:= true;
  IBQSeleccionados.Active:= false;
  IBQSeleccionados.ParamByName('ID_GRUPO').AsInteger := FIdGRUPO;
  IBQSeleccionados.Active:= true;
  RGBusqueda.ItemIndex := 0;
  RGBusquedaClick(nil);
  ActualizarCantidadAnimales;
  inherited;
  self.Height := self.Height+GBComplejos.Height;
 end;
end;

(*
  Al marcar un disponible desmarcamos los seleccionados
*)
procedure TFABMGrupos.BDBGDisponiblesCellClick(Column: TColumn);
begin
  inherited;
  BDBGSelecciondos.SelectedRows.Clear;
  ControlarBotones;
end;

(*
  Al marcar un seleccionado desmarcamos los disponibles
*)
procedure TFABMGrupos.BDBGSelecciondosCellClick(Column: TColumn);
begin
  inherited;
  BDBGDisponibles.SelectedRows.Clear;
  ControlarBotones;
end;

(*
  Movemos los datos del disponible a seleccionados
*)
procedure TFABMGrupos.DeSeleccionarAnimal(Sender: TObject);
begin
  { IBQDisponibles.Insert;
   IBQDisponibles.FieldByName('ID_ANIMAL').Value := IBQSeleccionados.FieldByName('ANIMAL').Value;
   IBQDisponibles.FieldByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
   IBQDisponibles.FieldByName('ID_RP').Value := IBQSeleccionados.FieldByName('ID_RP').Value;
   IBQDisponibles.FieldByName('ID_SENASA').Value := IBQSeleccionados.FieldByName('ID_SENASA').Value; }  
end;

(*
  Movemos los datos del seleccionado a disponibles
*)
procedure TFABMGrupos.SeleccionarAnimal(Sender: TObject);
begin
   IBQSeleccionados.Insert;
   IBQSeleccionados.FieldByName('ANIMAL').Value := IBQDisponibles.FieldByName('ID_ANIMAL').Value;
   IBQSeleccionados.FieldByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
   IBQSeleccionados.FieldByName('GRUPO').Value := FIdGRUPO;
   IBQSeleccionados.FieldByName('ID_RP').Value := IBQDisponibles.FieldByName('ID_RP').Value;
   IBQSeleccionados.FieldByName('ID_SENASA').Value := IBQDisponibles.FieldByName('ID_SENASA').Value;
   IBQSeleccionados.FieldByName('ACTIVO').Value := 'S';
end;

(*
  Eliminamos un grupo de usuario
*)
procedure TFABMGrupos.AcEliminarExecute(Sender: TObject);
begin
  IBQSeleccionados.Active:= false;
  IBQSeleccionados.ParamByName('ID_GRUPO').AsInteger := IBQAbmSimple.FieldValues['ID_GRUPO'];
  IBQSeleccionados.Active:= true;
  try
    while not(IBQSeleccionados.Eof) do
      IBQSeleccionados.Delete;
    IBQAbmSimple.Database.ApplyUpdates([IBQSeleccionados]);
    inherited;
  except
  end;
end;

(*
  Filtramos los grupos del establecimiento actual
*)
procedure TFABMGrupos.FormShow(Sender: TObject);
begin
  inherited;
  IBQAbmSimple.Close;
  IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
  IBQAbmSimple.Open;
end;

(*
  Ponemos el grupo en el establecimiento actual
  y nos aseguramos que sea de usuario
*)
procedure TFABMGrupos.InsertarRegistro;
begin
  inherited;
  IBQAbmSimple.FieldByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAbmSimple.FieldByName('TIPO').AsString := 'U';
end;

(*
  Establecemos el grupo generado (al insertar?)
  1- Sobreescribir el guardar registro en ABMCompuesto para hacer el applyupdates doble ahi
*)
procedure TFABMGrupos.GuardarRegistro;
begin
  IBQAbmSimple.FieldByName('ID_GRUPO').AsInteger := FIdGRUPO;
  inherited;
end;

procedure TFABMGrupos.CargarParametrosSimple;
begin
  inherited;
  IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
end;

procedure TFABMGrupos.RGBusquedaClick(Sender: TObject);
begin
  inherited;

    case RGBusqueda.ItemIndex of
    0 : begin
          EARP.Enabled := false;
          GBComplejos.Enabled := false;
          limpiarChecks;
          habilitarLabel(false);
          IBQDisponibles.Close;
          IBQDisponibles.SQL.Clear;
          IBQDisponibles.SQL.Add(consulta);
          IBQDisponibles.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
          IBQDisponibles.ParamByName('ID_GRUPO').AsInteger := FidGrupo;
          IBQDisponibles.Open;
        end;
    1 : begin
          EARP.Enabled := true;
          GBComplejos.Enabled := false;
          limpiarChecks;
          habilitarLabel(false);
          IBQDisponibles.Close;
          IBQDisponibles.SQL.Clear;
          IBQDisponibles.SQL.Add(consulta+' and ID_RP like :in || ''%''');
          IBQDisponibles.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
          IBQDisponibles.ParamByName('ID_GRUPO').AsInteger := FidGrupo;
          IBQDisponibles.ParamByName('in').AsString := '';
          IBQDisponibles.Open;
          EARP.SetFocus;
        end;
    2 : begin
          EARP.Enabled := false;
          GBComplejos.Enabled := true;
          habilitarLabel(true);
          IBQDisponibles.Close;
          IBQDisponibles.SQL.Clear;
          IBQDisponibles.SQL.Add(consulta);
          IBQDisponibles.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
          IBQDisponibles.ParamByName('ID_GRUPO').AsInteger := FidGrupo;
          IBQDisponibles.Open;
          GuardarParametros;
          AgregarAconsulta(listaObjetos[1].sentencia);
          CargarParametros;
        end;
    end;
    ActualizarCantidadAnimales;
end;



procedure TFABMGrupos.limpiarChecks;
begin
  CBSexo.Checked := false;
  CBRaza.Checked := false;
  CBCategoria.Checked := false;
  CBCondCorp.Checked := false;
  CBCronoDentaria.Checked := false;
  CBEstadoRepro.Checked := false;
  CBGdr.Checked := false;
  CBRodeo.Checked := false;
  CBPotrero.Checked := false;
  //CBAnios.Checked := false;
  CBPeso.Checked := false;
  CBFrame.Checked := false;
  CBEstadoParicion.Checked := false;
  CBAnios.Checked := false;
end;

procedure TFABMGrupos.habilitarLabel(cond: boolean);
begin
  CBSexo.Enabled := cond;
  CBRaza.Enabled := cond;
  CBCategoria.Enabled := cond;
  CBCondCorp.Enabled := cond;
  CBCronoDentaria.Enabled := cond;
  CBEstadoRepro.Enabled := cond;
  CBGdr.Enabled := cond;
  CBRodeo.Enabled := cond;
  CBPotrero.Enabled := cond;
  //CBAnios.Enabled := cond;
  CBPeso.Enabled := cond;
  CBAnios.Enabled := cond;
  CBFrame.Enabled := cond;
  CBEstadoParicion.Enabled := cond;  
  //LDesde1.Enabled := cond;
  LDesde2.Enabled := cond;
  LDesde3.Enabled := cond;
  //Lhasta1.Enabled := cond;
  Lhasta2.Enabled := cond;
  Lhasta3.Enabled := cond;

  LDesde1.Enabled := cond;
  Lhasta1.Enabled := cond;
end;

procedure TFABMGrupos.GuardarParametros;
var cont : integer;
begin
  cont := 0;
  SetLength(parametros,IBQDisponibles.Params.Count);
  while (cont < IBQDisponibles.Params.Count) do
    begin
      if (IBQDisponibles.Params.Items[cont].Value <> Unassigned) then
        begin
          parametros[cont].nombre := IBQDisponibles.Params.Items[cont].Name;
          parametros[cont].valor := IBQDisponibles.Params.Items[cont].Value;
        end;
      inc(cont);
    end;
end;

// cuando seteo los parametros recupero lo que guarde antes
procedure TFABMGrupos.CargarParametros;
var cont : integer;
begin
  IBQDisponibles.Close;
  cont := 0;
  while (cont < Length(parametros)) do
    begin
      if (existeEnParams(parametros[cont].nombre)and (parametros[cont].valor <> '-1')) then
        IBQDisponibles.ParamByName(parametros[cont].nombre).Value := parametros[cont].valor;
      inc(cont);
    end;
  IBQDisponibles.Open;
end;

procedure TFABMGrupos.AgregarAconsulta(sentencia: AnsiString);
Var aux : ansiString;
begin
  if (AnsiPos(sentencia,IBQDisponibles.SQL.GetText) = 0) then // no esta
    begin
      IBQDisponibles.Close;
      if (AnsiPos('where',IBQDisponibles.SQL.GetText) = 0) then // no tiene where
        begin
          aux := StringReplace(IBQDisponibles.SQL.GetText,#$D#$A, '',[rfReplaceAll])+ ' where '+sentencia;
          IBQDisponibles.SQL.Clear;
          IBQDisponibles.SQL.Add(aux);
        end
      else
        begin
          aux := StringReplace(IBQDisponibles.SQL.GetText,#$D#$A, '',[rfReplaceAll])+' and '+sentencia;
          IBQDisponibles.SQL.Clear;
          IBQDisponibles.SQL.Add(aux);
        end;
      {showMessage(IBQAbmSimple.SQL.GetText);
      showMessage(IBQDisponibles.SQL.GetText);}
      IBQDisponibles.Open;
    end;
end;

procedure TFABMGrupos.CargarLista;
begin

// 1 -- Ver solo animales activos
  listaObjetos[1].combo := nil;
  listaObjetos[1].sentencia := '(activo = ''S'')';

// 2 -- Ver solo animales rechazados
  listaObjetos[2].combo := nil;
  listaObjetos[2].sentencia := '(rechazado = ''S'')';

// 3 -- Ver ultimo Evento
  listaObjetos[3].combo := nil;
  listaObjetos[3].sentencia := '';

// 4 -- Filtro por sexo
  listaObjetos[4].combo := DBLCBASexo;
  listaObjetos[4].sentencia := '(sexo = :sexo)';

// 5 -- Filtro por raza
  listaObjetos[5].combo := DBLCBARaza;
  listaObjetos[5].sentencia := '(raza = :raza)';

// 6 -- Filtro por categoria
  listaObjetos[6].combo := DBLCBACategoria;
  listaObjetos[6].sentencia := '(categoria = :categoria)';

// 7 -- Filtro por condicion corporal
  listaObjetos[7].combo := DBLCBACondCorporal;
  listaObjetos[7].sentencia := '(condicion_corporal = :condicion_corporal)';

// 8 -- Filtro por cronologia dentaria
  listaObjetos[8].combo := DBLCBACronoDentaria;
  listaObjetos[8].sentencia := '(cronologia_dentaria = :cronologia_dentaria)';

// 9 -- Filtro por estado reproductivo
  listaObjetos[9].combo := DBLCBAEstadoRepro;
  listaObjetos[9].sentencia := '(estado_reproductivo = :estado_reproductivo)';

// 10 -- Filtro por gdr
  listaObjetos[10].combo := DBLCBAGdr;
  listaObjetos[10].sentencia := '(gdr = :gdr)';

// 11 -- Filtro por rodeo
  listaObjetos[11].combo := DBLCBARodeo;
  listaObjetos[11].sentencia := '(rodeo = :rodeo)';

// 12 -- Filtro por potrero
  listaObjetos[12].combo := DBLCBAPotrero;
  listaObjetos[12].sentencia := '(potrero = :potrero)';

// 13 -- Filtro por años
  listaObjetos[13].combo := nil;
  listaObjetos[13].sentencia := '(((CURRENT_DATE - fecha_nacimiento)/365) BETWEEN :valedad1 and :valedad2)';

// 14 -- Filtro por peso
  listaObjetos[14].combo := nil;
  listaObjetos[14].sentencia := '(peso BETWEEN :valpeso1 and :valpeso2)';

// 15 -- Filtro por frame
  listaObjetos[15].combo := nil;
  listaObjetos[15].sentencia := '(frame BETWEEN :valframe1 and :valframe2)';

// 16 -- Filtro por estado de parición
  listaObjetos[16].combo := DBLCBAEstadoParicion;
  listaObjetos[16].sentencia := '(estado_lactacion = :estadolactacion)';
end;

function TFABMGrupos.existeEnParams(nombre: string): boolean;
var cont : integer;
begin
  result := false;
  cont := 0;
  while ((cont < IBQDisponibles.Params.Count)and not(result)) do
    begin
      if (IBQDisponibles.Params.Items[cont].Name = nombre) then
          Result := true;
      inc(cont);
    end;
end;

procedure TFABMGrupos.CheckClick(Sender: TObject);
begin
  inherited;
  case TCheckBox(Sender).Tag of
    1, 2, 3 :
    begin
      // para los check que son solos
      checkSolos(TCheckBox(Sender));
    end;
    4, 5, 6, 7, 8, 9, 10, 11, 12,16 :
    begin
      // para los check que trabajan con combos (TERMINADO SUJETO A MODIFICACIONES)
      checkCombos(TCheckBox(Sender));
    end;
    13, 14, 15 :
    begin
      // para los check que habilitan los edits
      checkEdits(TCheckBox(Sender));
    end;
  end;

  if (TCheckBox(Sender).Checked = true) then
    if (TCheckBox(Sender).Tag = 14) then
      EAPesoDesde.SetFocus
     else
      if (TCheckBox(Sender).Tag = 15) then
         EAFrameDesde.SetFocus;

  if (CBSexo.Checked) then
   begin
    if (DBLCBASexo.KeyValue = 1) then
      begin
        CBEstadoParicion.Checked:= false;
        CBEstadoParicion.Enabled:= false;
      end
     else
      if (DBLCBASexo.KeyValue = 2) then
        CBEstadoParicion.Enabled:= true;
    end
   else
       CBEstadoParicion.Enabled:= true;

  ActualizarCantidadAnimales;         
end;

// evento de cambio de un combo
procedure TFABMGrupos.ComboCloseUp(Sender: TObject);
begin
  inherited;
  if (DBLCBASexo.KeyValue = 1) then
    begin
      CBEstadoParicion.Checked:= false;
      CBEstadoParicion.Enabled:= false;
    end
   else
    if (DBLCBASexo.KeyValue = 2) then
      CBEstadoParicion.Enabled:= true;

  ComboChange(TDBLookupComboBoxAuto(Sender), true);
  CargarParametros;
  ActualizarCantidadAnimales;   
end;

procedure TFABMGrupos.ComboKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key:=#0;
end;

// evento que produce cambios en un combo
procedure TFABMGrupos.ComboKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  ComboChange(TDBLookupComboBoxAuto(Sender), true);
  CargarParametros;
end;

procedure TFABMGrupos.checkSolos(check: TCheckBox);
var pos : integer;
begin
  GuardarParametros;
  if (check.Tag = 1) then
    begin
      if (check.Checked) then
        begin
          //SacarDeConsulta('(activo = ''N'')');
          AgregarAconsulta(listaObjetos[check.Tag].sentencia)
        end
      else
        begin
          SacarDeConsulta(listaObjetos[check.Tag].sentencia);
          //AgregarAconsulta('(activo = ''N'')');
        end;
    end
  else
    if (check.Tag = 2) then
      begin
        if (check.Checked) then
          AgregarAconsulta(listaObjetos[check.Tag].sentencia)
        else
          SacarDeConsulta(listaObjetos[check.Tag].sentencia);
      end
    else
      begin
        if (existeEnParametros('con_evento',pos)) then
          if (check.Checked) then
            parametros[pos].valor:= 'S'
          else
            parametros[pos].valor:= 'N';
        //BDBGAnimales.Columns.Items[6].Visible := check.Checked;
      end;
  CargarParametros;
end;

// manejos los checks con combo asociados
procedure TFABMGrupos.checkCombos(check: TCheckBox);
begin
  if not(listaObjetos[check.Tag].combo.ListSource.DataSet.IsEmpty) then
    begin
      listaObjetos[check.Tag].combo.Enabled := check.Checked;
      listaObjetos[check.Tag].combo.KeyValue := 1;
      // guardo el valor de los parametros porque cuando cambio la consulta lo pierdo
      GuardarParametros;
      if (check.Checked) then
        begin
          AgregarAconsulta(listaObjetos[check.Tag].sentencia);
          ComboChange(listaObjetos[check.Tag].combo, true);
        end
      else
        begin
          SacarDeConsulta(listaObjetos[check.Tag].sentencia);
          ComboChange(listaObjetos[check.Tag].combo, false);
          listaObjetos[check.Tag].combo.KeyValue := -1;
        end;
      CargarParametros;
    end
  else
    check.Checked := false;

//  ShowMessage(IBQAnimales.SQL.GetText); //si quiero ver como se va armando el sql HABILITO ESTA LINEA
end;

// manejos los checks con edit asociados
procedure TFABMGrupos.checkEdits(check: TCheckBox);
begin
  GuardarParametros;
  if (check.Checked) then
    begin
      AgregarAconsulta(listaObjetos[check.Tag].sentencia);
      case check.Tag of
        13 :  begin // años
                EditChange(EAAniosDesde);
              end;
        14 :  begin // peso
                EditChange(EAPesoDesde);
              end;
        15 :  begin // frame
                EditChange(EAFrameHasta);
              end;
      end;
    end
  else
    begin
      SacarDeConsulta(listaObjetos[check.Tag].sentencia);
      BorrarDeParametros(check.Tag);
    end;
  case check.Tag of
    13 :  begin // años
            EAAniosDesde.Enabled := check.Checked;
            EAAniosHasta.Enabled := check.Checked;
          end;
    14 :  begin // peso
            EAPesoDesde.Enabled := check.Checked;
            EAPesoHasta.Enabled := check.Checked;
          end;
    15 :  begin // frame
            EAFrameDesde.Enabled := check.Checked;
            EAFrameHasta.Enabled := check.Checked;
          end;
  end;

  CargarParametros;
end;

// lleno los parametros de la consulta que corresponden a combos
procedure TFABMGrupos.ComboChange(Combo: TDBLookupComboBoxAuto; Poner : boolean);
var pos : integer;
    aca : integer;
begin
  if (combo.KeyValue <> null) then
    case Combo.Tag of
      16 : begin  // sexo
             if not(existeEnParametros('sexo',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='sexo';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';

           end;
      17 : begin  // raza
             if not(existeEnParametros('raza',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='raza';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      18 : begin  // categoria
             if not(existeEnParametros('categoria',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='categoria';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      19 : begin  // condicion corporal
             if not(existeEnParametros('condicion_corporal',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='condicion_corporal';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      20 : begin  // cronologia dentaria
             if not(existeEnParametros('cronologia_dentaria',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='cronologia_dentaria';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      21 : begin  // estado reproductivo
             if not(existeEnParametros('estado_reproductivo',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='estado_reproductivo';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      22 : begin  // gdr
             if not(existeEnParametros('gdr',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='gdr';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      23 : begin  // rodeo
             if not(existeEnParametros('rodeo',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='rodeo';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      24 : begin  // potrero
             if not(existeEnParametros('potrero',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='potrero';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      40 : begin  // estadolactacion
             if not(existeEnParametros('estadolactacion',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='estadolactacion';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
    end;
end;

// saca la sentencia que viene como parametro de la consulta de los animales
procedure TFABMGrupos.SacarDeConsulta(sentencia: Ansistring);
begin
  if sentencia<>'' then
  begin
    if (AnsiPos(' and '+sentencia,IBQDisponibles.SQL.GetText) = 0) then  // no esta con and
    begin
      if (AnsiPos(' where '+sentencia+' and ',IBQDisponibles.SQL.GetText) <> 0) then // si esta con where /// PROBLEMA
        begin
          IBQDisponibles.Close;
          IBQDisponibles.SQL.Text:= StringReplace(IBQDisponibles.SQL.GetText,sentencia+' and ', '',[rfReplaceAll]);
        end
      else
        if (AnsiPos(' where '+sentencia,IBQDisponibles.SQL.GetText) <> 0) then // si esta con where
          begin
            IBQDisponibles.Close;
            IBQDisponibles.SQL.Text:= StringReplace(IBQDisponibles.SQL.GetText,' where '+sentencia, '',[rfReplaceAll]);
          end
    end
    else
    begin  // saco stringreplace
      IBQDisponibles.Close;
      IBQDisponibles.SQL.Text:= StringReplace(IBQDisponibles.SQL.GetText,' and '+sentencia, '',[rfReplaceAll]);
    end;
    //showmessage(IBQDisponibles.SQL.Text);
    IBQDisponibles.Open;
    ActualizarCantidadAnimales;
  end;
end;

// si existe el parametro en el arreglo dinamico 'PARAMETROS' retorno la posicion
function TFABMGrupos.existeEnParametros(nombre: string; var aca: integer): boolean;
var cont : integer;
begin
  result := false;
  cont := 0;
  aca := 0;
  while ((cont < Length(parametros))and not(result)) do
    begin
      if (parametros[cont].nombre = nombre) then
        begin
          aca := cont;
          Result := true;
        end;
      inc(cont);
    end;
end;

procedure TFABMGrupos.KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    begin
      EditChange(Sender);
      Change(Sender);
    end;
  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;
end;

// metodo generico para todos los edits para el agregado de los parametros 
procedure TFABMGrupos.EditChange(Sender: TObject);
var aca : integer;
    pos : integer;
    valor : integer;
begin
  inherited;

  case TEditAuto(Sender).Tag of
    25, 26: begin  // los dos de años
              if not(existeEnParametros('valedad1',aca)) then
                begin
                  pos := Length(parametros);
                  SetLength(parametros, pos +1);
                end
              else
                pos := aca;
              parametros[pos].nombre :='valedad1';
              if (TryStrToInt(EAAniosDesde.Text,valor)) then
                parametros[pos].valor:= valor
              else
                begin
                  MostrarMensaje(tmError, 'El año "desde" no es válido');
                  EAAniosDesde.Text := IntToStr(val1Edad);
                end;

              if not(existeEnParametros('valedad2',aca)) then
                begin
                  pos := Length(parametros);
                  SetLength(parametros, pos +1);
                end
              else
                pos := aca;
              parametros[pos].nombre :='valedad2';
               if (TryStrToInt(EAAniosHasta.Text, valor)) then
                parametros[pos].valor:= valor
              else
                begin
                  MostrarMensaje(tmError, 'El año "hasta" no es válido');
                  EAAniosHasta.Text := IntToStr(val2Edad);
                end;
            end;
    27, 28: begin  // los dos de peso
              if not(existeEnParametros('valpeso1',aca)) then
                begin
                  pos := Length(parametros);
                  SetLength(parametros, pos +1);
                end
              else
                pos := aca;
              parametros[pos].nombre :='valpeso1';
              if (TryStrToInt(EAPesoDesde.Text, valor)) then
                parametros[pos].valor:= valor
              else
                begin
                  MostrarMensaje(tmError, 'El peso "desde" no es válido');
                  EAPesoDesde.Text := IntToStr(val1peso);
                end;

              if not(existeEnParametros('valpeso2',aca)) then
                begin
                  pos := Length(parametros);
                  SetLength(parametros, pos +1);
                end
              else
                pos := aca;
              parametros[pos].nombre :='valpeso2';
              if (TryStrToInt(EAPesoHasta.Text, valor)) then
                parametros[pos].valor:= valor
              else
                begin
                  MostrarMensaje(tmError, 'El peso "hasta" no es válido');
                  EAPesoHasta.Text := IntToStr(val2peso);
                end;
            end;
    29, 30: begin  // los dos de frame
              if not(existeEnParametros('valframe1',aca)) then
                begin
                  pos := Length(parametros);
                  SetLength(parametros, pos +1);
                end
              else
                pos := aca;
              parametros[pos].nombre :='valframe1';
              if (TryStrToInt(EAFrameDesde.Text, valor)) then
                parametros[pos].valor:= valor
              else
                begin
                  MostrarMensaje(tmError, 'El frame "desde" no es válido');
                  EAFrameDesde.Text := IntToStr(val1frame);
                end;

              if not(existeEnParametros('valframe2',aca)) then
                begin
                  pos := Length(parametros);
                  SetLength(parametros, pos +1);
                end
              else
                pos := aca;
              parametros[pos].nombre :='valframe2';
              if (TryStrToInt(EAFrameHasta.Text, valor)) then
                parametros[pos].valor:= valor
              else
                begin
                  MostrarMensaje(tmError, 'El frame "hasta" no es válido');
                  EAFrameHasta.Text := IntToStr(val2frame);
                end;
            end;
  end;
  CargarParametros;
//  Change(Sender);
end;

procedure TFABMGrupos.BorrarDeParametros(tag: integer);
var pos:integer;
begin
  case tag of
    25, 26: begin
              if (existeEnParametros('valedad1',pos) and existeEnParametros('valedad2',pos) ) then
                begin
                  parametros[pos].valor:= '-1';
                  parametros[pos].valor:= '-1';
                end;
            end;
    27, 28: begin
              if (existeEnParametros('valpeso1',pos) and existeEnParametros('valpeso2',pos)) then
                begin
                  parametros[pos].valor:= '-1';
                  parametros[pos].valor:= '-1';
                end;
            end;
    29, 30: begin
              if (existeEnParametros('valframe1',pos) and existeEnParametros('valframe2',pos)) then
                begin
                  parametros[pos].valor:= '-1';
                  parametros[pos].valor:= '-1';
                end;
            end;
  end;
end;

procedure TFABMGrupos.Change(Sender: TObject);
var aux : integer;
begin
  inherited;
  case TeditAuto(Sender).Tag of
    25 : begin
           if (TryStrToInt(TeditAuto(Sender).Text, aux)) then
              begin
                if (aux < val1Edad) or (aux > val2edad) then
                  begin
                    MostrarMensaje(tmAdvertencia, 'La edad se encuentra fuera de los límite válidos');
                    TeditAuto(Sender).Text := IntToStr(val1Edad);
                    TeditAuto(Sender).SetFocus;
                  end;
              end
           else
             begin
               MostrarMensaje(tmError, 'El año "desde" no es válido');
               TeditAuto(Sender).Text := IntToStr(val1Edad);
               TeditAuto(Sender).SetFocus;
             end;
         end;
    26 : begin
           if (TryStrToInt(TeditAuto(Sender).Text, aux)) then
              begin
                if (aux < val1Edad) or (aux > val2edad) then
                  begin
                    MostrarMensaje(tmAdvertencia, 'La edad se encuentra fuera de los límites válidos');
                    TeditAuto(Sender).Text := IntToStr(val2Edad);
                    TeditAuto(Sender).SetFocus;
                  end;
              end
           else
             begin
               MostrarMensaje(tmError, 'El año "hasta" no es válido');
               TeditAuto(Sender).Text := IntToStr(val2Edad);
               TeditAuto(Sender).SetFocus;
             end;
         end;
    27 : begin
           if (TryStrToInt(TeditAuto(Sender).Text, aux)) then
              begin
                if {(aux < val1Peso) or} (aux > val2Peso) then
                  begin
                    MostrarMensaje(tmAdvertencia, 'El peso se encuentra fuera de los limites válidos');
                    TeditAuto(Sender).Text := IntToStr(val1Peso);
                    TeditAuto(Sender).SetFocus;
                  end;
              end
           else
             begin
               MostrarMensaje(tmError, 'El peso "desde" no es válido');
               TeditAuto(Sender).Text := IntToStr(val1Peso);
               TeditAuto(Sender).SetFocus;
             end;
         end;
    28 : begin
           if (TryStrToInt(TeditAuto(Sender).Text, aux)) then
              begin
                if {(aux < val1Peso) or} (aux > val2Peso) then
                  begin
                    MostrarMensaje(tmAdvertencia, 'El peso se encuentra fuera de los limites válidos');
                    TeditAuto(Sender).Text := IntToStr(val2Peso);
                    TeditAuto(Sender).SetFocus;
                  end;
              end
           else
             begin
               MostrarMensaje(tmError, 'El peso "hasta" no es válido');
               TeditAuto(Sender).Text := IntToStr(val2Peso);
               TeditAuto(Sender).SetFocus;
             end;
         end;
    29 : begin
           if (TryStrToInt(TeditAuto(Sender).Text, aux)) then
              begin
                if (aux < val1frame) or (aux > val2frame) then
                  begin
                    MostrarMensaje(tmAdvertencia, 'El frame se encuentra fuera de los limites válidos');
                    TeditAuto(Sender).Text := IntToStr(val1Frame);
                    TeditAuto(Sender).SetFocus;
                  end;
              end
           else
             begin
               MostrarMensaje(tmError, 'El frame "desde" no es válido');
               TeditAuto(Sender).Text := IntToStr(val1Frame);
               TeditAuto(Sender).SetFocus;
             end;
         end;
    30 : begin
           if (TryStrToInt(TeditAuto(Sender).Text, aux)) then
              begin
                if (aux < val1frame) or (aux > val2frame) then
                  begin
                    MostrarMensaje(tmAdvertencia, 'El frame se encuentra fuera de los limites válidos');
                    TeditAuto(Sender).Text := IntToStr(val2Frame);
                    TeditAuto(Sender).SetFocus;
                  end;
              end
           else
             begin
               MostrarMensaje(tmError, 'El frame "hasta" no es válido');
               TeditAuto(Sender).Text := IntToStr(val2Frame);
               TeditAuto(Sender).SetFocus;
             end;
         end;
  end;
end;

procedure TFABMGrupos.EARPChange(Sender: TObject);
begin
  inherited;
  IBQDisponibles.Close;
  IBQDisponibles.ParamByName('in').AsString := EARP.Text;
  IBQDisponibles.Open;
  ActualizarCantidadAnimales;
end;

procedure TFABMGrupos.BDBGDisponiblesDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if BDBGDisponibles.SelectedIndex = 0 then
    if not(IBQDisponibles.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQDisponibles.fieldByName('ID_ANIMAL').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFABMGrupos.BDBGSelecciondosDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
    if BDBGSelecciondos.SelectedIndex = 0 then
    if not(IBQSeleccionados.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQSeleccionados.fieldByName('ANIMAL').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFABMGrupos.EAPesoDesdeChange(Sender: TObject);
begin
  inherited;
   if (EAPesoDesde.Text <> '') and (EAPesoHasta.Text <> '') then
     begin
       EditChange(Sender);
       Change(Sender);
     end;
end;

procedure TFABMGrupos.EAFrameDesdeChange(Sender: TObject);
begin
  inherited;
   if (EAFrameDesde.Text <> '') and (EAFrameHasta.Text <> '') then
     begin
       EditChange(Sender);
       Change(Sender);
     end;
end;

procedure TFABMGrupos.BBGuardarClick(Sender: TObject);
var

   LResult : boolean;
begin
   // Aplicamos los cambios
   try
      //IBQSeleccionados.DataSource := nil;
      IBQAbmSimple.Edit;
      IBQAbmSimple.FieldByName('ID_GRUPO').AsInteger := FIdGRUPO;
      IBQAbmSimple.Database.ApplyUpdates([IBQAbmSimple]);
      LResult:= True;
   except
      LResult:= False;
   end;
   // Si todo anduvo bien, avisamos ...
   if LResult then begin
      // ... segun si estamos creando o actualizando
      if modo = 'N' then
         MostrarMensaje(tmInformacion, 'EL Grupo fue creado con exito');
      if modo = 'A' then
         MostrarMensaje(tmInformacion, 'EL Grupo fue actualizado con exito');
      //IBQDisponibles.DataSource := DSAbmSimple;
      estado := eaNavegar;
      BBGuardar.Visible:= false;
   // Si algo fallo, avisamos ...
   end else begin
      // ... segun si estamos creando o actualizando
      if modo = 'N' then
          MostrarMensaje(tmError, 'No se pudo crear el Grupo');
      if modo = 'A' then
          MostrarMensaje(tmError, 'No se pudo actualizar el Grupo');
   end;
   //RGBusqueda.ItemIndex := 0;
   Finalize(listaObjetos);
   Finalize(parametros);
   //InicFiltros();
end;

procedure TFABMGrupos.DBEANombreChange(Sender: TObject);
begin
  inherited;
  BBGuardar.Enabled := (not(DSSeleccionados.DataSet.IsEmpty)) and (DBEANombre.Text <> '');
  BBGuardar.Visible := (not(DSSeleccionados.DataSet.IsEmpty)) and (DBEANombre.Text <> '');
end;

procedure TFABMGrupos.AcCancelarExecute(Sender: TObject);
begin
  if (estado = eaInsertar) then
  begin
    IBQEliminarGrupo.Active := false;
    IBQEliminarGrupo.ParamByName('id').AsInteger := FIdGrupo;
    IBQEliminarGrupo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQEliminarGrupo.Active := true;
    IBQCommit.Close;
    IBQCommit.Open;
    IBQAbmSimple.Delete;
    IBQAbmSimple.Database.ApplyUpdates([IBQAbmSimple]);
  end;
  inherited;
end;

procedure TFABMGrupos.EAAniosDesdeChange(Sender: TObject);
begin
  inherited;
   if (EAAniosDesde.Text <> '') and (EAAniosHasta.Text <> '') then
     begin
       EditChange(Sender);
       Change(Sender);
     end;
end;

end.
