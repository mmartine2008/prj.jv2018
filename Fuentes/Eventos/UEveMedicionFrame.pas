unit UEveMedicionFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, DBCtrls, UDBLookupComboBoxAuto, EditAuto,
  DateTimePickerAuto, DataExport, DataToXLS, WinXP, ImgList, PngImageList,
  JvExControls, JvLabel, PngImage, JvExExtCtrls, JvImage, jpeg, JvGIF,
  JvComponentBase, JvBalloonHint, xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type

  TFEveMedicionFrame = class(TFEveSimple)
    LObservador: TLabel;
    LFecha: TLabel;
    LAltura: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    EAAltura: TEditAuto;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    LEdad: TLabel;
    Ldias: TLabel;
    LCm: TLabel;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleEDAD: TIntegerField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    IBQFrame: TIBQuery;
    IBDSSimpleFRAME: TFloatField;
    PFrame: TPanel;
    EAEdad: TEditAuto;
    STEdad: TStaticText;
    STAltura: TStaticText;
    IBQSexo: TIBQuery;
    DSSexo: TDataSource;
    IBDSSimpleSEXO: TIntegerField;
    DSObtenerIDSexo: TDataSource;
    IBQObtenerIDSexo: TIBQuery;
    IBQSexoSEXO: TIntegerField;
    IBQSexoNOMBRE: TIBStringField;
    IBQSexoSINONIMO: TIBStringField;
    IBQObtenerIDSexoSEXO: TIntegerField;
    IBQObtenerIDSexoFECHA_NACIMIENTO: TDateField;
    IBDSSimpleALTURA: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure IBDSSimpleALTURAChange(Sender: TField);
    procedure EAAlturaChange(Sender: TObject);
    procedure EAEdadChange(Sender: TObject);
    procedure IBDSSimpleALTURASetText(Sender: TField; const Text: String);
    procedure FormShow(Sender: TObject);
    procedure DTPAFechaCloseUp(Sender: TObject);
    procedure EAAlturaKeyPress(Sender: TObject; var Key: Char);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LObservadorMouseEnter(Sender: TObject);
    procedure LObservadorMouseLeave(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure IBDSSimpleFECHAChange(Sender: TField);
    procedure IBDSSimpleFECHASetText(Sender: TField; const Text: String);
    procedure BDBGSimpleKeyPress(Sender: TObject; var Key: Char);
  private
    FValorFrame: Real;
    FSexo: integer;
    FNacimiento: Tdate;
    FDias:Integer;
    FPulgadas : Real;
    { Private declarations }
    procedure HabilitarParaIndividual(B: boolean);
    procedure ObtenerSexo(animal: integer);
    procedure VerCalculoFrameIndividual(altura:string);
  protected
    Procedure CargarParametrosSP;override;
    Procedure CargarParametrosRN;override;
    procedure CargarDatosGrilla;override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure cargarDatos(i:integer);override;
  public
  end;

var
  FEveMedicionFrame: TFEveMedicionFrame;

implementation

uses UDMSoftvet, UPrincipal,UClassType,UFunctions, UMensajeHuella, UABMEmpleados,
  DateUtils, UImportacion, UTraduccion;

{$R *.dfm}


Procedure TFEveMedicionFrame.CargarParametrosRN;
begin

 IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
 if(self.ModoEve = meIndividual)then
 begin
    IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
    IBQSPRN.ParamByName('frame').Value := FValorFrame;
    IBQSPRN.ParamByName('fecha').AsDateTime := DTPAFecha.DateTime;
 end
   else
   begin
      IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
      IBQSPRN.ParamByName('frame').Value := IBDSSimple.fieldbyname('FRAME').AsFloat;
      IBQSPRN.ParamByName('fecha').AsDateTime := IBDSSimple.fieldbyname('fecha').AsDateTime;
   end;
end;

procedure TFEveMedicionFrame.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DBLCBAResponsable.AsignarValorDefecto;
  MSimple.SQLBasico := 'select ID_RP,ID_SENASA,ID_ANIMAL, id_pc, id_hba, id_otro, FECHA_NACIMIENTO, POTRERO, RODEO, CATEGORIA, SEXO, id_ie, nombre, apodo from VIS_MEDICION_FRAME';
end;



Procedure TFEveMedicionFrame.CargarParametrosSP;
begin
 IBQSPEventoInd.ParamByName('FECHA').Value  := DTPAFecha.GetDato;
 IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IDAnimal;
 IBQSPEventoInd.ParamByName('OBSERVACION').AsString := MAObservacion.GetDato;
 IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
 IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := DBLCBAResponsable.GetDato;
 IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger :=  FPrincipal.UsuarioActual;
 IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;
 IBQSPEventoInd.ParamByName('ALTURA').Value := StrToFloat(EAAltura.GetDato);
 IBQSPEventoInd.ParamByName('EDAD').Value :=EAEdad.GetDato;
 IBQSPEventoInd.ParamByName('ID_GRUPO').Value := Null;
 IBQSPEventoInd.ParamByName('FRAME').Value := FValorFrame;
end;

procedure TFEveMedicionFrame.CargarDatosGrilla;
var
  valFrame : Double;
begin
inherited;
{if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple))then
begin   }

  IDAnimal :=MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
  FDias:= CantidadDias(MSimple.IBQSeleccionados.FieldValues['FECHA_NACIMIENTO'],DTPAFecha.DateTime);
  FPulgadas := StrToFloat(trim(EAAltura.Text))/ 2.54;
  {Obtengo el Sexo del animal para saber que frame calcular M/H}
  ObtenerSexo(IDAnimal);// Obtiene el sexo  ysetea la variable FSexo
  IBQSexo.close;
  IBQSexo.ParamByName('ID').AsInteger := FSexo;
  IBQSexo.Open;

  //IBDSSimple.Insert;
  IBDSSimple.FieldByName('ID_RP').Asstring:=MSimple.IBQSeleccionados.FieldValues['ID_RP'];
  IBDSSimple.FieldByName('ID_SENASA').Value:=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];

  RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.GetDato]);
  //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
  RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('RESP')],[DBLCBAResponsable.GetDato,DBLCBAResponsable.Text]);
  //IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.GetDato;
  //IBDSSimple.FieldByName('RESP').Value:= DBLCBAResponsable.Text;
  RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
  //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;
  RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('EDAD')],[FDias]);
  //IBDSSimple.FieldByName('EDAD').AsInteger:= FDias;
  IBDSSimple.FieldByName('sexo').Value:= FSexo;
  IBDSSimple.FieldByName('ID_ANIMAL').AsInteger:= IDAnimal;
  RealizarCambio(EAAltura,[IBDSSimple.FieldByName('ALTURA')],[StrToFloat(EAAltura.Text){EAAltura.GetDato}]);
  //IBDSSimple.FieldByName('ALTURA').Value:= EAAltura.GetDato; //Al cambiar recalcula el frame y ademas necesita el sexo del animal
  if(IBQSexo.FieldValues['sexo'] = 1)then
     valFrame := CalcularFrameMachos(FPulgadas, FDias)
  else
     valFrame := CalcularFrameHembras(FPulgadas, FDias);
  RealizarCambio(EAAltura,[IBDSSimple.FieldByName('FRAME')],[valFrame]);
