unit UEveCalidadCarne;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, IBQuery, DB, IBCustomDataSet, WinXP, DataExport,
  DataToXLS, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Grids,
  DBGrids, UBDBGrid, MemoAuto, EditAuto, UFrameMangazo, Buttons, DBCtrls,
  UDBLookupComboBoxAuto, DateTimePickerAuto, Spin, ImgList, PngImageList,
  JvExControls, JvLabel, PngImage, JvExExtCtrls, JvImage, jpeg, JvGIF,
  JvEnterTab, JvComponentBase, JvBalloonHint, xmldom, XMLIntf, msxmldom,
  XMLDoc, Menus;

type
  TFEveCalidadCarne = class(TFEveSimple)
    LFecha: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    LObservador: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    LPeso: TLabel;
    EAPeso: TEditAuto;
    Label1: TLabel;
    DBLCBADias: TDBLookupComboBoxAuto;
    LAltura: TLabel;
    EAAltura: TEditAuto;
    LCm: TLabel;
    LEdad: TLabel;
    EAEdad: TEditAuto;
    Ldias: TLabel;
    IBQSexo: TIBQuery;
    IBQSexoSEXO: TIntegerField;
    IBQSexoNOMBRE: TIBStringField;
    IBQSexoSINONIMO: TIBStringField;
    DSSexo: TDataSource;
    LValor: TLabel;
    SEvalor: TSpinEdit;
    Label2: TLabel;
    alos18meses: TCheckBox;
    IBQObtenerIDSexo: TIBQuery;
    IBQObtenerIDSexoSEXO: TIntegerField;
    IBQObtenerIDSexoFECHA_NACIMIENTO: TDateField;
    DSObtenerIDSexo: TDataSource;
    PFrame: TPanel;
    STEdad: TStaticText;
    STAltura: TStaticText;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label5: TLabel;
    Label4: TLabel;
    SpinEdit2: TSpinEdit;
    GroupBox3: TGroupBox;
    DBLCBAPeladoSN: TDBLookupComboBoxAuto;
    IBQCodigoGenSINO: TIBQuery;
    DSCodigoGenSINO: TDataSource;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleID_AUX_EVENTO: TIntegerField;
    IBDSSimpleCODDIAS: TIBStringField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleDIAS: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    IBDSSimpleFECHA_NACIMIENTO: TDateField;
    IBDSSimpleALOS18MESES: TIBStringField;
    IBDSSimpleFRAME: TFloatField;
    IBDSSimpleEDAD: TIntegerField;
    IBDSSimpleCANTAOPBEGD: TIntegerField;
    IBDSSimpleCANTEGC: TIntegerField;
    IBDSSimpleCANTGI: TIntegerField;
    IBDSSimpleVUNO1: TIBStringField;
    IBDSSimplePELADO: TIBStringField;
    IBDSSimpleSEXO: TIntegerField;
    IBDSSimplePESO: TFloatField;
    IBDSSimpleALTURA: TFloatField;
    IBDSSimpleVALOR: TFloatField;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    JvEnterAsTab1: TJvEnterAsTab;
    IBDSSimpleAOB: TFloatField;
    IBDSSimpleEG: TFloatField;
    IBDSSimpleGI: TFloatField;
    IBDSSimpleGC: TFloatField;
    IBDSSimplePCMA: TFloatField;
    EAAreaOjoBifeValue: TEditAuto;
    EAEGValue: TEditAuto;
    EAGIValue: TEditAuto;
    EAGCValue: TEditAuto;
    EAPCMAValue: TEditAuto;
    procedure FormCreate(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LObservadorMouseEnter(Sender: TObject);
    procedure LObservadorMouseLeave(Sender: TObject);
    procedure DBLCBADiasCloseUp(Sender: TObject);
    procedure EAAlturaChange(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure DTPAFechaCloseUp(Sender: TObject);
    procedure SEvalorChange(Sender: TObject);
    procedure SEvalorKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EAEdadChange(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure DTPAFechaChange(Sender: TObject);
    procedure IBDSSimpleFECHAChange(Sender: TField);
    procedure IBDSSimpleALTURAChange(Sender: TField);
    procedure IBDSSimpleVALORSetText(Sender: TField; const Text: String);
    procedure EAreaOjoBifeValueKeyPress(Sender: TObject; var Key: Char);
    procedure EEGValueKeyPress(Sender: TObject; var Key: Char);
    procedure EGCValueKeyPress(Sender: TObject; var Key: Char);
    procedure EPCMAValueKeyPress(Sender: TObject; var Key: Char);
    procedure EGIValueKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    DiasPeso : String;
    FValorFrame: Real;
    FSexo: integer;

    FNacimiento: Tdate;
    FDias:Integer;
    FPulgadas : Real;

    procedure HabilitarParaIndividual(B: boolean);
    procedure ObtenerSexo(animal: integer);
    procedure VerCalculoFrameIndividual(altura:string);
    function PasarAFloat(dato : string) : double;      
  public
    { Public declarations }
  protected
    Procedure CargarParametrosSP;override;
    Procedure CargarParametrosRN;override;
    procedure CargarDatosGrilla;override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure cargarDatos(i:integer);override;
  end;

var
  FEveCalidadCarne: TFEveCalidadCarne;

implementation

{$R *.dfm}

uses UDMSoftvet, UPrincipal, UABMEmpleados, UFunctions, UMensajeHuella, DateUtils,UImportacion, UTraduccion;

{ TFEveCalidadCarne }

procedure TFEveCalidadCarne.FormCreate(Sender: TObject);
begin
  inherited;
  //
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').Value := 'DP';
  DMSoftvet.IBQCodigosGenericos.Open;
  DiasPeso := 'G';
  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, id_ie, fecha_nacimiento, nombre, apodo from VIS_CALIDAD_CARNE';

  IBQCodigoGenSINO.Close;
  IBQCodigoGenSINO.ParamByName('tipo').AsString := 'SN';
  IBQCodigoGenSINO.Open;

  DBLCBAPeladoSN.KeyValue := 'S';

  AsignarValoresDefecto;

  alos18meses.Checked := false;
end;

procedure TFEveCalidadCarne.CargarParametrosSP;
begin
  inherited;
   //
 IBQSPEventoInd.ParamByName('FECHA').AsDate  := DTPAFecha.Date;
 IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IDAnimal;
 IBQSPEventoInd.ParamByName('OBSERVACION').AsString := MAObservacion.GetDato;
 IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
 IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := DBLCBAResponsable.GetDato;
 IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger :=  FPrincipal.UsuarioActual;
 IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;

 if EAPeso.GetDato <> '' then
 begin
   IBQSPEventoInd.ParamByName('DIAS').Value := DiasPeso;
   IBQSPEventoInd.ParamByName('PESO').Value := EAPeso.GetDato;
 end
 else
 begin
  IBQSPEventoInd.ParamByName('DIAS').Value := '';
  IBQSPEventoInd.ParamByName('PESO').Value := 0;
 end;

 if EAAltura.GetDato <> '' then
  IBQSPEventoInd.ParamByName('ALTURA').Value := EAAltura.GetDato
 else
  IBQSPEventoInd.ParamByName('ALTURA').Value := 0;

 IBQSPEventoInd.ParamByName('EDAD').Value := EAEdad.GetDato;

 //if FValorFrame <> '' then
  IBQSPEventoInd.ParamByName('FRAME').Value := FValorFrame;
 {else
  IBQSPEventoInd.ParamByName('FRAME').Value := 0;}

 //if SEvalor.Value <> '' then
  IBQSPEventoInd.ParamByName('VALOR').Value := SEvalor.Value;
 {else
  IBQSPEventoInd.ParamByName('VALOR').Value := 0;}

 if(alos18meses.Checked)then
   IBQSPEventoInd.ParamByName('ALOS18MESES').Value := 1
 else
     IBQSPEventoInd.ParamByName('ALOS18MESES').Value := 0;


 IBQSPEventoInd.ParamByName('CANTAOPBEGD').Value :=SpinEdit1.Value;
 IBQSPEventoInd.ParamByName('CANTEGC').Value :=SpinEdit2.Value;
 IBQSPEventoInd.ParamByName('CANTGI').Value :=SpinEdit3.Value;

 IBQSPEventoInd.ParamByName('PELADO').Value := DBLCBAPeladoSN.KeyValue;

 if (EAAreaOjoBifeValue.Text <> '') then
    IBQSPEventoInd.ParamByName('AOB').AsFloat := PasarAFloat(EAAreaOjoBifeValue.Text)
 else
    IBQSPEventoInd.ParamByName('AOB').Value := null;

 if (EAEGValue.Text <> '') then
    IBQSPEventoInd.ParamByName('EG').AsFloat := PasarAFloat(EAEGValue.Text)
 else
    IBQSPEventoInd.ParamByName('EG').Value := null;

 if (EAGIValue.Text <> '') then
    IBQSPEventoInd.ParamByName('GI').AsFloat := PasarAFloat(EAGIValue.Text)
 else
    IBQSPEventoInd.ParamByName('GI').Value := null;

 if (EAGCValue.Text <> '') then
    IBQSPEventoInd.ParamByName('GC').AsFloat := PasarAFloat(EAGCValue.Text)
 else
    IBQSPEventoInd.ParamByName('GC').Value := null;

 if (EAPCMAValue.Text <> '') then
    IBQSPEventoInd.ParamByName('PCMA').AsFloat := PasarAFloat(EAPCMAValue.Text)
 else
    IBQSPEventoInd.ParamByName('PCMA').Value := null;

 IBQSPEventoInd.ParamByName('ID_GRUPO').Value := Null;

end;

procedure TFEveCalidadCarne.CargarParametrosRN;
begin
 inherited;
   //
 IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
 if(self.ModoEve = meIndividual)then
 begin
    IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
    if EAPeso.Text <> '' then
      IBQSPRN.ParamByName('PESO').AsInteger := StrToInt(EAPeso.Text)
    else
      IBQSPRN.ParamByName('PESO').Value := null;

    if FValorFrame > 0 then
      IBQSPRN.ParamByName('FRAME').Value := FValorFrame
    else
      IBQSPRN.ParamByName('FRAME').Value := null;

    if (IBDSSimple.FieldByName('SEXO').AsInteger <> 2) then
    begin
      if SEvalor.Value > 0 then
        IBQSPRN.ParamByName('VALOR').AsInteger :=  SEvalor.Value
      else
        IBQSPRN.ParamByName('VALOR').Value := null;
    end;
 end
 else
 begin
    IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;

    if IBDSSimplePESO.AsInteger > 0 then
      IBQSPRN.ParamByName('PESO').AsInteger := IBDSSimplePESO.AsInteger
    else
      IBQSPRN.ParamByName('PESO').Value := null;

    if IBDSSimple.fieldbyname('FRAME').AsFloat > 0 then
      IBQSPRN.ParamByName('FRAME').Value := IBDSSimple.fieldbyname('FRAME').AsFloat
    else
      IBQSPRN.ParamByName('FRAME').Value := null;

    if (IBDSSimple.FieldByName('SEXO').AsInteger <> 2) then
    begin
      if IBDSSimple.fieldbyname('valor').AsInteger > 0 then
        IBQSPRN.ParamByName('VALOR').AsInteger := IBDSSimple.fieldbyname('valor').AsInteger
      else
        IBQSPRN.ParamByName('VALOR').Value := null;
    end;
 end;
 IBQSPRN.ParamByName('EDAD_PESADO').Value:= DBLCBADias.GetDato;
 IBQSPRN.ParamByName('FECHA').AsDate := DTPAFecha.Date;
end;

procedure TFEveCalidadCarne.CargarDatosGrilla;
var
  valFrame : Double;
  valor : integer;
begin
  inherited;

  IDAnimal := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
  IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];

  FDias:= CantidadDias(MSimple.IBQSeleccionados.FieldValues['FECHA_NACIMIENTO'],DTPAFecha.DateTime);

  if (EAAltura.Text <> '') then
    FPulgadas := StrToFloat(trim(EAAltura.Text))/ 2.54
  else
    FPulgadas := 0;

  ObtenerSexo(IDAnimal);// Obtiene el sexo  ysetea la variable FSexo
  IBQSexo.close;
  IBQSexo.ParamByName('ID').AsInteger := FSexo;
  IBQSexo.Open;

  IBDSSimple.FieldByName('ID_RP').Asstring:=MSimple.IBQSeleccionados.FieldValues['ID_RP'];
  IBDSSimple.FieldByName('ID_SENASA').Value:=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];

  IBDSSimple.FieldByName('SEXO').Value:= FSexo;

  RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.GetDato]);

  RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESP'),IBDSSimple.FieldByName('RESPONSABLE')],[DBLCBAResponsable.Text,DBLCBAResponsable.GetDato]);

  RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);

  IBDSSimple.FieldByName('ID_ANIMAL').Value:= IDAnimal;

  IBDSSimple.FieldByName('FECHA_NACIMIENTO').AsDateTime := MSimple.IBQSeleccionados.FieldValues['FECHA_NACIMIENTO'];

  if (EAAltura.Text <> '') then
    RealizarCambio(EAAltura,[IBDSSimple.FieldByName('ALTURA')],[EAAltura.GetDato])
  else
    IBDSSimple.FieldByName('ALTURA').Value := null;

  if(IBQSexo.FieldValues['sexo'] = 1)then
     valFrame := CalcularFrameMachos(FPulgadas, FDias)
  else
     valFrame := CalcularFrameHembras(FPulgadas, FDias);

  if (EAAltura.Text <> '') then
    RealizarCambio(EAAltura,[IBDSSimple.FieldByName('FRAME')],[valFrame])
  else
    IBDSSimple.FieldByName('FRAME').Value := null;
    
  if (FSexo <> 2) then
    RealizarCambio(SEvalor,[IBDSSimple.FieldByName('VALOR')],[SEvalor.Value]);

  if (EAPeso.Text <> '') then
    RealizarCambio(EAPeso,[IBDSSimple.FieldByName('PESO')],[FormatFloat('00.00',EAPeso.GetDato)])
  else
    IBDSSimple.FieldByName('PESO').Value := null;

  RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('EDAD')],[FDias]);

  if (alos18meses.Checked) then
      valor := 1
  else
      valor := 0;

  RealizarCambio(ALOS18MESES,[IBDSSimple.FieldByName('ALOS18MESES')],[valor]);
  
  RealizarCambio(SpinEdit1,[IBDSSimple.FieldByName('CANTAOPBEGD')],[SpinEdit1.Value]);
  RealizarCambio(SpinEdit2,[IBDSSimple.FieldByName('CANTEGC')],[SpinEdit2.Value]);
  RealizarCambio(SpinEdit3,[IBDSSimple.FieldByName('CANTGI')],[SpinEdit3.Value]);

  RealizarCambio(DBLCBAPeladoSN,[IBDSSimple.FieldByName('VUNO1'),IBDSSimple.FieldByName('PELADO')],[DBLCBAPeladoSN.KeyValue,DBLCBAPeladoSN.Text]);

  RealizarCambio(EAAreaOjoBifeValue,[IBDSSimple.FieldByName('aob')],[PasarAFloat(EAAreaOjoBifeValue.Text)]);
  RealizarCambio(EAEGValue,[IBDSSimple.FieldByName('eg')],[PasarAFloat(EAEGValue.Text)]);
  RealizarCambio(EAGIValue,[IBDSSimple.FieldByName('gi')],[PasarAFloat(EAGIValue.Text)]);
  RealizarCambio(EAGCValue,[IBDSSimple.FieldByName('gc')],[PasarAFloat(EAGCValue.Text)]);
  RealizarCambio(EAPCMAValue,[IBDSSimple.FieldByName('pcma')],[PasarAFloat(EAPCMAValue.Text)]);
