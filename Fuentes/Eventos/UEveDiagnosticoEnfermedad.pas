unit UEveDiagnosticoEnfermedad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, DBCtrls, UDBLookupComboBoxAuto,
  DateTimePickerAuto, IBUpdateSQL, DataExport, DataToXLS, WinXP, EditAuto,
  ImgList, PngImageList, JvExControls, JvLabel, PngImage, JvExExtCtrls,
  JvImage, jpeg, JvGIF, JvEnterTab, DateUtils, JvComponentBase,
  JvBalloonHint, xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TRegEventos = record
    animal : integer;
    evento : integer;
  end;
  TArrEventos = Array of TRegEventos;
  TFEveDiagnosticoEnfermedad = class(TFEveSimple)
    LFecha: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    LResponsable: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    Label1: TLabel;
    DBLCBADiagnosticador: TDBLookupComboBoxAuto;
    DBLCBAEnfermedad: TDBLookupComboBoxAuto;
    Label2: TLabel;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleID_AUX_EVENTO: TIntegerField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleENFERMEDAD: TIBStringField;
    IBDSSimpleID_ENFERMEDAD: TIntegerField;
    IBDSSimpleDIAGNOSTICADOR: TIBStringField;
    IBDSSimpleID_DIAGNOSTICADOR: TIntegerField;
    IBDSSimpleEW: TIBStringField;
    CBAplicarTratamiento: TCheckBox;
    IBQActualizoDiagnostico: TIBQuery;
    IBUSQLActualizoDiagnostico: TIBUpdateSQL;
    Label3: TLabel;
    EPrecio: TEdit;
    IBQGetEvento: TIBQuery;
    TSNecropsia: TTabSheet;
    SBNecropsia: TScrollBox;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    IPreliminar: TImage;
    Label26: TLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    ETelVet: TEdit;
    EDirVet: TEdit;
    ENombreVet: TEdit;
    ELote: TEdit;
    EOrigen: TEdit;
    ERP: TEdit;
    ECategoria: TEdit;
    EEdad: TEdit;
    ERaza: TEdit;
    ETiempoEvolucion: TEdit;
    ETotalAnimales: TEdit;
    ESignologia: TEdit;
    EtotalCorral: TEdit;
    ETomaMuestra: TEdit;
    MVacunacionesSimil: TMemo;
    MDiagPresuntivo: TMemo;
    MDatosMortandad: TMemo;
    ITrat: TImage;
    INecropsia: TImage;
    LNecropsia: TLabel;
    IBQAnimal: TIBQuery;
    IBQAnimalID_RP: TIBStringField;
    IBQAnimalRAZA: TIBStringField;
    IBQAnimalORIGEN: TIBStringField;
    IBQAnimalCATEGORIA: TIBStringField;
    IBQAnimalFECHA_NACIMIENTO: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SetText(Sender: TField; const Text: String);
    procedure Change(Sender: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ATerminarExecute(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure EPrecioChange(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure ITratClick(Sender: TObject);
    procedure INecropsiaClick(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure IPreliminarClick(Sender: TObject);
  private
    FConTratamiento: boolean;
    Precio : double;
    ArrEventos : TArrEventos;
    IndiceArr : Integer;
    procedure SetConTratamiento(const Value: boolean);
    function CargarTratamiento() : TModalResult;
  public
    deBaja : Boolean;
    FechaBaja : TDate;
    DS : TDataSet;
    property ConTratamiento : boolean read FConTratamiento write SetConTratamiento;
    function ObtenerDiagnosticos : TArrEventos;
  protected
    procedure cargarDatos(i:integer);overload;override;
    procedure CargarDatos;overload;
    procedure TerminarIndividual; override;
    procedure CargarDatosGrilla;override;
    Procedure CargarParametrosRN;override;
    Procedure CargarParametrosSP;override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure ManejarDatosDeSP;override;

  end;

var
  FEveDiagnosticoEnfermedad: TFEveDiagnosticoEnfermedad;
  executeTratamiento : boolean;

implementation

uses UDMSoftvet, UPrincipal, UEveTratamiento, UClassType, UEveUniversal,
     UABMEmpleados, UABMEnfermedades, UImportacion, URepNecropsia;

{$R *.dfm}

// codigo
procedure TFEveDiagnosticoEnfermedad.ManejarDatosDeSP;
begin
  ArrEventos[IndiceArr-1].evento := IBQSPEventoInd.FieldByName('id_evento_generado').AsInteger;
end;

function TFEveDiagnosticoEnfermedad.ObtenerDiagnosticos : TArrEventos;
begin
  Result := ArrEventos;
end;

procedure TFEveDiagnosticoEnfermedad.CargarDatos;
begin
    {if(NoExiste(DS.FieldValues['ID_animal'],DSSimple))then
      begin
        IBDSSimple.Insert;}

        IBDSSimple.FieldByName('ID_RP').Value := DS.FieldValues['ID_RP'];
        IBDSSimple.FieldByName('ID_ANIMAL').Value := DS.FieldValues['ID_ANIMAL'];

        RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.Date]);
        //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
        RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESP'),IBDSSimple.FieldByName('RESPONSABLE')],[DBLCBAResponsable.Text,DBLCBAResponsable.GetDato]);
        //IBDSSimple.FieldByName('RESP').Value:= DBLCBAResponsable.Text;
        //IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.GetDato;
        RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
        //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;
        RealizarCambio(DBLCBAEnfermedad,[IBDSSimple.FieldByName('ENFERMEDAD'),IBDSSimple.FieldByName('ID_ENFERMEDAD')],[DBLCBAEnfermedad.Text,DBLCBAEnfermedad.KeyValue]);
        //IBDSSimple.FieldByName('ENFERMEDAD').Value := DBLCBAEnfermedad.Text;
        //IBDSSimple.FieldByName('ID_ENFERMEDAD').Value := DBLCBAEnfermedad.KeyValue;
        RealizarCambio(DBLCBADiagnosticador,[IBDSSimple.FieldByName('DIAGNOSTICADOR'),IBDSSimple.FieldByName('ID_DIAGNOSTICADOR')],[DBLCBADiagnosticador.Text,DBLCBADiagnosticador.KeyValue]);
        //IBDSSimple.FieldByName('DIAGNOSTICADOR').Value := DBLCBADiagnosticador.Text;
        //IBDSSimple.FieldByName('ID_DIAGNOSTICADOR').Value := DBLCBADiagnosticador.KeyValue;

     // end;
end;

procedure TFEveDiagnosticoEnfermedad.CargarDatosGrilla;
begin
  inherited;
  {if (deBaja) then
    CargarDatos
  else}
    begin
      {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_animal'],DSSimple))then
        begin
          IBDSSimple.Insert;  }
          IBDSSimple.FieldByName('ID_RP').Value:=MSimple.IBQSeleccionados.FieldValues['ID_RP'];
          IBDSSimple.FieldByName('ID_ANIMAL').Value:=MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];

          RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.Date]);
          //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
          RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESP'),IBDSSimple.FieldByName('RESPONSABLE')],[DBLCBAResponsable.Text,DBLCBAResponsable.GetDato]);
          //IBDSSimple.FieldByName('RESP').Value:= DBLCBAResponsable.Text;
          //IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.GetDato;
          RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
          //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;
          RealizarCambio(DBLCBAEnfermedad,[IBDSSimple.FieldByName('ENFERMEDAD'),IBDSSimple.FieldByName('ID_ENFERMEDAD')],[DBLCBAEnfermedad.Text,DBLCBAEnfermedad.KeyValue]);
          //IBDSSimple.FieldByName('ENFERMEDAD').Value := DBLCBAEnfermedad.Text;
          //IBDSSimple.FieldByName('ID_ENFERMEDAD').Value := DBLCBAEnfermedad.KeyValue;
          RealizarCambio(DBLCBADiagnosticador,[IBDSSimple.FieldByName('DIAGNOSTICADOR'),IBDSSimple.FieldByName('ID_DIAGNOSTICADOR')],[DBLCBADiagnosticador.Text,DBLCBADiagnosticador.KeyValue]);
          //IBDSSimple.FieldByName('DIAGNOSTICADOR').Value := DBLCBADiagnosticador.Text;
          //IBDSSimple.FieldByName('ID_DIAGNOSTICADOR').Value := DBLCBADiagnosticador.KeyValue;

        //end;
    end;
