unit UEveDestete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, EditAuto, DBCtrls,
  UDBLookupComboBoxAuto, DateTimePickerAuto, DataExport, DataToXLS, WinXP,
  ImgList, PngImageList, JvExControls, JvLabel, PngImage, JvExExtCtrls,
  JvImage, jpeg, JvGIF, JvComponentBase, JvBalloonHint, xmldom, XMLIntf,
  msxmldom, XMLDoc, Menus;

type
  TFEveDestete = class(TFEveSimple)
    LFecha: TLabel;
    LObservador: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    CBAObservador: TDBLookupComboBoxAuto;
    LPeso: TLabel;
    EAPeso: TEditAuto;
    Label1: TLabel;
    DBLCBATipoDestete: TDBLookupComboBoxAuto;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleTIPO: TIntegerField;
    IBDSSimpleSTRTIPO: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleEW: TIBStringField;
    IBQuery1: TIBQuery;
    GroupBox1: TGroupBox;
    CkBPotrero: TCheckBox;
    Label2: TLabel;
    DBLCBAPotrero: TDBLookupComboBoxAuto;
    DBLCBARodeo: TDBLookupComboBoxAuto;
    Label3: TLabel;
    IBDSSimplePOT: TIntegerField;
    IBDSSimpleROD: TIntegerField;
    IBDSSimpleRODEO: TIBStringField;
    IBDSSimplePOTRERO: TIBStringField;
    IBDSSimplePESO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBDSSimplePESOSetText(Sender: TField; const Text: String);
    procedure DBLCBAPotreroCloseUp(Sender: TObject);
    procedure CkBPotreroClick(Sender: TObject);
    procedure EAPesoKeyPress(Sender: TObject; var Key: Char);
    procedure PCBasicoChange(Sender: TObject);
    procedure DBLCBARodeoCloseUp(Sender: TObject);
    procedure EAPesoExit(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LObservadorMouseEnter(Sender: TObject);
    procedure LObservadorMouseLeave(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure BDBGSimpleKeyPress(Sender: TObject; var Key: Char);
    procedure ATerminarExecute(Sender: TObject);
//    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
  private
    { Private declarations }
    IDPotrero :Variant;
    IDRodeo : Variant;
  protected
    procedure CargarParametrosRN; override;
    procedure CargarParametrosSP; override;
    procedure CargarDatosGrilla; override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure cargarDatos(i:integer);override;

  public
    { Public declarations }
  end;

var
  FEveDestete: TFEveDestete;
  PesoMin, PesoMax : double;

implementation

uses UPrincipal, uTiposGlobales, UDMSoftVet, DateUtils, UClassType, UEveUniversal, UMensajeHuella,
     UABMEmpleados,Uabmpotreros, UABMRodeos, UABMSimple,UImportacion, UFunctions, UTraduccion;

{$R *.dfm}

{ TFEveDestete }


(*
  Agrega los datos del evento a la grilla
*)

procedure TFEveDestete.CargarDatosGrilla;
var
  d : double;
begin
  inherited;
  { if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple))then
  begin
    IBDSSimple.Insert;    }
    IDAnimal :=MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
    IBDSSimple.FieldByName('ID_RP').Value:=MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_SENASA').Value:=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];


    RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.Date]);
    //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
    RealizarCambio(CBAObservador,[IBDSSimple.FieldByName('RESP'),IBDSSimple.FieldByName('RESPONSABLE')],[CBAObservador.Text,CBAObservador.GetDato]);
    //IBDSSimple.FieldByName('RESP').Value:= CBAObservador.Text;
    //IBDSSimple.FieldByName('RESPONSABLE').Value:=CBAObservador.KeyValue;
    RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
    //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;
    if TryStrToFloat(EAPeso.Text,d) then
      RealizarCambio(EAPeso,[IBDSSimple.FieldByName('PESO')],[StrToFloat(EAPeso.Text)]);
    {else
      RealizarCambio(EAPeso,[IBDSSimple.FieldByName('PESO')],[StrToFloat(EAPeso.Text)])}
    //IBDSSimple.FieldByName('PESO').Value:= StrToInt(EAPeso.Text);
    RealizarCambio(DBLCBATipoDestete,[IBDSSimple.FieldByName('STRTIPO'),IBDSSimple.FieldByName('TIPO')],[DBLCBATipoDestete.Text,DBLCBATipoDestete.KeyValue]);
    //IBDSSimple.FieldByName('STRTIPO').Value:= DBLCBATipoDestete.Text;
    //IBDSSimple.FieldByName('TIPO').Value:= DBLCBATipoDestete.KeyValue;

    IBDSSimple.FieldByName('ID_ANIMAL').Value:= IDAnimal;

    RealizarCambio(DBLCBAPotrero,[IBDSSimple.FieldByName('POT'),IBDSSimple.FieldByName('POTRERO')],[IDPotrero,DBLCBAPotrero.Text]);
    RealizarCambio(DBLCBARodeo,[IBDSSimple.FieldByName('ROD'),IBDSSimple.FieldByName('RODEO')],[IDRodeo,DBLCBARodeo.Text]);
    //IBDSSimple.FieldByName('POT').Value:= IDPotrero;
    //IBDSSimple.FieldByName('ROD').Value:= IDRodeo;

    //IBDSSimple.FieldByName('POTRERO').Value:= DBLCBAPotrero.Text;
    //IBDSSimple.FieldByName('RODEO').Value:= DBLCBARodeo.Text;
 // end;