end;

procedure TFEveCalidadCarne.CargarParametrosMasivo;
begin
  inherited;

  if(CrearGrupo)then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').Value;

  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  IBQSPEventoInd.ParamByName('DIAS').Value := IBDSSimpleCODDIAS.Value;
  IBQSPEventoInd.ParamByName('PESO').Value := IBDSSimple.FieldValues['PESO'];
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimpleRESPONSABLE.AsInteger;
  IBQSPEventoInd.ParamByName('ALTURA').Value := IBDSSimple.FieldValues['ALTURA'];
  IBQSPEventoInd.ParamByName('EDAD').Value := IBDSSimple.FieldValues['EDAD'];
  IBQSPEventoInd.ParamByName('FRAME').Value := IBDSSimple.FieldValues['FRAME'];

  if (IBDSSimple.FieldByName('SEXO').AsInteger <> 2) then
    IBQSPEventoInd.ParamByName('VALOR').Value := IBDSSimple.FieldValues['VALOR'];

  IBQSPEventoInd.ParamByName('ALOS18MESES').Value := IBDSSimple.FieldValues['ALOS18MESES'];


  IBQSPEventoInd.ParamByName('CANTAOPBEGD').Value := IBDSSimple.FieldValues['CANTAOPBEGD'];
  IBQSPEventoInd.ParamByName('CANTEGC').Value :=IBDSSimple.FieldValues['CANTEGC'];
  IBQSPEventoInd.ParamByName('CANTGI').Value :=IBDSSimple.FieldValues['CANTGI'];

  IBQSPEventoInd.ParamByName('PELADO').Value := IBDSSimple.FieldValues['VUNO1'];

  IBQSPEventoInd.ParamByName('AOB').Value := IBDSSimple.FieldValues['aob'];
  IBQSPEventoInd.ParamByName('EG').Value := IBDSSimple.FieldValues['eg'];
  IBQSPEventoInd.ParamByName('GI').Value := IBDSSimple.FieldValues['gi'];
  IBQSPEventoInd.ParamByName('GC').Value := IBDSSimple.FieldValues['gc'];
  IBQSPEventoInd.ParamByName('PCMA').Value := IBDSSimple.FieldValues['pcma'];

