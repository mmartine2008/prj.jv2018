unit UAbmEstablecimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, IBStoredProc, WinXP, DataExport,
  DataToXLS, UDBLookupComboBoxAuto, StrUtils, JvExControls, JvLabel, JvGIF,
  PngImage, jpeg, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMEstablecimientos = class(TFABMSimple)
    DBEditAuto1: TDBEditAuto;
    DBEditAuto2: TDBEditAuto;
    DBEditAuto3: TDBEditAuto;
    DBEditAuto4: TDBEditAuto;
    DBEditAuto5: TDBEditAuto;
    DBEditAuto6: TDBEditAuto;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    IBSPEliminarEstablecimiento: TIBStoredProc;
    Label1: TLabel;
    DBEditAuto7: TDBEditAuto;
    LPais: TLabel;
    DBLCBAPais: TDBLookupComboBoxAuto;
    IBQPais: TIBQuery;
    DSPais: TDataSource;
    IBQActDesactTriggerEve_Evento: TIBQuery;
    Label2: TLabel;
    IBQRazaPredom: TIBQuery;
    DSRazaPredom: TDataSource;
    IBQActualizarVisibilidad: TIBQuery;
    IBQInsertRazaByEstable: TIBQuery;
    IBQExisteRazaEst: TIBQuery;
    CBxRazaPredom: TComboBox;
    DBLCBAActividad: TDBLookupComboBoxAuto;
    LActividad: TLabel;
    DSActividades: TDataSource;
    IBQActividades: TIBQuery;
    Label3: TLabel;
    DBEPrefijo: TDBEdit;
    DSPrefijo: TDataSource;
    IBQueryPrefijo: TIBQuery;
    IBUpdatePrefijo: TIBUpdateSQL;
    IBQueryPrefijoID_CRIADOR: TIntegerField;
    IBQueryPrefijoNOMBRE: TIBStringField;
    IBQueryPrefijoCODIGO: TIBStringField;
    IBQueryPrefijoSINONIMO: TIBStringField;
    IBQueryPrefijoNUMEROCRIADOR: TIntegerField;
    IBQueryPrefijoRAZON_SOCIAL: TIBStringField;
    IBQueryPrefijoPREFIJO: TIBStringField;
    IBQueryPrefijoESTABLECIMIENTO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure AcEliminarExecute(Sender: TObject);
    procedure DBEditAuto7KeyPress(Sender: TObject; var Key: Char);
    procedure DBEditAuto7Change(Sender: TObject);
    procedure DBEditAuto7Exit(Sender: TObject);
    procedure DBEditAuto5Exit(Sender: TObject);
    procedure IBQPaisAfterOpen(DataSet: TDataSet);
    procedure AcGuardarExecute(Sender: TObject);
    procedure DBLCBAPaisCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure AcCancelarExecute(Sender: TObject);
  private
    procedure DelArchivosEstablecimiento(Directorio : String; Establecimiento : Integer);
    procedure DelCarpetasEstablecimiento(Directorio, Establecimiento : String);
    procedure CargarCombo;
    procedure inicializacion;
  protected
    procedure ComponentesVisiblesPorPais(pais: Integer);override;     
  public
  end;

var
  FABMEstablecimientos: TFABMEstablecimientos;
  nuevoCriador : boolean;

implementation

uses UMensajeHuella, UDMSoftvet, UPrincipal, UBackup, UFunctions, UCartel, UTraduccion;

{$R *.dfm}

(*
  Permitimos cambios, pero no inserciones, ya que existe el
  asistente para la creacion de establecimientos. (lo active. Que llame al asistente.)
*)
procedure TFABMEstablecimientos.inicializacion;
var
  SQL : String;
begin
  PermiteCambio := True;
  nuevoCriador := false;
  
  IBQPais.Close;
  IBQPais.Open;

  IBQActividades.Close;
  IBQActividades.SQL.Clear;
  case FPrincipal.OpcionDeEstablecimiento of
    1 : SQL := 'select * from cod_actividad_establecimiento where (id_actividad_establecimiento = 1) or (id_actividad_establecimiento = 2)';
    2 : SQL := 'select * from cod_actividad_establecimiento where (id_actividad_establecimiento = 1) or (id_actividad_establecimiento = 2) or (id_actividad_establecimiento = 4)';
    3 : SQL := 'select * from cod_actividad_establecimiento';
  end;
  IBQActividades.SQL.Add(SQL);
  IBQActividades.Open;

  IBQActividades.Last;
  IBQActividades.First;
end;

procedure TFABMEstablecimientos.FormCreate(Sender: TObject);
begin
  inherited;
  inicializacion;
end;

