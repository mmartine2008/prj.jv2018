unit UEveServicioCorral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveIndividual, DB, IBCustomDataSet, IBQuery, ActnList, Tabs,
  ComCtrls, StdCtrls, MemoAuto, Buttons, ExtCtrls,  Grids,
  DBGrids, UBDBGrid, DBCtrls, UDBLookupComboBoxAuto, EditAuto,
  DateTimePickerAuto, UFrameMangazo, IBStoredProc, DataExport, DataToXLS,
  WinXP, ImgList, PngImageList, JvExControls, JvLabel, PngImage,
  JvExExtCtrls, JvImage, jpeg, JvGIF, UClassType;

type
  TFEveServicioCorral = class(TFEveIndividual)
    TabSheet1: TTabSheet;
    MangaHembras: TMangazo;
    MangaMachos: TMangazo;
    IBQEdadAnimal: TIBQuery;
    IBQEdadAnimalVALOR: TIBStringField;
    GBDatos: TGroupBox;
    LNombre: TLabel;
    LFechaInicio: TLabel;
    DTPAFechaInicio: TDateTimePickerAuto;
    EANombre: TEditAuto;
    LResponsable: TLabel;
    LCondicionCorporal: TLabel;
    LPotrero: TLabel;
    DBLCBAPotrero: TDBLookupComboBoxAuto;
    DBLCBACondicionCorporal: TDBLookupComboBoxAuto;
    CBCondicionCorporal: TCheckBox;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    LObservaciones: TLabel;
    JvIAyuda: TJvImage;
    LAyuda: TLabel;
    TSHDetalle: TTabSheet;
    BDBGSimple: TBitDBGrid;
    IBDSSimple: TIBDataSet;
    DSSimple: TDataSource;
    IBQDelAux: TIBQuery;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRP_MADRE: TIBStringField;
    IBDSSimpleHBA_MADRE: TIBStringField;
    IBDSSimpleRP_PADRE: TIBStringField;
    IBDSSimpleHBA_PADRE: TIBStringField;
    IBDSSimplePOTRERO: TIntegerField;
    IBDSSimpleCONDICION_CORPORAL: TIntegerField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleID_PADRE: TIntegerField;
    IBDSSimpleID_MADRE: TIntegerField;
    IBDSSimpleESTABLECIMIENTO: TIntegerField;
    IBDSSimplePOTRERO_NOMBRE: TIBStringField;
    IBDSSimpleRESPONSABLE_NOMBRE: TIBStringField;
    IBDSSimpleCOND_CORP_VALOR: TFloatField;
    IBQDatosAnimal: TIBQuery;
    DSPadres: TDataSource;
    IBQPadres: TIBQuery;
    IBQPadresRP_PADRE: TIBStringField;
    IBQPadresID_SENASA: TIBStringField;
    IBQPadresID_ANIMAL: TIntegerField;
    IBQPadresID_PC: TIBStringField;
    IBQPadresID_HBA: TIBStringField;
    IBQPadresID_OTRO: TIBStringField;
    IBQPadresNOMBRE: TIBStringField;
    IBQPadresAPODO: TIBStringField;
    IBQuerySelPotreroEvento: TIBQuery;
    DataSourceSelPotreroEvento: TDataSource;
    IBSPCrearGrupo: TIBStoredProc;
    IBSPCrearGrupoIDNUEVOGRUPO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ejecucionTerminar;
    function chequearRN:boolean;
    procedure GetErrors(Query : TIBQuery; Seleccionados : TIBQuery);
    procedure CBCondicionCorporalClick(Sender: TObject);
    procedure CBCondicionCorporalKeyPress(Sender: TObject; var Key: Char);
    procedure MangaMachosBDBGDisponiblesDblClick(Sender: TObject);
    procedure MangaHembrasBDBGDisponiblesDblClick(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure DTPAFechaInicioChange(Sender: TObject);
    procedure MangaMachosBBAgregarUnoClick(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure LPotreroMouseEnter(Sender: TObject);
    procedure LPotreroMouseLeave(Sender: TObject);
    procedure LPotreroClick(Sender: TObject);
    procedure MangaHembrasBDBGDisponiblesKeyPress(Sender: TObject;
      var Key: Char);
    procedure MangaMachosBDBGDisponiblesKeyPress(Sender: TObject;
      var Key: Char);
    procedure MangaMachosBBEliminarUnoClick(Sender: TObject);
    procedure MangaMachosBBAgregarTodosClick(Sender: TObject);
    procedure MangaHembrasBBAgregarUnoClick(Sender: TObject);
    procedure MangaHembrasBBAgregarTodosClick(Sender: TObject);
    procedure IBDSSimplePOTRERO_NOMBRESetText(Sender: TField;
      const Text: String);
    procedure MangaHembrasBDBGSeleccionadosDblClick(Sender: TObject);
    procedure MangaMachosBDBGSeleccionadosDblClick(Sender: TObject);

  private
    ID_SERVICIO:integer;
    ID_GRUPO:integer;
    FEdadMinima: integer;
    SQLStringList: TStringList;
    procedure ClearErrores;
    procedure controlCondicionCorporal;//agregue codigo
    procedure RefrescarMangaDisp(Manga : TMangazo);

    procedure CargarStringList();
    procedure FillPickList(const campo: string; const Qry: TDataSet);
    procedure CargarPickListEnGrilla;    

    procedure CargarGrillaDetalle;
    procedure creacionGrupo;
  protected
      procedure ControlEventoOnExit(Sender: TObject);override;
  public
    SinMangaMadre : boolean;
    id_madre : integer;
    id_potreroaux: Integer;
  end;

var
  FEveServicioCorral: TFEveServicioCorral;

implementation

uses UDMSoftvet, UPrincipal, UAvanceTerminar, UMensajeHuella, UREPFichaAnimal,
     UABMEmpleados, UABMPotreros, UABMSimple, UEveSimple, UTraduccion, UNombreGrupo;

{$R *.dfm}

procedure TFEveServicioCorral.FormCreate(Sender: TObject);
begin
  inherited;
  MangaHembras.ActualizarLosQuery;
  MangaMachos.ActualizarLosQuery;
  MangaHembras.EsSimple := false;
  MangaMachos.EsSimple := true;

  {Obtengo la cantidad minima de meses que debe tener una hembra para entrar a servicio sin mostrar una advertencia}
  IBQEdadAnimal.Close;
  IBQEdadAnimal.ParamByName('nombreparametro').AsString := 'MSEDADSER1';
  IBQEdadAnimal.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQEdadAnimal.Open;
  FEdadMinima := IBQEdadAnimalVALOR.AsInteger*30;

  MangaHembras.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, id_ie, condicion_corporal, nombre, apodo from vis_servicio_CorralHembras where (CURRENT_DATE - FECHA_NACIMIENTO) >'+ IntToStr(FEdadMinima);
  MangaMachos.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, id_ie, nombre, apodo from VIS_INGRESO_TORO where (CURRENT_DATE - FECHA_NACIMIENTO) >'+ IntToStr(FEdadMinima);// minima edad para entrar a servico
end;

procedure TFEveServicioCorral.FormShow(Sender: TObject);
begin
    inherited;
    IBQuerySelPotreroEvento.Close;
    if (id_potreroaux <> 0) then
    begin
      IBQuerySelPotreroEvento.SQL.clear;
      IBQuerySelPotreroEvento.SQL.Add('select * from TAB_POTREROS where establecimiento = :ESTABLECIMIENTO and visible = 1 and id_potrero = :id_potreroaux');
      IBQuerySelPotreroEvento.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      IBQuerySelPotreroEvento.ParamByName('id_potreroaux').AsInteger := id_potreroaux;
    end
    else
    begin
      IBQuerySelPotreroEvento.SQL.clear;
      IBQuerySelPotreroEvento.SQL.Add('select * from TAB_POTREROS where establecimiento = :ESTABLECIMIENTO and visible = 1');
      IBQuerySelPotreroEvento.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    end;

    IBQuerySelPotreroEvento.Open;
    IBQuerySelPotreroEvento.Last;
    IBQuerySelPotreroEvento.First;
    
//    MangaHembras.PasarParametros(2);// aca cambie codigo
    MangaHembras.PasarParametros(2,5);//cambie codigo
//    MangaMachos.PasarParametros(1);
    MangaMachos.PasarParametros(1,6);//cambie codigo
    MangaMachos.ControlarBotones;
    MangaHembras.ControlarBotones;
    DMSoftvet.IBQPotrero.Close;
    DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQPotrero.Open;
    DBLCBAPotrero.AsignarValorDefecto;
    DMSoftvet.IBQResponsable.Close;
    DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQResponsable.Open;
    DBLCBAResponsable.AsignarValorDefecto;
    DBLCBACondicionCorporal.AsignarValorDefecto;

    DBLCBACondicionCorporal.KeyValue := 0;
    DBLCBACondicionCorporal.Enabled:= false;

    DTPAFechaInicio.Date := now;
    //DTPAFechaInicio.MaxDate:= now;
    EANombre.Text := 'Servicio Corral '+DateToStr(now);

    MangaHembras.Inic_Filtros;
    MangaMachos.Inic_Filtros;


    if (SinMangaMadre) then
    begin
      TSHDatos.TabVisible := false;
      IBQDatosAnimal.Close;
      IBQDatosAnimal.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQDatosAnimal.ParamByName('id').AsInteger := id_madre;
      IBQDatosAnimal.Open;
    end;
end;

procedure TFEveServicioCorral.ATerminarExecute(Sender: TObject);
begin
   Paso := true;
//  inherited;
   CantAnimales := 0;
   Indice := 0;

   DMSoftvet.IBSP_IngresoServicio.AfterOpen := IBQSPEventoAfterOpen;
   DMSoftvet.IBSP_IngresoToro.AfterOpen := IBQSPEventoAfterOpen;

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

procedure TFEveServicioCorral.FormActivate(Sender: TObject);
begin
  inherited;
  MangaHembras.RBTodas.Checked := true;
  MangaMachos.RBTodas.Checked := true;

//  CargarStringList;
end;


procedure TFEveServicioCorral.creacionGrupo ;
var v : TFNombredelGrupo;
    fecha:string;
    FNombreGrupo : string;
begin
   fecha:=datetostr(DTPAFechaInicio.Date);

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



procedure TFEveServicioCorral.ejecucionTerminar;
var LResult: Boolean;
    cantidad : integer;
begin
    FAvanceTerminar := TFAvanceTerminar.Create(self);

    creacionGrupo;

    IBDSSimple.Close;
    IBDSSimple.Open;
    IBDSSimple.First;

{    if NOT(MangaHembras.hay_animales) OR  NOT(MangaMachos.hay_animales) then
      MostrarMensaje(tmError, 'Faltan Seleccionar Animales para poder crear el Servicio')
    else
    begin    }
      Application.ProcessMessages;
      FAvanceTerminar.Update;
      FAvanceTerminar.Pos := 1;
      FAvanceTerminar.Max := MangaMachos.FCantidadSeleccionados + MangaHembras.FCantidadSeleccionados;;
      FAvanceTerminar.Modo := maGuardando;

      while not(IBDSSimple.Eof) do
      begin
          try


              with DMSoftvet.IBSPGrupoServicio do
              Begin
                  if EANombre.Text <> '' then
                      ParamByName('NOMBRE').AsString := EANombre.Text;

                  ParamByName('FECHA_INICIO').AsDate := DTPAFechaInicio.Date;
                  ParamByName('FECHA_FIN_ESTIMADA').AsDate := DTPAFechaInicio.Date;
                  ParamByName('ACTIVO').AsString := 'N';
                  ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
                  ParamByName('TIPO').AsInteger := 2;
                  ParamByName('POTRERO').Value := DBLCBAPotrero.KeyValue;
                  ExecProc;
                  ID_SERVICIO := ParamByName('ID_SERVICIO').asInteger;
                  ID_GRUPO  :=  ParamByName('ID_GRUPO').asInteger;
                  LResult:= true;
                  close;
              end;

          //ciclo para animales seleccionados en la manga
          // TOROS.

              with DMSoftvet.IBSP_IngresoToro do
              Begin
                ParamByName('FECHA').AsDate  := IBDSSimple.FieldValues['fecha'];
                ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_padre'];
                ParamByName('OBSERVACION').Value     := MAObservacion.GetDato;
                ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
                ParamByName('RESPONSABLE').Value := IBDSSimple.FieldValues['responsable'];
                ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
                ParamByName('LOG_FECHA_MODIFICADO').Value := now;
                ParamByName('ID_GRUPO').Value   := ID_GRUPO;
                ParamByName('SERVICIO').Value   := ID_SERVICIO;
                ParamByName('ID_POTRERO').Value := IBDSSimple.FieldValues['potrero'];
                ExecProc;
                LResult:= true;
                close;
              end;
              FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
              Application.ProcessMessages;

          //ciclo para animales seleccionados en la manga
          // HEMBRAS.
          //inserta en Eve_Ingreso_Servicio , genera el N-N con grupos y cambia la ubicación.
              with DMSoftvet.IBSP_IngresoServicio do
              Begin
                ParamByName('FECHA').AsDate  := IBDSSimple.FieldValues['fecha'];
                ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_madre'];
                ParamByName('OBSERVACION').Value     := MAObservacion.GetDato;
                ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
                ParamByName('RESPONSABLE').Value := IBDSSimple.FieldValues['responsable'];
                ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
                ParamByName('LOG_FECHA_MODIFICADO').Value := now;
                ParamByName('ID_POTRERO').Value := IBDSSimple.FieldValues['potrero'];
                ParamByName('SERVICIO').Value :=  ID_Servicio;
                ParamByName('CONDICION_CORPORAL').Value := null;
                if (IBDSSimple.FieldValues['condicion_corporal'] <> null) then
                  if (IBDSSimple.FieldValues['condicion_corporal'] <> 0) then
                    ParamByName('CONDICION_CORPORAL').Value:= IBDSSimple.FieldValues['condicion_corporal'];

                ParamByName('ID_GRUPO').Value := ID_Grupo;
                ExecProc;
                LResult:= true;
                close;
              end;
              FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
              Application.ProcessMessages;
          except //del try
              LResult:= false;
          end;

          IBDSSimple.Next;
      end;
      if LResult then
      begin
        FPrincipal.IBTPrincipal.CommitRetaining;
        FAvanceTerminar.Modo := maListo;
        close;
      end
      else
      begin
        FAvanceTerminar.Modo := maError;
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
//    end;
    FAvanceTerminar.Destroy;

{    FAvanceTerminar := TFAvanceTerminar.Create(self);
    if NOT(MangaHembras.hay_animales) OR  NOT(MangaMachos.hay_animales) then
      MostrarMensaje(tmError, 'Faltan Seleccionar Animales para poder crear el Servicio')
    else
    begin
      try
          Application.ProcessMessages;
          FAvanceTerminar.Update;
          FAvanceTerminar.Pos := 1;
          FAvanceTerminar.Max := MangaMachos.FCantidadSeleccionados + MangaHembras.FCantidadSeleccionados;;

          FAvanceTerminar.Modo := maGuardando;
          //LResult:= false;
          //DMSoftvet.IBTServicio.StartTransaction;
          // Creo el Grupo (automático por debajo del poncho) y el servicio.
          with DMSoftvet.IBSPGrupoServicio do
          Begin
            if EANombre.Text <> '' then
              ParamByName('NOMBRE').AsString := EANombre.Text;
            ParamByName('FECHA_INICIO').AsDate := DTPAFechaInicio.Date;
            ParamByName('FECHA_FIN_ESTIMADA').AsDate := DTPAFechaInicio.Date;
            ParamByName('ACTIVO').AsString := 'N';
            ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
            ParamByName('TIPO').AsInteger := 2;
            ParamByName('POTRERO').Value := DBLCBAPotrero.KeyValue;
            ExecProc;
            ID_SERVICIO := ParamByName('ID_SERVICIO').asInteger;
            ID_GRUPO  :=  ParamByName('ID_GRUPO').asInteger;
            LResult:= true;
            close;
          end;

          //ciclo para animales seleccionados en la manga
          // TOROS.
          MangaMachos.IBQSeleccionados.First;
          for cantidad := 1 to MangaMachos.IBQSeleccionados.RecordCount do
          begin
              //inserta en Eve_Ingreso_Toro , genera el N-N con grupos y cambia la ubicación.
              with DMSoftvet.IBSP_IngresoToro do
              Begin
                ParamByName('FECHA').AsDate  := DTPAFechaInicio.Date;
                ParamByName('ANIMAL').Value := MangaMachos.IBQSeleccionados.FieldValues['ID_ANIMAL'];
                ParamByName('OBSERVACION').Value     := MAObservacion.GetDato;
                ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
                ParamByName('RESPONSABLE').Value := DBLCBAResponsable.GetDato;
                ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
                ParamByName('LOG_FECHA_MODIFICADO').Value := now;
                ParamByName('ID_GRUPO').Value   := ID_GRUPO;
                ParamByName('SERVICIO').Value   := ID_SERVICIO;
                ParamByName('ID_POTRERO').Value := DBLCBAPotrero.GetDato;
                ExecProc;
                LResult:= true;
                close;
              end;
              FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
              Application.ProcessMessages;
              MangaMachos.IBQSeleccionados.Next;
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
                if (DBLCBACondicionCorporal.KeyValue <> 0) then // agregue codigo
                  ParamByName('CONDICION_CORPORAL').Value := DBLCBACondicionCorporal.KeyValue;
                ParamByName('ID_GRUPO').Value := ID_Grupo;
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
        //ShowMessage('EL Servicio fue creado con EXITO!.');
        FAvanceTerminar.Modo := maListo;
        close;
      end
      else
      begin
        //ShowMessage('No se pudo crear el Servicio!.');
        FAvanceTerminar.Modo := maError;
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
    FAvanceTerminar.Destroy; }
end;

// chequeamos rn de los ingresos
function TFEveServicioCorral.chequearRN: boolean;
begin
  ClearErrores;
  MangaMachos.IBQSeleccionados.First;

  {if FAvanceTerminar=nil then}
  FAvanceTerminar := TFAvanceTerminar.Create(self);
  FAvanceTerminar.Pos := 1;
  FAvanceTerminar.Max := MangaMachos.FCantidadSeleccionados + MangaHembras.FCantidadSeleccionados;
  FAvanceTerminar.Modo := maVerificando;
  FAvanceTerminar.Update;
  FAvanceTerminar.Pos := 1;

  while not(MangaMachos.IBQSeleccionados.Eof)do
    begin
      IBQRNToros.Close;
      IBQRNToros.ParamByName('animal').AsInteger := MangaMachos.IBQSeleccionados.fieldByName('ID_ANIMAL').AsInteger;
      IBQRNToros.ParamByName('fecha').AsDateTime := DTPAFechaInicio.DateTime;
      IBQRNToros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQRNToros.Open;
      GetErrors(IBQRNToros, MangaMachos.IBQSeleccionados);
      MangaMachos.IBQSeleccionados.Next;
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
      MangaHembras.IBQSeleccionados.Next;
      FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
      FAvanceTerminar.Update;
    end;

  //FAvanceTerminar.Close;
  FAvanceTerminar.Destroy;

  result := true;
end;

procedure TFEveServicioCorral.ClearErrores;
begin
  MAErrors.Clear;
  CantidadErrores  := 0;
  CantidadWarnings := 0;
end;

procedure TFEveServicioCorral.GetErrors(Query, Seleccionados: TIBQuery);
begin
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

procedure TFEveServicioCorral.controlCondicionCorporal;
begin
  DBLCBACondicionCorporal.Enabled := CBCondicionCorporal.Checked;
  if (not DBLCBACondicionCorporal.Enabled) then
    DBLCBACondicionCorporal.KeyValue := null;
end;

procedure TFEveServicioCorral.CBCondicionCorporalClick(Sender: TObject);
begin
  inherited;
  controlCondicionCorporal;
end;

procedure TFEveServicioCorral.CBCondicionCorporalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  controlCondicionCorporal;
end;

procedure TFEveServicioCorral.MangaMachosBDBGDisponiblesDblClick(
  Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (MangaMachos.BDBGDisponibles.SelectedIndex = MangaMachos.BDBGDisponibles.ColumnByField('id_rp').Index) then
  begin
    if not(MangaMachos.IBQDisponibles.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := MangaMachos.IBQDisponibles.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
    RefrescarMangaDisp(MangaMachos);
  end;
end;

procedure TFEveServicioCorral.MangaHembrasBDBGDisponiblesDblClick(
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

procedure TFEveServicioCorral.PCBasicoChange(Sender: TObject);
begin
  inherited;
  if(PCBasico.ActivePage = TSHObservacion)then
    begin
      EANombre.SetFocus;
      EANombre.SelectAll;
    end;
  TSHDatos.ImageIndex := 8;
  if(PCBasico.ActivePage = TSHDatos)then
    TSHDatos.ImageIndex := 1;

  TabSheet1.ImageIndex := 9;
  if(PCBasico.ActivePage = TabSheet1)then
    TabSheet1.ImageIndex := 2;

  TSHObservacion.ImageIndex := 16;
  if(PCBasico.ActivePage = TSHObservacion)then
    TSHObservacion.ImageIndex := 14;

  if (PCBasico.ActivePage = TSHDetalle) then
  begin
      try
       IBQDelAux.Close;
       IBQDelAux.Open;

       IBQPadres.Close;
       IBQPadres.ParamByName('edadMinima').AsInteger := FEdadMinima;
       IBQPadres.Open;

       CargarStringList;

       FPrincipal.IBTPrincipal.CommitRetaining;

       IBDSSimple.Close;
       IBDSSimple.Open;
       
       CargarGrillaDetalle;

       FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;

      IBDSSimple.Edit;
  end;
end;

procedure TFEveServicioCorral.DTPAFechaInicioChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;

end;

procedure TFEveServicioCorral.RefrescarMangaDisp(Manga : TMangazo);
begin

end;

procedure TFEveServicioCorral.MangaMachosBBAgregarUnoClick(
  Sender: TObject);
begin
  MangaMachos.IBQDisponibles.OnFilterRecord := nil;
  inherited;
  MangaMachos.BBAgregarUnoClick(Sender);
  //MangaMachos.IBQDisponibles.OnFilterRecord := MangaMachos.IBQDisponiblesFilterRecord;
end;

procedure TFEveServicioCorral.LResponsableClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      FPrincipal.AbrirFormNormal(TFABMEmpleados.Create(self));
      DMSoftvet.IBQResponsable.Close;
      DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQResponsable.Open;
      if nroID>-1 then
        begin
        DBLCBAResponsable.KeyValue:=nroID;
        nroID:=-1;
        end;
    end;
end;

procedure TFEveServicioCorral.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;  
end;

procedure TFEveServicioCorral.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveServicioCorral.LPotreroMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LPotrero.Font.Color:= $00606C02;
      LPotrero.Font.Style:= [fsBold,fsUnderline];
    end;  
end;

procedure TFEveServicioCorral.LPotreroMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LPotrero.Font.Color:= clWindowText;
      LPotrero.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveServicioCorral.LPotreroClick(Sender: TObject);
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

procedure TFEveServicioCorral.MangaHembrasBDBGDisponiblesKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (key=#13) then
    MangaHembrasBDBGDisponiblesDblClick(nil);
end;

procedure TFEveServicioCorral.MangaMachosBDBGDisponiblesKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (key=#13) then
    MangaMachosBDBGDisponiblesDblClick(nil);
end;

procedure TFEveServicioCorral.ControlEventoOnExit(Sender: TObject);
begin
  inherited;
    BBTerminar.Enabled := PuedeGrabar and MangaHembras.PuedeGrabar and MangaMachos.PuedeGrabar;
end;

procedure TFEveServicioCorral.MangaMachosBBEliminarUnoClick(
  Sender: TObject);
begin
  inherited;
  MangaMachos.BBEliminarUnoClick(Sender);

end;

procedure TFEveServicioCorral.MangaMachosBBAgregarTodosClick(
  Sender: TObject);
begin
  inherited;
  MangaMachos.BBAgregarTodosClick(Sender);

end;

procedure TFEveServicioCorral.MangaHembrasBBAgregarUnoClick(
  Sender: TObject);
begin
  inherited;
  MangaHembras.BBAgregarUnoClick(Sender);

end;

procedure TFEveServicioCorral.MangaHembrasBBAgregarTodosClick(
  Sender: TObject);
begin
  inherited;
  MangaHembras.BBAgregarTodosClick(Sender);

end;

procedure TFEveServicioCorral.CargarGrillaDetalle;
begin
      if (SinMangaMadre) then
      begin
        IBDSSimple.Insert;

        IBDSSimple.FieldByName('fecha').Value := DTPAFechaInicio.Date;

        IBDSSimple.FieldByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;

        IBDSSimple.FieldByName('rp_madre').AsString := IBQDatosAnimal.FieldValues['id_rp'];

          if (IBQDatosAnimal.FieldValues['ID_hba'] <> null) then
             IBDSSimple.FieldByName('hba_madre').AsString := IBQDatosAnimal.FieldValues['ID_hba']
          else
             IBDSSimple.FieldByName('hba_madre').AsString := '';

        IBDSSimple.FieldByName('rp_padre').AsString := MangaMachos.IBQSeleccionados.FieldValues['ID_rp'];

        if (MangaMachos.IBQSeleccionados.FieldValues['ID_hba'] <> null) then
          IBDSSimple.FieldByName('hba_padre').AsString := MangaMachos.IBQSeleccionados.FieldValues['ID_hba']
        else
          IBDSSimple.FieldByName('hba_padre').AsString := '';

        IBDSSimple.FieldByName('potrero').AsInteger := DBLCBAPotrero.KeyValue;
        IBDSSimple.FieldByName('potrero_nombre').AsString := DBLCBAPotrero.Text;

        if (DBLCBACondicionCorporal.KeyValue <> null) then
        begin
          IBDSSimple.FieldByName('condicion_corporal').AsInteger := DBLCBACondicionCorporal.KeyValue;
          IBDSSimple.FieldByName('cond_corp_valor').AsString := DBLCBACondicionCorporal.Text;
        end
        else
          IBDSSimple.FieldByName('condicion_corporal').AsInteger := null;

        IBDSSimple.FieldByName('responsable').AsInteger := DBLCBAResponsable.KeyValue;
        IBDSSimple.FieldByName('responsable_nombre').AsString := DBLCBAResponsable.Text;

        IBDSSimple.FieldByName('id_padre').AsInteger := MangaMachos.IBQSeleccionados.FieldValues['id_animal'];
        IBDSSimple.FieldByName('id_madre').AsInteger := id_madre;

        IBDSSimple.Post;
      end
      else
      begin
          MangaHembras.IBQSeleccionados.First;

          while not(MangaHembras.IBQSeleccionados.Eof) do
          begin

              IBDSSimple.Insert;

              IBDSSimple.FieldByName('fecha').Value := DTPAFechaInicio.Date;

              IBDSSimple.FieldByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;


              IBDSSimple.FieldByName('rp_madre').AsString := MangaHembras.IBQSeleccionados.FieldValues['ID_rp'];

              if (MangaHembras.IBQSeleccionados.FieldValues['ID_hba'] <> null) then
                 IBDSSimple.FieldByName('hba_madre').AsString := MangaHembras.IBQSeleccionados.FieldValues['ID_hba']
              else
                 IBDSSimple.FieldByName('hba_madre').AsString := '';

              IBDSSimple.FieldByName('rp_padre').AsString := MangaMachos.IBQSeleccionados.FieldValues['ID_rp'];

              if (MangaMachos.IBQSeleccionados.FieldValues['ID_hba'] <> null) then
                  IBDSSimple.FieldByName('hba_padre').AsString := MangaMachos.IBQSeleccionados.FieldValues['ID_hba']
              else
                  IBDSSimple.FieldByName('hba_padre').AsString := '';

              IBDSSimple.FieldByName('potrero').AsInteger := DBLCBAPotrero.KeyValue;
              IBDSSimple.FieldByName('potrero_nombre').AsString := DBLCBAPotrero.Text;

              if (DBLCBACondicionCorporal.KeyValue <> null) then
              begin
                IBDSSimple.FieldByName('condicion_corporal').AsInteger := DBLCBACondicionCorporal.KeyValue;
                IBDSSimple.FieldByName('cond_corp_valor').AsString := DBLCBACondicionCorporal.Text;
              end
              else
                IBDSSimple.FieldByName('condicion_corporal').AsInteger := null;

              IBDSSimple.FieldByName('responsable').AsInteger := DBLCBAResponsable.KeyValue;
              IBDSSimple.FieldByName('responsable_nombre').AsString := DBLCBAResponsable.Text;

              IBDSSimple.FieldByName('id_padre').AsInteger := MangaMachos.IBQSeleccionados.FieldValues['id_animal'];
              IBDSSimple.FieldByName('id_madre').AsInteger := MangaHembras.IBQSeleccionados.FieldValues['id_animal'];

              IBDSSimple.Post;
              MangaHembras.IBQSeleccionados.Next;
          end;
      end;
end;

procedure TFEveServicioCorral.CargarPickListEnGrilla;
var i: integer;
begin
  for i := 0 to SQLStringList.Count -1 do
   if not((TDataSource(SQLStringList.Objects[i]).DataSet).IsEmpty)then
     FillPickList(SQLStringList.Strings[i], TDataSource(SQLStringList.Objects[i]).DataSet);
end;

(*
  Llena cada uno de los PickList de la Grilla Detalle
*)
procedure TFEveServicioCorral.FillPickList(const campo: string; const Qry: TDataSet);
var slPickList: TStringList;
    i:integer;
    aux:integer;
begin
  slPickList:= TStringList.Create;
  try
   Qry.First;
    while not (Qry.Eof) do
    begin
     if (TryStrToInt(Qry.Fields[0].AsString,aux)) then
        slPickList.AddObject(Qry.Fields[1].AsString, TClassType.CreateClassTypeInteger(Qry.Fields[0].AsInteger))
     else
        slPickList.AddObject(Qry.Fields[1].AsString, TClassType.CreateClassTypeString(Qry.Fields[0].AsString));
      Qry.Next;
    end;
    for i:= 0 to BDBGSimple.Columns.Count - 1 do
      if(BDBGSimple.Columns[i].FieldName = campo)then
      begin
         BDBGSimple.Columns[i].PickList := slPickList;
         break;
      end;
  finally
    slPickList.Free;
  end;
end;

procedure TFEveServicioCorral.CargarStringList;
begin
  SQLStringList:= TStringList.Create;
  SQLStringList.AddObject('RP_PADRE',TObject(DSPadres));  
  SQLStringList.AddObject('POTRERO_NOMBRE',TObject(DMSoftvet.DSPotrerosVacios));
  SQLStringList.AddObject('COND_CORP_VALOR',TObject(DMSoftvet.DSCondicionCorporal));
  SQLStringList.AddObject('RESPONSABLE_NOMBRE',TObject(DMSoftvet.DSResponsable));

  CargarPickListEnGrilla;  
end;

procedure TFEveServicioCorral.IBDSSimplePOTRERO_NOMBRESetText(Sender: TField; const Text: String);
var PickPos:integer;
begin
  inherited;
    if (IBDSSimple.State <> dsInsert) then
    begin
        if(Sender.FieldName = 'POTRERO_NOMBRE')then
         begin
          IBDSSimplePOTRERO_NOMBRE.AsString := Text;
          PickPos := BDBGSimple.ColumnByField('POTRERO_NOMBRE').PickList.IndexOf(BDBGSimple.ColumnByField('POTRERO_NOMBRE').Field.AsString);
          IBDSSimplePOTRERO.AsInteger := TClassType(BDBGSimple.ColumnByField('POTRERO_NOMBRE').PickList.Objects[PickPos]).getValue;
        end;

        if(Sender.FieldName = 'COND_CORP_VALOR')then
         begin
          IBDSSimpleCOND_CORP_VALOR.AsString := Text;
          PickPos := BDBGSimple.ColumnByField('COND_CORP_VALOR').PickList.IndexOf(BDBGSimple.ColumnByField('COND_CORP_VALOR').Field.AsString);
          IBDSSimpleCONDICION_CORPORAL.AsInteger := TClassType(BDBGSimple.ColumnByField('COND_CORP_VALOR').PickList.Objects[PickPos]).getValue;
        end;

        if(Sender.FieldName = 'RESPONSABLE_NOMBRE')then
         begin
          IBDSSimpleRESPONSABLE_NOMBRE.AsString := Text;
          PickPos := BDBGSimple.ColumnByField('RESPONSABLE_NOMBRE').PickList.IndexOf(BDBGSimple.ColumnByField('RESPONSABLE_NOMBRE').Field.AsString);
          IBDSSimpleRESPONSABLE.AsInteger := TClassType(BDBGSimple.ColumnByField('RESPONSABLE_NOMBRE').PickList.Objects[PickPos]).getValue;
        end;

        if(Sender.FieldName = 'RP_PADRE')then
         begin
          IBDSSimpleRP_PADRE.AsString := Text;
          PickPos := BDBGSimple.ColumnByField('RP_PADRE').PickList.IndexOf(BDBGSimple.ColumnByField('RP_PADRE').Field.AsString);
          IBDSSimpleID_PADRE.AsInteger := TClassType(BDBGSimple.ColumnByField('RP_PADRE').PickList.Objects[PickPos]).getValue;
        end;

        IBDSSimple.Post;
    end;
end;

procedure TFEveServicioCorral.MangaHembrasBDBGSeleccionadosDblClick(
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

procedure TFEveServicioCorral.MangaMachosBDBGSeleccionadosDblClick(
  Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (MangaMachos.BDBGSeleccionados.SelectedIndex = MangaMachos.BDBGSeleccionados.ColumnByField('id_rp').Index) then
  begin
    if not(MangaMachos.BDBGSeleccionados.DataSource.DataSet.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := MangaMachos.BDBGSeleccionados.DataSource.DataSet.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
    RefrescarMangaDisp(MangaMachos);
  end;
end;

end.