end;

procedure TFEveCalidadCarne.LoadSQLStringList;
begin
 inherited;

 SQLStringList.AddObject('RESP',DMSoftvet.DSResponsable);
 SQLStringList.AddObject('DIAS',DMSoftvet.DSCodigosGenericos);
 SQLStringList.AddObject('PELADO',DSCodigoGenSINO);

end;

procedure TFEveCalidadCarne.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveCalidadCarne.LObservadorMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= $00606C02;
      LObservador.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveCalidadCarne.LObservadorMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= clWindowText;
      LObservador.Font.Style:= [fsUnderline];
    end; 
end;

procedure TFEveCalidadCarne.DBLCBADiasCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBADias.KeyValue <> null then
    DiasPeso := DBLCBADias.KeyValue;
end;

procedure TFEveCalidadCarne.EAAlturaChange(Sender: TObject);
begin
  inherited;
  VerCalculoFrameIndividual(EAAltura.Text);
end;

procedure TFEveCalidadCarne.VerCalculoFrameIndividual(altura:string);
var val:integer;
begin
  if(TryStrToInt(altura,val))then
    if(StrToInt(altura)>200)or (StrToInt(altura)<0)then
    begin
       MostrarMensaje(tmError, 'El valor altura no es válido');
       EAAltura.Text := '';
       FPulgadas:= 0;
       STAltura.Caption :='';
      end
      else
        if(ModoEve = meIndividual )then
        begin
          ObtenerSexo(IDAnimal);
          IBQSexo.Close;
          IBQSexo.ParamByName('ID').AsInteger := FSexo;
          IBQSexo.Open;
          FNacimiento:= IBQObtenerIDSexoFECHA_NACIMIENTO.AsDateTime;
          FDias := CantidadDias(FNacimiento,DTPAFecha.DateTime);
          EAEdad.Text := IntToStr(Fdias);
          FPulgadas := StrToFloat(trim(EAAltura.Text))/ 2.54;
          if(IBQSexo.FieldValues['sexo'] = 1)then
            FValorFrame :=CalcularFrameMachos(FPulgadas, StrToInt(EAEdad.Text))
          else
            FValorFrame :=CalcularFrameHembras(FPulgadas,StrToInt(EAEdad.Text));
          PFrame.Caption:=Traducir('FRAME  : ')+ FloatToStr(FValorFrame);
          STAltura.Caption :=FormatFloat('00.00',FPulgadas)  + Traducir(' Pulgadas');
    end;