//end;

end;

Procedure TFEveMedicionFrame.CargarParametrosMasivo;
begin
  if (CrearGrupo) then
     IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimpleRESPONSABLE.AsInteger;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  IBQSPEventoInd.ParamByName('ALTURA').Value := IBDSSimple.FieldValues['ALTURA'];
  IBQSPEventoInd.ParamByName('EDAD').Value := IBDSSimple.FieldValues['EDAD'];
  IBQSPEventoInd.ParamByName('FRAME').Value := IBDSSimple.FieldValues['FRAME'];
end;

procedure TFEveMedicionFrame.LoadSQLStringList;
begin
 SQLStringList.AddObject('RESP',DMSoftvet.DSResponsable);
 inherited;
end;

procedure TFEveMedicionFrame.PCBasicoChange(Sender: TObject);
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

procedure TFEveMedicionFrame.HabilitarParaIndividual(B: boolean);
begin
  EAEdad.Visible  := B;
  LEdad.Visible   := B;
  Ldias.Visible   := B;
  STEdad.Visible := B;
  PFrame.Caption := '';

end;


procedure TFEveMedicionFrame.EAAlturaChange(Sender: TObject);
begin
  inherited;
  VerCalculoFrameIndividual(EAAltura.Text);
end;

procedure TFEveMedicionFrame.EAEdadChange(Sender: TObject);
begin
  inherited;
  if(EAEdad.Visible)then
    STEdad.Caption := '-  ' + CantidadMeses(FNacimiento, DTPAFecha.DateTime);