end;

procedure TFEveDiagnosticoEnfermedad.CargarParametrosMasivo;
begin
  inherited;
  Inc(IndiceArr);
  SetLength(ArrEventos,IndiceArr);
  ArrEventos[IndiceArr-1].animal := IBDSSimple.FieldValues['ID_ANIMAL'];

  // DATOS GENERICOS
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('FECHA').Value := DTPAFecha.GetDato;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;

  // DATOS DE LA ENFERMEDAD
  IBQSPEventoInd.ParamByName('ENFERMEDAD').AsInteger := IBDSSimple.FieldValues['ID_ENFERMEDAD'];
  IBQSPEventoInd.ParamByName('DIAGNOSTICADOR').AsInteger := IBDSSimple.FieldValues['ID_DIAGNOSTICADOR'];
  IBQSPEventoInd.ParamByName('TRATAMIENTO').AsString := 'N';
  IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimple.FieldValues['RESPONSABLE'];
  IBQSPEventoInd.ParamByName('PRECIO').AsFloat := Precio;

   if (crearGrupo) then
    IBQSPEventoInd.ParamByName('grupo').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;
end;

procedure TFEveDiagnosticoEnfermedad.CargarParametrosRN;
begin
  inherited;
  if(self.ModoEve = meIndividual)then
    begin
      IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
      IBQSPRN.ParamByName('fecha').AsDateTime := DTPAFecha.DateTime;
    end
  else
    begin
      IBQSPRN.ParamByName('animal').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
      IBQSPRN.ParamByName('fecha').AsDateTime := IBDSSimple.fieldbyname('fecha').AsDateTime;
    end;