end;

procedure TFEveCalidadCarne.HabilitarParaIndividual(B: boolean);
begin
  EAEdad.Visible  := B;
  LEdad.Visible   := B;
  Ldias.Visible   := B;
  STEdad.Visible := B;
  PFrame.Caption := '';
end;

procedure TFEveCalidadCarne.ObtenerSexo(animal: integer);
begin
  IBQObtenerIDSexo.Close;
  IBQObtenerIDSexo.ParamByName('id').AsInteger := Animal;
  IBQObtenerIDSexo.Open;
  FSexo:= IBQObtenerIDSexoSEXO.AsInteger;
  FNacimiento:= IBQObtenerIDSexoFECHA_NACIMIENTO.AsDateTime;
  FDias := CantidadDias(FNacimiento,DTPAFecha.DateTime);
  EAEdad.Text := IntToStr(Fdias);
end;

procedure TFEveCalidadCarne.PCBasicoChange(Sender: TObject);
begin
  inherited;
  if(ModoEve = meMasivo)then  HabilitarParaIndividual(false)
  else
  begin
    HabilitarParaIndividual(true);
    ObtenerSexo(IDAnimal);
    EAEdad.Text:=IntToStr(CantidadDias(FNacimiento,DTPAFecha.DateTime));
    VerCalculoFrameIndividual(EAAltura.Text);

  end;
  {if(PCBasico.ActivePage = TSDatos) then
    EAAltura.SetFocus;}
