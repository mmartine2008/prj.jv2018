unit UEveModifDatosAnimal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveAltaDirecta, IBCustomDataSet, DB, IBQuery, WinXP, DateUtils,
  DataExport, DataToXLS, IBStoredProc, ActnList, ComCtrls, ExtCtrls,
  StdCtrls, MemoAuto, UFrameDBSeleccion, Buttons, EditAuto, DBCtrls,
  UDBLookupComboBoxAuto, DateTimePickerAuto,  UPrincipal, DBGrids, Mask,
  UFunctions, ImgList, PngImageList, JvExControls, JvLabel, PngImage,
  JvExExtCtrls, JvImage, jpeg, JvGIF, Grids, JvFullColorSpaces,
  JvFullColorCtrls;

type
  TFEveModifDatosAnimal = class(TFEveAltaDirecta)
    IBSPGetDatosAnimal: TIBStoredProc;
    IBQGetPadres: TIBQuery;
    DSPadres: TDataSource;
    IBQUnPadre: TIBQuery;
    IBQSeleccionGrupos: TIBQuery;
    IBSPDatosPadre: TIBStoredProc;
    IBQCoopropiedad: TIBQuery;
    DSCoopropiedad: TDataSource;
    IBQInsertCoopropiedad: TIBQuery;
    IBQTipoAlta: TIBQuery;
    IBQLimpiarCoopropAux: TIBQuery;
    IBQMadre: TIBQuery;
    IBQPadre: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure SeleccionGrupo(Sender : TObject);
    procedure CargarParametrosSP;override;
    procedure CargarParametrosRN;override;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure VerCampos(valor:Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Change(Sender: TObject);
    procedure ChkBMadreReceptoraClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBMadreIndefinidaClick(Sender: TObject);
    procedure SBMadreBClick(Sender: TObject);
    procedure DBLCBATipoAltaCloseUp(Sender: TObject);
  private
    FechaPeso : TDate;
    procedure CargarSenasa(ID_SENASA : String);
  public
    ID_ANIMAL : integer;
    Puede_Modificar: boolean;
  end;

var
  FEveModifDatosAnimal: TFEveModifDatosAnimal;

implementation

uses UDMSoftvet, UCartel, UEveIndividual;

{$R *.dfm}

procedure TFEveModifDatosAnimal.FormShow(Sender: TObject);
var
  TipoMadreBiologica, TipoMadreReceptora : String;
  TieneReceptora, TieneMadre : boolean;
  RP : String;
  cartel: TCartel;
  tipodealta : integer;

  fechaNacAnimal : TDate;
begin

  inherited;

  IBQTipoAlta.Close;
  IBQTipoAlta.ParamByName('id_animal').AsInteger := id_animal;
  IBQTipoAlta.Open;

  if (not(IBQTipoAlta.IsEmpty)) then
  begin
     FTipoAlta:= 3;
     FTipoCArga:= 3;
  end;

  TipoMadreBiologica := '';

  TieneMadre:= false;

  //DecimalSeparator:='.';
  DMSoftvet.IBQRaza.Close;
  DMSoftvet.IBQRaza.SQL.Clear;
  DMSoftvet.IBQRaza.SQL.Add('select ID_RAZA, SINONIMO, NOMBRE, DIAS_GESTACION, CODIGO from COD_RAZAS order by nombre asc');
  DMSoftvet.IBQRaza.Open;

  //FTipoAlta:= 1; PUEDE ESTAR BIEN

  CBCastrado.Visible:= false;
  IBSPGetDatosAnimal.Close;
  IBSPGetDatosAnimal.ParamByName('ID_ANIMAL').AsInteger := ID_ANIMAL;
  IBSPGetDatosAnimal.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBSPGetDatosAnimal.ExecProc;


 {EAIdRP.Text}EARpInicial.Text := IBSPGetDatosAnimal.Params.ParamValues['ID_RP'];


  if IBSPGetDatosAnimal.Params.ParamValues['FECHA_PESO'] = null then
    FechaPeso := DTPAFechaEve.Date
  else
    FechaPeso := IBSPGetDatosAnimal.Params.ParamValues['FECHA_PESO'];

  

  {EAIdRP.Enabled}EARpInicial.Enabled := {EAIdRP.Text}IDRp <> 'N/N';
  EANombre.Text := IBSPGetDatosAnimal.Params.ParamValues['NOMBRE'];
  EAApodo.Text := IBSPGetDatosAnimal.Params.ParamValues['APODO'];
  CargarSenasa(IBSPGetDatosAnimal.Params.ParamValues['ID_SENASA']);
  //EAIdSenasa.Text := IBSPGetDatosAnimal.Params.ParamValues['ID_SENASA'];
  EAIdHBA.Text := trim(IBSPGetDatosAnimal.Params.ParamValues['ID_HBA']);
  EAOtro.Text := trim(IBSPGetDatosAnimal.Params.ParamValues['ID_OTRO']);
  EAIdentificacionElectronica.Text := trim(IBSPGetDatosAnimal.Params.ParamValues['ID_IE']);
  EAIdPC.Text := trim(IBSPGetDatosAnimal.Params.ParamValues['ID_PC']);
  EAIdRA.Text := trim(IBSPGetDatosAnimal.Params.ParamValues['ID_RA']);
  EADTA.Text := trim(IBSPGetDatosAnimal.Params.ParamValues['DTA']);


  if (IBSPGetDatosAnimal.Params.ParamValues['FECHA_NACIMIENTO'] <> null) then
  begin
      DTPAFechaNac.Date := IBSPGetDatosAnimal.Params.ParamValues['FECHA_NACIMIENTO'];
      fechaNacAnimal := IBSPGetDatosAnimal.Params.ParamValues['FECHA_NACIMIENTO'];
      DTPAFechaNacCloseUp(nil);
  end;

  if (IBSPGetDatosAnimal.Params.ParamValues['FECHA_ALTA'] <> null) then
  begin
      DTPAFechaEve.Date := IBSPGetDatosAnimal.Params.ParamValues['FECHA_ALTA'];
      DTPAFechaEveChange(nil);
  end;
  if (IBSPGetDatosAnimal.Params.ParamValues['SEXO'] <> -1) then
      DBLCBASexo.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['SEXO'];
  HabilitarSegunSexo;
  CategoriaSegunSexo;
  if (IBSPGetDatosAnimal.Params.ParamValues['TIPO_ALTA'] <> -1) then
      DBLCBATipoAlta.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['TIPO_ALTA'];

  if (IBSPGetDatosAnimal.Params.ParamValues['ACTIVIDAD'] <> -1) then
      DBLCBAActividad.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['ACTIVIDAD'];

  if (IBSPGetDatosAnimal.Params.ParamValues['SUBCATEGORIA'] <> -1) then
      DBLCBASubCategoria.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['SUBCATEGORIA'];

  if (IBSPGetDatosAnimal.Params.ParamValues['COLOR'] <> -1) then
      DBLCBAColor.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['COLOR'];

  if (DBLCBAActividad.KeyValue = 3) then
    begin
       LCodigoManejo.Visible:= true;
       DBLCBACodigoManejo.Visible:= true;
    end
   else
      begin
         LCodigoManejo.Visible:= false;
         DBLCBACodigoManejo.Visible:= false;
      end;

  if (IBSPGetDatosAnimal.Params.ParamValues['CODIGOMANEJO'] <> -1) then
      DBLCBACodigoManejo.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['CODIGOMANEJO'];

  DBLCBATipoAltaCloseUp(nil);
  if (IBSPGetDatosAnimal.Params.ParamValues['CRONOLOGIA_DENTARIA'] <> -1) then
    DBLCBACronologiaD.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['CRONOLOGIA_DENTARIA'];
  if (IBSPGetDatosAnimal.Params.ParamValues['CATEGORIA'] <> -1) then
      DBLCBACategoria.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['CATEGORIA'];

  if (IBSPGetDatosAnimal.Params.ParamValues['RAZA'] <> -1) then
  begin
      DBLCBARaza.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['RAZA'];
      ConfigurarPorRaza;
      if (IBSPGetDatosAnimal.Params.ParamValues['MOCHO'] <> -1) then
              DBLCBAMocho.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['MOCHO']
      else
              DBLCBAMocho.KeyValue := 0;
  end;

//  if (IBSPGetDatosAnimal.Params.ParamValues['MOCHO'] <> -1) then

//  else
//      DBLCBAMocho.KeyValue := 0;

  if (IBSPGetDatosAnimal.Params.ParamValues['RESPONSABLE'] <> -1) then
      DBLCBAResponsable.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['RESPONSABLE'];

//  if (IBSPGetDatosAnimal.Params.ParamValues['PROPIETARIO'] <> -1) then
  DBLCBAPROPIETARIO.KeyValue := 0;//IBSPGetDatosAnimal.Params.ParamValues['PROPIETARIO'];
  if (IBSPGetDatosAnimal.Params.ParamValues['CRIADOR'] <> -1) then
      DBLCBACRIADOR.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['CRIADOR'];
  if (IBSPGetDatosAnimal.Params.ParamValues['ORIGEN'] <> -1) then
      DBLCBAORIGEN.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['ORIGEN'];

  CBADN.Checked := (IBSPGetDatosAnimal.Params.ParamValues['ADN'] <> '')and(IBSPGetDatosAnimal.Params.ParamValues['ADN'] <> null);
  if CBADN.Checked then EAADN.Text := IBSPGetDatosAnimal.Params.ParamValues['ADN'];
  CBSanguinea.Checked := (IBSPGetDatosAnimal.Params.ParamValues['TIPIFICACION_SANGUINEA'] <> '')and(IBSPGetDatosAnimal.Params.ParamValues['TIPIFICACION_SANGUINEA'] <> null);
  if CBSanguinea.Checked then EASanguinea.Text := IBSPGetDatosAnimal.Params.ParamValues['TIPIFICACION_SANGUINEA'];


////////////////////////////////////////////
//////////////             /////////////////
////////////// Datos Madre /////////////////
//////////////             /////////////////
////////////////////////////////////////////
  IBQMadre.Close;
  IBQMadre.ParamByName('rp').AsString := '%';
  IBQMadre.ParamByName('nom').AsString := '%';
  IBQMadre.Open;

  if ((IBSPGetDatosAnimal.Params.ParamValues['MADRE_BIOLOGICA_INTERNA'] <> -1))then
  begin
    TipoMadreBiologica := 'MADRE_BIOLOGICA_INTERNA';
    TieneMadre := true;
    id_madreB := IBSPGetDatosAnimal.Params.ParamValues['MADRE_BIOLOGICA_INTERNA'];
    TipoMadreB := 'INTERNA';
    IBQMadre.Locate('id;tipo',VarArrayOf([id_madreB,'INTERNA']),[]);

    LMSeleccionadaB.Caption := 'Madre Biológica Seleccionada - RP: '+IBQMadre.FieldValues['id_rp'];
    if IBQMadre.FieldValues['id_hba'] <> null then
      LMSeleccionadaB.Caption := LMSeleccionadaB.Caption+' HBA: '+IBQMadre.FieldValues['id_hba'];
    if IBQMadre.FieldValues['nombre'] <> null then
      LMSeleccionadaB.Caption := LMSeleccionadaB.Caption+' Nombre: '+IBQMadre.FieldValues['nombre'];
    LMSeleccionadaB.Visible := true;

  end
  else if (IBSPGetDatosAnimal.Params.ParamValues['MADRE_BIOLOGICA_EXTERNA'] <> -1) then
       begin
        TieneMadre := true;
        id_madreB := IBSPGetDatosAnimal.Params.ParamValues['MADRE_BIOLOGICA_EXTERNA'];
        TipoMadreB := 'EXTERNA';

        IBQMadre.Locate('id;tipo',VarArrayOf([id_madreB,'EXTERNA']),[]);

        LMSeleccionadaB.Caption := 'Madre Biológica Seleccionada - RP: '+IBQMadre.FieldValues['id_rp'];
        if IBQMadre.FieldValues['id_hba'] <> null then
          LMSeleccionadaB.Caption := LMSeleccionadaB.Caption+' HBA: '+IBQMadre.FieldValues['id_hba'];
        if IBQMadre.FieldValues['nombre'] <> null then
          LMSeleccionadaB.Caption := LMSeleccionadaB.Caption+' Nombre: '+IBQMadre.FieldValues['nombre'];
        LMSeleccionadaB.Visible := true;

       end;


  if (IBSPGetDatosAnimal.Params.ParamValues['MADRE_RECEPTORA_INTERNA'] <> -1) then
  begin
    TipoMadreReceptora := 'MADRE_RECEPTORA_INTERNA';
    TieneReceptora := true;
    id_madreR := IBSPGetDatosAnimal.Params.ParamValues['MADRE_RECEPTORA_INTERNA'];
    TipoMadreR := 'INTERNA';

    IBQMadre.Locate('id;tipo',VarArrayOf([id_madreR,'INTERNA']),[]);

    LMSeleccionadaR.Caption := 'Madre Receptora Seleccionada - RP: '+IBQMadre.FieldValues['id_rp'];
    if IBQMadre.FieldValues['id_hba'] <> null then
      LMSeleccionadaR.Caption := LMSeleccionadaR.Caption+' HBA: '+IBQMadre.FieldValues['id_hba'];
    if IBQMadre.FieldValues['nombre'] <> null then
      LMSeleccionadaR.Caption := LMSeleccionadaR.Caption+' Nombre: '+IBQMadre.FieldValues['nombre'];
    LMSeleccionadaR.Visible := true;

  end
  else if (IBSPGetDatosAnimal.Params.ParamValues['MADRE_RECEPTORA_EXTERNA'] <> -1) then
       begin
          TipoMadreReceptora := 'MADRE_RECEPTORA_EXTERNA';
          TieneReceptora := true;
          id_madreR := IBSPGetDatosAnimal.Params.ParamValues['MADRE_RECEPTORA_EXTERNA'];
          TipoMadreR := 'EXTERNA';

          IBQMadre.Locate('id;tipo',VarArrayOf([id_madreR,'EXTERNA']),[]);

          LMSeleccionadaR.Caption := 'Madre Receptora Seleccionada - RP: '+IBQMadre.FieldValues['id_rp'];
          if IBQMadre.FieldValues['id_hba'] <> null then
            LMSeleccionadaR.Caption := LMSeleccionadaR.Caption+' HBA: '+IBQMadre.FieldValues['id_hba'];
          if IBQMadre.FieldValues['nombre'] <> null then
            LMSeleccionadaR.Caption := LMSeleccionadaR.Caption+' Nombre: '+IBQMadre.FieldValues['nombre'];
          LMSeleccionadaR.Visible := true;

       end
       else TieneReceptora := false;

////////////////////////
///////Datos Padre
 IBQGetPadres.Active := false;
 IBQGetPadres.ParamByName('ID_ANIMAL').AsInteger := ID_ANIMAL;
 IBQGetPadres.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
 IBQGetPadres.Active := true;
 if not(IBQGetPadres.IsEmpty) then
 begin
  IBQPadre.Close;
  IBQPadre.ParamByName('rp').AsString := '%';
  IBQPadre.ParamByName('nom').AsString := '%';
  IBQPadre.Open;

  id_padre := IBQGetPadres.FieldValues['ID'];

  if IBQGetPadres.FieldByName('Tipo').AsString = 'N' then
    IBQPadre.Locate('id;tipo',VarArrayOf([id_padre,'EXTERNO']),[])
  else
    IBQPadre.Locate('id;tipo',VarArrayOf([id_padre,'INTERNO']),[]);

  TipoPadre := IBQPadre.FieldValues['Tipo'];

  LSeleccionP.Caption := 'Padre Seleccionado - RP: '+IBQPadre.FieldValues['id_rp'];
  if IBQPadre.FieldValues['id_hba'] <> null then
    LSeleccionP.Caption := LSeleccionP.Caption+' HBA: '+IBQPadre.FieldValues['id_hba'];
  if IBQPadre.FieldValues['nombre'] <> null then
    LSeleccionP.Caption := LSeleccionP.Caption+' Nombre: '+IBQPadre.FieldValues['nombre'];
  LSeleccionP.Visible := true;


 end;

///////////////////////
  EAEstadoLactacion.Text := IBSPGetDatosAnimal.Params.ParamValues['ESTADO_LACTACION'];
  if (IBSPGetDatosAnimal.Params.ParamValues['ESTADO_REPRODUCTIVO'] <> -1) then
    DBLCBAEstadoR.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['ESTADO_REPRODUCTIVO'];
  if (IBSPGetDatosAnimal.Params.ParamValues['GDR'] <> -1) then
    DBLCBAGDR.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['GDR'];
  if (IBSPGetDatosAnimal.Params.ParamValues['ESTADO_REPRODUCTIVO'] <> -1) then
    DBLCBAEstadoR.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['ESTADO_REPRODUCTIVO'];
  EACircunferenciaE.Text := IBSPGetDatosAnimal.Params.ParamValues['CIRCUNFERENCIA_ESCROTAL'];
  if (IBSPGetDatosAnimal.Params.ParamValues['CONDICION_CORPORAL'] <> -1) then
  begin
    CBCondicionCorporal.Checked := true;
    CBCondicionCorporalClick(nil);
    DBLCBACondicionC.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['CONDICION_CORPORAL'];
  end;
  UDLactacion.Position := StrToInt(IBSPGetDatosAnimal.Params.ParamValues['ESTADO_LACTACION']);
  if (IBSPGetDatosAnimal.Params.ParamValues['RODEO'] <> -1) then
    DBLCBARodeo.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['RODEO'];
  if (IBSPGetDatosAnimal.Params.ParamValues['POTRERO'] <> -1) then
    DBLCBAPotrero.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['POTRERO'];
////////////////////
/////Datos Grupo
  IBQSeleccionGrupos.Active := false;
  IBQSeleccionGrupos.ParamByName('est').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSeleccionGrupos.ParamByName('animal').AsInteger := ID_ANIMAL;
  IBQSeleccionGrupos.Active := true;
  IBQSeleccionGrupos.First;
  while (not IBQSeleccionGrupos.Eof) do
  begin
    FrameSeleccionGrupos.IBQDisponibles.Locate('NOMBRE',IBQSeleccionGrupos.fieldByName('nombre').AsString,[loCaseInsensitive]);
    FrameSeleccionGrupos.BDBGDisponibles.SelectedIndex := FrameSeleccionGrupos.IBQDisponibles.RecNo;
    SeleccionGrupo(nil);
    FrameSeleccionGrupos.IBQSeleccionados.Database.ApplyUpdates([FrameSeleccionGrupos.IBQSeleccionados]);
    FrameSeleccionGrupos.IBQDisponibles.Close;
    FrameSeleccionGrupos.IBQDisponibles.Open;
    IBQSeleccionGrupos.Next;
  end;
//////////////////////
  EAPrecioU.Text := FloatToStr(IBSPGetDatosAnimal.Params.ParamValues['PRECIO_UNITARIO']);
  EAPrecioB.Text := FloatToStr(IBSPGetDatosAnimal.Params.ParamValues['PRECIO_BRUTO']);

  MAObservacion.Text := IBSPGetDatosAnimal.Params.ParamValues['OBSERVACION'];
  EAPeso.Text := IBSPGetDatosAnimal.Params.ParamValues['PESO'];
  if EAPeso.Text <> '0' then
  begin
    DBLCBATiposPeso.KeyValue := IBSPGetDatosAnimal.Params.ParamValues['DIASPESO'];
    if IBSPGetDatosAnimal.Params.ParamValues['DIASPESO'] <> 'G' then
      EAPeso.Enabled := false;
  end;

  //EAValor.OnChange:=nil;
  EAValor.Text := FormatFloat('###0.00',StrToFloat(IBSPGetDatosAnimal.Params.ParamValues['GASTOS']));
//  EAValor.OnChange:=Change;
  EAPorcentaje.OnChange:=nil;//deshabilita onchange
  if (FormatFloat('###0.00',StrToFloat(EAValor.Text) * 100 /StrToFloat(EAPrecioU.Text))<>'NAN') then
    EAPorcentaje.Text :=FormatFloat('###0.00',StrToFloat(EAValor.Text) * 100 /StrToFloat(EAPrecioU.Text))
  else
     EAPorcentaje.Text :=FormatFloat('###0.00',StrToFloat('0'));
  EAPorcentaje.OnChange:=Change;  //habilita onchange
  
  VerCampos(false);//deshabilita los campos que no se pueden modificar

 { try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end; }

  try
    IBQCoopropiedad.Close;
    IBQCoopropiedad.ParamByName('id_animal').AsInteger:= id_animal;
    IBQCoopropiedad.Open;
    IBQCoopropiedad.First;
    while not IBQCoopropiedad.Eof do
      begin

        IBQInsertCoopropiedad.Close;
        IBQInsertCoopropiedad.ParamByName('idanimal').AsInteger:= id_animal;
        IBQInsertCoopropiedad.ParamByName('propietario').AsInteger:= IBQCoopropiedad.fieldbyname('id_propietario').AsInteger;
        IBQInsertCoopropiedad.ParamByName('nombre').AsString:= IBQCoopropiedad.fieldbyname('nombre').AsString;
        IBQInsertCoopropiedad.ParamByName('porcentaje').AsFloat:= IBQCoopropiedad.fieldbyname('porcentaje').AsFloat;
        IBQInsertCoopropiedad.Open;

        IBQCoopropiedad.Next;
      end;
     FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
   end;

  cartel:= TCartel.getInstance();
  cartel.cerrarcartel;
  cartel.FreeInstance;
end;

procedure TFEveModifDatosAnimal.CargarParametrosSP();
var
  I : Integer;
begin

  IBQSPEventoInd.ParamByName('ID_AUX').Value := FIdAux;
  IBQSPEventoInd.ParamByName('ID_ANIMAL').Value := ID_ANIMAL;

  if ({EAIdRP.GetDato}IDRp = '') then  IBQSPEventoInd.ParamByName('ID_RP').Value := null
  else IBQSPEventoInd.ParamByName('ID_RP').Value := IDRp;//EAIdRP.GetDato;
  if (RBCUIGSenasa.Checked) then
  begin
    IBQSPEventoInd.ParamByName('ID_SENASA').Value := EAEncabezado.Text+EAUltimoIdent.Text;
    ActualizarCUIG(EAEncabezado.Text);
  end
  else
    IBQSPEventoInd.ParamByName('ID_SENASA').Value := EAIdSenasa.Text;
  IBQSPEventoInd.ParamByName('FECHA_NACIMIENTO').AsDate := DTPAFechaNac.Date;
  if(trim(EAPeso.Text) <> '') then
  begin
    if (EAPeso.Text = '0') then
      IBQSPEventoInd.ParamByName('PESO').Value := null
    else
      IBQSPEventoInd.ParamByName('PESO').Value := StrToFloat(EAPeso.Text);
  end
  else
    IBQSPEventoInd.ParamByName('PESO').Value := null;

  if (EAEstadoLactacion.Text='') then IBQSPEventoInd.ParamByName('ESTADO_LACTACION').Value := 0
  else IBQSPEventoInd.ParamByName('ESTADO_LACTACION').Value := StrToInt(EAEstadoLactacion.Text);
  IBQSPEventoInd.ParamByName('RODEO').Value := DBLCBARodeo.KeyValue;
  IBQSPEventoInd.ParamByName('RAZA').Value := DBLCBARaza.KeyValue;
  IBQSPEventoInd.ParamByName('POTRERO').Value := DBLCBAPotrero.KeyValue;
  IBQSPEventoInd.ParamByName('CATEGORIA').Value := DBLCBACategoria.KeyValue;
  IBQSPEventoInd.ParamByName('CRONOLOGIA_DENTARIA').Value := DBLCBACronologiaD.KeyValue;
  IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := DBLCBACondicionC.KeyValue;
  IBQSPEventoInd.ParamByName('GDR').Value := DBLCBAGDR.KeyValue;
  IBQSPEventoInd.ParamByName('COLOR').Value := DBLCBAColor.KeyValue;

  if (DBLCBACategoria.KeyValue = 2) or (DBLCBACategoria.KeyValue = 3) then
  begin
    if (EACircunferenciaE.Text = '0') then IBQSPEventoInd.ParamByName('CIRCUNFERENCIA_ESCROTAL').Value := null
    else IBQSPEventoInd.ParamByName('CIRCUNFERENCIA_ESCROTAL').Value := StrToFloat(EACircunferenciaE.Text);
  end
  else
    IBQSPEventoInd.ParamByName('CIRCUNFERENCIA_ESCROTAL').Value := null;
  IBQSPEventoInd.ParamByName('ESTADO_REPRODUCTIVO').Value := DBLCBAEstadoR.KeyValue;
  if (EAIdPC.GetDato = '') then IBQSPEventoInd.ParamByName('ID_PC').Value := null
  else IBQSPEventoInd.ParamByName('ID_PC').Value := trim(EAIdPC.GetDato);
  if (EAIdHBA.GetDato = '') then IBQSPEventoInd.ParamByName('ID_HBA').Value := null
  else IBQSPEventoInd.ParamByName('ID_HBA').Value := trim(EAIdHBA.GetDato);
  if (EAIdRA.GetDato = '') then IBQSPEventoInd.ParamByName('ID_RA').Value := null
  else IBQSPEventoInd.ParamByName('ID_RA').Value := trim(EAIdRA.GetDato);
  if (EAOtro.GetDato = '') then IBQSPEventoInd.ParamByName('ID_OTRO').Value := null
  else IBQSPEventoInd.ParamByName('ID_OTRO').Value := trim(EAOtro.GetDato);
  if (EAIdentificacionElectronica.GetDato = '') then IBQSPEventoInd.ParamByName('ID_IE').Value := null
  else IBQSPEventoInd.ParamByName('ID_IE').Value := trim(EAIdentificacionElectronica.GetDato);
  if (EANombre.GetDato = '') then IBQSPEventoInd.ParamByName('NOMBRE').Value := null
  else IBQSPEventoInd.ParamByName('NOMBRE').Value := trim(EANombre.GetDato);
  if (EAApodo.GetDato = '') then IBQSPEventoInd.ParamByName('APODO').Value := null
  else IBQSPEventoInd.ParamByName('APODO').Value := trim(EAApodo.GetDato);
  IBQSPEventoInd.ParamByName('SEXO').Value := DBLCBASexo.KeyValue;
  IBQSPEventoInd.ParamByName('TIPO_ALTA').Value := DBLCBATipoAlta.KeyValue;
  if (EAPrecioB.Text <> '') then IBQSPEventoInd.ParamByName('PRECIO_BRUTO').Value := StrToFloat(EAPrecioB.Text)
  else IBQSPEventoInd.ParamByName('PRECIO_BRUTO').Value := 0;
  if (EAPrecioU.Text <> '') then IBQSPEventoInd.ParamByName('PRECIO_UNITARIO').Value := StrToFloat(EAPrecioU.Text)
  else IBQSPEventoInd.ParamByName('PRECIO_UNITARIO').Value := 0;
  if (MAObservacion.GetDato = '') then IBQSPEventoInd.ParamByName('OBSERVACION').Value := null
  else IBQSPEventoInd.ParamByName('OBSERVACION').Value := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := DBLCBAResponsable.KeyValue;
  ////////Madres y Padres
  IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_EXTERNA').Value := null;
  IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_EXTERNA').Value := null;
  IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_INTERNA').Value := null;
  IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_INTERNA').Value := null;
  IBQSPEventoInd.ParamByName('PADRE_EXTERNO').Value := null;
  IBQSPEventoInd.ParamByName('PADRE_INTERNO').Value := null;
  IBQSPEventoInd.ParamByName('PADRE_INTERNO').Value := null;
  if ((id_padre <> -1) and (TipoPadre = 'INTERNO')) then
    IBQSPEventoInd.ParamByName('PADRE_INTERNO').Value := id_padre
  else
    IBQSPEventoInd.ParamByName('PADRE_INTERNO').Value := null;

  IBQSPEventoInd.ParamByName('PADRE_EXTERNO').Value := null;
  if ((id_padre <> -1) and (TipoPadre = 'EXTERNO')) then
    IBQSPEventoInd.ParamByName('PADRE_EXTERNO').Value := id_padre
  else
    IBQSPEventoInd.ParamByName('PADRE_EXTERNO').Value := null;

  {Carga de Madres Internas}
  IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_INTERNA').Value := null;
  if ((id_madreB <> -1) and (TipoMadreB = 'INTERNA')) then
    IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_INTERNA').Value := id_madreB
  else
    IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_INTERNA').Value := null;

  IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_INTERNA').Value := null;
  if ((id_madreR <> -1) and (TipoMadreR = 'INTERNA')) then
      IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_INTERNA').Value := id_madreR
  else
      IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_INTERNA').Value := null;

  {Carga de Madres Externas}
  IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_EXTERNA').Value := null;
  if ((id_madreB <> -1) and (TipoMadreB = 'EXTERNA')) then
    IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_EXTERNA').Value := id_madreB
  else
    IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_EXTERNA').Value := null;

  IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_EXTERNA').Value := null;
  if ((id_madreR <> -1) and (TipoMadreR = 'EXTERNA')) then
    IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_EXTERNA').Value := id_madreR
  else
    IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_EXTERNA').Value := null;
  /////////////
  if (EAValor.Text <> '') then IBQSPEventoInd.ParamByName('GASTOS').Value:= StrToFloat(EAValor.Text)
  else IBQSPEventoInd.ParamByName('GASTOS').Value := 0;
  IBQSPEventoInd.ParamByName('FECHA_EVENTO').AsDate := DTPAFechaEve.Date;
  if (EADTA.GetDato = '') then IBQSPEventoInd.ParamByName('DTA').Value := null
  else IBQSPEventoInd.ParamByName('DTA').Value := EADTA.GetDato;
  if DBLCBATiposPeso.Visible then
    IBQSPEventoInd.ParamByName('DIASPESO').Value := DBLCBATiposPeso.KeyValue
  else
    IBQSPEventoInd.ParamByName('DIASPESO').Value := 'G';

  if Trim(EAADN.Text)<>'' then IBQSPEventoInd.ParamByName('ADN').AsString := Trim(EAADN.Text);
  if Trim(EASanguinea.Text)<>'' then IBQSPEventoInd.ParamByName('TipificacionSanguinea').AsString := Trim(EASanguinea.Text);
  IBQSPEventoInd.ParamByName('Propietario').Value := 0;//DBLCBAPropietario.KeyValue;
  IBQSPEventoInd.ParamByName('Criador').Value := DBLCBACriador.KeyValue;
  IBQSPEventoInd.ParamByName('Origen').Value := DBLCBAOrigen.KeyValue;

  I := DBLCBARaza.KeyValue;
  if I in [12,28,11,10,5] then
    IBQSPEventoInd.ParamByName('mocho').AsInteger := DBLCBAMocho.KeyValue
  else
    IBQSPEventoInd.ParamByName('mocho').Value := null;
end;



procedure TFEveModifDatosAnimal.CargarParametrosRN;
begin
  IBQSPRN.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  //RP
  if ({EAIdRP.Text}IDRp = IBSPGetDatosAnimal.Params.ParamValues['ID_RP']) then
    IBQSPRN.ParamByName('RP').Value := '!@a%&/()'
  else
    begin
      if({EAIdRP.Text}IDRp = '')then IBQSPRN.ParamByName('RP').Value := null
      else  IBQSPRN.ParamByName('RP').Value := trim({EAIdRP.Text}IDRp);
    end;
  //Senasa
  if RBSenasa.Checked then
  begin
    if (EAIdSenasa.Text = IBSPGetDatosAnimal.Params.ParamValues['ID_SENASA']) then
      IBQSPRN.ParamByName('SENASA').Value := null
    else
      begin
        if(EAIdSenasa.Text = '')then  IBQSPRN.ParamByName('SENASA').Value := null
        else IBQSPRN.ParamByName('SENASA').Value := CompletarDigitosSenasa(EAIdSenasa.Text);
      end;
  end;
  //HBA
  if (EAIdHBA.Text = IBSPGetDatosAnimal.Params.ParamValues['ID_HBA']) then
    IBQSPRN.ParamByName('HBA').Value := null
  else
    begin
      if(EAIdHBA.Text = '')then  IBQSPRN.ParamByName('HBA').Value := null
      else IBQSPRN.ParamByName('HBA').Value:= trim(EAIdHBA.Text);
    end;
  //OTRO
  if (EAOtro.Text = IBSPGetDatosAnimal.Params.ParamValues['ID_OTRO']) then
    IBQSPRN.ParamByName('OTRO').Value := null
  else
    begin
      if(EAOtro.Text = '')then IBQSPRN.ParamByName('OTRO').Value := null
      else  IBQSPRN.ParamByName('OTRO').Value := trim(EAOtro.Text);
    end;
  //IE

  if (EAIdentificacionElectronica.Text = IBSPGetDatosAnimal.Params.ParamValues['ID_IE']) then
    IBQSPRN.ParamByName('IE').Value := null
  else
    begin
      if(EAIdentificacionElectronica.Text = '')then IBQSPRN.ParamByName('IE').Value := null
      else  IBQSPRN.ParamByName('IE').Value := trim(EAIdentificacionElectronica.Text);
    end;

{  if(EAIdentificacionElectronica.Text = '')then IBQSPRN.ParamByName('IE').Value := null
  else  IBQSPRN.ParamByName('IE').AsString := EAIdentificacionElectronica.Text;}
  //PC
  if (EAIdPC.Text = IBSPGetDatosAnimal.Params.ParamValues['ID_PC']) then
    IBQSPRN.ParamByName('PC').Value := null
  else
    begin
      if(EAIdPC.Text = '')then   IBQSPRN.ParamByName('PC').Value := null
      else IBQSPRN.ParamByName('PC').Value := trim(EAIdPC.Text);
    end;
  //RA
  if (EAIdRA.Text = IBSPGetDatosAnimal.Params.ParamValues['ID_RA']) then
    IBQSPRN.ParamByName('RA').Value := null
  else
    begin
      if(EAIdRA.Text = '')then IBQSPRN.ParamByName('RA').Value := null
      else IBQSPRN.ParamByName('RA').Value := trim(EAIdRA.Text);
    end;

  IBQSPRN.ParamByName('EDAD').Value := MonthsBetween(Date(), DTPAFechaNac.Date);

  if (EAPeso.Text = '' ) then IBQSPRN.ParamByName('PESO').Value := null
  else IBQSPRN.ParamByName('PESO').Value := StrToFloat(EAPeso.Text);

  if (DBLCBASexo.Text = 'MACHO') then IBQSPRN.ParamByName('CANT_PARTOS').Value := null
  else IBQSPRN.ParamByName('CANT_PARTOS').Value := StrToInt(EAEstadoLactacion.Text);

  IBQSPRN.ParamByName('CATEGORIA').Value := DBLCBACategoria.KeyValue;
  IBQSPRN.ParamByName('SEXO').Value := DBLCBASexo.KeyValue;
  IBQSPRN.ParamByName('ESTADO_REP').Value := DBLCBAEstadoR.KeyValue;
  IBQSPRN.ParamByName('FECHA_NAC').AsDate := DTPAFechaNac.Date;
  IBQSPRN.ParamByName('DIASPESO').Value := DiasPeso;
  IBQSPRN.ParamByName('FECHA_EVE').AsDate := FechaPeso;
  if (EACircunferenciaE.Text = '') then
    IBQSPRN.ParamByName('CIRCUNFERENCIA').Value := null
  else
    IBQSPRN.ParamByName('CIRCUNFERENCIA').Value := StrToFloat(EACircunferenciaE.Text);

  IBQSPRN.ParamByName('SUBCATEGORIA').Value := DBLCBASubCategoria.KeyValue;

  IBQSPRN.ParamByName('RAZA').Value := DBLCBARaza.KeyValue;

  if (DBLCBAActividad.KeyValue = 3) then
     IBQSPRN.ParamByName('CODIGOMANEJO').AsInteger := DBLCBACodigoManejo.GetDato
   else
      IBQSPRN.ParamByName('CODIGOMANEJO').AsInteger := 0;
end;

procedure TFEveModifDatosAnimal.SeleccionGrupo(Sender : TObject);
begin
  FrameSeleccionGrupos.IBQSeleccionados.insert;
  FrameSeleccionGrupos.IBQSeleccionados.FieldByName('ID_AUX').Value := FIdAux;
  FrameSeleccionGrupos.IBQSeleccionados.FieldByName('GRUPO').Value  := IBQSeleccionGrupos.fieldByName('grupo').AsInteger;
  FrameSeleccionGrupos.IBQSeleccionados.FieldByName('NOMBRE').Value := IBQSeleccionGrupos.fieldByName('nombre').AsString;
end;


procedure TFEveModifDatosAnimal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CargaOtro := false;
  inherited;
end;

procedure TFEveModifDatosAnimal.CargarSenasa(ID_SENASA : String);
var
  primerLetra, segundaLetra : Char;
begin

  if (ID_SENASA <> ' ') and (StrComp(PChar(ID_SENASA), PChar('')) <> 0) and (StrComp(PChar(ID_SENASA), PChar('         ')) <> 0) then
  begin
    primerLetra := ID_SENASA[1];
    if ((Ord(primerLetra)>=48) and (Ord(primerLetra)<=57))then  //Valores del 0..9 en codigo ASCII
    begin
      RBSenasa.Checked := true;
      EAIdSenasa.Text := ID_SENASA;
    end
    else
    begin
      segundaLetra := ID_SENASA[2];
      if (Ord(segundaLetra)>=48) and (Ord(segundaLetra)<=57) then
        begin
          RBReidentificacionSenasa.Checked := true;
          EAEncabezadoReidentificacion.Text := Copy(ID_SENASA,2,4);
          EAUltimoIdentReidentificacion.Text := Copy(ID_SENASA,6,4);
          EVerificadorReidentificacion.Text := IntToStr(UFunctions.DigitoVerificadorCaravana('00'+ID_SENASA));
        end
       else
         begin
            RBCUIGSenasa.Checked := true;
            EAEncabezado.Text := Copy(ID_SENASA,1,5);
            EAUltimoIdent.Text := Copy(ID_SENASA,6,4);
            EVerificador.Text := IntToStr(UFunctions.DigitoVerificadorCaravana(ID_SENASA));
         end;
    end;
  end;
end;

procedure TFEveModifDatosAnimal.VerCampos(valor:Boolean);
begin
      //****solapa identificacion****//
      LFechaNac.Enabled:= valor;
      DTPAFechaNac.Enabled:= valor;
      LSexo.Enabled:= valor;
      DBLCBASexo.Enabled:= valor;
      LCategoriaAnimal.Enabled:= valor;
      DBLCBACategoria.Enabled:= valor;
      LFechaEvento.Enabled:= valor;
      DTPAFechaEve.Enabled:= valor;//DTPAFechaEve.Enabled:= true;
      LTipoAlta.Enabled:= valor;
      DBLCBATipoAlta.Enabled:= valor;
      //****solapa identificacion****//

      //****solapa estado****//
      LELactacion.Enabled:= valor;
      EAEstadoLactacion.Enabled:= valor;//EAEstadoLactacion.Enabled:= true;
      LEstadoR.Enabled:= valor;
      DBLCBAEstadoR.Enabled:= valor;
      LGDR.Enabled:= valor;
      DBLCBAGDR.Enabled:= valor;
      LCEscrotal.Enabled:= valor;
      EACircunferenciaE.Enabled:= valor;
      LCCorporal.Enabled:= valor;
      CBCondicionCorporal.Enabled:= valor;
      DBLCBACondicionC.Enabled:= valor;
      LCronologiaD.Enabled:= valor;
      DBLCBACronologiaD.Enabled:= valor;
      //****solapa estado****//

      //****solapa ubicación****//
      LPotrero.Enabled:= valor;
      DBLCBAPotrero.Enabled:= valor;
      LRodeo.Enabled:= valor;
      DBLCBARodeo.Enabled:= valor;
      FrameSeleccionGrupos.BDBGDisponibles.Enabled:= valor;
      FrameSeleccionGrupos.BDBGSeleccionados.Enabled:= valor;
      FrameSeleccionGrupos.BBAgregarTodos.Enabled:= valor;
      FrameSeleccionGrupos.BBAgregarUno.Enabled:= valor;
      FrameSeleccionGrupos.BBEliminarTodos.Enabled:= valor;
      FrameSeleccionGrupos.BBEliminarUno.Enabled:= valor;
      FrameSeleccionGrupos.GBDisponibles.Enabled:= valor;
      FrameSeleccionGrupos.GBSeleccionados.Enabled:= valor;
      GBGrupos.Enabled:= Puede_Modificar;
      //****solapa ubicación****//

      //****solapa economía****//
      //LPeso.Enabled:= valor;
      if(EAPeso.Text = '0') then
        EAPeso.Enabled:= valor;
      EAPrecioB.Enabled := valor;
      EAPrecioU.Enabled := valor;
      EAValor.Enabled := valor;
      EAPorcentaje.Enabled := valor;
end;

procedure TFEveModifDatosAnimal.FormCreate(Sender: TObject);
begin
   FTipoAlta:= 1;
   inherited;
end;

procedure TFEveModifDatosAnimal.Change(Sender: TObject);
var
  peso : double;
begin
 // inherited;
  if not TryStrToFloat(EAPeso.Text,peso) then  peso := 0;
  if peso <> 0 then
  begin
    LDias.Visible := true;
    DBLCBATiposPeso.Visible := true;
  end
  else
  begin
    LDias.Visible := false;
    DBLCBATiposPeso.Visible := false;
  end;
end;

procedure TFEveModifDatosAnimal.ChkBMadreReceptoraClick(Sender: TObject);
begin
  inherited;
  {if not ChkBMadreReceptora.Checked then
    begin
    ClearListSource(GBMadreReceptora,nil);
    end; }
end;

procedure TFEveModifDatosAnimal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMSoftvet.IBQRaza.Close;
  DMSoftvet.IBQRaza.SQL.Clear;
  DMSoftvet.IBQRaza.SQL.Add('select ID_RAZA, SINONIMO, NOMBRE, DIAS_GESTACION, CODIGO from COD_RAZAS where visible = 1 order by nombre asc');
  DMSoftvet.IBQRaza.Open;
end;

procedure TFEveModifDatosAnimal.SBMadreIndefinidaClick(Sender: TObject);
begin
  inherited;
  //  ClearListSource(GBMadreBiologica,DSMadreBiologica);

    if (FTipoCArga = 3) then
      ClearListSource(GBMadreBiologica,DSMadresInternas)
     else
       ClearListSource(GBMadreBiologica,DSMadreBiologica);
end;

procedure TFEveModifDatosAnimal.SBMadreBClick(Sender: TObject);
begin
  inherited;
{ if CHKBpadresMultiples.Checked then
    if MostrarMensaje(tmConsulta,'Si agrega un animal externo deberá seleccionar los padres nuevamente. Desea Continuar?') = mrNo then
      Exit;
  try
    Iabm := IButtonABM(TFABMPadresExternos.Create(self));
    Iabm.IFitrate(2,FPrincipal.EstablecimientoActual);
    Iabm.ISetCampoRetorno('ID_ANIMAL_EXTERNO');
    Iabm.IAbrir(faElegir); (*tambien llama al ShowModal*)

    IBQMadreB.Close; (* Actualizo los queries para los combos*)
    IBQMadreB.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQMadreB.Open;

    if (Iabm.IValorRetorno) then
    begin
      ClearListSource(GBMadreBiologica,DSMadreBiologica);
      DBLCBARPMadreB.KeyValue := Iabm.IValorRetorno;
      ControlEventOnCloseUp(DBLCBARPMadreB);
    end;
  except
    MostrarMensaje(tmError, 'No se pudo abrir el formulario de animales externos');
  end;
  BorrarTablasAuxiliares();
  ActualizarPadres();
 }
end;

procedure TFEveModifDatosAnimal.DBLCBATipoAltaCloseUp(Sender: TObject);
begin
  //inherited;

  IBQLimpiarCoopropAux.Close;
  IBQLimpiarCoopropAux.Open; 

end;

end.
