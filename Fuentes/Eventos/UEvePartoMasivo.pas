unit UEvePartoMasivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, IBQuery, DB, IBCustomDataSet, WinXP, DataExport,
  DataToXLS, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Grids,
  DBGrids, UBDBGrid, MemoAuto, EditAuto, UFrameMangazo, Buttons, UDMSoftvet,
  DBCtrls, UDBLookupComboBoxAuto, DateTimePickerAuto, UPrincipal, UClassType,
  UMensajeHuella, ImgList, PngImageList, PngImage, JvExExtCtrls, JvImage,
  jpeg, JvGIF, JvExControls, JvLabel, JvComponentBase, JvBalloonHint,
  xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEvePartoMasivo = class(TFEveSimple)
    DTPAFechaParto: TDateTimePickerAuto;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    DBLCBATipoParto: TDBLookupComboBoxAuto;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleV1: TIBStringField;
    IBDSSimpleI1: TIntegerField;
    IBDSSimpleV2: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    TSDistocia: TTabSheet;
    GroupBox1: TGroupBox;
    LCausaDistocia: TLabel;
    LGradoDistocia: TLabel;
    DBLCBACausaDistocia: TDBLookupComboBoxAuto;
    DBLCBAGradoDistocia: TDBLookupComboBoxAuto;
    GBObservacion: TGroupBox;
    MAObservacionDistocia: TMemoAuto;
    IBDSSimpleI3: TIntegerField;
    IBDSSimpleV3: TIBStringField;
    IBDSSimpleI4: TIntegerField;
    IBDSSimpleV4: TIBStringField;
    IBDSSimpleI5: TIntegerField;
    IBDSSimpleV5: TIBStringField;
    IBQGrupoParto: TIBQuery;
    IBDSSimpleI6: TIntegerField;
    IBDSSimpleV6: TIBStringField;
    DBLCBACondCorp: TDBLookupComboBoxAuto;
    IBDSSimpleI7: TIntegerField;
    IBDSSimpleV7: TIBStringField;
    CBCondCorp: TCheckBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    DBLCBAPotrero: TDBLookupComboBoxAuto;
    DBLCBARodeos: TDBLookupComboBoxAuto;
    Label4: TLabel;
    CBPotrero: TCheckBox;
    CBRodeo: TCheckBox;
    IBDSSimpleFECHA: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure IBDSSimpleV2SetText(Sender: TField; const Text: String);
    procedure DBLCBATipoPartoCloseUp(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure MSimpleBBAgregarUnoClick(Sender: TObject);
    procedure MSimpleBBAgregarTodosClick(Sender: TObject);
    procedure MSimpleBBEliminarUnoClick(Sender: TObject);
    procedure MSimpleBBEliminarTodosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DTPAFechaPartoChange(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label5MouseEnter(Sender: TObject);
    procedure Label5MouseLeave(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label4MouseEnter(Sender: TObject);
    procedure Label4MouseLeave(Sender: TObject);
    procedure ASacarAnimalExecute(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure DBLCBATipoPartoExit(Sender: TObject);
    procedure CBCondCorpClick(Sender: TObject);
    procedure DBLCBACondCorpCloseUp(Sender: TObject);
    procedure CBPotreroClick(Sender: TObject);
    procedure CBRodeoClick(Sender: TObject);
  private
    IDAnimal : Integer;
    grupo : integer;
    CondicionC : Variant;
    Condicion : String;
    CambioPotrero, CambioRodeo : Boolean;
    procedure CargarParametrosSP;override;
    procedure CargarParametrosRN;override;
    procedure CargarDatosGrilla;override;
    procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure ManejarBotones();
    procedure CargarDatos(I : Integer);override;
  protected

    procedure ComponentesVisiblesPorPais(pais: Integer);override;
    procedure completarCampos;override;
    procedure setDefault(campo:string);override;

  public
    { Public declarations }
  end;

var
  FEvePartoMasivo: TFEvePartoMasivo;

implementation

{$R *.dfm}

uses UABMEmpleados, UABMPotreros, UABMRodeos, UABMSimple, UEveUniversal,
     UImportacion;

procedure TFEvePartoMasivo.FormCreate(Sender: TObject);
var
  IDistocia : TBitmap;
begin
  inherited;
  IDistocia := TBitmap.Create;
  IDistocia.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Distocia.bmp');
  ILVets.Add(IManga,nil);
  ILVets.Add(IDatos,nil);
  ILVets.Add(IDistocia,nil);
  ILVets.Add(IGrilla,nil);


  CondicionC := Null;
  Condicion := '';

  CambioRodeo := false;
  CambioPotrero := false;

  DMSoftvet.IBQTiposParto.Close;
  DMSoftvet.IBQTiposParto.Open;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQGradoAsistencia.Close;
  DMSoftvet.IBQGradoAsistencia.Open;
  DMSoftvet.IBQCausaDistocia.Close;
  DMSoftvet.IBQCausaDistocia.Open;
  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;
  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;

  DTPAFechaParto.Date := Date();
  MSimple.SQLBasico := 'select id_animal, id_rp, id_senasa, id_pc, id_hba, id_otro, id_ie, nombre, apodo from vis_parto';
  TSDistocia.TabVisible:=false;
  DBLCBATipoParto.KeyValue := 1;
  DBLCBAResponsable.KeyValue := 0;
  DBLCBARodeos.KeyValue := 0;
  DBLCBAPotrero.KeyValue := 0;
  DBLCBACausaDistocia.KeyValue:=0;
  DBLCBAGradoDistocia.KeyValue:=0;
end;

procedure TFEvePartoMasivo.CargarDatosGrilla;
begin
  {if NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple) then
  begin
      IBDSSimple.Insert;}
      IDAnimal := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
      IBDSSimple.FieldByName('ID_rp').AsString := MSimple.IBQSeleccionados.FieldValues['ID_rp'];
      IBDSSimple.FieldByName('ID_ANIMAL').AsString := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
      if (MSimple.IBQSeleccionados.FieldValues['ID_senasa'] <> null) then
        IBDSSimple.FieldByName('ID_senasa').AsString := MSimple.IBQSeleccionados.FieldValues['ID_senasa'];
      RealizarCambio(DTPAFechaParto,[IBDSSimple.FieldByName('FECHA')],[DTPAFechaParto.Time]);
      RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.Text]);
      //IBDSSimple.FieldByName('D1').AsDateTime := DTPAFechaParto.Time;
      RealizarCambio(DBLCBATipoParto,[IBDSSimple.FieldByName('V2'),IBDSSimple.FieldByName('I1')],[DBLCBATipoParto.Text,DBLCBATipoParto.KeyValue]);
      //IBDSSimple.FieldByName('V2').AsString := DBLCBATipoParto.Text;
      //IBDSSimple.FieldByName('I1').AsInteger := DBLCBATipoParto.KeyValue;
      RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('V1')],[DBLCBAResponsable.KeyValue,DBLCBAResponsable.Text]);
      //IBDSSimple.FieldByName('RESPONSABLE').AsInteger := DBLCBAResponsable.KeyValue;
      //IBDSSimple.FieldByName('V1').AsString := DBLCBAResponsable.Text;
      if IBDSSimpleV2.Text='DISTOCICO'{(DBLCBATipoParto.KeyValue = 2)} then
        begin
        RealizarCambio(DBLCBACausaDistocia,[IBDSSimple.FieldByName('V3'),IBDSSimple.FieldByName('I3')],[DBLCBACausaDistocia.Text,DBLCBACausaDistocia.KeyValue]);
        //IBDSSimple.FieldByName('V3').AsString := DBLCBACausaDistocia.Text;
        //IBDSSimple.FieldByName('I3').AsInteger := DBLCBACausaDistocia.KeyValue;
        RealizarCambio(DBLCBAGradoDistocia,[IBDSSimple.FieldByName('V4'),IBDSSimple.FieldByName('I4')],[DBLCBAGradoDistocia.Text,DBLCBAGradoDistocia.KeyValue]);
        //IBDSSimple.FieldByName('V4').AsString := DBLCBAGradoDistocia.Text;
        //IBDSSimple.FieldByName('I4').AsInteger := DBLCBAGradoDistocia.KeyValue;
        end
      else
        IBDSSimpleV2SetText(IBDSSimpleV2,IBDSSimpleV2.Text);

      RealizarCambio(DBLCBARodeos,[IBDSSimple.FieldByName('V5'),IBDSSimple.FieldByName('I5')],[DBLCBARodeos.Text,DBLCBARodeos.KeyValue]);
      //IBDSSimple.FieldByName('V5').AsString := DBLCBARodeos.Text;
      //IBDSSimple.FieldByName('I5').AsString := DBLCBARodeos.KeyValue;
      RealizarCambio(DBLCBAPotrero,[IBDSSimple.FieldByName('V6'),IBDSSimple.FieldByName('I6')],[DBLCBAPotrero.Text,DBLCBAPotrero.KeyValue]);
      //IBDSSimple.FieldByName('V6').AsString := DBLCBAPotrero.Text;
      //IBDSSimple.FieldByName('I6').AsString := DBLCBAPotrero.KeyValue;
      RealizarCambio(DBLCBACondCorp,[IBDSSimple.FieldByName('I7'),IBDSSimple.FieldByName('V7')],[CondicionC,Condicion]);
  //end;