end;


procedure TFEveCalidadCarne.DTPAFechaCloseUp(Sender: TObject);
begin
  inherited;
   FDias := CantidadDias(FNacimiento,DTPAFecha.DateTime);
   EAEdad.Text := IntToStr(Fdias);
end;


procedure TFEveCalidadCarne.SEvalorChange(Sender: TObject);
begin
  inherited;
  if((SEvalor.Text <> '') and (IntToStr(SEvalor.MaxValue) <> '')) then
  begin
      if( StrToInt(SEvalor.Text) > SEvalor.MaxValue ) then
        SEvalor.Text:=IntToStr(SEvalor.MaxValue);
  end
  else
     SEvalor.Text:='0';
end;

procedure TFEveCalidadCarne.SEvalorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not(key in (['0'..'9'])) then
    key := #0;
end;

procedure TFEveCalidadCarne.FormShow(Sender: TObject);
begin
  inherited;
  DTPAFecha.Date := DateOf(now);
//  DTPAFecha.MaxDate:= now;
//  MSimple.PasarParametros(1);{Para filtrar las categorias para el Combo de la Manga}//aca cambie codigo
 // MSimple.PasarParametros(1,6);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
  DBLCBAResponsable.AsignarValorDefecto;
  SEvalor.Value :=0;
  {if(PCBasico.ActivePage = TSDatos)then
   begin
     SEvalor.SetFocus;
     SEvalor.SelectAll;
   end;}

  DTPAFecha.Date := now;