end;


procedure TFEveMedicionFrame.IBDSSimpleALTURAChange(Sender: TField);
begin
  inherited;
  FPulgadas := IBDSSimpleALTURA.Value/ 2.54;
  if(IBQSexo.FieldValues['sexo'] = 1)then
     IBDSSimple.FieldByName('FRAME').AsFloat:= CalcularFrameMachos(FPulgadas, IBDSSimpleEDAD.AsInteger)
  else
       IBDSSimple.FieldByName('FRAME').AsFloat:= CalcularFrameHembras(FPulgadas, IBDSSimpleEDAD.AsInteger);
end;


procedure TFEveMedicionFrame.IBDSSimpleALTURASetText(Sender: TField;
  const Text: String);
begin
  inherited;
  try
    if(StrToFloat(Text)>200)or (StrToFloat(Text)<0)then
      begin
       MostrarMensaje(tmError, 'El valor altura no es válido');
      end 
     else
      begin
       if ((IBDSSimple.FieldValues['EW'] = 'E') or (IBDSSimple.FieldValues['EW'] = 'W')) then
            IBDSSimple.FieldValues['EW'] := 'M';
       sender.AsString := text;
      end;
  except on e:Exception do
   begin
     MostrarMensaje(tmError, 'El valor de la altura no es válido.');
   end;
  end;
end;


procedure TFEveMedicionFrame.ObtenerSexo(animal: integer);
begin
  IBQObtenerIDSexo.Close;
  IBQObtenerIDSexo.ParamByName('id').AsInteger := Animal;
  IBQObtenerIDSexo.Open;
  FSexo:= IBQObtenerIDSexoSEXO.AsInteger;
  FNacimiento:= IBQObtenerIDSexoFECHA_NACIMIENTO.AsDateTime;
  FDias := CantidadDias(FNacimiento,DTPAFecha.DateTime);
  EAEdad.Text := IntToStr(Fdias);
end;

procedure TFEveMedicionFrame.FormShow(Sender: TObject);
begin
  inherited;
  DTPAFecha.Date := now;
//  DTPAFecha.MaxDate:= now;
  if(ModoEve = meIndividual)then
    ObtenerSexo(IDAnimal);
  //MSimple.DBLCBCategoria.KeyValue:=1;//agregue codigo
  MSimple.PasarParametros(0,0);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
  //DecimalSeparator:='.';
end;

procedure TFEveMedicionFrame.DTPAFechaCloseUp(Sender: TObject);
begin
  inherited;
   FDias := CantidadDias(FNacimiento,DTPAFecha.DateTime);
   EAEdad.Text := IntToStr(Fdias);
end;

procedure TFEveMedicionFrame.EAAlturaKeyPress(Sender: TObject;
  var Key: Char);
var Separador: Char;
begin
  inherited;