end;

procedure TFEveDiagnosticoEnfermedad.CargarParametrosSP;
begin
  inherited;
  Inc(IndiceArr);
  SetLength(ArrEventos,IndiceArr);
  ArrEventos[IndiceArr-1].animal := IDAnimal;

  // DATOS GENERICOS
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('FECHA').Value := DTPAFecha.GetDato;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;

  // DATOS DE LA ENFERMEDAD
  IBQSPEventoInd.ParamByName('ENFERMEDAD').AsInteger := DBLCBAEnfermedad.KeyValue;
  IBQSPEventoInd.ParamByName('DIAGNOSTICADOR').AsInteger := DBLCBADiagnosticador.KeyValue;

  IBQSPEventoInd.ParamByName('TRATAMIENTO').AsString := 'N';

  IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IDAnimal;
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := DBLCBAResponsable.KeyValue;
  if (EventoDisparador <> 0) then
    IBQSPEventoInd.ParamByName('disparador').AsInteger := EventoDisparador;

  IBQSPEventoInd.ParamByName('PRECIO').AsFloat := Precio;  
end;

procedure TFEveDiagnosticoEnfermedad.FormCreate(Sender: TObject);
begin
  IndiceArr := 0;
  Precio := 0;
  EventoDisparador := 0;
  FConTratamiento := true;
  CBAplicarTratamiento.Checked := false;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  deBaja := false;
  DMSoftvet.IBQEnfermedades.Open;
  DMSoftvet.IBQDiagnosticadores.Open;

  inherited;
  DTPAFecha.DateTime:= now;
 // DTPAFecha.MaxDate:= now;
  FConTratamiento := true;
  Msimple.SQLBasico := 'select id_animal, id_rp, id_senasa, id_pc, id_hba, id_otro, id_ie, nombre, apodo from vis_diagnostico_enfermedad';
  MSimple.PasarParametros(0,0); //cambie codigo
end;

procedure TFEveDiagnosticoEnfermedad.LoadSQLStringList;
begin
  inherited;
  SQLStringList.AddObject('ENFERMEDAD',TObject(DMSoftvet.DSEnfermedades));
  SQLStringList.AddObject('DIAGNOSTICADOR',TObject(DMSoftvet.DSDiagnosticadores));
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
end;