end;

procedure TFEveDestete.CargarParametrosMasivo;
//var PickPos: integer;
begin
  if (CrearGrupo) then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value :=  IBDSSimple.FieldValues['RESPONSABLE'];
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  if (IBDSSimple.FieldValues['PESO'] = null) then
    IBQSPEventoInd.ParamByName('PESO').Value := 0
  else
    IBQSPEventoInd.ParamByName('PESO').Value := IBDSSimple.FieldValues['PESO'];
  IBQSPEventoInd.ParamByName('TIPO').Value :=  IBDSSimple.FieldValues['TIPO'];
  if CkBPotrero.Checked then
    begin
      IBQSPEventoInd.ParamByName('RODEO').Value := IBDSSimple.FieldValues['ROD'];
      IBQSPEventoInd.ParamByName('POTRERO').Value := IBDSSimple.FieldValues['POT'];
    end
  else
    begin
      IBQSPEventoInd.ParamByName('RODEO').Value := null;
      IBQSPEventoInd.ParamByName('POTRERO').Value := null;
    end;
  IBQSPEventoInd.ParamByName('DISPARADOR').Value := Null;
end;

procedure TFEveDestete.CargarParametrosRN;
begin
  inherited;
  IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  if(self.ModoEve = meIndividual)then
  begin
      IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;// PARAMETRO  ANIMAL
      IBQSPRN.ParamByName('FECHA').AsDate := DTPAFecha.DateTime;
      if (EAPeso.text <> '') then
        IBQSPRN.ParamByName('PESO').AsFloat := StrToFloat(EAPeso.Text)
      else
        IBQSPRN.ParamByName('PESO').AsFloat := 0;
  end
  else
    begin
     IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
     IBQSPRN.ParamByName('FECHA').AsDate :=IBDSSimple.fieldbyname('FECHA').AsDateTime;
     IBQSPRN.ParamByName('PESO').AsFloat := IBDSSimple.fieldbyname('PESO').AsFloat;
    end;
end;

procedure TFEveDestete.CargarParametrosSP;
var
  d : double;
begin
  inherited;
  IBQSPEventoInd.ParamByName('FECHA').AsDate := DTPAFecha.DateTime;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IDAnimal;
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := CBAObservador.GetDato;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value :=NOW;
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := Null;
  IBQSPEventoInd.ParamByName('DISPARADOR').Value := Null;
  if TryStrToFloat(EAPeso.Text,d) then
    IBQSPEventoInd.ParamByName('PESO').Value :=StrToFloat(EAPeso.Text)
  else
    IBQSPEventoInd.ParamByName('PESO').Value := 0;
  IBQSPEventoInd.ParamByName('POTRERO').Value := IDPotrero;
  IBQSPEventoInd.ParamByName('RODEO').Value := IDRodeo;
  IBQSPEventoInd.ParamByName('TIPO').Value := DBLCBATipoDestete.GetDato;
end;

procedure TFEveDestete.FormCreate(Sender: TObject);
begin
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQPotParaGrilla.Close;
  DMSoftvet.IBQPotParaGrilla.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotParaGrilla.Open;
  DMSoftvet.IBQRodParaGrilla.Close;
  DMSoftvet.IBQRodParaGrilla.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodParaGrilla.Open;
