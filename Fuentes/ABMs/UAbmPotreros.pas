
unit UAbmPotreros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, UDBDateTimePickerAuto, DBCtrls, UDBLookupComboBoxAuto, EditAuto,
  Mask, UDBEditAuto, IBStoredProc, DataExport, DataToXLS, WinXP,
  JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls,
  JvImage;

type
  TFABMPotreros = class(TFABMSimple)
    LNombre: TLabel;
    LHectareas: TLabel;
    DBEHectareas: TDBEditAuto;
    DBEANombre: TDBEditAuto;
    IBQSPEventosPotreros: TIBQuery;
    DSIBQSPEventosPotreros: TDataSource;
    LSuperficieGanadera: TLabel;
    EASuperficieGanadera: TEditAuto;
    Lha2: TLabel;
    Lha1: TLabel;
    LSuperficieAgricola: TLabel;
    EASuperficieAgricola: TEditAuto;
    Lha3: TLabel;
    IBQUltimoIdPotrero: TIBQuery;
    DSUltimoIdPotrero: TDataSource;
    DSSuperficiesPotrero: TDataSource;
    IBQSuperficiesPotrero: TIBQuery;
    CBVisible: TCheckBox;
    IBQPotreroVisible: TIBQuery;
    DSPotreroVisible: TDataSource;
    IBQAbmSimpleESTABLECIMIENTO: TIntegerField;
    IBQAbmSimpleID_POTRERO: TIntegerField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleRECURSO_FORRAJERO: TIntegerField;
    IBQAbmSimpleCRFSINONIMO: TIBStringField;
    IBQBorrarEventosPotreros: TIBQuery;
    IBQAbmSimpleHECTAREAS: TIBBCDField;
    IBQVerificarNombre: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EValorFiltrarChange(Sender: TObject);
    procedure CBCriterioFiltrarChange(Sender: TObject);
    procedure DBEANombreKeyPress(Sender: TObject; var Key: Char);
    procedure AcInsertarExecute(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure EASuperficieGanaderaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EASuperficieGanaderaKeyPress(Sender: TObject; var Key: Char);
    procedure EASuperficieAgricolaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEHectareasExit(Sender: TObject);
    procedure EASuperficieGanaderaExit(Sender: TObject);
    procedure AcSalirExecute(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
    procedure AcEliminarExecute(Sender: TObject);
  private
    id_potrero: Integer;
    procedure CargarParametrosSpEventosPotreros();
    procedure HabilitarComponentesVersionBasica; override;
  protected
    procedure InsertarRegistro; override;
    procedure GuardarRegistro; override;
    procedure CargarParametrosSimple; override;
    function OpcionesParaGrabar : Boolean; override;
  public
    property nombre:string read nom write nom;
  end;

var
  FABMPotreros: TFABMPotreros;

implementation

uses UPrincipal,uTiposGlobales, UMensajeHuella, UDMSoftVet,UImportacion, UEveSimple;

{$R *.dfm}

(*
  Los Potreros son modificables por el usuario
*)
procedure TFABMPotreros.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := True;
end;

(*
  Nos aseguramos que haya por lo menos 1 hectarea,
  que el recurso forrajero sea no definido y
  que esté en el establecimiento actual
*)
procedure TFABMPotreros.InsertarRegistro;
begin
  inherited;
  IBQAbmSimple.FieldByName('HECTAREAS').AsInteger := 1;
  IBQAbmSimple.FieldByName('RECURSO_FORRAJERO').AsInteger := 0;
  IBQAbmSimple.FieldByName('CRFSINONIMO').AsString := 'NO DEFINIDO';
  IBQAbmSimple.FieldByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
  IBQAbmSimple.FieldByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
end;

(*
  Los Potreros pertenecen a un establecimiento y por eso abrimos el query filtrado
*)
procedure TFABMPotreros.CargarParametrosSimple;
begin
  inherited;
  IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
end;

(*
  No permitimos potreros de 0 hectareas,
  si el usuario lo fuerza ...nosotros tambien
*)
procedure TFABMPotreros.GuardarRegistro;
begin
  inherited;
  if (IBQAbmSimple.FieldByName('HECTAREAS').AsInteger = 0) then
    IBQAbmSimple.FieldByName('HECTAREAS').AsInteger := 1;
end;

procedure TFABMPotreros.FormShow(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    begin;
    AcInsertar.Visible:=true;
    AcInsertar.Enabled:=true;
    AcInsertarExecute(Sender);
    end;
  { se desabilita el boton SBFiltrar x q surgen problemas de campos ambiguos P.nombre y R.nombre,
  al generar el query para filtrar, el like que se adiciona al query no distingue
  (al elegir filtar por nombre) por cual de los dos filtrar}
  //SBFiltrar.Visible := false;

end;

procedure TFABMPotreros.EValorFiltrarChange(Sender: TObject);
begin
  inherited;
  IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
  IBQAbmSimple.Close;
  IBQAbmSimple.Open;
end;

procedure TFABMPotreros.CBCriterioFiltrarChange(Sender: TObject);
begin
  inherited;
  IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
  IBQAbmSimple.Close;
  IBQAbmSimple.Open;
end;

procedure TFABMPotreros.DBEANombreKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) then
   begin
     DBEHectareas.SetFocus;
     key:= #0;
   end;
end;

procedure TFABMPotreros.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    begin
     DBEANombre.Text:=nombre;
     DBEHectareas.Text:='1';
     EASuperficieGanadera.Text:='1';
     EASuperficieAgricola.Text:='0';
    end;

  CBVisible.Checked:= true;    
  IBQUltimoIdPotrero.Close;
  IBQUltimoIdPotrero.Open;
  id_potrero  := IBQUltimoIdPotrero.fieldbyname('gen_id').AsInteger;
end;

procedure TFABMPotreros.AcGuardarExecute(Sender: TObject);
var id_pot : integer;
begin
  if (self.Estado = eaEditar) then
      id_pot := id_potrero //porque el potrero ya existe
  else id_pot := -1;
  IBQVerificarNombre.Close;
  IBQVerificarNombre.ParamByName('nombre').AsString := trim(DBEANombre.Text);
  IBQVerificarNombre.ParamByName('estab').AsInteger := fprincipal.EstablecimientoActual;
  IBQVerificarNombre.ParamByName('id_potrero').AsInteger := id_pot;
  IBQVerificarNombre.Open;
  if (IBQVerificarNombre.IsEmpty) then
    begin
        if ((trim(DBEHectareas.Text) <> '') and (trim(EASuperficieGanadera.Text) <>'') and (trim(EASuperficieAgricola.Text) <>'') and (trim(DBEHectareas.Text) <> '0')) then
        begin
          inherited;
          //if cargaDeMovil then
          //  TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:=DBEANombre.Text;
          try
            //se agrego porq el id_potrero se estaba cargando con basura y el sp al no reconocer el id ponia visible en 0
            IBQUltimoIdPotrero.Close;
            IBQUltimoIdPotrero.Open;
            if (id_pot = -1) then
                id_potrero := IBQUltimoIdPotrero.fieldbyname('gen_id').AsInteger;
            IBQSPEventosPotreros.Close;
            CargarParametrosSpEventosPotreros;
            IBQSPEventosPotreros.Open;
            FPrincipal.IBTPrincipal.CommitRetaining;
            except on e:exception do
             FPrincipal.IBTPrincipal.RollbackRetaining;
          end;
         end
        else
          MostrarMensaje(tmError, 'Los campos de las superficies no deben estar vacíos.');
    end
    else
    begin
        MostrarMensaje(tmError,'El potrero '+trim(DBEANombre.Text)+' ya existe en este establecimiento');
    end
end;

procedure TFABMPotreros.CargarParametrosSpEventosPotreros;
begin
 IBQSPEventosPotreros.ParamByName('FECHA').AsDate  := now();
 IBQSPEventosPotreros.ParamByName('OBSERVACION').Value  := null;
 IBQSPEventosPotreros.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
 IBQSPEventosPotreros.ParamByName('RESPONSABLE').AsInteger  := 0;

 IBQSPEventosPotreros.ParamByName('POTRERO').AsInteger  := id_potrero;

 IBQSPEventosPotreros.ParamByName('SUPERFICIETOTAL').AsFloat  := StrToFloat(DBEHectareas.Text);
 IBQSPEventosPotreros.ParamByName('SUPERFICIEGANADERA').AsFloat  := StrToFloat(EASuperficieGanadera.Text);
 IBQSPEventosPotreros.ParamByName('SUPERFICIEAGRICOLA').AsFloat  := StrToFloat(EASuperficieAgricola.Text);

 IBQSPEventosPotreros.ParamByName('RECURSO').Value  := null;

 IBQSPEventosPotreros.ParamByName('TRATAMIENTO').Value  := null;

 IBQSPEventosPotreros.ParamByName('MATERIASECA').Value  := null;

 IBQSPEventosPotreros.ParamByName('OBSERVACIOANALISISSUELO').Value  := null;

 IBQSPEventosPotreros.ParamByName('RESERVAFORRAJERAS').Value:= null;
 IBQSPEventosPotreros.ParamByName('CANTIDADRESERVA').Value:= null;
 IBQSPEventosPotreros.ParamByName('UNIDADRESERVA').Value:= null;

 if (CBVisible.Checked) then
   IBQSPEventosPotreros.ParamByName('VISIBLE').Value:= 1
  else
    IBQSPEventosPotreros.ParamByName('VISIBLE').Value:= 0;
end;

procedure TFABMPotreros.AcEditarExecute(Sender: TObject);
begin
  inherited;
    if not(IBQAbmSimple.IsEmpty) and AcEditar.Enabled then
    begin
      id_potrero:= IBQAbmSimple.fieldbyname('id_potrero').AsInteger;

      IBQPotreroVisible.Close;
      IBQPotreroVisible.ParamByName('potrero').AsInteger:= id_potrero;
      IBQPotreroVisible.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
      IBQPotreroVisible.Open;
      IBQPotreroVisible.first;

      if (IBQPotreroVisible.fieldbyname('visible').AsInteger = 1) then
        CBVisible.Checked:= true
       else
         CBVisible.Checked:= false;   

      IBQSuperficiesPotrero.Close;
      IBQSuperficiesPotrero.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
      IBQSuperficiesPotrero.ParamByName('POTRERO').AsInteger  := id_potrero;
      IBQSuperficiesPotrero.Open;
      IBQSuperficiesPotrero.first;
      EASuperficieGanadera.Clear;
      EASuperficieAgricola.Clear;
      if not(IBQSuperficiesPotrero.IsEmpty) then
        begin
          EASuperficieGanadera.Text:= IBQSuperficiesPotrero.fieldbyname('superficieganadera').AsString;
          EASuperficieAgricola.Text:= IBQSuperficiesPotrero.fieldbyname('superficieagricola').AsString;
        end
    end;
end;

procedure TFABMPotreros.EASuperficieGanaderaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((trim(DBEHectareas.Text) <> '') and (trim(EASuperficieGanadera.Text) <>'')) then
    EASuperficieAgricola.Text:= FloatToStr(StrToFloat(DBEHectareas.Text) - StrToFloat(EASuperficieGanadera.Text));
end;

procedure TFABMPotreros.EASuperficieGanaderaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 7)) and (key <> #8)) then key:=#0;
end;

procedure TFABMPotreros.EASuperficieAgricolaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((trim(DBEHectareas.Text) <> '') and (trim(EASuperficieAgricola.Text) <>'')) then
    EASuperficieGanadera.Text:= FloatToStr(StrToFloat(DBEHectareas.Text) - StrToFloat(EASuperficieAgricola.Text));
end;

procedure TFABMPotreros.DBEHectareasExit(Sender: TObject);
begin
  inherited;
  if (trim(DBEHectareas.Text) <> '') then
    if ((trim(EASuperficieGanadera.Text) <>'') and (trim(EASuperficieAgricola.Text) <>'')) then
      begin
        if ((StrToFloat(EASuperficieGanadera.Text) + StrToFloat(EASuperficieAgricola.Text)) <> StrToFloat(DBEHectareas.Text)) then
          begin
             EASuperficieGanadera.Text:= DBEHectareas.Text;
             EASuperficieAgricola.Text:= '0';
          end;
      end
    else
      begin
         EASuperficieGanadera.Text:= DBEHectareas.Text;
         EASuperficieAgricola.Text:= '0';
      end;
end;

procedure TFABMPotreros.EASuperficieGanaderaExit(Sender: TObject);
var ind: Integer;
begin
  inherited;
  if (EASuperficieGanadera.Text<>'') and (EASuperficieAgricola.Text<>'') then
    for ind := 0 to ComponentCount -1 do
      if (Components[ind] is TEditAuto) then
        if (StrToFloat(trim((TEditAuto(Components[ind])).Text)) < 0) then
          begin
            MostrarMensaje(tmError, 'Las superficies no pueden ser negativas.');
            (TEditAuto(Components[ind])).SetFocus;
            break;
          end;
end;

procedure TFABMPotreros.AcSalirExecute(Sender: TObject);
begin
  if cargaDeMovil then
    TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:='INDEFINIDO';
  inherited;
end;

procedure TFABMPotreros.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
      desdeEvento:=IBQAbmSimple.FieldValues['ID_POTRERO'];
end;

procedure TFABMPotreros.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

procedure TFABMPotreros.HabilitarComponentesVersionBasica;
var ind : Integer;
begin
  inherited;
//  {$IFDEF BASICO}
  if (FPrincipal.TipoVersionLicencia = 'Basico') then
      CBVisible.Enabled:= false;
//  {$ELSE}
    //
//  {$ENDIF}
end;

procedure TFABMPotreros.AcEliminarExecute(Sender: TObject);
begin
  try
    IBQBorrarEventosPotreros.Close;
    IBQBorrarEventosPotreros.ParamByName('potrero').AsInteger := IBQAbmSimple.FieldValues['ID_POTRERO'];
    IBQBorrarEventosPotreros.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
    inherited;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

function TFABMPotreros.OpcionesParaGrabar : Boolean;
begin
  Result := false;
  if ((DBEANombre.Text <> '') and (DBEHectareas.Text <> '') and (EASuperficieGanadera.Text <> '') and (EASuperficieAgricola.Text <> '')) then
    Result := true;
end;

end.