end;

procedure TFEvePartoMasivo.CargarParametrosMasivo;
begin
  if(CrearGrupo)then
  begin
    grupo := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').Value;
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := grupo;
  end;
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := Now;
  IBQSPEventoInd.ParamByName('TIPO_PARTO').Value := IBDSSimple.FieldValues['I1'];
  if IBQSPEventoInd.ParamByName('TIPO_PARTO').Value<>1 then
    IBQSPEventoInd.ParamByName('CAUSA').Value := IBDSSimple.FieldValues['I3']
  else
    IBQSPEventoInd.ParamByName('CAUSA').Value := null;
  if IBQSPEventoInd.ParamByName('TIPO_PARTO').Value<>1 then
    IBQSPEventoInd.ParamByName('GRADO').Value := IBDSSimple.FieldValues['I4']
  else
    IBQSPEventoInd.ParamByName('GRADO').Value :=null;
  IBQSPEventoInd.ParamByName('OBS_DISTOCIA').Value := MAObservacionDistocia.Text;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := IBDSSimple.FieldValues['RESPONSABLE'];

  if CambioRodeo then
    IBQSPEventoInd.ParamByName('RODEO').Value := IBDSSimple.FieldValues['I5']
  else
    IBQSPEventoInd.ParamByName('RODEO').Value := null;

  IBQSPEventoInd.ParamByName('FECHA_PARTO').Value := IBDSSimple.FieldValues['FECHA'];

  IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := IBDSSimple.FieldValues['I7'];

  if CambioPotrero then
    IBQSPEventoInd.ParamByName('POTRERO').Value := IBDSSimple.FieldValues['I6']
  else
    IBQSPEventoInd.ParamByName('POTRERO').Value := null;
