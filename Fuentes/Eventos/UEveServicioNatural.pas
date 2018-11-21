unit UEveServicioNatural;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveIndividual, DB, IBCustomDataSet, IBQuery, ActnList, Tabs,
  ComCtrls, StdCtrls, MemoAuto, Buttons, ExtCtrls, UFrameMangazo, DBCtrls,
  UDBLookupComboBoxAuto, Mask, UDBEditAuto, UDBDateTimePickerAuto,
  DateTimePickerAuto, ComboBoxAuto, EditAuto,
  IBStoredProc, IBDatabase, ColorGrd, Grids, DBGrids, DataExport, DataToXLS,
  WinXP, IBTable, ImgList, PngImageList, JvExControls, JvLabel, PngImage,
  JvExExtCtrls, JvImage, jpeg, JvGIF;

type
  TFEveServicioNatural = class(TFEveIndividual)
    TSToros: TTabSheet;
    MangaHembras: TMangazo;
    MangaToros: TMangazo;
    Label2: TLabel;
    IBQEdadAnimal: TIBQuery;
    IBQEdadAnimalVALOR: TIBStringField;
    IBSPVerificarAnimalServ: TIBStoredProc;
    IBTAlarmaServicio: TIBTable;
    IBQDeleteServicios: TIBQuery;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    LFechaInicio: TLabel;
    LFechaFinEstimada: TLabel;
    DTPAFechaFinEstimada: TDateTimePickerAuto;
    DTPAFechaInicio: TDateTimePickerAuto;
    EANombre: TEditAuto;
    LResponsable: TLabel;
    LCondicionCorporal: TLabel;
    LPotrero: TLabel;
    CBCondicionCorporal: TCheckBox;
    DBLCBAPotrero: TDBLookupComboBoxAuto;
    DBLCBACondicionCorporal: TDBLookupComboBoxAuto;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    JvIAyuda: TJvImage;
    LAyuda: TLabel;
    IBSPCrearGrupo: TIBStoredProc;
    IBSPCrearGrupoIDNUEVOGRUPO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function chequearRN:boolean;
    procedure GetErrors(Query : TIBCustomDataSet; Seleccionados : TIBQuery);
    procedure ejecucionTerminar;
    procedure CBCondicionCorporalClick(Sender: TObject);
    procedure CBCondicionCorporalKeyPress(Sender: TObject; var Key: Char);
    procedure DTPAFechaInicioCloseUp(Sender: TObject);
    procedure DTPAFechaInicioChange(Sender: TObject);
    procedure DTPAFechaFinEstimadaChange(Sender: TObject);
    procedure MangaHembrasBDBGDisponiblesDblClick(Sender: TObject);
    procedure MangaTorosBDBGDisponiblesDblClick(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LPotreroClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure LPotreroMouseEnter(Sender: TObject);
    procedure LPotreroMouseLeave(Sender: TObject);
    procedure MangaHembrasBDBGDisponiblesKeyPress(Sender: TObject;
      var Key: Char);
    procedure MangaTorosBDBGDisponiblesKeyPress(Sender: TObject;
      var Key: Char);
    procedure MangaTorosCBAnimalClick(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure MangaHembrasBDBGSeleccionadosDblClick(Sender: TObject);
    procedure MangaTorosBDBGSeleccionadosDblClick(Sender: TObject);
    procedure MangaHembrasBBEliminarUnoClick(Sender: TObject);
    procedure MangaHembrasBBEliminarUnoMouseEnter(Sender: TObject);
    procedure MangaHembrasBBEliminarUnoMouseLeave(Sender: TObject);
  private
    ID_SERVICIO:integer;
    ID_GRUPO:integer;
    FEdadMinima:integer;
    procedure ClearErrores;
    procedure controlCondicionCorporal;//agregue codigo
    procedure GetErroresServicios();
    procedure RefrescarMangaDisp(Manga : TMangazo);
    procedure creacionGrupo;
  protected
      procedure ControlEventoOnExit(Sender: TObject);override;
  public
  end;

const
  TRESMESES=90;

var
  FEveServicioNatural: TFEveServicioNatural;

implementation

uses UDMSoftvet,UPrincipal, UAvanceTerminar, UMensajeHuella, DateUtils, UREPFichaAnimal,
     UABMPotreros, UABMEmpleados, UABMSimple, UEveSimple, UTraduccion,
  UUniversal, UNombreGrupo;

{$R *.dfm}

procedure TFEveServicioNatural.FormCreate(Sender: TObject);
begin
  inherited;
  MangaHembras.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, id_ie, nombre, apodo from vis_servicio_NaturalHembras where (CURRENT_DATE - FECHA_NACIMIENTO) >'+ IntToStr(FEdadMinima); //fecha_nacimiento, condicion_corporal
  //MangaHembras.PasarParametros(2); //aca cambie codigo
  MangaHembras.PasarParametros(2,5);
  MangaHembras.IBQSeleccionados.Close;
  MangaHembras.IBQSeleccionados.Open;

  MangaToros.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, id_ie, nombre, apodo from VIS_INGRESO_TORO where (CURRENT_DATE - FECHA_NACIMIENTO) >'+ IntToStr(FEdadMinima);// minima edad para entrar a servico y tambien saque los terneros que me mostraba
  MangaToros.PasarParametros(1,0); //aca cambie codigo //cambie codigo
  MangaToros.PasarParametros(1,6);//cambie codigo  
  MangaToros.IBQSeleccionados.Close;
  MangaToros.IBQSeleccionados.Open;

  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;

  DBLCBAResponsable.AsignarValorDefecto;
  DBLCBACondicionCorporal.AsignarValorDefecto;
  DBLCBAPotrero.AsignarValorDefecto;

  DTPAFechaFinEstimada.Date := now + TRESMESES;
  DTPAFechaInicio.Date := now;

  {Obtengo la cantidad minima de meses que debe tener una hembra para entrar a servicio sin mostrar una advertencia}
  IBQEdadAnimal.Close;
  IBQEdadAnimal.ParamByName('nombreparametro').AsString := 'MSEDADSER1';
  IBQEdadAnimal.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQEdadAnimal.Open;
  FEdadMinima := IBQEdadAnimalVALOR.AsInteger * 30;
end;

procedure TFEveServicioNatural.ATerminarExecute(Sender: TObject);

begin
//  inherited;

   CantAnimales := 0;
   Indice := 0;

   DMSoftvet.IBSP_IngresoServicio.AfterOpen := IBQSPEventoAfterOpen;
   DMSoftvet.IBSP_IngresoToro.AfterOpen := IBQSPEventoAfterOpen;

   Paso := true;
   IBQDeleteServicios.Close;
   IBQDeleteServicios.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
   IBQDeleteServicios.Open;
   chequearRN;
   if (CantidadErrores > 0) then
     MostrarMensaje(tmAdvertencia, 'Hay condiciones que impiden registrar el evento. Compruebe los valores e intente nuevamente')
   else
     if (CantidadWarnings > 0) then
       begin
         if (MostrarMensaje(tmConsulta,Traducir('Hay algunas condiciones que transgreden los parámetros del establecimiento.') + #13 +
                                       Traducir('Desea registrar los eventos de todas formas ?')) = mrYes) then
           ejecucionTerminar;
       end
     else
       ejecucionTerminar;

   DMSoftvet.IBSP_IngresoServicio.AfterOpen := nil;
   DMSoftvet.IBSP_IngresoToro.AfterOpen := nil;
end;

procedure TFEveServicioNatural.FormShow(Sender: TObject);
begin
  inherited;
  EANombre.Text := 'Servicio Natural '+DateToStr(now);
  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;
  DBLCBAPotrero.AsignarValorDefecto;
  DBLCBACondicionCorporal.KeyValue := 0;
  DBLCBACondicionCorporal.Enabled:= false;
  //DTPAFechaFinEstimada.MinDate := dateOf(DTPAFechaInicio.DateTime);
end;

procedure TFEveServicioNatural.FormActivate(Sender: TObject);
begin
  inherited;
  MangaHembras.RBTodas.Checked := true;
  MangaToros.RBTodas.Checked := true;
end;

// chequeo rn para ingresos
function TFEveServicioNatural.chequearRN: boolean;
begin
  ClearErrores;
  MangaToros.IBQSeleccionados.First;

  FAvanceTerminar := TFAvanceTerminar.Create(self);
  FAvanceTerminar.Pos := 1;
  FAvanceTerminar.Max := MangaToros.FCantidadSeleccionados + MangaHembras.FCantidadSeleccionados;
  FAvanceTerminar.Modo := maVerificando;
  FAvanceTerminar.Update;
  FAvanceTerminar.Pos := 1;

  while not(MangaToros.IBQSeleccionados.Eof)do
    begin
      IBQRNToros.Close;
      IBQRNToros.ParamByName('animal').AsInteger := MangaToros.IBQSeleccionados.fieldByName('ID_ANIMAL').AsInteger;
      IBQRNToros.ParamByName('fecha').AsDateTime := DTPAFechaInicio.DateTime;
      IBQRNToros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQRNToros.Open;
      GetErrors(IBQRNToros, MangaToros.IBQSeleccionados);

      IBSPVerificarAnimalServ.ParamByName('animal').AsInteger := MangaToros.IBQSeleccionados.FieldValues['ID_ANIMAL'];
      IBSPVerificarAnimalServ.ParamByName('inicio').AsDate := DTPAFechaInicio.Date;
      IBSPVerificarAnimalServ.ParamByName('fin').AsDate := DTPAFechaFinEstimada.Date;
      IBSPVerificarAnimalServ.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBSPVerificarAnimalServ.ParamByName('fecha_ingreso').AsDate := DTPAFechaInicio.Date;
      IBSPVerificarAnimalServ.ExecProc;

      MangaToros.IBQSeleccionados.Next;
      FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
      FAvanceTerminar.Update;
    end;

  MangaHembras.IBQSeleccionados.First;
  while not(MangaHembras.IBQSeleccionados.Eof)do
    begin
      IBQRNHembras.Close;
      IBQRNHembras.ParamByName('animal').AsInteger := MangaHembras.IBQSeleccionados.fieldByName('ID_ANIMAL').AsInteger;
      IBQRNHembras.ParamByName('fecha').AsDateTime := DTPAFechaInicio.DateTime;
      IBQRNHembras.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQRNHembras.Open;
      GetErrors(IBQRNHembras, MangaHembras.IBQSeleccionados);

      IBSPVerificarAnimalServ.ParamByName('animal').AsInteger := MangaHembras.IBQSeleccionados.FieldValues['ID_ANIMAL'];
      IBSPVerificarAnimalServ.ParamByName('inicio').AsDate := DTPAFechaInicio.Date;
      IBSPVerificarAnimalServ.ParamByName('fin').AsDate := DTPAFechaFinEstimada.Date;
      IBSPVerificarAnimalServ.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBSPVerificarAnimalServ.ParamByName('fecha_ingreso').AsDate := DTPAFechaInicio.Date;
      IBSPVerificarAnimalServ.ExecProc;

      MangaHembras.IBQSeleccionados.Next;
      FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
      FAvanceTerminar.Update;
    end;
  //FAvanceTerminar.Close;
  FAvanceTerminar.Destroy;

  try
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;

  GetErroresServicios();
  result := true;
end;

procedure TFEveServicioNatural.GetErroresServicios();
begin
  IBTAlarmaServicio.Active := true;
  IBTAlarmaServicio.First;
  while not (IBTAlarmaServicio.Eof) do
  begin
    if (IBTAlarmaServicio.FieldByName('ESTABLECIMIENTO').AsInteger = FPrincipal.EstablecimientoActual) then
    begin
      MAErrors.Lines.Add(Traducir('El animal: ')+IBTAlarmaServicio.fieldByName('RP_ANIMAL').AsString+Traducir(' se encontraba en el servicio: ')+IBTAlarmaServicio.fieldByName('SERVICIO').AsString+Traducir(', activo en esa fecha'));
      Inc(CantidadErrores);
    end;
    IBTAlarmaServicio.Next;
  end;
  IBTAlarmaServicio.Active := false;
  PError.ActivePageIndex := 0;
  PError.Visible := CantidadErrores + CantidadWarnings > 0;
end;

// recupero los errores en el caso de que hubiera
procedure TFEveServicioNatural.GetErrors(Query: TIBCustomDataSet; Seleccionados : TIBQuery );
begin
  Query.Open;
  Query.First;
  while not(Query.Eof) do
    begin
      if (Query.FieldValues['Result'] <> 'A') then
        MAErrors.Lines.Add(Query.FieldValues['Result'] + ':  '+Seleccionados.FieldByName('id_rp').AsString+': '+ Query.FieldValues['mensaje']);
      if (Query.FieldValues['Result'] = 'E') then
        inc(CantidadErrores)
      else
        if (Query.FieldValues['Result'] = 'W') then
          inc(CantidadWarnings);
      Query.Next;
    end;

  PError.ActivePageIndex := 0;
  PError.Visible := CantidadErrores + CantidadWarnings > 0;
end;

procedure TFEveServicioNatural.ClearErrores;
begin
  MAErrors.Clear;
  CantidadErrores  := 0;
  CantidadWarnings := 0;
end;

procedure TFEveServicioNatural.creacionGrupo;
var v : TFNombredelGrupo;
    fecha:string;
    FNombreGrupo : string;
begin
   fecha:=datetostr(now);

   v := TFNombredelGrupo.Create(self);
   v.ENombreGrupo.Text := PTitulo.Caption + ' ' + fecha;
   v.ShowModal;

   FNombreGrupo := v.ENombreGrupo.Text;
   IBSPCrearGrupo.ParamByName('ESTABLECIMIENTO').Value :=FPrincipal.EstablecimientoActual;
   IBSPCrearGrupo.ParamByName('NOMBREGRUPO').Value := FNombreGrupo;
   IBSPCrearGrupo.ParamByName('DESCRIPCIONGRUPO').Value := 'Creación del evento '+ FNombreGrupo;
   IBSPCrearGrupo.ParamByName('TIPO').Value :='S';
   IBSPCrearGrupo.ParamByName('TIPO_EVENTO').Value := 20;
   IBSPCrearGrupo.ParamByName('NRO_DTE').Value := 0;
   IBSPCrearGrupo.ParamByName('PATH_DTE').Value := '';
   IBSPCrearGrupo.ExecProc;

end;

procedure TFEveServicioNatural.ejecucionTerminar;
var LResult: Boolean;
    cantidad : integer;
begin
  if NOT(MangaHembras.hay_animales) OR  NOT(MangaToros.hay_animales) then
    MostrarMensaje(tmInformacion, 'Debe seleccionar Animales para crear el Servicio')
  else
   begin
      //if FAvanceTerminar=nil then
      FAvanceTerminar := TFAvanceTerminar.Create(self);
      Application.ProcessMessages;
      FAvanceTerminar.Update;
      FAvanceTerminar.Pos := 1;
      //FAvanceTerminar.Max := MangaHembras.IBQSeleccionados.RecordCount;
      FAvanceTerminar.Max := MangaToros.FCantidadSeleccionados + MangaHembras.FCantidadSeleccionados;

      FAvanceTerminar.Modo := maGuardando;

         try
          //LResult:= false;
//            DMSoftvet.IBTServicio.StartTransaction;
          // Creo el Grupo (automático por debajo del poncho) y el servicio.
          creacionGrupo;
          with DMSoftvet.IBSPGrupoServicio do
                  Begin
                     if EANombre.Text <> '' then
                     ParamByName('NOMBRE').AsString := EANombre.Text;
                     ParamByName('FECHA_INICIO').AsDate := DTPAFechaInicio.Date;
                     ParamByName('FECHA_FIN_ESTIMADA').AsDate := DTPAFechaFinEstimada.Date;
                     ParamByName('ACTIVO').AsString := 'S';
                     ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
                     ParamByName('TIPO').AsInteger := 1;
                     ParamByName('POTRERO').AsInteger := DBLCBAPotrero.KeyValue;
                     ExecProc;
                     ID_SERVICIO := ParamByName('ID_SERVICIO').asInteger;
                     ID_GRUPO  :=  ParamByName('ID_GRUPO').asInteger;
                     LResult:= true;
                     close;
                   end;

          //ciclo para animales seleccionados en la manga
          // TOROS.
          MangaToros.IBQSeleccionados.First;
          for cantidad := 1 to MangaToros.IBQSeleccionados.RecordCount do
          begin
              //inserta en Eve_Ingreso_Toro , genera el N-N con grupos y cambia la ubicación.
              with DMSoftvet.IBSP_IngresoToro do
                   Begin
                     ParamByName('FECHA').AsDate  := DTPAFechaInicio.Date;
                     ParamByName('ANIMAL').Value := MangaToros.IBQSeleccionados.FieldValues['ID_ANIMAL'];
                     ParamByName('OBSERVACION').Value     := MAObservacion.GetDato;
                     ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
                     ParamByName('RESPONSABLE').Value := DBLCBAResponsable.GetDato;
                     ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
                     ParamByName('LOG_FECHA_MODIFICADO').Value := now;
                     ParamByName('ID_GRUPO').Value   := ID_GRUPO;
                     ParamByName('SERVICIO').Value   := ID_SERVICIO;
                     ParamByName('ID_POTRERO').Value := DBLCBAPotrero.GetDato;
                     //ParamByName('tipo').Value    :=  21;
                     ExecProc;
                     LResult:= true;
                     close;
                   end;
             FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
             Application.ProcessMessages;
             MangaToros.IBQSeleccionados.Next;
          end;//fin ciclo manga toros.
          //ciclo para animales seleccionados en la manga
          // HEMBRAS.
          MangaHembras.IBQSeleccionados.First;
          for cantidad := 1 to MangaHembras.IBQSeleccionados.RecordCount do
          begin
              //inserta en Eve_Ingreso_Servicio , genera el N-N con grupos y cambia la ubicación.
              with DMSoftvet.IBSP_IngresoServicio do
                   Begin
                     ParamByName('FECHA').AsDate  := DTPAFechaInicio.Date;
                     ParamByName('ANIMAL').Value := MangaHembras.IBQSeleccionados.FieldValues['ID_ANIMAL'];
                     ParamByName('OBSERVACION').Value     := MAObservacion.GetDato;
                     ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
                     ParamByName('RESPONSABLE').Value := DBLCBAResponsable.GetDato;
                     ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
                     ParamByName('LOG_FECHA_MODIFICADO').Value := now;
                     ParamByName('ID_POTRERO').Value :=DBLCBAPotrero.KeyValue;
                     ParamByName('SERVICIO').Value :=  ID_Servicio;
                     ParamByName('CONDICION_CORPORAL').Value:= null;
                     if (DBLCBACondicionCorporal.KeyValue <> 0) then
                       ParamByName('CONDICION_CORPORAL').Value := DBLCBACondicionCorporal.KeyValue;
                     ParamByName('ID_GRUPO').Value := ID_Grupo;
                     //ParamByName('tipo').Value := 20;
                     ExecProc;
                     LResult:= true;
                     close;
                   end;
               FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
               Application.ProcessMessages;
               MangaHembras.IBQSeleccionados.Next;
          end;//fin ciclo manga hembras.
         except //del try
               LResult:= false;
         end;
         if LResult then
            begin
             FPrincipal.IBTPrincipal.CommitRetaining;
             FAvanceTerminar.Modo := maListo;
             //ShowMessage('EL Servicio fue creado con EXITO!.');
             close;
            end
           else
            begin
             FAvanceTerminar.Modo := maError;
             //ShowMessage('No se pudo crear el Servicio!.');
             FPrincipal.IBTPrincipal.RollbackRetaining;
            end;
      FAvanceTerminar.Destroy;
   end;
end;

procedure TFEveServicioNatural.ControlEventoOnExit(Sender: TObject);
begin
  inherited;
    BBTerminar.Enabled := PuedeGrabar and MangaHembras.PuedeGrabar and MangaToros.PuedeGrabar;
end;

procedure TFEveServicioNatural.controlCondicionCorporal;
begin
  DBLCBACondicionCorporal.Enabled := CBCondicionCorporal.Checked;
  if (not DBLCBACondicionCorporal.Enabled) then
    DBLCBACondicionCorporal.KeyValue := null;
end;


procedure TFEveServicioNatural.CBCondicionCorporalClick(Sender: TObject);
begin
  inherited;
  controlCondicionCorporal;
end;

procedure TFEveServicioNatural.CBCondicionCorporalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  controlCondicionCorporal;
end;

procedure TFEveServicioNatural.DTPAFechaInicioCloseUp(Sender: TObject);
begin
  inherited;
  //DTPAFechaFinEstimada.MinDate := dateOf(DTPAFechaInicio.DateTime);
  DTPAFechaFinEstimada.Date:=DTPAFechaInicio.Date + TRESMESES;
end;

procedure TFEveServicioNatural.DTPAFechaInicioChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;

  //DTPAFechaFinEstimada.MinDate := dateOf(DTPAFechaInicio.DateTime);
    DTPAFechaFinEstimada.Date:=DTPAFechaInicio.Date + TRESMESES;
end;

procedure TFEveServicioNatural.DTPAFechaFinEstimadaChange(Sender: TObject);
begin
  inherited;
  //DTPAFechaInicio.MaxDate := DTPAFechaFinEstimada.DateTime;
  if(DTPAFechaFinEstimada.Date < DTPAFechaInicio.Date) then
     DTPAFechaFinEstimada.Date:= DTPAFechaInicio.Date + TRESMESES;
end;

procedure TFEveServicioNatural.MangaHembrasBDBGDisponiblesDblClick(
  Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (MangaHembras.BDBGDisponibles.SelectedIndex = MangaHembras.BDBGDisponibles.ColumnByField('id_rp').Index) then
  begin
    if not(MangaHembras.BDBGDisponibles.DataSource.DataSet.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := MangaHembras.BDBGDisponibles.DataSource.DataSet.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
    RefrescarMangaDisp(MangaHembras);
  end;
end;

procedure TFEveServicioNatural.MangaTorosBDBGDisponiblesDblClick(
  Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (MangaToros.BDBGDisponibles.SelectedIndex = MangaToros.BDBGDisponibles.ColumnByField('id_rp').Index) then
  begin
    if not(MangaToros.BDBGDisponibles.DataSource.DataSet.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := MangaToros.BDBGDisponibles.DataSource.DataSet.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
    RefrescarMangaDisp(MangaToros);
  end;
end;

procedure TFEveServicioNatural.RefrescarMangaDisp(Manga : TMangazo);
begin

end;

procedure TFEveServicioNatural.LResponsableClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      FPrincipal.AbrirFormNormal(TFABMEmpleados.Create(self));
      DMSoftvet.IBQResponsable.Close;
      DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQResponsable.Open;
      if nroID>0 then
        begin
        DBLCBAResponsable.KeyValue:=nroID;
        nroID:=-1;
        end;
    end;  
end;

procedure TFEveServicioNatural.LPotreroClick(Sender: TObject);
var
  abm : TFABMPotreros;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      abm := TFABMPotreros.Create(self);
      abm.Abrir(faAbm);
      DMSoftvet.IBQPotrero.Close;
      DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQPotrero.Open;
      if nroID>-1 then
        begin
          DBLCBAPotrero.KeyValue:=nroID;
          nroID:=-1;
        end;
    end;
end;

procedure TFEveServicioNatural.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;  
end;

procedure TFEveServicioNatural.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveServicioNatural.LPotreroMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LPotrero.Font.Color:= $00606C02;
      LPotrero.Font.Style:= [fsBold,fsUnderline];
    end;  
end;

procedure TFEveServicioNatural.LPotreroMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LPotrero.Font.Color:= clWindowText;
      LPotrero.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveServicioNatural.MangaHembrasBDBGDisponiblesKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (key=#13) then
    MangaHembrasBDBGDisponiblesDblClick(nil);
end;

procedure TFEveServicioNatural.MangaTorosBDBGDisponiblesKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (key=#13) then
    MangaTorosBDBGDisponiblesDblClick(nil);
end;

procedure TFEveServicioNatural.MangaTorosCBAnimalClick(Sender: TObject);
begin
  inherited;
  MangaToros.CBClick(Sender);

end;

procedure TFEveServicioNatural.PCBasicoChange(Sender: TObject);
begin
  inherited;
  TSHDatos.ImageIndex := 8;
  if(PCBasico.ActivePage = TSHDatos)then
    TSHDatos.ImageIndex := 1;

  TSToros.ImageIndex := 9;
  if(PCBasico.ActivePage = TSToros)then
    TSToros.ImageIndex := 2;

  TSHObservacion.ImageIndex := 16;
  if(PCBasico.ActivePage = TSHObservacion)then
    TSHObservacion.ImageIndex := 14;
end;

procedure TFEveServicioNatural.MangaHembrasBDBGSeleccionadosDblClick(
  Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (MangaHembras.BDBGSeleccionados.SelectedIndex = MangaHembras.BDBGSeleccionados.ColumnByField('id_rp').Index) then
  begin
    if not(MangaHembras.BDBGSeleccionados.DataSource.DataSet.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := MangaHembras.BDBGSeleccionados.DataSource.DataSet.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
    RefrescarMangaDisp(MangaHembras);
  end;
end;

procedure TFEveServicioNatural.MangaTorosBDBGSeleccionadosDblClick(
  Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (MangaToros.BDBGSeleccionados.SelectedIndex = MangaToros.BDBGSeleccionados.ColumnByField('id_rp').Index) then
  begin
    if not(MangaToros.BDBGSeleccionados.DataSource.DataSet.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := MangaToros.BDBGSeleccionados.DataSource.DataSet.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
    RefrescarMangaDisp(MangaToros);
  end;
end;


procedure TFEveServicioNatural.MangaHembrasBBEliminarUnoClick(
  Sender: TObject);
begin
  inherited;
  MangaHembras.BBEliminarUnoClick(Sender);
end;

procedure TFEveServicioNatural.MangaHembrasBBEliminarUnoMouseEnter(
  Sender: TObject);
begin
  inherited;
  MangaHembras.BBEliminarUnoMouseEnter(Sender);
end;

procedure TFEveServicioNatural.MangaHembrasBBEliminarUnoMouseLeave(
  Sender: TObject);
begin
  inherited;
  MangaHembras.BBEliminarUnoMouseLeave(Sender);
end;

end.