inherited;
  MSimple.SQLBasico := 'select  ID_RP, ID_SENASA,id_animal, id_pc, id_hba, id_otro, id_ie, nombre, apodo From VIS_DESTETE';
  IBQValidaciones.Close;

  // recupero el peso minimo y maximo para el destete de los parametros del sistema
  IBQValidaciones.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :ESTABLECIMIENTO) and (sjp.nombre = ''BGPESANI4'')');
  IBQValidaciones.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQValidaciones.Open;
  PesoMax := IBQValidaciones.FieldByName('valor').AsFloat;
  IBDSSimplePESO.MaxValue:= PesoMax;
  IBQValidaciones.Close;
  IBQValidaciones.sql.Clear;
  IBQValidaciones.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :ESTABLECIMIENTO) and (sjp.nombre = ''BGPESANI1'')');
  IBQValidaciones.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQValidaciones.Open;
  PesoMin := IBQValidaciones.FieldByName('valor').AsFloat;
  IBDSSimplePESO.MinValue:= PesoMin;
end;

procedure TFEveDestete.FormShow(Sender: TObject);
begin
  inherited;
  DTPAFecha.Date := DateOf(Now);
//  DTPAFecha.MaxDate:= now;
  DBLCBAPotrero.Enabled := false;
  IDPotrero := DBLCBAPotrero.KeyValue;
  MSimple.PasarParametros(0,0);{Para filtrar las categorias para el Combo de la Manga -//cambie codigo
//  - " 0 " indica mostrar las cargorias para ambos sexos}

//  MSimple.PasarParametros(0,7);{Para filtrar las categorias para el Combo de la Manga -//cambie codigo
//    - " 0 " indica mostrar las cargorias para ambos sexos}
  Label2.Enabled:= false;
  Label3.Enabled:= false;
  //DecimalSeparator:='.';
end;

(*
  Carga el string List que se va a mostrar en el lookup de la columna correspondiente
*)
procedure TFEveDestete.LoadSQLStringList;
begin
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('STRTIPO',TObject(DMSoftvet.DSTipoDestete));
  SQLStringList.AddObject('POTRERO',TObject(DMSoftvet.DSPotParaGrilla));
  SQLStringList.AddObject('RODEO',TObject(DMSoftvet.DSRodParaGrilla));
//  inherited;
end;

procedure TFEveDestete.IBDSSimplePESOSetText(Sender: TField;
  const Text: String);
var PickPos:integer;
    peso: double;
    po: integer;
    auxText: String;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)) then
  begin
      SetText(Sender,Text);
      if(Sender.FieldName = 'PESO')then
      begin
        auxText:= Text;
        {po:= pos(',',auxText);
        if (po>0) then
          begin
            auxText[po]:='.';
          end;}
        auxText := FixDecimal(auxText);
        if (TryStrToFloat(auxText,peso)) then
          if(peso >= PesoMin) and (peso <= PesoMax ) then
              Sender.AsVariant := peso
          else
            MostrarMensaje(tmError, Traducir('El Peso debe estar entre ')+FloatToStr(PesoMin)+Traducir(' y ')+FloatToStr(PesoMax)+#13+Traducir(' Según los Parámetros del Establecimiento'));
      end;
      if(Sender.FieldName = 'STRTIPO')then
         begin
           IBQValidaciones.Close;
           IBQValidaciones.Params.Clear;
           IBQValidaciones.SQL.Add('select sinonimo from COD_TIPOS_DESTETE where (((sinonimo like '''+UpperCase(Text)+'''||''%'')or (CODIGO like '''+UpperCase(Text)+'%'')))');
           IBQValidaciones.Open;
           if not(IBQValidaciones.IsEmpty) then
           BEGIN
             Sender.AsVariant := IBQValidaciones.FieldByName('sinonimo').AsString ;
             PickPos := BDBGSimple.ColumnByField('STRTIPO').PickList.IndexOf(BDBGSimple.ColumnByField('STRTIPO').Field.AsString);
             IBDSSimple.FieldByName('TIPO').Value :=  TClassType(BDBGSimple.ColumnByField('STRTIPO').PickList.Objects[PickPos]).getValue;
           END;
         end;
      if(Sender.FieldName = 'POTRERO')then
         begin
           IBQValidaciones.Close;
           IBQValidaciones.Params.Clear;
           IBQValidaciones.SQL.Add('select nombre from TAB_POTREROS where (nombre like '''+UpperCase(Text)+''')');
           IBQValidaciones.Open;
           if not(IBQValidaciones.IsEmpty) then
           BEGIN
             Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString ;
             PickPos := BDBGSimple.ColumnByField('POTRERO').PickList.IndexOf(BDBGSimple.ColumnByField('POTRERO').Field.AsString);
             IBDSSimple.FieldByName('POT').Value :=  TClassType(BDBGSimple.ColumnByField('POTRERO').PickList.Objects[PickPos]).getValue;
           END;
         end;
      if(Sender.FieldName = 'RODEO')then
         begin
           IBQValidaciones.Close;
           IBQValidaciones.Params.Clear;
           IBQValidaciones.SQL.Add('select nombre from TAB_RODEOS where (nombre like '''+UpperCase(Text)+''')');
           IBQValidaciones.Open;
           if not(IBQValidaciones.IsEmpty) then
           BEGIN
             Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString ;
             PickPos := BDBGSimple.ColumnByField('RODEO').PickList.IndexOf(BDBGSimple.ColumnByField('RODEO').Field.AsString);
             IBDSSimple.FieldByName('ROD').Value :=  TClassType(BDBGSimple.ColumnByField('RODEO').PickList.Objects[PickPos]).getValue;
           END;
         end;
      if ((IBDSSimple.FieldValues['EW'] = 'E') or (IBDSSimple.FieldValues['EW'] = 'W')) then
              IBDSSimple.FieldValues['EW'] := 'M';
  end;
end;

procedure TFEveDestete.DBLCBAPotreroCloseUp(Sender: TObject);
begin
  inherited;
  IDPotrero := DBLCBAPotrero.KeyValue;
end;

procedure TFEveDestete.CkBPotreroClick(Sender: TObject);
begin
  inherited;
  if(CkBPotrero.Checked)then
  begin
    DBLCBAPotrero.Enabled := true;
    DBLCBARodeo.Enabled := true;
    Label2.Enabled:= true;
    Label3.Enabled:= true;
  end
  else
  begin
    DBLCBAPotrero.KeyValue := null;
    DBLCBARodeo.KeyValue := null;
    DBLCBAPotrero.Enabled := false;
    DBLCBARodeo.Enabled := false;
    Label2.Enabled:= false;
    Label3.Enabled:= false;
  end;
end;

procedure TFEveDestete.EAPesoKeyPress(Sender: TObject; var Key: Char);
var Separador: Char;
begin
  inherited;
//  if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 4)) and (key <> #8)) then key:=#0;

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

procedure TFEveDestete.PCBasicoChange(Sender: TObject);
begin
  inherited;
 { if(PCBasico.ActivePage = TSDatos) then
    EAPeso.SetFocus;}
end;

procedure TFEveDestete.DBLCBARodeoCloseUp(Sender: TObject);
begin
  inherited;
  IDRodeo := DBLCBARodeo.KeyValue;
end;

procedure TFEveDestete.EAPesoExit(Sender: TObject);
var peso: double;
begin
  inherited;
  if (TryStrToFloat(EAPeso.Text,peso)) then
    if(peso < PesoMin) or (peso > PesoMax ) then
      begin
        MostrarMensaje(tmError, 'El peso se encuentra fuera del rango. Ingreselo nuevamente.');
        EAPeso.SetFocus;
      end;
  GetEvent(Sender);
end;

procedure TFEveDestete.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;
  GetEvent(DTPAFecha);
end;

procedure TFEveDestete.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(CBAObservador,nroID);
end;

procedure TFEveDestete.LObservadorMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= $00606C02;
      LObservador.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveDestete.LObservadorMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= clWindowText;
      LObservador.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveDestete.Label2Click(Sender: TObject);
var
  abm : TFABMPotreros;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm := TFABMPotreros.Create(self);
      abm.Abrir(faAbm);
      DMSoftvet.IBQPotParaGrilla.Close;
      DMSoftvet.IBQPotParaGrilla.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQPotParaGrilla.Open;
      if nroID>-1 then
      begin
        DBLCBAPotrero.KeyValue:=nroID;
        nroID:=-1;
      end;
    end;
end;

procedure TFEveDestete.Label3Click(Sender: TObject);
var
  abm : TFABMRodeos;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm := TFABMRodeos.Create(self);
      abm.Abrir(faAbm);
      DMSoftvet.IBQRodParaGrilla.Close;
      DMSoftvet.IBQRodParaGrilla.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQRodParaGrilla.Open;
      if nroID>-1 then
      begin
        DBLCBARodeo.KeyValue:=nroID;
        nroID:=-1;
      end;
    end;
end;

procedure TFEveDestete.Label2MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      if (Label2.Enabled) then
        begin
          Label2.Font.Color:= $00606C02;
          Label2.Font.Style:= [fsBold,fsUnderline];
        end;
    end;
end;

procedure TFEveDestete.Label2MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      if (Label2.Enabled) then
        begin
          Label2.Font.Color:= clWindowText;
          Label2.Font.Style:= [fsUnderline];
        end;
    end;
end;

procedure TFEveDestete.Label3MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      if (Label3.Enabled) then
        begin
          Label3.Font.Color:= $00606C02;
          Label3.Font.Style:= [fsBold,fsUnderline];
        end;
    end;
end;

procedure TFEveDestete.Label3MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      if (Label3.Enabled) then
        begin
          Label3.Font.Color:= clWindowText;
          Label3.Font.Style:= [fsUnderline];
        end;
    end;
end;

procedure TFEveDestete.IBDSSimpleID_RPSetText(Sender: TField;const Text: String);
var str:string;
begin
  inherited;        //no borrar este metodo. hereda de evesimple
end;

procedure TFEveDestete.cargarDatos(i:integer);
var str:string;
begin
  inherited;
    IBDSSimple.FieldByName('ID_SENASA').Value:=getDato('senasa',anim[i]);
    IBDSSimple.FieldByName('PESO').Value:= getDato('peso',anim[i]);
    IBDSSimple.FieldByName('ID_ANIMAL').Value:= anim[i].id;
    IBDSSimple.FieldByName('STRTIPO').Value:= getDato('tipo destete',anim[i]);
    str:=getDato('potrero',anim[i]);
    if dmsoftvet.IBQPotrero.Lookup('NOMBRE',str,'ID_POTRERO')<>null then
      IBDSSimple.FieldByName('POTRERO').Value:=str
    else
      IBDSSimple.FieldByName('POTRERO').Value:='INDEFINIDO';
    IBDSSimple.FieldByName('POT').Value:= dmsoftvet.IBQPotrero.Lookup('NOMBRE',IBDSSimple.FieldByName('POTRERO').Value,'ID_POTRERO');
    str:=getDato('rodeo',anim[i]);
    if dmsoftvet.IBQRodeo.Lookup('NOMBRE',str,'ID_RODEO')<>null then
      IBDSSimple.FieldByName('RODEO').Value:=str
    else
      IBDSSimple.FieldByName('RODEO').Value:='INDEFINIDO';
    IBDSSimple.FieldByName('ROD').Value:= dmsoftvet.IBQRodeo.Lookup('NOMBRE',IBDSSimple.FieldByName('RODEO').Value,'ID_RODEO');
    str:=getDato('responsable',anim[i]);
    if CBAObservador.ListSource.DataSet.Lookup('NOMBRE',str,'ID_EMPLEADO')<>null then
      IBDSSimple.FieldByName('RESP').Value:=str
    else
      IBDSSimple.FieldByName('RESP').Value:='INDEFINIDO';
    IBDSSimple.FieldByName('RESPONSABLE').Value:= CBAObservador.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
    if DBLCBATipoDestete.ListSource.DataSet.Lookup('CODIGO',IBDSSimple.FieldByName('STRTIPO').Value,'ID_TIPO_DESTETE')<>null then
      IBDSSimple.FieldByName('STRTIPO').Value:= DBLCBATipoDestete.ListSource.DataSet.Lookup('CODIGO',IBDSSimple.FieldByName('STRTIPO').Value,'SINONIMO');
    IBDSSimple.FieldByName('TIPO').Value:= DBLCBATipoDestete.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('STRTIPO').Value,'ID_TIPO_DESTETE');
    EAPeso.Text:=IBDSSimple.FieldByName('PESO').Value;
end;

procedure TFEveDestete.BDBGSimpleKeyPress(Sender: TObject; var Key: Char);
var
  Separador : Char;
begin
  inherited;
  Separador := SysUtils.DecimalSeparator;
  if (Key = '.') or (Key = ',') then
    Key := Separador;
end;

procedure TFEveDestete.ATerminarExecute(Sender: TObject);
begin
  inherited;
  //hola
end;

end.