end;

procedure TFEvePartoMasivo.CargarParametrosRN;
begin
  IBQSPRN.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  if(self.ModoEve = meIndividual)then
  begin
    IBQSPRN.ParamByName('ANIMAL').AsInteger := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];//IDAnimal;
    IBQSPRN.ParamByName('FECHA').AsDate := DTPAFechaParto.Date;
  end
  else
  begin
    IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldByName('id_animal').AsInteger;
    IBQSPRN.ParamByName('FECHA').AsDate := IBDSSimple.fieldByName('FECHA').AsDateTime;
  end;
end;


procedure TFEvePartoMasivo.ASacarAnimalExecute(Sender: TObject);
begin
  inherited;
  if MSimple.IBQSeleccionados.RecordCount < 1 then
  begin
    TSDistocia.TabVisible := false;
    ControlEventoOnExit(self);
  end;
  ATerminar.Enabled := MSimple.IBQSeleccionados.RecordCount >=1;
  if MSimple.IBQSeleccionados.RecordCount = 1 then
    PCBasico.ActivePage := TSDatos;
end;

procedure TFEvePartoMasivo.PCBasicoChange(Sender: TObject);
begin
  if(PCBasico.ActivePage = TSManga) or (PCBasico.ActivePage = TSDatos) {or (PCBasico.ActivePage = TSDistocia)} then
  begin
    if MSimple.IBQSeleccionados.RecordCount>=1 then
      ModoEve := meMasivo
    else
      ModoEve := meIndividual;
    ControlEventoOnExit(self);
    ManejarBotones;
  end;

  if (PCBasico.ActivePage = TSDatos) then
  begin
      if(DBLCBATipoParto.KeyValue = 2) then
        TSDistocia.TabVisible := true;
  end;
  inherited;
  TSDistocia.ImageIndex := 4;
  if(PCBasico.ActivePage = TSDistocia)then
    TSDistocia.ImageIndex := 1;
end;


procedure TFEvePartoMasivo.CargarParametrosSP;
begin
 creacionGrupo;
 grupo:=IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').Value;
 IBQSPEventoInd.ParamByName('FECHA').AsDate  := trunc(DTPAFechaParto.Date);
 IBQSPEventoInd.ParamByName('ANIMAL').Value := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
 IBQSPEventoInd.ParamByName('OBSERVACION').Value := MAObservacion.GetDato;
 IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
 IBQSPEventoInd.ParamByName('RESPONSABLE').Value := DBLCBAResponsable.GetDato;
 IBQSPEventoInd.ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
 IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := Now;
 IBQSPEventoInd.ParamByName('TIPO_PARTO').Value := DBLCBATipoParto.KeyValue;
 IBQSPEventoInd.ParamByName('CAUSA').Value := DBLCBACausaDistocia.KeyValue;
 IBQSPEventoInd.ParamByName('GRADO').Value := DBLCBAGradoDistocia.KeyValue;
 IBQSPEventoInd.ParamByName('OBS_DISTOCIA').Value := MAObservacionDistocia.Text;
 IBQSPEventoInd.ParamByName('ID_GRUPO').Value := grupo;

 if CambioRodeo then
  IBQSPEventoInd.ParamByName('RODEO').Value := DBLCBARodeos.KeyValue
 else
  IBQSPEventoInd.ParamByName('RODEO').Value := null;
 if CambioPotrero then
  IBQSPEventoInd.ParamByName('POTRERO').Value := DBLCBAPotrero.KeyValue
 else
  IBQSPEventoInd.ParamByName('POTRERO').Value := null;

 IBQSPEventoInd.ParamByName('FECHA_PARTO').AsDate  := trunc(DTPAFechaParto.Date);
 IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := CondicionC;