//  DTPAFecha.MaxDate:= now;
  if(ModoEve = meIndividual)then
    ObtenerSexo(IDAnimal);
  //MSimple.DBLCBCategoria.KeyValue:=1;//agregue codigo
  MSimple.PasarParametros(0,0);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
 //MSimple.PasarParametros(0,4);
end;

procedure TFEveCalidadCarne.EAEdadChange(Sender: TObject);
begin
  inherited;
  if(EAEdad.Visible)then
    STEdad.Caption := '-  ' + CantidadMeses(FNacimiento, DTPAFecha.DateTime);
end;

procedure TFEveCalidadCarne.cargarDatos(i:integer);
var
  valFrame : Double;
  str : String;
begin
inherited;
  EAPeso.Text:='0';
  EAAltura.Text:='0';

  IDAnimal := MSimple.IBQDisponibles.FieldValues['ID_ANIMAL'];
  FDias:= CantidadDias(MSimple.IBQDisponibles.FieldValues['FECHA_NACIMIENTO'],IBDSSimple.FieldByName('FECHA').AsDateTime);
  str := getDato('altura',anim[i]);
  if str <> '' then
    FPulgadas := StrToFloat(trim(str))/ 2.54
  else
    FPulgadas := 0;

  ObtenerSexo(IDAnimal);// Obtiene el sexo  y setea la variable FSexo
  IBQSexo.close;
  IBQSexo.ParamByName('ID').AsInteger := FSexo;
  IBQSexo.Open;

  IBDSSimple.FieldByName('SEXO').Value:= FSexo;////

  IBDSSimple.FieldByName('RESP').Value:= getDato('responsable',anim[i]);
  IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');

  IBDSSimple.FieldByName('DIAS').Value:= DBLCBADias.ListSource.DataSet.Lookup('ID_CODIGO','G','VALOR'); //se pone en gral
  IBDSSimple.FieldByName('CODDIAS').Value:= DBLCBADias.ListSource.DataSet.Lookup('VALOR',IBDSSimple.FieldByName('DIAS').Value,'ID_CODIGO');

  IBDSSimple.FieldByName('FECHA_NACIMIENTO').AsDateTime := MSimple.IBQDisponibles.FieldValues['FECHA_NACIMIENTO'];

  str := getDato('altura',anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('ALTURA').Value:= str
  else
    IBDSSimple.FieldByName('ALTURA').Value := null;

  if(IBQSexo.FieldValues['sexo'] = 1)then
     valFrame := CalcularFrameMachos(FPulgadas, FDias)
  else
     valFrame := CalcularFrameHembras(FPulgadas, FDias);

  str:=getDato('circunferencia',anim[i]);
  if (IBDSSimple.FieldByName('SEXO').Value <> 2) then
    if str<>'' then
      IBDSSimple.FieldByName('VALOR').Value:=str;

  str := getDato('peso',anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('PESO').Value:= str
  else
    IBDSSimple.FieldByName('PESO').Value:= null;

  str := getDato('cantidad imágenes o.p.b.e.g.d.',anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('CANTAOPBEGD').value:= str
  else
    IBDSSimple.FieldByName('CANTAOPBEGD').value:= 0;

  str := getDato('cantidad imágenes e.g.c.',anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('CANTEGC').value:= str
  else
    IBDSSimple.FieldByName('CANTEGC').value:= 0;

  str := getDato('cantidad imágenes g.i.',anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('CANTGI').Value:= str
  else
    IBDSSimple.FieldByName('CANTGI').Value:= 0;

  IBDSSimple.FieldByName('PELADO').Value:=getDato('pelado',anim[i]);
  IBDSSimple.FieldByName('VUNO1').Value:=DBLCBAPeladoSN.ListSource.DataSet.Lookup('VALOR',IBDSSimple.FieldByName('PELADO').Value,'ID_CODIGO');
  
  str := getDato('aob', anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('aob').Value := str
  else
    IBDSSimple.FieldByName('aob').Value := null;
  str := getDato('gc', anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('eg').Value := str
  else
    IBDSSimple.FieldByName('eg').Value := null;
  str := getDato('gi', anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('gi').Value := str
  else
    IBDSSimple.FieldByName('gi').Value := null;
  str := getDato('gc', anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('gc').Value := str
  else
    IBDSSimple.FieldByName('gc').Value := null;
  str := getDato('pcma', anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('pcma').Value := str
  else
    IBDSSimple.FieldByName('pcma').Value := null;
end;

procedure TFEveCalidadCarne.IBDSSimpleID_RPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  //hereda de evesimple
end;

procedure TFEveCalidadCarne.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;
  GetEvent(DTPAFecha);

  EAEdad.Text:=IntToStr(CantidadDias(FNacimiento,DTPAFecha.DateTime));
  VerCalculoFrameIndividual(EAAltura.Text);  
end;

procedure TFEveCalidadCarne.IBDSSimpleFECHAChange(Sender: TField);
begin
  inherited;
  IBDSSimple.FieldByName('EDAD').AsInteger:= FDias;

  IBDSSimpleALTURAChange(nil);
end;

procedure TFEveCalidadCarne.IBDSSimpleALTURAChange(Sender: TField);
begin
  inherited;
  FPulgadas := IBDSSimpleALTURA.Value/ 2.54;
  if(IBQSexo.FieldValues['sexo'] = 1)then
     IBDSSimple.FieldByName('FRAME').AsFloat:= CalcularFrameMachos(FPulgadas, IBDSSimpleEDAD.AsInteger)
  else
       IBDSSimple.FieldByName('FRAME').AsFloat:= CalcularFrameHembras(FPulgadas, IBDSSimpleEDAD.AsInteger);
end;

procedure TFEveCalidadCarne.IBDSSimpleVALORSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if (IBDSSimple.FieldByName('SEXO').AsInteger = 2) then
    Sender.AsString:= ''
   else
      if (IBDSSimple.FieldByName('SEXO').AsInteger = 1) then
         Sender.AsString:= Text;
end;

procedure TFEveCalidadCarne.EAreaOjoBifeValueKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (not(Key in ['0' .. '9']) and (Key <> ',') and (Key <> '.') and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveCalidadCarne.EEGValueKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (not(Key in ['0' .. '9']) and (Key <> ',') and (Key <> '.') and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveCalidadCarne.EGCValueKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (not(Key in ['0' .. '9']) and (Key <> ',') and (Key <> '.') and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveCalidadCarne.EPCMAValueKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (not(Key in ['0' .. '9']) and (Key <> ',') and (Key <> '.') and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveCalidadCarne.EGIValueKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (not(Key in ['0' .. '9']) and (Key <> ',') and (Key <> '.') and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;


function TFEveCalidadCarne.PasarAFloat(dato : string) : double;
var res : double;
    aux : string;
begin

     if (dato = '') then
        Result := 0
     else
     begin
       aux := Trim(dato);
       aux := StringReplace(aux,'.',',',[rfReplaceAll]);
       res := StrToFloat(aux);

       Result := res;
     end;
end;


end.