//  if not (key in ['0'..'9',#8]) then key:=#0;


  Separador := SysUtils.DecimalSeparator;

  if ((Key = '.') or ( Key = ',')) then
    Key := Separador;

  if (pos(Separador,TEditAuto(Sender).Text)=0) then
    begin
      if not (key in ['0'..'9',Separador,#8]) then
        key:=#0;
    end
  else
    if not (key in ['0'..'9',#8]) then
      key:=#0;
end;

procedure TFEveMedicionFrame.VerCalculoFrameIndividual(altura:string);
var val:double;
begin
  if(TryStrToFloat(altura,val))then
    if(StrToFloat(altura)>200)or (StrToFloat(altura)<0)then
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

procedure TFEveMedicionFrame.DTPAFechaChange(Sender: TObject);
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

procedure TFEveMedicionFrame.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveMedicionFrame.LObservadorMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= $00606C02;
      LObservador.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveMedicionFrame.LObservadorMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= clWindowText;
      LObservador.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveMedicionFrame.cargarDatos(i:integer);
var  valFrame : Double;
begin
  inherited;
  EAAltura.Text:='0';
  //if getDato('fecha nac',anim[i])

  FDias:= CantidadDias(dmsoftvet.IBQDatosAnimal.Lookup('id_animal',anim[i].id,'fecha_nacimiento'),strtodatetime(getDato('fecha',anim[i])));
  FPulgadas := StrToFloat(getDato('altura',anim[i]))/ 2.54;
  {Obtengo el Sexo del animal para saber que frame calcular M/H}
  ObtenerSexo(anim[i].id);// Obtiene el sexo  ysetea la variable FSexo
  IBQSexo.close;
  IBQSexo.ParamByName('ID').AsInteger := FSexo;
  IBQSexo.Open;

  IBDSSimple.FieldByName('ID_SENASA').Value:=getDato('senasa',anim[i]);
  IBDSSimple.FieldByName('RESP').Value:= getDato('resp',anim[i]);
  IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
  if getDato('edad',anim[i])='' then
    IBDSSimple.FieldByName('EDAD').AsInteger:= FDias
  else
    IBDSSimple.FieldByName('EDAD').AsInteger:= strtoint(getDato('edad',anim[i]));
  IBDSSimple.FieldByName('sexo').Value:= FSexo;
  IBDSSimple.FieldByName('ALTURA').Value:= getDato('altura',anim[i]); //Al cambiar recalcula el frame y ademas necesita el sexo del animal
  if getDato('frame',anim[i])=0 then
    begin
    if(IBQSexo.FieldValues['sexo'] = 1)then
       valFrame := CalcularFrameMachos(FPulgadas, FDias)
    else
       valFrame := CalcularFrameHembras(FPulgadas, FDias);
    IBDSSimple.FieldByName('FRAME').Value:=valFrame;
    end
  else
    IBDSSimple.FieldByName('FRAME').Value:=normalizarFloat(getDato('frame',anim[i]));
end;

procedure TFEveMedicionFrame.IBDSSimpleID_RPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  IBDSSimple.Edit;
  DMSoftvet.IBQDatosAnimal.Close;
  DMSoftvet.IBQDatosAnimal.ParamByName('ESTABLECIMIENTO').AsInteger:=FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQDatosAnimal.Open;
  FDias:=CantidadDias(DMSoftVet.IBQDatosAnimal.Lookup('ID_ANIMAL',IBDSSimple.FieldByName('ID_ANIMAL').Value,'FECHA_NACIMIENTO'),IBDSSimple.FieldByName('FECHA').Value);
  if IBDSSimple.FieldByName('EDAD').AsInteger=0 then
    IBDSSimple.FieldByName('EDAD').AsInteger:= FDias;
  if IBDSSimple.FieldByName('FRAME').Value=0 then
    begin
    FPulgadas := StrToFloat(IBDSSimple.FieldByName('ALTURA').Value)/ 2.54;
    if(IBDSSimple.FieldByName('sexo').Value = 1)then
       IBDSSimple.FieldByName('FRAME').Value := CalcularFrameMachos(FPulgadas, FDias)
    else
       IBDSSimple.FieldByName('FRAME').Value := CalcularFrameHembras(FPulgadas, FDias);
    end;
  IBDSSimple.Post;
end;

procedure TFEveMedicionFrame.IBDSSimpleFECHAChange(Sender: TField);
begin
  inherited;
  IBDSSimple.FieldByName('EDAD').AsInteger:= FDias;

  IBDSSimpleALTURAChange(nil);
end;

procedure TFEveMedicionFrame.IBDSSimpleFECHASetText(Sender: TField;
  const Text: String);
begin
  inherited;
       if ((IBDSSimple.FieldValues['EW'] = 'E') or (IBDSSimple.FieldValues['EW'] = 'W')) then
            IBDSSimple.FieldValues['EW'] := 'M';
       sender.AsString := text;
end;

procedure TFEveMedicionFrame.BDBGSimpleKeyPress(Sender: TObject;
  var Key: Char);
var
  Separador : Char;
begin
  inherited;
  Separador := SysUtils.DecimalSeparator;
  if (Key = '.') or (Key = ',') then
    Key := Separador;
end;

end.