end;

procedure TFEvePartoMasivo.LoadSQLStringList;
begin
  SQLStringList.AddObject('V1',DMSoftvet.DSResponsable);
  SQLStringList.AddObject('V2',DMSoftvet.DSTiposParto);
  SQLStringList.AddObject('V3',DMSoftvet.DSCausaDistocia);
  SQLStringList.AddObject('V4',DMSoftvet.DSGradoAsistencia);
  SQLStringList.AddObject('V5',DMSoftvet.DSRodeo);
  SQLStringList.AddObject('V6',DMSoftvet.DSPotrero);
  SQLStringList.AddObject('V7',DMSoftvet.DSCondicionCorporal);
end;

procedure TFEvePartoMasivo.IBDSSimpleV2SetText(Sender: TField; const Text: String);
var
  aux : double;
  aux2 : String;
  PickPos : integer;
  f : TDateTime;
begin
  inherited;
  if((IBDSSimple.State <> dsInsert) or cargaXLS) then
  begin
    SetText(Sender,Text);
    if (Sender.FieldName = 'V1') then   //Responsable
    begin
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select NOMBRE || '' '' || APELLIDO as NombreyApellido from TAB_EMPLEADOS where (establecimiento = :esta) and ((apellido like '''+UpperCase(Text)+'%'') or(nombre like '''+UpperCase(Text)+'%'')or (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%''))');
        IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
        BEGIN
            Sender.AsString := IBQValidaciones.FieldByName('NombreyApellido').AsString;
            PickPos := BDBGSimple.ColumnByField('V1').PickList.IndexOf(BDBGSimple.ColumnByField('V1').Field.AsString);
            IBDSSimpleRESPONSABLE.Value :=  TClassType(BDBGSimple.ColumnByField('V1').PickList.Objects[PickPos]).getValue;
        END;
    end;
    if (Sender.FieldName = 'V7') then   //Condicion Corporal
    begin
      if (TryStrTofloat(text,aux)) then
      begin
        aux2 := StringReplace(FormatFloat('0.0',aux), ',', '.',[]);
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select count(*)as cantidad from cod_condiciones_corporales where ('+fprincipal.StringEscalaCC+' = '+aux2+')');
        IBQValidaciones.Active := true;

        if (IBQValidaciones.FieldByName('cantidad').AsInteger <> 0) then
          begin
            IBQValidaciones.Active := false;
            IBQValidaciones.SQL.Clear;
            IBQValidaciones.SQL.Add('select '+FPrincipal.StringEscalaCC+' from cod_condiciones_corporales where ('+FPrincipal.StringEscalaCC+' = '+aux2+')');
            IBQValidaciones.Active := true;
            Sender.Value := IBQValidaciones.FieldByName(FPrincipal.StringEscalaCC).Value;

            PickPos := BDBGSimple.ColumnByField('V7').PickList.IndexOf(BDBGSimple.ColumnByField('V7').Field.AsString);
            //IBDSSimpleCONDICION_CORPORAL.AsInteger := TClassType(BDBGSimple.ColumnByField('CONDICION_CORPORAL').PickList.Objects[PickPos]).getValue;
            IBDSSimple.FieldByName('I7').Value :=  TClassType(BDBGSimple.ColumnByField('V7').PickList.Objects[PickPos]).getValue;
          end;
      end;
    end;
    if(Sender.FieldName = 'FECHA')then
    begin
      if (TryStrToDate(Text,f)) then
           Sender.AsVariant := StrToDate(text);
    end;
    if(Sender.FieldName = 'V2') then  //Tipo de Parto
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from cod_tipos_parto where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString ;
        PickPos := BDBGSimple.ColumnByField('V2').PickList.IndexOf(BDBGSimple.ColumnByField('V2').Field.AsString);
        IBDSSimpleI1.Value := TClassType(BDBGSimple.ColumnByField('V2').PickList.Objects[PickPos]).getValue;
        if (IBDSSimpleI1.Value = 2) then
        begin
          TSDistocia.TabVisible:=true;
          BDBGSimple.ColumnByField('V3').Visible := true;
          BDBGSimple.ColumnByField('V4').Visible := true;
          IBDSSimpleV2SetText(IBDSSimpleV3,'N');
          IBDSSimpleV2SetText(IBDSSimpleV4,'N');
        end
        else
          if (BDBGSimple.ColumnByField('V3').Visible) then
          begin
            IBDSSimpleV3.Value := '';
            IBDSSimpleV4.Value := '';
          end
      end;
    end;
    if (Sender.FieldName = 'V3') then  //Causa Distocia
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from cod_causas_distocia where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not IBQValidaciones.IsEmpty then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('V3').PickList.IndexOf(BDBGSimple.ColumnByField('V3').Field.AsString);
        IBDSSimpleI3.Value := TClassType(BDBGSimple.ColumnByField('V3').PickList.Objects[PickPos]).getValue;
      end;
      IBDSSimpleV2.Value := 'DISTOCICO';
      if (IBDSSimpleV4.Value = '') then
        IBDSSimpleV2SetText(IBDSSimpleV4,'N');
    end;
    if (Sender.FieldName = 'V4') then  //Grado de Asistencia
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from cod_grados_asistencia where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not IBQValidaciones.IsEmpty then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('V4').PickList.IndexOf(BDBGSimple.ColumnByField('V4').Field.AsString);
        IBDSSimpleI4.Value := TClassType(BDBGSimple.ColumnByField('V4').PickList.Objects[PickPos]).getValue;
      end;
      IBDSSimpleV2.Value := 'DISTOCICO';
      if (IBDSSimpleV3.Value = '') then
        IBDSSimpleV2SetText(IBDSSimpleV3,'N');
    end;
    if (Sender.FieldName = 'V5') then  //Rodeo
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from tab_rodeos where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not IBQValidaciones.IsEmpty then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('V5').PickList.IndexOf(BDBGSimple.ColumnByField('V5').Field.AsString);
        IBDSSimpleI5.Value := TClassType(BDBGSimple.ColumnByField('V5').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if (Sender.FieldName = 'V6') then  //Potrero
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from tab_potreros where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not IBQValidaciones.IsEmpty then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('V6').PickList.IndexOf(BDBGSimple.ColumnByField('V6').Field.AsString);
        IBDSSimpleI6.Value := TClassType(BDBGSimple.ColumnByField('V6').PickList.Objects[PickPos]).getValue;
      end;
    end;
  end;
end;

procedure TFEvePartoMasivo.DBLCBATipoPartoCloseUp(Sender: TObject);
begin
  inherited;
  if (DBLCBATipoParto.KeyValue = 2) then
  begin
   // TSDistocia.TabVisible := true;
    TSDistocia.TabVisible :=MSimple.IBQSeleccionados.RecordCount >=1;
    DBLCBACausaDistocia.KeyValue:=0;
    DBLCBAGradoDistocia.KeyValue:=0;
    DBLCBACausaDistocia.EsRequerido := true;
    DBLCBAGradoDistocia.EsRequerido := true;
    BDBGSimple.ColumnByField('V3').Visible := true;
    BDBGSimple.ColumnByField('V4').Visible := true;
    //if BDBGSimple.RowCount<=2 then
      //TSGrilla.TabVisible:=false;
  end
  else
  begin
    if MSimple.IBQSeleccionados.RecordCount =1 then
      TSDistocia.TabVisible := false;
    DBLCBACausaDistocia.EsRequerido := false;
    DBLCBAGradoDistocia.EsRequerido := false;
    //BDBGSimple.ColumnByField('V3').Visible := false;
    //BDBGSimple.ColumnByField('V4').Visible := false;
    //ATerminar.Enabled := false;
  end;
  ControlBounds;
end;

procedure TFEvePartoMasivo.ATerminarExecute(Sender: TObject);
begin
  try
    inherited;
    if PuedeTerminar then
    begin
      IBQGrupoParto.Close;
      IBQGrupoParto.ParamByName('ID_GRUPO').AsInteger := grupo;
      IBQGrupoParto.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
      IBQGrupoParto.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
      if MostrarMensaje(tmConsulta,'Desea cargar los nacimientos de estos partos?') = mrYes then
        FPrincipal.AEveNacimientosExecute(self);
    end;
  except
    on E : Exception do
    begin
      MostrarMensaje(tmError,E.Message);
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;
end;

procedure TFEvePartoMasivo.MSimpleBBAgregarUnoClick(Sender: TObject);
begin
  inherited;
  ManejarBotones();
end;

procedure TFEvePartoMasivo.MSimpleBBAgregarTodosClick(Sender: TObject);
begin
  inherited;
  ManejarBotones();
end;

procedure TFEvePartoMasivo.MSimpleBBEliminarUnoClick(Sender: TObject);
begin
  inherited;
  ManejarBotones();
end;

procedure TFEvePartoMasivo.MSimpleBBEliminarTodosClick(Sender: TObject);
begin
  inherited;
  ManejarBotones();
end;

procedure TFEvePartoMasivo.ManejarBotones();
begin
  if (MSimple.IBQSeleccionados.RecordCount >= 1) then
  begin
    BBSiguiente.Enabled := true;
    TSDatos.Enabled := true;
    TSDatos.TabVisible := true;
  end
  else
  begin
    BBSiguiente.Enabled := false;
    TSDatos.TabVisible := false;
    TSDatos.Enabled := false;
  end;
  //BBTerminar.Enabled := false;
end;

procedure TFEvePartoMasivo.FormShow(Sender: TObject);
begin
  inherited;
  //DTPAFechaParto.Date := DateOf(Now);
//  DTPAFechaParto.MaxDate:= now;
  MSimple.PasarParametros(2,5);
  ManejarBotones();
  // Cuando se muestra la primera vez, se oculta
  JvTerminar.Visible := false;
  LBBTerminar.Visible := false;
  ComponentesVisiblesPorPais(FPrincipal.Pais);
end;

procedure TFEvePartoMasivo.DTPAFechaPartoChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
    fecha.Date:=now;
  GetEvent(DTPAFechaParto);
end;

procedure TFEvePartoMasivo.Label2Click(Sender: TObject);
begin
  inherited;
  LResponsableClick(nil);
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEvePartoMasivo.Label2MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label2.Font.Color:= $00606C02;
      Label2.Font.Style:= [fsBold,fsUnderline];
    end;  
end;

procedure TFEvePartoMasivo.Label2MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label2.Font.Color:= clWindowText;
      Label2.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEvePartoMasivo.Label5Click(Sender: TObject);
var
  abm : TFABMPotreros;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm := TFABMPotreros.Create(self);
      abm.Abrir(faAbm);
      DMSoftvet.IBQPotrero.Close;
      DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQPotrero.Open;
      if nroID>-1 then
        begin
        DBLCBAPotrero.KeyValue:=nroID;
        nroID:=-1;
        GetEvent(DBLCBAPotrero);
        end;
    end;

end;

procedure TFEvePartoMasivo.Label5MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      if (Label5.Enabled) then
        begin
          Label5.Font.Color:= $00606C02;
          Label5.Font.Style:= [fsBold,fsUnderline];
        end;
    end;  
end;

procedure TFEvePartoMasivo.Label5MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      if (Label5.Enabled) then
        begin
          Label5.Font.Color:= clWindowText;
          Label5.Font.Style:= [fsUnderline];
        end;
    end;  
end;

procedure TFEvePartoMasivo.Label4Click(Sender: TObject);
var
  abm : TFABMRodeos;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm := TFABMRodeos.Create(self);
      abm.Abrir(faAbm);
      DMSoftvet.IBQRodeo.Close;
      DMSoftvet.IBQRodeo.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQRodeo.Open;

      if nroID>-1 then
        begin
        DBLCBARodeos.KeyValue:=nroID;
        nroID:=-1;
        GetEvent(DBLCBARodeos);
        end;      
    end;  
end;

procedure TFEvePartoMasivo.Label4MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      if (Label4.Enabled) then
        begin
          Label4.Font.Color:= $00606C02;
          Label4.Font.Style:= [fsBold,fsUnderline];
        end;
    end;
end;

procedure TFEvePartoMasivo.Label4MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      if (Label4.Enabled) then
        begin
          Label4.Font.Color:= clWindowText;
          Label4.Font.Style:= [fsUnderline];
        end;  
    end;  
end;

procedure TFEvePartoMasivo.ComponentesVisiblesPorPais(pais: Integer);
begin
  inherited;

  if (pais = 1) then //Argentina
   begin

//
   end
  else
    if (pais = 2) then //Uruguay
     begin
//
     end;
end;

procedure TFEvePartoMasivo.completarCampos;
begin
      inherited;
      if DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V1').Value,'ID_EMPLEADO')<>null then
        IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V1').Value,'ID_EMPLEADO')
      else
        IBDSSimple.FieldByName('RESPONSABLE').Value:= 0;
      if DBLCBARodeos.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V5').Value,'ID_RODEO')<>null then
        IBDSSimple.FieldByName('I5').Value:= DBLCBARodeos.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V5').Value,'ID_RODEO')
      else
        IBDSSimple.FieldByName('I5').Value:= 0;
      if DBLCBAPotrero.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V6').Value,'ID_POTRERO')<>null then
        IBDSSimple.FieldByName('I6').Value:= DBLCBAPotrero.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V6').Value,'ID_POTRERO')
      else
        IBDSSimple.FieldByName('I6').Value:= 0;
      

      if DBLCBATipoParto.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V2').Value,'SINONIMO')<>null then
        IBDSSimple.FieldByName('V2').Value:= DBLCBATipoParto.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V2').Value,'SINONIMO');
      IBDSSimple.FieldByName('I1').Value:= DBLCBATipoParto.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('V2').Value,'ID_TIPO_PARTO');
//      RealizarCambio(DBLCBATipoParto,[IBDSSimple.FieldByName('V2'),IBDSSimple.FieldByName('I1')],[IBDSSimple.FieldByName('V2'),IBDSSimple.FieldByName('I1')]);
      if (IBDSSimple.FieldByName('I1').Value=2) then
        TSDistocia.TabVisible:=true;

      if DBLCBACausaDistocia.ListSource.DataSet.Lookup('codigo',IBDSSimple.FieldByName('V3').Value,'SINONIMO')<>null then
        IBDSSimple.FieldByName('V3').Value:= DBLCBACausaDistocia.ListSource.DataSet.Lookup('codigo',IBDSSimple.FieldByName('V3').Value,'SINONIMO');
      IBDSSimple.FieldByName('I3').Value:= DBLCBACausaDistocia.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('I3').Value,'ID_CAUSA_DISTOCIA');

      //if DBLCBACondCorp.ListSource.DataSet.Lookup('ID',IBDSSimple.FieldByName('V3').Value,'SINONIMO')<>null then
        //IBDSSimple.FieldByName('V3').Value:= DBLCBACausaDistocia.ListSource.DataSet.Lookup('codigo',IBDSSimple.FieldByName('V3').Value,'SINONIMO');
      IBDSSimple.FieldByName('I7').Value:= DBLCBACondCorp.ListSource.DataSet.Lookup('escala',IBDSSimple.FieldByName('V7').Value,'ID_CONDICION_CORPORAL');

      if DBLCBAGradoDistocia.ListSource.DataSet.Lookup('codigo',IBDSSimple.FieldByName('V4').Value,'SINONIMO')<>null then
        IBDSSimple.FieldByName('V4').Value:= DBLCBAGradoDistocia.ListSource.DataSet.Lookup('codigo',IBDSSimple.FieldByName('V4').Value,'SINONIMO');
      IBDSSimple.FieldByName('I4').Value:= DBLCBAGradoDistocia.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('I4').Value,'ID_CAUSA_DISTOCIA');
      //  RealizarCambio(DBLCBACausaDistocia,[IBDSSimple.FieldByName('V3'),IBDSSimple.FieldByName('I3')],[DBLCBACausaDistocia.Text,DBLCBACausaDistocia.KeyValue]);
      //  RealizarCambio(DBLCBAGradoDistocia,[IBDSSimple.FieldByName('V4'),IBDSSimple.FieldByName('I4')],[DBLCBAGradoDistocia.Text,DBLCBAGradoDistocia.KeyValue]);
      if (IBDSSimpleI1.Value = 2) then
        begin
          BDBGSimple.ColumnByField('V3').Visible := true;
          BDBGSimple.ColumnByField('V4').Visible := true;
        end;
