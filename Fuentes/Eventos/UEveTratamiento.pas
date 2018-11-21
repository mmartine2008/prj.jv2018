unit UEveTratamiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, DBCtrls, UDBLookupComboBoxAuto,
  DateTimePickerAuto, DataExport, DataToXLS, WinXP, EditAuto, UMensajeHuella,
  UABMLaboratorios, UEveDiagnosticoEnfermedad, ImgList, PngImageList,
  PngImage, JvExExtCtrls, JvImage, jpeg, JvGIF, JvExControls, JvLabel,
  JvComponentBase, JvBalloonHint, xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveTratamiento = class(TFEveSimple)
    LFecha: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    LResponsable: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    LTipo: TLabel;
    DBLCBATipo: TDBLookupComboBoxAuto;
    LTecnica: TLabel;
    DBLCBATecnica: TDBLookupComboBoxAuto;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleID_AUX_EVENTO: TIntegerField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleTIPO: TIBStringField;
    IBDSSimpleID_TIPO: TIntegerField;
    IBDSSimpleTECNICA: TIBStringField;
    IBDSSimpleID_TECNICA: TIntegerField;
    IBDSSimpleEW: TIBStringField;
    LDescripcion: TLabel;
    DBLCBATratamiento: TDBLookupComboBoxAuto;
    IBDSSimpleDESCRIPCIONTRATAMIENTO: TIBStringField;
    IBDSSimpleID_TRATAMIENTO: TIntegerField;
    GBDatosEconomicos: TGroupBox;
    Label1: TLabel;
    EADosis: TEditAuto;
    LMedida: TLabel;
    Label2: TLabel;
    EAPrecio: TEditAuto;
    LPMedida: TLabel;
    LLaboratorios: TLabel;
    DBLCBALaboratorios: TDBLookupComboBoxAuto;
    Label5: TLabel;
    EANroSerie: TEditAuto;
    Label6: TLabel;
    DTPAFechaVencimiento: TDateTimePickerAuto;
    LNroDosis: TLabel;
    CBNroDosis: TComboBox;
    IBQLaboratorios: TIBQuery;
    DSLaboratorios: TDataSource;
    IBQInsertarDatos: TIBQuery;
    CBDiagnosticar: TCheckBox;
    IBQUltimoEvento: TIBQuery;
    LPeriodoRetirada: TLabel;
    EAPeriodoRetirada: TEditAuto;
    LDias: TLabel;
    LHora: TLabel;
    DTPAHora: TDateTimePickerAuto;
    IBDSSimpleH1: TTimeField;
    ETempCorporal: TEdit;
    LTempCorp: TLabel;
    LPeso: TLabel;
    EAPeso: TEditAuto;
    LGrad: TLabel;
    IBDSSimpleF1: TFloatField;
    IBDSSimpleF2: TFloatField;
    IBDSSimpleF3: TFloatField;
    IBQPesoGrupo: TIBQuery;
    IBQCantCategoria: TIBQuery;
    IBQPesoPromCateg: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure SetText(Sender: TField; const Text: String);
    procedure change(Sender: TField);
    procedure IBDSSimpleRESPSetText(Sender: TField; const Text: String);
    procedure IBDSSimpleRESPChange(Sender: TField);
    procedure DBLCBATipoCloseUp(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure LDescripcionClick(Sender: TObject);
    procedure LDescripcionMouseEnter(Sender: TObject);
    procedure LDescripcionMouseLeave(Sender: TObject);
    procedure DBLCBATratamientoCloseUp(Sender: TObject);
    procedure LLaboratoriosMouseEnter(Sender: TObject);
    procedure LLaboratoriosMouseLeave(Sender: TObject);
    procedure LLaboratoriosClick(Sender: TObject);
    procedure IBQLaboratoriosAfterOpen(DataSet: TDataSet);
    procedure DSTIpoTratamientoDataChange(Sender: TObject; Field: TField);
    procedure ATerminarExecute(Sender: TObject);
    procedure EAChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ACancelarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLCBATipoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PCBasicoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLCBATipoExit(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure EADosisKeyPress(Sender: TObject; var Key: Char);
    procedure EAPeriodoRetiradaKeyPress(Sender: TObject; var Key: Char);
    procedure CBNroDosisKeyPress(Sender: TObject; var Key: Char);
    procedure ETempCorporalChange(Sender: TObject);
    procedure EAPesoChange(Sender: TObject);
    procedure IBDSSimpleF2SetText(Sender: TField; const Text: String);
    
  private
    FConDiagnostico, FDesdeFlushing : Boolean;
    CargarOtro, Diagnosticar : Boolean;
    ValorDosis, ValorPrecio : Double;
    function CalcularDosis(peso : Double) : Double;
    procedure CalculaPesoGrupal();
    procedure SetConDiagnostico(Const Value : Boolean);
    procedure SetDesdeFlushing(Value : Boolean);
    procedure CargarOtroTratamiento();
    function PesoPromedioCategoria(Categoria : Integer) : Integer;
    procedure CargarDiagnostico();
  public
    property ConDiagnostico : boolean read FConDiagnostico write SetConDiagnostico;
    property DesdeFlushing : boolean read FDesdeFlushing write SetDesdeFlushing;
  protected
    Procedure CargarParametrosRN;override;
    Procedure CargarParametrosSP;override;
    procedure CargarDatosGrilla;override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure cargarDatos(i:integer);override;
  end;

var
  FEveTratamiento: TFEveTratamiento;

implementation

uses UDMSoftvet, UPrincipal, UClassType, UABMEmpleados, UABMDescTipoTratamiento,
     UImportacion, UTraduccion;

{$R *.dfm}

{ TFEveTratamiento }

function TFEveTratamiento.PesoPromedioCategoria(Categoria : Integer) : Integer;
begin
  IBQPesoPromCateg.Close;
  IBQPesoPromCateg.ParamByName('categoria').AsInteger := Categoria;
  IBQPesoPromCateg.Open;
  if IBQPesoPromCateg.FieldValues['peso'] <> null then
    Result := IBQPesoPromCateg.FieldValues['peso']
  else
    Result := 0;
end;

procedure TFEveTratamiento.CargarDatosGrilla;
begin
  inherited;
  {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['id_animal'],DSSimple))then
    begin
      IBDSSimple.Insert;}
      IBDSSimple.FieldByName('ID_RP').Value:=MSimple.IBQSeleccionados.FieldValues['ID_RP'];
      IBDSSimple.FieldByName('ID_ANIMAL').Value:=MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];

      RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.DateTime]);
      //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
      RealizarCambio(DTPAHora,[IBDSSimple.FieldByName('H1')],[DTPAHora.Time]);
      RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('RESP')],[DBLCBAResponsable.KeyValue,DBLCBAResponsable.Text]);
      //IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.GetDato;
      //IBDSSimple.FieldByName('RESP').Value:= DBLCBAResponsable.Text;
      RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
      //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;
      RealizarCambio(DBLCBATipo,[IBDSSimple.FieldByName('TIPO'),IBDSSimple.FieldByName('ID_TIPO')],[DBLCBATipo.Text,DBLCBATipo.KeyValue]);
      //IBDSSimple.FieldByName('TIPO').Value := DBLCBATipo.Text;
      //IBDSSimple.FieldByName('ID_TIPO').Value := DBLCBATipo.KeyValue;
      RealizarCambio(DBLCBATecnica,[IBDSSimple.FieldByName('TECNICA'),IBDSSimple.FieldByName('ID_TECNICA')],[DBLCBATecnica.Text,DBLCBATecnica.KeyValue]);
      //IBDSSimple.FieldByName('TECNICA').Value := DBLCBATecnica.Text;
      //IBDSSimple.FieldByName('ID_TECNICA').Value := DBLCBATecnica.KeyValue;
      RealizarCambio(DBLCBATratamiento,[IBDSSimple.FieldByName('DESCRIPCIONTRATAMIENTO'),IBDSSimple.FieldByName('ID_TRATAMIENTO')],[DBLCBATratamiento.Text,DBLCBATratamiento.KeyValue]);
      //IBDSSimple.FieldByName('DESCRIPCIONTRATAMIENTO').Value := DBLCBATratamiento.Text;
      //IBDSSimple.FieldByName('ID_TRATAMIENTO').Value := DBLCBATratamiento.KeyValue;
      RealizarCambio(ETempCorporal,[IBDSSimple.FieldByName('F1')],[ETempCorporal.Text]);
      RealizarCambio(ETempCorporal,[IBDSSimple.FieldByName('F2')],[PesoPromedioCategoria(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'])]);
      RealizarCambio(ETempCorporal,[IBDSSimple.FieldByName('F3')],[CalcularDosis(IBDSSimple.FieldByName('F2').AsFloat)]);

    //end;
end;

procedure TFEveTratamiento.CargarParametrosMasivo;
begin
  inherited;
  // DATOS GENERICOS
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('FECHA').AsDateTime := IBDSSimple.FieldByName('FECHA').AsDateTime;
  IBQSPEventoInd.ParamByName('HORA').AsTime := IBDSSimple.FieldValues['H1'];
  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;

  // DATOS DEl tratamiento
  IBQSPEventoInd.ParamByName('tipo').AsInteger := IBDSSimple.FieldValues['id_tipo'];
  IBQSPEventoInd.ParamByName('tecnica').AsInteger := IBDSSimple.FieldValues['id_tecnica'];
  IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimple.FieldValues['RESPONSABLE'];

  if BDBGSimple.Columns[7].Visible then
    IBQSPEventoInd.ParamByName('TEMPERATURA').Value := IBDSSimple.FieldValues['F1']
  else
    IBQSPEventoInd.ParamByName('TEMPERATURA').Value := null;

  if (CrearGrupo) then
    IBQSPEventoInd.ParamByName('grupo').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').AsInteger;

  IBQSPEventoInd.ParamByName('ID_TRATAMIENTO').AsInteger := IBDSSimple.FieldValues['ID_TRATAMIENTO'];

  IBQSPEventoInd.ParamByName('ID_TRATAMIENTO').AsInteger := IBDSSimple.FieldValues['ID_TRATAMIENTO'];
  IBQSPEventoInd.ParamByName('PESO').value := IBDSSimple.FieldValues['F2'];
  IBQSPEventoInd.ParamByName('DOSIS').value := IBDSSimple.FieldValues['F3'];
end;

procedure TFEveTratamiento.CargarParametrosRN;
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

procedure TFEveTratamiento.CargarParametrosSP;
var
  d : double;
begin
  inherited;
  // DATOS GENERICOS
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('FECHA').AsDateTime := DTPAFecha.DateTime;
  IBQSPEventoInd.ParamByName('HORA').AsTime := DTPAHora.Time;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;

  // DATOS DEL tratamiento
  IBQSPEventoInd.ParamByName('tipo').AsInteger := DBLCBATipo.KeyValue;
  IBQSPEventoInd.ParamByName('tecnica').AsInteger := DBLCBATecnica.KeyValue;
  IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IDAnimal;
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := DBLCBAResponsable.KeyValue;
  if (EventoDisparador <> 0) then
    IBQSPEventoInd.ParamByName('DISPARADOR').AsInteger := EventoDisparador;

  IBQSPEventoInd.ParamByName('ID_TRATAMIENTO').AsInteger := DBLCBATratamiento.KeyValue;

  if DBLCBATipo.KeyValue = 1 then
    IBQSPEventoInd.ParamByName('TEMPERATURA').Value := StrToFloat(ETempCorporal.Text)
  else
    IBQSPEventoInd.ParamByName('TEMPERATURA').Value := null;

  if TryStrToFloat(EAPeso.Text,d) then
    IBQSPEventoInd.ParamByName('PESO').AsFloat := d
  else
    IBQSPEventoInd.ParamByName('PESO').AsFloat := 0;
  if TryStrToFloat(EADosis.Text,d) then
    IBQSPEventoInd.ParamByName('DOSIS').AsFloat := d
  else
    IBQSPEventoInd.ParamByName('DOSIS').AsFloat := 0;

end;

procedure TFEveTratamiento.LoadSQLStringList;
begin
  inherited;
//  SQLStringList.AddObject('TIPO',TObject(DMSoftvet.DSTipoTratamientos));
  SQLStringList.AddObject('TECNICA',TObject(DMSoftvet.DSTecnicasTratamientos));
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('DESCRIPCIONTRATAMIENTO',TObject(DMSoftvet.DSTratamiento));
end;

procedure TFEveTratamiento.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DBLCBAResponsable.AsignarValorDefecto;

  DTPAFecha.DateTime := now;
//  DTPAFecha.MaxDate:= now;

  DesdeFlushing := false;

  DMSoftvet.IBQTecnicasTratamientos.Open;
  DMSoftvet.IBQTiposTratamientos.Open;

//  DMSoftvet.DSTratamiento.OnDataChange := DSTIpoTratamientoDataChange;

  Msimple.SQLBasico := 'select id_animal, id_rp, id_senasa, id_pc, id_hba, id_otro, id_ie, nombre, apodo from vis_tratamiento';
  MSimple.PasarParametros(0,0);//cambie codigo

  DBLCBATipoCloseUp(nil);

  ValorDosis := 0;
  ValorPrecio := 0;

  FConDiagnostico := true;
end;

procedure TFEveTratamiento.SetText(Sender: TField; const Text: String);
begin
  inherited;
  if ((IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      case (Sender.Index) of
{        6 : begin      // RESPONSABLE
              IBQValidaciones.SQL.Add('select NOMBRE || '' '' || APELLIDO as NombreyApellido from TAB_EMPLEADOS where (establecimiento = :esta) and ((apellido like '''+UpperCase(Text)+'%'') or(nombre like '''+UpperCase(Text)+'%'')or (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%''))');
              IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
              IBQValidaciones.Active := true;
              if not(IBQValidaciones.IsEmpty) then
                Sender.AsString := IBQValidaciones.FieldByName('NombreyApellido').AsString;
            end;}
        4 : begin
              Sender.AsString := Text; 
            end;
        7 : begin      // tipo
              {IBQValidaciones.SQL.Add('select sinonimo from COD_tipos_tratamiento where (sinonimo like '''+UpperCase(Text)+'%'') or (codigo ='''+ UpperCase(Text)+''')');
              IBQValidaciones.Active := true;
              if not(IBQValidaciones.IsEmpty) then
                Sender.AsString := IBQValidaciones.FieldByName('sinonimo').AsString;}
            end;
        9 : begin      // tecnica
              IBQValidaciones.SQL.Add('select sinonimo from cod_tecnicas_tratamiento where (sinonimo like '''+UpperCase(Text)+'%'') or (codigo ='''+ UpperCase(Text)+''')');
              IBQValidaciones.Active := true;
              if not(IBQValidaciones.IsEmpty) then
                Sender.AsString := IBQValidaciones.FieldByName('sinonimo').AsString;
            end;
        12 : begin      // descripción tratamiento
              IBQValidaciones.SQL.Add('select sinonimo from cod_tratamiento where (sinonimo like '''+UpperCase(Text)+'%'') or (codigo ='''+ UpperCase(Text)+''')');
              IBQValidaciones.Active := true;
              if not(IBQValidaciones.IsEmpty) then
                Sender.AsString := IBQValidaciones.FieldByName('sinonimo').AsString;
            end;

      end;
    end;

end;

procedure TFEveTratamiento.change(Sender: TField);
var PickPos : integer;
begin
  inherited;
  if (IBDSSimple.State <> dsInsert ) then
    case (Sender.Index) of
     { 6:  begin      // RESPONSABLE
            PickPos := BDBGSimple.ColumnByField('RESP').PickList.IndexOf(BDBGSimple.ColumnByField('RESP').Field.AsString);
            IBDSSimpleRESPONSABLE.Value := TClassType(BDBGSimple.ColumnByField('RESP').PickList.Objects[PickPos]).getValue;
          end;}
      7:  begin      // TIPO
           // PickPos := BDBGSimple.ColumnByField('TIPO').PickList.IndexOf(BDBGSimple.ColumnByField('TIPO').Field.AsString);
           // IBDSSimpleID_TIPO.Value := TClassType(BDBGSimple.ColumnByField('TIPO').PickList.Objects[PickPos]).getValue;

           { DMSoftvet.IBQTratamiento.ParamByName('tipotratamiento').Value:= IBDSSimpleID_TIPO.Value;
            DMSoftvet.IBQTratamiento.Close;
            DMSoftvet.IBQTratamiento.Open;}
            //IBDSSimpleID_TRATAMIENTO.Value:= DMSoftvet.IBQTratamiento.fieldbyname('id_tratamiento').AsInteger;
            //IBDSSimpleDESCRIPCIONTRATAMIENTO.SetAsString(DMSoftvet.IBQTratamiento.fieldbyname('sinonimo').AsString);
          end;
      9: begin      // TECNICA
            PickPos := BDBGSimple.ColumnByField('TECNICA').PickList.IndexOf(BDBGSimple.ColumnByField('TECNICA').Field.AsString);
            IBDSSimpleID_TECNICA.Value := TClassType(BDBGSimple.ColumnByField('TECNICA').PickList.Objects[PickPos]).getValue;
          end;
      12: begin      // DESCRIPCIONTRATAMIENTO
          {  DMSoftvet.IBQTratamiento.ParamByName('tipotratamiento').Value:= IBDSSimpleID_TIPO.Value;
            DMSoftvet.IBQTratamiento.Close;
            DMSoftvet.IBQTratamiento.Open;}

            PickPos := BDBGSimple.ColumnByField('DESCRIPCIONTRATAMIENTO').PickList.IndexOf(BDBGSimple.ColumnByField('DESCRIPCIONTRATAMIENTO').Field.AsString);
            IBDSSimpleID_TRATAMIENTO.Value := TClassType(BDBGSimple.ColumnByField('DESCRIPCIONTRATAMIENTO').PickList.Objects[PickPos]).getValue;
          end;
    end;
{  if (IBDSSimple.State = dsEdit ) then
    begin
      IBDSSimple.Post;
    end}
end;

procedure TFEveTratamiento.IBDSSimpleRESPSetText(Sender: TField; const Text: String);
begin
  inherited;
  if ((IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select NOMBRE || '' '' || APELLIDO as NombreyApellido from TAB_EMPLEADOS where (establecimiento = :esta) and ((apellido like '''+UpperCase(Text)+'%'') or(nombre like '''+UpperCase(Text)+'%'')or (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%''))');
      IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
        Sender.AsString := IBQValidaciones.FieldByName('NombreyApellido').AsString;
    end;
end;

procedure TFEveTratamiento.IBDSSimpleRESPChange(Sender: TField);
var PickPos : integer;
begin
  inherited;
  if (IBDSSimple.State <> dsInsert ) then
    begin
      PickPos := BDBGSimple.ColumnByField('RESP').PickList.IndexOf(BDBGSimple.ColumnByField('RESP').Field.AsString);
      IBDSSimpleRESPONSABLE.Value := TClassType(BDBGSimple.ColumnByField('RESP').PickList.Objects[PickPos]).getValue;
    end;

end;

procedure TFEveTratamiento.DBLCBATipoCloseUp(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQTratamiento.ParamByName('tipotratamiento').Value:= DBLCBATipo.KeyValue;
  DMSoftvet.IBQTratamiento.Close;
  DMSoftvet.IBQTratamiento.Open;
//  DBLCBATratamiento.KeyValue:= DBLCBATipo.KeyValue;
  DMSoftvet.IBQTratamiento.First;
  DBLCBATratamiento.KeyValue:=DMSoftvet.IBQTratamiento.FieldByName('id_tratamiento').AsInteger;

  if DBLCBATipo.KeyValue <> null then
  begin
    LTempCorp.Visible := DBLCBATipo.KeyValue = 1;
    ETempCorporal.Visible := DBLCBATipo.KeyValue = 1;
    LGrad.Visible := DBLCBATipo.KeyValue = 1;
    BDBGSimple.Columns[7].Visible := DBLCBATipo.KeyValue = 1;
    if DBLCBATipo.KeyValue = 1 then
    begin
      LDescripcion.Top := 225;
      DBLCBATratamiento.Top := 220;
      LTecnica.Top := 260;
      DBLCBATecnica.Top := 255;
      CBDiagnosticar.Top := 282;
    end
    else
    begin
      LDescripcion.Top := 192;
      DBLCBATratamiento.Top := 188;
      LTecnica.Top := 228;
      DBLCBATecnica.Top := 223;
      CBDiagnosticar.Top := 258;
    end;
  end;
  
end;

procedure TFEveTratamiento.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.DateTime > now) then
    fecha.DateTime:=now;
  GetEvent(DTPAFecha);
end;

procedure TFEveTratamiento.LResponsableClick(Sender: TObject);
begin
  inherited;
  if nroID>0 then
        begin
        DBLCBAResponsable.KeyValue:=nroID;
        nroID:=-1;
        end;
end;

procedure TFEveTratamiento.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;  
end;

procedure TFEveTratamiento.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveTratamiento.LDescripcionClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMDescTipoTratamiento.Create(self));
      DMSoftvet.IBQTratamiento.ParamByName('tipotratamiento').Value:= DBLCBATipo.KeyValue;
      DMSoftvet.IBQTratamiento.Close;
      DMSoftvet.IBQTratamiento.Open;
      if nroID>0 then
        begin
          DBLCBATratamiento.KeyValue:=nroID;
          nroID:=-1;
        end;
    end;  
end;

procedure TFEveTratamiento.LDescripcionMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LDescripcion.Font.Color:= $00606C02;
      LDescripcion.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveTratamiento.LDescripcionMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LDescripcion.Font.Color:= clWindowText;
      LDescripcion.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveTratamiento.DBLCBATratamientoCloseUp(Sender: TObject);
var
  d : Double;
begin
  inherited;
  if DBLCBATratamiento.KeyValue <> null then
  begin
    if DMSoftvet.IBQTratamiento.Lookup('id_tratamiento',DBLCBATratamiento.KeyValue,'periodoretirada') <> null then
      EAPeriodoRetirada.Text := FormatFloat('##.##',DMSoftvet.IBQTratamiento.Lookup('id_tratamiento',DBLCBATratamiento.KeyValue,'periodoretirada'));
    if EAPeso.Visible then
    begin
      if TryStrToFloat(EAPeso.Text,d) then
        EADosis.Text := FormatFloat('##.##',CalcularDosis(d));
    end;
    DBLCBALaboratorios.KeyValue := DMSoftvet.IBQTratamiento.FieldValues['laboratorio'];
  end;
end;

function TFEveTratamiento.CalcularDosis(peso : Double) : Double;
var
  dosis : Variant;
  kg : Variant;
  res : Double;
  I : Integer;
begin
  dosis := DMSoftvet.IBQTratamiento.Lookup('id_tratamiento',DBLCBATratamiento.KeyValue,'dosis');
  kg := DMSoftvet.IBQTratamiento.Lookup('id_tratamiento',DBLCBATratamiento.KeyValue,'kg_dosis');
  res := 0;
  if dosis <> null then
  begin
    if kg > 1 then
    begin
      res := (peso * dosis) / kg;
    end
    else
      res := dosis;
  end;
  Result := res;
end;

procedure TFEveTratamiento.LLaboratoriosMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LLaboratorios.Font.Color:= $00606C02;
      LLaboratorios.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveTratamiento.LLaboratoriosMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LLaboratorios.Font.Color:= clWindowText;
      LLaboratorios.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveTratamiento.LLaboratoriosClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMLaboratorios.Create(self));
      IBQLaboratorios.Close;
      IBQLaboratorios.Open;
    end;
  cambiarCB(DBLCBALaboratorios,nroID);
end;

procedure TFEveTratamiento.IBQLaboratoriosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFEveTratamiento.DSTIpoTratamientoDataChange(Sender: TObject; Field: TField);
begin
  LMedida.Caption := DMSoftvet.IBQTiposTratamientos.FieldByName('MEDIDA').AsString;
  LPMedida.Caption := StringReplace(LMedida.Caption,'/','precio/',[rfReplaceAll]);

  if DMSoftvet.IBQTiposTratamientos.FieldByName('ID_TIPO_TRATAMIENTO').AsInteger = 2 then
  begin
    LNroDosis.Visible := true;
    CBNroDosis.Visible := true;
  end
  else
  begin
    LNroDosis.Visible := false;
    CBNroDosis.Visible := false;
  end;

  if ((DMSoftvet.IBQTiposTratamientos.FieldByName('ID_TIPO_TRATAMIENTO').AsInteger = 1) or
      (DMSoftvet.IBQTiposTratamientos.FieldByName('ID_TIPO_TRATAMIENTO').AsInteger = 4) or
      (DMSoftvet.IBQTiposTratamientos.FieldByName('ID_TIPO_TRATAMIENTO').AsInteger = 6) or
      (DMSoftvet.IBQTiposTratamientos.FieldByName('ID_TIPO_TRATAMIENTO').AsInteger = 7) or
      (DMSoftvet.IBQTiposTratamientos.FieldByName('ID_TIPO_TRATAMIENTO').AsInteger = 8) or
      (DMSoftvet.IBQTiposTratamientos.FieldByName('ID_TIPO_TRATAMIENTO').AsInteger = 8) or
      (DMSoftvet.IBQTiposTratamientos.FieldByName('ID_TIPO_TRATAMIENTO').AsInteger = 11)) then
    begin
      LPeriodoRetirada.Visible := true;
      EAPeriodoRetirada.Visible := true;
      LDias.Visible:= true;
    end
   else
      begin
        LPeriodoRetirada.Visible := false;
        EAPeriodoRetirada.Visible := false;
        LDias.Visible:= false;
      end;

  if DBLCBATratamiento.KeyValue <> 0 then
    GBDatosEconomicos.Visible := true
  else
    GBDatosEconomicos.Visible := false;
end;

procedure TFEveTratamiento.ATerminarExecute(Sender: TObject);
var
  grupo, animal, evento : Variant;
begin
  inherited;

  CargarOtro := PuedeTerminar;
  Diagnosticar := PuedeTerminar and CBDiagnosticar.Checked;

  if PuedeTerminar then
  begin
    if ModoEve = meIndividual then
    begin
      grupo := null;
      animal := IDAnimal;
      IBQUltimoEvento.Close;
      IBQUltimoEvento.Open;
      IBQUltimoEvento.First;
      evento:= IBQUltimoEvento.FieldbyName('ultimoevento').Value;
    end
    else
    begin
      grupo := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').Value;
      animal := null;
      evento:= null;
    end;

    try
      IBQInsertarDatos.Close;
      IBQInsertarDatos.ParamByName('GRUPO').Value := grupo;
      IBQInsertarDatos.ParamByName('ESTABLECIMIENTO').Value := Fprincipal.EstablecimientoActual;
      IBQInsertarDatos.ParamByName('ANIMAL').Value := animal;
      IBQInsertarDatos.ParamByName('DOSIS').Value := ValorDosis;
      IBQInsertarDatos.ParamByName('PRECIO').Value := ValorPrecio;
      IBQInsertarDatos.ParamByName('NRO_SERIE').AsString := EANroSerie.Text;
      IBQInsertarDatos.ParamByName('LABORATORIO').Value := DBLCBALaboratorios.KeyValue;
      IBQInsertarDatos.ParamByName('FECHA_VENCIMIENTO').AsDate := DTPAFechaVencimiento.Date;
      if CBNroDosis.Visible then
        IBQInsertarDatos.ParamByName('NRO_DOSIS').AsString := CBNroDosis.Text;


      if (trim(EAPeriodoRetirada.Text)<> '') then
        IBQInsertarDatos.ParamByName('PERIODORETIRADA').AsString := EAPeriodoRetirada.Text;
//       else
//        IBQInsertarDatos.ParamByName('PERIODORETIRADA').AsString := '1';

      IBQInsertarDatos.ParamByName('EVENTO').Value := evento;
      IBQInsertarDatos.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;

    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;

  end;
end;

procedure TFEveTratamiento.EAChange(Sender: TObject);
var
  valor : double;
  separador : Char;
begin
  inherited;

  Separador := SysUtils.DecimalSeparator;

  if (Sender as TEditAuto).Text = '' then
  begin
    case (Sender as TEditAuto).Tag of
      1 : ValorDosis := 0;
      2 : ValorPrecio := 0;
    end;
  end
  else
  begin
    if not TryStrToFloat(Trim((Sender as TEditAuto).Text),valor) then
    begin
      MostrarMensaje(tmError,Traducir('El numero no es válido. Los decimales se deben separar con (''')+separador+''')');
      (Sender as TEditAuto).Clear;
      case (Sender as TEditAuto).Tag of
        1 : ValorDosis := 0;
        2 : ValorPrecio := 0;
      end;
    end
    else
    begin
      case (Sender as TEditAuto).Tag of
        1 : ValorDosis := valor;
        2 : ValorPrecio := valor;
      end;
    end;
  end;
end;

procedure TFEveTratamiento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if Diagnosticar then
    CargarDiagnostico();


  if CargarOtro then
  begin
    if (MostrarMensaje(tmConsulta, 'Desea cargar otro Tratamiento?') = mrYes) then
    begin
      CanClose := False;
      CargarOtroTratamiento();
    end
    else
      CanClose := True;
  end;
end;

procedure TFEveTratamiento.ACancelarExecute(Sender: TObject);
begin
  inherited;
  CargarOtro := false;
  Diagnosticar := false;
end;

procedure TFEveTratamiento.FormShow(Sender: TObject);
begin
  inherited;
  DTPAFechaVencimiento.Date := Date();
  DBLCBALaboratorios.KeyValue := 0;
  CargarOtro := false;
  if not FConDiagnostico then
    CBDiagnosticar.Visible := false
  else
    CBDiagnosticar.Checked := false;
 // DMSoftvet.DSTratamiento.OnDataChange := DSTIpoTratamientoDataChange;
//  DBLCBATipoCloseUp(nil);
  DMSoftvet.DSTratamiento.OnDataChange := nil;

  PCBasicoChange(nil);
end;

procedure TFEveTratamiento.CargarOtroTratamiento();
begin
  if (ModoEve = meIndividual) then
    PCBasico.ActivePage := TSDatos
   else
     if (ModoEve = meMasivo) then
       PCBasico.ActivePage := TSManga;

  MSimple.ControlarBotones;
  if not DesdeFlushing then
    DBLCBATipo.KeyValue := 0;
  DBLCBATipoCloseUp(nil);
  //DBLCBATratamiento.KeyValue := 0;
  DBLCBATecnica.KeyValue := 0;
  EADosis.Clear;
  EAPrecio.Clear;
  EAPeriodoRetirada.Clear;
  CBNroDosis.ItemIndex := 0;
  DBLCBALaboratorios.KeyValue := 0;
  EANroSerie.Clear;
  DTPAFechaVencimiento.Date := Date();
  CBDiagnosticar.Checked := false;
  MAObservacion.Clear;
end;

procedure TFEveTratamiento.CargarDiagnostico();
var
  F : TFEveDiagnosticoEnfermedad;
begin
  F := TFEveDiagnosticoEnfermedad.Create(self);
  F.ConManga := ModoEve = meMasivo;
  F.ModoEve := ModoEve;
  F.ConTratamiento := false;
  if not F.ConManga then
    F.IDAnimal := IDAnimal;
  F.ShowModal;
  F.Destroy;
end;

procedure TFEveTratamiento.DBLCBATipoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not(DBLCBATipo.ListVisible) then
    DBLCBATipoCloseUp(nil);  
end;

procedure TFEveTratamiento.PCBasicoChange(Sender: TObject);
begin
  inherited;

  if (PCBasico.ActivePage = TSDatos) then
  begin
    EAPeso.Visible := false;
    LPeso.Visible := false;
    DMSoftvet.DSTratamiento.OnDataChange := DSTIpoTratamientoDataChange;
    if ModoEve = meIndividual then
    begin
      EAPeso.Visible := true;
      LPeso.Visible := true;
      EAPeso.Text := FormatFloat('##.##',PesoPromedioCategoria(IDAnimal));
    end
    else
      CalculaPesoGrupal;
  end;
end;

procedure TFEveTratamiento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMSoftvet.DSTratamiento.OnDataChange := nil;
end;

procedure TFEveTratamiento.SetConDiagnostico(const Value : Boolean);
begin
  FConDiagnostico := Value;
end;

procedure TFEveTratamiento.SetDesdeFlushing(Value : Boolean);
begin
  FDesdeFlushing := Value;
end;

procedure TFEveTratamiento.DBLCBATipoExit(Sender: TObject);
begin
  inherited;
  GetEvent(DBLCBATipo);
  GetEvent(DBLCBATratamiento);
end;

procedure TFEveTratamiento.cargarDatos(i:integer);
begin
inherited;
      IBDSSimple.FieldByName('RESP').Value:= getDato('responsable',anim[i]);
      IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
      IBDSSimple.FieldByName('TIPO').Value := getDato('tipo',anim[i]);
      if DBLCBATipo.ListSource.DataSet.Lookup('CODIGO',IBDSSimple.FieldByName('TIPO').Value,'SINONIMO')<>null then
          IBDSSimple.FieldByName('TIPO').Value:=DBLCBATipo.ListSource.DataSet.Lookup('CODIGO',IBDSSimple.FieldByName('TIPO').Value,'SINONIMO');
      IBDSSimple.FieldByName('ID_TIPO').Value:=DBLCBATipo.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('TIPO').Value,'ID_TIPO_TRATAMIENTO');
      IBDSSimple.FieldByName('TECNICA').Value := getDato('técnica',anim[i]);
      if DBLCBATecnica.ListSource.DataSet.Lookup('CODIGO',IBDSSimple.FieldByName('TECNICA').Value,'SINONIMO')<>null then
          IBDSSimple.FieldByName('TECNICA').Value:=DBLCBATecnica.ListSource.DataSet.Lookup('CODIGO',IBDSSimple.FieldByName('TECNICA').Value,'SINONIMO');
      IBDSSimple.FieldByName('ID_TECNICA').Value:=DBLCBATecnica.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('TECNICA').Value,'ID_TECNICA');
      IBDSSimple.FieldByName('DESCRIPCIONTRATAMIENTO').Value:='NN'; //esto es porque la descripcion no esta en el xls, entonces se carga como no definida
      if DBLCBATratamiento.ListSource.DataSet.Lookup('CODIGO',IBDSSimple.FieldByName('DESCRIPCIONTRATAMIENTO').Value,'SINONIMO')<>null then
          IBDSSimple.FieldByName('DESCRIPCIONTRATAMIENTO').Value:=DBLCBATratamiento.ListSource.DataSet.Lookup('CODIGO',IBDSSimple.FieldByName('DESCRIPCIONTRATAMIENTO').Value,'SINONIMO');
      IBDSSimple.FieldByName('ID_TRATAMIENTO').Value:=DBLCBATratamiento.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('DESCRIPCIONTRATAMIENTO').Value,'ID_TRATAMIENTO');
      IBDSSimple.FieldByName('H1').Value:=getDato('hora',anim[i]);
end;

procedure TFEveTratamiento.IBDSSimpleID_RPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  //hereda de evesimple
end;

procedure TFEveTratamiento.EADosisKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 5)) and (key <> #8)) then key:=#0;
end;

procedure TFEveTratamiento.EAPeriodoRetiradaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 2)) and (key <> #8)) then key:=#0;
end;

procedure TFEveTratamiento.CBNroDosisKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key:= #0;
end;

procedure TFEveTratamiento.ETempCorporalChange(Sender: TObject);
var
  d : Double;
begin
  inherited;
  if not TryStrToFloat(ETempCorporal.Text,d) then
    ETempCorporal.Text := '0';
end;

procedure TFEveTratamiento.EAPesoChange(Sender: TObject);
var
  d : Double;
begin
  inherited;
  if TryStrToFloat(EAPeso.Text,d) then
    if d > 0 then
      EADosis.Text := FormatFloat('##.##',CalcularDosis(d));
end;

procedure TFEveTratamiento.IBDSSimpleF2SetText(Sender: TField;
  const Text: String);
var
  d : double;
begin
  inherited;
  if TryStrToFloat(Text,d) then
  begin
    if d > 0 then
    begin
      Sender.Value := d;
      IBDSSimpleF3.Value := CalcularDosis(d);
    end;
  end;
end;

procedure TFEveTratamiento.CalculaPesoGrupal;
begin
  IBQPesoGrupo.Close;
  IBQPesoGrupo.Open;
  IBQPesoGrupo.Last;
  IBQPesoGrupo.First;
  if not IBQPesoGrupo.IsEmpty then
  begin
    if IBQPesoGrupo.RecordCount = 1 then
    begin
      LPeso.Visible := true;
      EAPeso.Visible := true;
      EAPeso.Text := FormatFloat('#0.##',IBQPesoGrupo.FieldValues['peso']);
    end;
  end;
end;



end.