(*
  Eliminamos el establecimiento seleccionado, se sobreescribe el
  eliminar estandar ya que aqui usamos un SP
*)
procedure TFABMEstablecimientos.AcEliminarExecute(Sender: TObject);
var
  resultado: Boolean;
  EstablecimientoAborrar: Integer;
  cartel: TCartel;
  msje: String;
  NombreEstablecimiento: String;
  id_establecimiento_borrar: integer;
  indexSelector: integer;
begin
  // No llamamos al padre porque la forma de borrado es completamente distinta
  NombreEstablecimiento := IBQAbmSimple.FieldValues['NOMBRE'];
  id_establecimiento_borrar := IBQAbmSimple.FieldValues['ID_ESTABLECIMIENTO'];
  indexSelector := Self.BDBGAbm.SelectedIndex;

  MostrarMensaje(tmAdvertencia, 'Recuerde que si elimina un establecimiento, eliminará todos los animales y eventos cargados para este establecimiento.');
  if MostrarMensaje(tmConsulta, 'Se recomienda realizar un Backup de sus datos. Desea realizar un Backup?') = mrYes then
  begin
    Self.Visible := false;

    UPrincipal.FPrincipal.AGenBackupExecute(self);
    Self.inicializacion;
    Self.Visible := true;
    ReabrirQuerys;

  end;


  If (MostrarMensaje(tmConsulta, Traducir('Está seguro que desea eliminar el establecimiento ')+ NombreEstablecimiento+ ' ?.') = mrYes) then
    begin
      EstablecimientoAborrar := 0;
      try
        cartel:= TCartel.getInstance();
        msje:= Traducir('Borrando Establecimiento ') + NombreEstablecimiento + Traducir('. Puede demorar unos minutos ...');
        cartel.abrircartel(msje);
        with IBSPEliminarEstablecimiento do begin
           // Obtenemos el establecimiento a borrar (el actual)
           EstablecimientoAborrar :=  id_establecimiento_borrar ;
           ParamByName('ESTA').Value := id_establecimiento_borrar;
           // ... y lo borramos
           ExecProc;
           resultado := True;
        end;
        DelArchivosEstablecimiento(ExtractFilePath(Application.ExeName),IBQAbmSimple.FieldValues['ID_ESTABLECIMIENTO']);
        DelCarpetasEstablecimiento(ExtractFilePath(Application.ExeName)+'Fotos\',NombreEstablecimiento);
        cartel.cerrarcartel();
        cartel.FreeInstance();
      except
      begin
        cartel.cerrarcartel();
        cartel.FreeInstance();
        resultado:= False;
      end;
      end;
      // Si se pudo borrar, entonces avisamos
      if resultado then begin
        MostrarMensaje(tmInformacion, 'Se Eliminó el Establecimiento.');
        // y reabrimos el query ya que el borrado se hizo via SP
        ReabrirQuerys;
        // Si era el establecimiento actual, avisamos y nos vamos
        if (EstablecimientoAborrar = FPrincipal.EstablecimientoActual) then begin
          MostrarMensaje(tmInformacion, 'Usted Eliminó el Establecimiento Actual. El Sistema se cerrara.');
          FPrincipal.Close;
          Application.Terminate;
        end
      // Si algo salio mal, avisamos
      end else begin
        MostrarMensaje(tmError, 'NO se puede eliminar el Establecimiento. Tiene Datos relacionados.');
      end;
      // Si el establecimiento era el unico, tambien nos vamos
      // Martin: Esto quiza no suceda nunca, ya que si hay uno, éste será el acutal
      //         y por lo tanto se cierra en el terminate de arriba
      if (IBQAbmSimple.IsEmpty) then begin
        MostrarMensaje(tmInformacion, 'Usted Eliminó el único Establecimiento de Huella.');
        FPrincipal.Close;
        Application.Terminate;
      end;
   end;
end;

procedure TFABMEstablecimientos.DelArchivosEstablecimiento(Directorio : String; Establecimiento : Integer);
var
  sr : TSearchRec;
begin
  if FindFirst(Directorio + '*',faDirectory, sr) = 0 then
  repeat
    if (AnsiContainsStr(sr.Name,'temp-'+IntToStr(Establecimiento)+'-')) then
    begin
      SetFileAttributes(PChar(Directorio+sr.Name),FILE_ATTRIBUTE_NORMAL);
      DeleteFile(Directorio+sr.Name);
    end;
  until FindNext(sr) <> 0;
end;

procedure TFABMEstablecimientos.DelCarpetasEstablecimiento(Directorio, Establecimiento : String);
var
  Dir : String;
  sr : TSearchRec;
begin
  Dir := IncludeTrailingPathDelimiter(Directorio+Establecimiento);
  if FindFirst(Dir + '*',faDirectory, sr) = 0 then
  repeat
    if ((sr.Name <> '.') and (sr.Name <> '..')) then
      DelCarpetasEstablecimiento(Dir+sr.Name,'');
    SetFileAttributes(PChar(Dir+sr.Name),FILE_ATTRIBUTE_NORMAL);
    if not RemoveDir(Dir+sr.Name) then
      DeleteFile(Dir+sr.Name)
  until FindNext(sr) <> 0;
  FindClose(sr);
  RemoveDir(Directorio+Establecimiento);
end;


(*
  Al salir actualizamos el query de establecimientos
  para poder elegir los cambios sin salir del sistema
*)
procedure TFABMEstablecimientos.DBEditAuto7KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (not (key in (['0'..'9'])) and (key <> #8)) then key:=#0;
end;

procedure TFABMEstablecimientos.DBEditAuto7Change(Sender: TObject);
begin
  inherited;
  BBGuardar.Enabled := VerificarRenspa(DBEditAuto7.Text);
end;

procedure TFABMEstablecimientos.DBEditAuto7Exit(Sender: TObject);
begin
  inherited;
  if not(VerificarRenspa(DBEditAuto7.Text)) then
  begin
    DBEditAuto7.Clear;
    MostrarMensaje(tmError, 'Renspa inválido. Debe completar todo el Respa o dejarlo vacío.');
    DBEditAuto7.SetFocus;
  end;
end;

procedure TFABMEstablecimientos.DBEditAuto5Exit(Sender: TObject);
var mailValido: Boolean;
begin
  inherited;
  mailValido:= true;
  if (length(DBEditAuto5.Text)> 0) then
     mailValido:= EsUnEmailValido(DBEditAuto5.Text);

  if not(mailValido) then
    begin
       MostrarMensaje(tmError, 'Dirección de mail inválida. Debe ingresar un mail válido o dejarlo vacío.');
       DBEditAuto5.SetFocus;
       DBEditAuto5.SelectAll;
    end;
end;

procedure TFABMEstablecimientos.IBQPaisAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQPais.Last;
  IBQPais.First;
end;

procedure TFABMEstablecimientos.AcGuardarExecute(Sender: TObject);
begin
  inherited;
  IBQueryPrefijo.FieldValues['establecimiento'] := IBQAbmSimple.FieldValues['id_establecimiento'] ;

  IF(nuevoCriador)then
    begin
      IBQueryPrefijo.FieldValues['nombre'] := 'Criador de '+ IBQAbmSimple.FieldValues['nombre'];
      IBQueryPrefijo.FieldValues['codigo'] := 'NN';
      IBQueryPrefijo.FieldValues['sinonimo'] := 'Criador de '+ IBQAbmSimple.FieldValues['nombre'];
    end;

  IBQueryPrefijo.Post;

  IBQAbmSimple.Close;
  IBQAbmSimple.Open;


  try
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
  Close();
end;

procedure TFABMEstablecimientos.ComponentesVisiblesPorPais(pais: Integer);
begin
  inherited;
  if (DBLCBAPais.KeyValue <> null) then
    begin
      DMSoftvet.IBQPais.Close;
      DMSoftvet.IBQPais.ParamByName('pais').AsInteger:= DBLCBAPais.KeyValue;
      DMSoftvet.IBQPais.Open;
      Label1.Caption:= DMSoftvet.IBQPais.FieldByName('registro').AsString;
      if (DBLCBAPais.KeyValue = 1) then //Argentina
       begin
          //
       end
      else
        if (DBLCBAPais.KeyValue = 2) then //Uruguay
         begin
            //
         end;
    end;
end;

procedure TFABMEstablecimientos.DBLCBAPaisCloseUp(Sender: TObject);
begin
  inherited;
  ComponentesVisiblesPorPais(-1);
end;

procedure TFABMEstablecimientos.FormShow(Sender: TObject);
begin
  inherited;
  ComponentesVisiblesPorPais(-1);
  CargarCombo;
end;

procedure TFABMEstablecimientos.AcEditarExecute(Sender: TObject);
begin
  inherited;
  ComponentesVisiblesPorPais(-1);
  IBQueryPrefijo.Close;
  IBQueryPrefijo.ParamByName('establecimiento').AsInteger := IBQAbmSimple.FieldValues['ID_ESTABLECIMIENTO'];
  IBQueryPrefijo.Open;

  IF(IBQueryPrefijo.IsEmpty)then
    begin
      nuevoCriador := true;
      IBQueryPrefijo.Insert;
    end
  else
    IBQueryPrefijo.Edit;
end;

procedure TFABMEstablecimientos.AcInsertarExecute(Sender: TObject);
begin
  //inherited;
  FPrincipal.AGenAsistenteEstablecimientoExecute(nil);
  IBQAbmSimple.Close;
  IBQAbmSimple.Open;
end;


procedure TFABMEstablecimientos.CargarCombo;
begin
end;

procedure TFABMEstablecimientos.AcCancelarExecute(Sender: TObject);
begin
  inherited;
  IBQueryPrefijo.CancelUpdates;
end;

end.