end;

procedure TFEvePartoMasivo.DBLCBATipoPartoExit(Sender: TObject);
begin
  inherited;
  getEvent(DBLCBATipoParto);
  getEvent(DBLCBACausaDistocia);
  getEvent(DBLCBAGradoDistocia);
end;

procedure TFEvePartoMasivo.CBCondCorpClick(Sender: TObject);
begin
  inherited;
  if CBCondCorp.Checked then
  begin
    CondicionC := DBLCBACondCorp.KeyValue;
    Condicion := DBLCBACondCorp.Text;
    DBLCBACondCorp.Enabled := true;
    BDBGSimple.Columns[6].Visible := true;
  end
  else
  begin
    CondicionC := Null;
    Condicion := '';
    DBLCBACondCorp.Enabled := false;
    BDBGSimple.Columns[6].Visible := false;
  end;
end;

procedure TFEvePartoMasivo.DBLCBACondCorpCloseUp(Sender: TObject);
begin
  inherited;
  CondicionC := DBLCBACondCorp.KeyValue;
  Condicion := DBLCBACondCorp.Text;
end;

procedure TFEvePartoMasivo.setDefault(campo:string);
begin
inherited;
if campo='FECHA' then IBDSSimple.FieldByName(campo).Value:=now;
if campo='V2' then IBDSSimple.FieldByName(campo).Value:='NORMAL';