procedure TFEveDiagnosticoEnfermedad.FormShow(Sender: TObject);
begin
  inherited;
  CBAplicarTratamiento.Visible := false;
  if FConTratamiento then
    CBAplicarTratamiento.Visible := true;

  if ModoEve = meIndividual then
  begin
    INecropsia.Visible := true;
    LNecropsia.Visible := true;
  end;
end;

procedure TFEveDiagnosticoEnfermedad.SetText(Sender: TField;  const Text: String);
begin
  if ((IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      case (Sender.Index) of
        6 : begin      // RESPONSABLE
              IBQValidaciones.SQL.Add('select NOMBRE || '' '' || APELLIDO as NombreyApellido from TAB_EMPLEADOS where (establecimiento = :esta) and ((apellido like '''+UpperCase(Text)+'%'') or(nombre like '''+UpperCase(Text)+'%'')or (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%''))');
              IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
              IBQValidaciones.Active := true;
              if not(IBQValidaciones.IsEmpty) then
                Sender.AsString := IBQValidaciones.FieldByName('NombreyApellido').AsString;
            end;
        7 : begin      // ENFERMEDAD
              IBQValidaciones.SQL.Add('select NOMBRE from COD_ENFERMEDADES where (nombre like '''+UpperCase(Text)+'%'') or (codigo ='''+ UpperCase(Text)+''')');
              IBQValidaciones.Active := true;
              if not(IBQValidaciones.IsEmpty) then
                Sender.AsString := IBQValidaciones.FieldByName('nombre').AsString;
            end;
        9 : begin      // DIAGNOSTICADOR
              IBQValidaciones.SQL.Add('select sinonimo from cod_diagnosticadores where (sinonimo like '''+UpperCase(Text)+'%'') or (codigo ='''+ UpperCase(Text)+''')');
              IBQValidaciones.Active := true;
              if not(IBQValidaciones.IsEmpty) then
                Sender.AsString := IBQValidaciones.FieldByName('sinonimo').AsString;
            end;
      end;
    end;
end;

procedure TFEveDiagnosticoEnfermedad.Change(Sender: TField);
var PickPos : integer;
begin
  inherited;
  if (IBDSSimple.State <> dsInsert ) then
    case (Sender.Index) of
      6:  begin      // RESPONSABLE
            PickPos := BDBGSimple.ColumnByField('RESP').PickList.IndexOf(BDBGSimple.ColumnByField('RESP').Field.AsString);
            IBDSSimpleRESPONSABLE.Value := TClassType(BDBGSimple.ColumnByField('RESP').PickList.Objects[PickPos]).getValue;
          end;
      7:  begin      // ENFERMEDAD
            PickPos := BDBGSimple.ColumnByField('ENFERMEDAD').PickList.IndexOf(BDBGSimple.ColumnByField('ENFERMEDAD').Field.AsString);
            IBDSSimpleID_ENFERMEDAD.Value := TClassType(BDBGSimple.ColumnByField('ENFERMEDAD').PickList.Objects[PickPos]).getValue;
          end;
      9: begin      // DIAGNOSTICADOR
            PickPos := BDBGSimple.ColumnByField('DIAGNOSTICADOR').PickList.IndexOf(BDBGSimple.ColumnByField('DIAGNOSTICADOR').Field.AsString);
            IBDSSimpleID_DIAGNOSTICADOR.Value := TClassType(BDBGSimple.ColumnByField('DIAGNOSTICADOR').PickList.Objects[PickPos]).getValue;
          end;
    end;

  {if (IBDSSimple.State = dsEdit ) then
    begin
      IBDSSimple.Post;
    end;
   }
end;

procedure TFEveDiagnosticoEnfermedad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if ((self.BBTerminar.ModalResult <> 1) and (executeTratamiento)) then
    FPrincipal.IBTPrincipal.RollbackRetaining;
end;

// Redefino este metodo porque
// nesecito setear el evento generado para darselo al tratamiento 
procedure TFEveDiagnosticoEnfermedad.TerminarIndividual;
begin
  inherited TerminarIndividual;
  {if (PuedeTerminar) then
    if (IBQSPEventoInd.FieldValues['id_evento_generado'] <> null) then
      EventoGenerado := IBQSPEventoInd.FieldValues['id_evento_generado']; }
end;

// reescribo el terminar ya que agrego funcionalidad
procedure TFEveDiagnosticoEnfermedad.ATerminarExecute(Sender: TObject);
begin
  inherited ATerminarExecute(Sender); // ejecuto el terminar de eveSimple
  if (PuedeTerminar) then
  begin
    if (CBAplicarTratamiento.Checked) then // caso que tengo que aplicar Tratamiento
      begin
        {Application.CreateForm(TFEveTratamiento, FEveTratamiento);
        FEveTratamiento.EventoDisparador := self.EventoGenerado;
        FEveTratamiento.ModoEve := meIndividual;
        FEveTratamiento.IDAnimal := IDAnimal;
        FEveTratamiento.ConManga := false;
        FEveTratamiento.CrearGrupo := true;
        FEveTratamiento.ShowModal;  }

        //if (FEveTratamiento.BBTerminar.ModalResult = 1) then // actualizo la tabla del diagnostico de enfermedad cuando termino bien
       if CargarTratamiento() = 1 then
         { begin
            IBQActualizoDiagnostico.Close;
            IBQActualizoDiagnostico.ParamByName('eve').AsInteger := self.EventoGenerado;
            IBQActualizoDiagnostico.Open;
            {IBQActualizoDiagnostico.Edit;
            IBQActualizoDiagnostico.FieldByName('tratamiento').AsString := 'S';
            IBQActualizoDiagnostico.Post;}

            FPrincipal.IBTPrincipal.CommitRetaining;
          //end
      end;
  end;
  ModalResult := mrOk;
end;

function TFEveDiagnosticoEnfermedad.CargarTratamiento() : TModalResult;
var
  F : TFEveTratamiento;
begin
  F := TFEveTratamiento.Create(self);
  F.ConManga := ModoEve = meMasivo;
  F.ModoEve := ModoEve;
  F.ConDiagnostico := false;
  if not F.ConManga then
    F.IDAnimal := IDAnimal;
  F.ShowModal;
  Result := F.ModalResult;
  F.Destroy;
end;

// seteo la property conTratamiento
procedure TFEveDiagnosticoEnfermedad.SetConTratamiento(
  const Value: boolean);
begin
  FConTratamiento := Value;
end;

procedure TFEveDiagnosticoEnfermedad.ACancelarExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFEveDiagnosticoEnfermedad.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if deBaja then
  begin
    if(fecha.Date > FechaBaja) then
      fecha.Date:=FechaBaja;
  end
  else
    if(fecha.Date > now) then
      fecha.Date:=now;
  GetEvent(DTPAFecha);
end;

procedure TFEveDiagnosticoEnfermedad.LResponsableClick(Sender: TObject);
begin
  inherited;
  if nroID>0 then
        begin
        DBLCBAResponsable.KeyValue:=nroID;
        nroID:=-1;
        end;
end;

procedure TFEveDiagnosticoEnfermedad.LResponsableMouseEnter(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveDiagnosticoEnfermedad.LResponsableMouseLeave(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveDiagnosticoEnfermedad.Label2Click(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMEnfermedades.Create(self));
      DMSoftvet.IBQEnfermedades.Close;
      DMSoftvet.IBQEnfermedades.Open;
      if nroID>0 then
            begin
            DBLCBAEnfermedad.KeyValue:=nroID;
            nroID:=-1;
            end;
    end;
end;

procedure TFEveDiagnosticoEnfermedad.Label2MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label2.Font.Color:= $00606C02;
      Label2.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveDiagnosticoEnfermedad.Label2MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label2.Font.Color:= clWindowText;
      Label2.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveDiagnosticoEnfermedad.EPrecioChange(Sender: TObject);
begin
  inherited;
  if not TryStrToFloat(EPrecio.Text,Precio) then
  begin
    EPrecio.Text := '';
    Precio := 0;
  end;
end;

procedure TFEveDiagnosticoEnfermedad.cargarDatos(i:integer);
begin
  inherited;
  //if (deBaja) then
    //CargarDatos
  //else
    begin
          IBDSSimple.FieldByName('RESP').Value:= getDato('responsable',anim[i]);
          IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
          IBDSSimple.FieldByName('ENFERMEDAD').Value :=getDato('enfermedad',anim[i]);
          IBDSSimple.FieldByName('ID_ENFERMEDAD').Value:=DBLCBAEnfermedad.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('ENFERMEDAD').Value,'ID_ENFERMEDAD');
          IBDSSimple.FieldByName('DIAGNOSTICADOR').Value := getDato('diagnosticador',anim[i]);
          IBDSSimple.FieldByName('ID_DIAGNOSTICADOR').Value:=DBLCBADiagnosticador.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('DIAGNOSTICADOR').Value,'ID_DIAGNOSTICADOR');
    end;
end;

procedure TFEveDiagnosticoEnfermedad.IBDSSimpleID_RPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  //hereda de evesimple
end;

procedure TFEveDiagnosticoEnfermedad.ITratClick(Sender: TObject);
begin
  inherited;
  CBAplicarTratamiento.Checked := not CBAplicarTratamiento.Checked;
end;

procedure TFEveDiagnosticoEnfermedad.INecropsiaClick(Sender: TObject);
var
  E : Integer;
begin
  inherited;
  TSNecropsia.TabVisible := true;
  PCBasico.ActivePage := TSNecropsia;

  SBNecropsia.Repaint;

  IBQAnimal.Close;
  IBQAnimal.ParamByName('animal').AsInteger := IDAnimal;
  IBQAnimal.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAnimal.Open;

  ERP.Text := IBQAnimal.FieldValues['id_rp'];
  if IBQAnimal.FieldValues['Origen'] <> null then
    EOrigen.Text := IBQAnimal.FieldValues['Origen'];
  ERaza.Text := IBQAnimal.FieldValues['raza'];
  ECategoria.Text := IBQAnimal.FieldValues['categoria'];
  {if IBQAnimal.FieldValues['lote'] <> null then
    ELote.Text := IBQAnimal.FieldValues['lote'];}

  E := MonthsBetween(Today(),IBQAnimal.FieldValues['fecha_nacimiento']);
  if E < 24 then
    EEdad.Text := IntToStr(E)+' meses'
  else
    EEdad.Text := IntToStr(YearsBetween(Today(),IBQAnimal.FieldValues['fecha_nacimiento']))+' años';
end;

procedure TFEveDiagnosticoEnfermedad.PCBasicoChange(Sender: TObject);
begin
  inherited;
  if PCBasico.ActivePage = TSDatos then
  begin
    LNecropsia.Visible := ModoEve = meIndividual;
    INecropsia.Visible := ModoEve = meIndividual;
  end;
end;

procedure TFEveDiagnosticoEnfermedad.IPreliminarClick(Sender: TObject);
var
  F : TFRepNecropsia;
begin
  inherited;
  F := TFRepNecropsia.Create(self);
  F.QRLCant.Caption := ETotalAnimales.Text;
  F.QRLCateg.Caption := ECategoria.Text;
  F.QRLDirVet.Caption := EDirVet.Text;
  F.QRLEdad.Caption := EEdad.Text;
  F.QRLLote.Caption := ELote.Text;
  F.QRLNombreVet.Caption := ENombreVet.Text;
  F.QRLOrigen.Caption := EOrigen.Text;
  F.QRLRaza.Caption := ERaza.Text;
  F.QRLRodeo.Caption := EtotalCorral.Text;
  F.QRLRP.Caption := ERP.Text;
  F.QRLTelVet.Caption := ETelVet.Text;
  F.QRLTimepoEv.Caption := ETiempoEvolucion.Text;
  F.QRLSignologia.Caption := ESignologia.Text;
  F.QRMDiagPres.Lines.AddStrings(MDiagPresuntivo.Lines);
  F.QRMMortandad.Lines.AddStrings(MDatosMortandad.Lines);
  F.QRMVacuna.Lines.AddStrings(MVacunacionesSimil.Lines);
  F.QRMTomaMuestra.Lines.Add(ETomaMuestra.Text);
  F.ShowModal;
  F.Destroy;
end;

end.