end;

procedure TFEvePartoMasivo.CBPotreroClick(Sender: TObject);
begin
  inherited;
  CambioPotrero := CBPotrero.Checked;
  if CambioPotrero then
  begin
    Label5.Enabled := true;
    DBLCBAPotrero.Enabled := true;
    BDBGSimple.Columns[4].Visible := true;
  end
  else
  begin
    Label5.Enabled := false;
    DBLCBAPotrero.Enabled := false;
    BDBGSimple.Columns[4].Visible := false;
  end;
end;

procedure TFEvePartoMasivo.CBRodeoClick(Sender: TObject);
begin
  inherited;
  CambioRodeo := CBRodeo.Checked;
  if CambioRodeo then
  begin
    Label4.Enabled := true;
    DBLCBARodeos.Enabled := true;
    BDBGSimple.Columns[5].Visible := true;
  end
  else
  begin
    Label4.Enabled := false;
    DBLCBARodeos.Enabled := false;
    BDBGSimple.Columns[5].Visible := false;
  end;
end;

procedure TFEvePartoMasivo.CargarDatos(I : Integer);
begin
  inherited;
  if DMSoftVet.IBQDatosAnimal.Lookup('ID_RP',IBDSSimple.FieldByName('ID_RP').Value,'ID_SENASA') <> null then
    IBDSSimple.FieldByName('ID_SENASA').AsString := DMSoftVet.IBQDatosAnimal.Lookup('ID_RP',IBDSSimple.FieldByName('ID_RP').Value,'ID_SENASA');
  //Responsable
  if DBLCBAResponsable.ListSource.DataSet.Locate('nombre',getDato('Responsable',anim[i]),[]) then
  begin
    IBDSSimple.FieldByName('V1').AsString := getDato('Responsable',anim[i]);
    IBDSSimple.FieldByName('RESPONSABLE').AsInteger := DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V1').Value,'ID_EMPLEADO');
  end
  else
  begin
    IBDSSimple.FieldByName('V1').AsString := 'INDEFINIDO';
    IBDSSimple.FieldByName('RESPONSABLE').AsInteger := 0;
  end;
  //Tipo de Parto
  if DBLCBATipoParto.ListSource.DataSet.Locate('sinonimo',getDato('Tipo de Parto',anim[i]),[]) then
    IBDSSimple.FieldByName('V2').AsString := getDato('Tipo de Parto',anim[i])
  else
    IBDSSimple.FieldByName('V2').AsString := 'NORMAL';
  IBDSSimple.FieldByName('I1').Value := DBLCBATipoParto.ListSource.DataSet.Lookup('sinonimo',IBDSSimple.FieldByName('V2').Value,'id_tipo_parto');
  //Causa Distocia
  if IBDSSimple.FieldByName('V2').AsString = 'DISTOCICO' then
  begin
    BDBGSimple.Columns[9].Visible := true;
    BDBGSimple.Columns[10].Visible := true;
    //Causa Distocia
    if DBLCBACausaDistocia.ListSource.DataSet.Locate('nombre',getDato('Causa Dist.',anim[i]),[]) then
      IBDSSimple.FieldByName('V3').AsString := getDato('Causa Dist.',anim[i])
    else
      IBDSSimple.FieldByName('V3').AsString := '';
    IBDSSimple.FieldByName('I3').Value := DBLCBACausaDistocia.ListSource.DataSet.Lookup('nombre',IBDSSimple.FieldByName('V3').Value,'id_causa_distocia');
    //Grado Distocia
    if DBLCBAGradoDistocia.ListSource.DataSet.Locate('nombre',getDato('Grado Dist.',anim[i]),[]) then
      IBDSSimple.FieldByName('V4').AsString := getDato('Grado Dist.',anim[i])
    else
      IBDSSimple.FieldByName('V4').AsString := '';
    IBDSSimple.FieldByName('I4').Value := DBLCBAGradoDistocia.ListSource.DataSet.Lookup('nombre',IBDSSimple.FieldByName('V4').Value,'id_grado_asistencia');
  end;
  //Potrero
  if UImportacion.existeCampo('Potrero') then
  begin
    BDBGSimple.Columns[4].Visible := true;
    if DBLCBAPotrero.ListSource.DataSet.Locate('nombre',getDato('Potrero',anim[i]),[]) then
      IBDSSimple.FieldByName('V6').AsString := getDato('Potrero',anim[i])
    else
      IBDSSimple.FieldByName('V6').AsString := '';
    IBDSSimple.FieldByName('I6').Value := DBLCBAPotrero.ListSource.DataSet.Lookup('nombre',IBDSSimple.FieldByName('V6').Value,'id_potrero');
  end;
  //Rodeo
  if UImportacion.existeCampo('Rodeo') then
  begin
    BDBGSimple.Columns[5].Visible := true;
    if DBLCBARodeos.ListSource.DataSet.Locate('nombre',getDato('Rodeo',anim[i]),[]) then
      IBDSSimple.FieldByName('V5').AsString := getDato('Rodeo',anim[i])
    else
      IBDSSimple.FieldByName('V5').AsString := '';
    IBDSSimple.FieldByName('I5').Value := DBLCBARodeos.ListSource.DataSet.Lookup('nombre',IBDSSimple.FieldByName('V5').Value,'id_rodeo');
  end;
  //Condicion Corporal
  if UImportacion.existeCampo('Condicion Corporal') then
  begin
    BDBGSimple.Columns[6].Visible := true;
    if DBLCBACondCorp.ListSource.DataSet.Locate('escala',getDato('Condicion Corporal',anim[i]),[]) then
      IBDSSimple.FieldByName('V7').AsString := getDato('Condicion Corporal',anim[i])
    else
      IBDSSimple.FieldByName('V7').AsString := '';
    IBDSSimple.FieldByName('I7').Value := DBLCBACondCorp.ListSource.DataSet.Lookup('escala',IBDSSimple.FieldByName('V7').Value,'id_condicion_corporal');
  end;
end;

end.
