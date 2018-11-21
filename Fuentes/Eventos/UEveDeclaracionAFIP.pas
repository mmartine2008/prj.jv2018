unit UEveDeclaracionAFIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, EditAuto, DateTimePickerAuto, DBCtrls,
  UDBLookupComboBoxAuto, ComboBoxAuto, DataExport, DataToXLS, WinXP, UMensajeHuella,
  UDMSoftvet, ImgList, PngImageList, PngImage, JvExExtCtrls, JvImage, jpeg, Shlobj,
  JvGIF, JvExControls, JvLabel, JvComponentBase, JvBalloonHint, ComObj,
  xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveDeclaracionAFIP = class(TFEveSimple)
    LObservador: TLabel;
    LFecha: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleCODDIAS: TIBStringField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleDIAS: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    IBDSSimpleFECHA_NACIMIENTO: TDateField;
    IBDSSimplePESO: TFloatField;
    JvImage1: TJvImage;
    Label2: TLabel;
    IBQTabAnimales: TIBQuery;
    SDEquivalencias: TSaveDialog;
    MAuxCaravanas: TMemoAuto;
   
    procedure FormCreate(Sender: TObject);
    procedure IBDSSimpleFECHASetText(Sender: TField; const Text: String);
    procedure FormShow(Sender: TObject);
    procedure EAPesoKeyPress(Sender: TObject; var Key: Char);
    procedure PCBasicoChange(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LObservadorMouseEnter(Sender: TObject);
    procedure LObservadorMouseLeave(Sender: TObject);
  //  procedure DBLCBADiasCloseUp(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField;const Text: String);
    procedure LParametrosEstabClick(Sender: TObject);
    procedure LCMClick(Sender: TObject);
    procedure BDBGSimpleKeyPress(Sender: TObject; var Key: Char);
    procedure ATerminarExecute(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
    function SpecialFolder(Folder: Integer): String;
    procedure mostrarCaravanas;

  

   private
    DiasPeso : String;
  protected
    Procedure CargarParametrosSP;override;
    Procedure CargarParametrosRN;override;
    procedure CargarDatosGrilla;override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    //procedure completarCampos;override;
    procedure cargarDatos(i:integer);override;
  public
    { Public declarations }
  end;

var
  FEveDeclaracionAFIP: TFEveDeclaracionAFIP;
  //******************************************************//
  //	INCIDENCIA: 403									                    //
  //	INICIO Declaraci�n de variables.                    //
  //	Ana Lamorte 							              30/12/2014  //
  //******************************************************//
  nomDestino : String;
  archivo : String;
  nro_grupo : Integer;
  pathOrigen : String;
  informar : integer;
  arcEquivalenciasTxt : TextFile;
  arcEquivalenciasXls : TextFile;
  LineaauxTxt : String;
  LineaauxXls : String;
  CantAnim : Integer;

  //******************************************************//
  //	INCIDENCIA: 403									                    //
  //	FIN Declaraci�n de variables.                       //
  //	Ana Lamorte							              30/12/2014  //
  //******************************************************//

implementation

{$R *.dfm}

uses UPrincipal,uTiposGlobales, UEveUniversal,UClassType,UFunctions,UEveActividad, UPanelCaravanas,
  DateUtils, UAbmEmpleados, UImportacion, UModificacionParametros, UTraduccion, UCartel;

procedure TFEveDeclaracionAFIP.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').Value := 'DP';
  DMSoftvet.IBQCodigosGenericos.Open;
  DiasPeso := 'G';
  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_hba, id_pc, id_otro, id_ie, fecha_nacimiento, nombre, apodo from VIS_DECLARACION';
  AsignarValoresDefecto;

  //******************************************************//
  //	INCIDENCIA: 403									                    //
  //	INICIO Seteo de elementos agregados.			          //
  //	Ana Laura   							              29/12/2014  //
  //******************************************************//
  nomDestino := '';
  archivo := '';
  nro_grupo := 0;
  pathOrigen := '';
  informar := 0;
  LineaauxTxt := '';
  LineaauxXls := '';
  if not (DirectoryExists(ExtractFilePath(Application.ExeName)+'Exportacion\')) then
      CrearDirectorio((ExtractFilePath(Application.ExeName)+'Exportacion\'));

  AssignFile(arcEquivalenciasTxt, ExtractFilePath(Application.ExeName)+'Exportacion\EquivalenciasTempTxt.txt');
  Rewrite(arcEquivalenciasTxt);
  AssignFile(arcEquivalenciasXls, ExtractFilePath(Application.ExeName)+'Exportacion\EquivalenciasTempXls.txt');
  Rewrite(arcEquivalenciasXls);
  Append(arcEquivalenciasXls);
  Writeln(arcEquivalenciasXls, 'RP | Identificaci�n electr�nica');
  //******************************************************//
  //	INCIDENCIA: 403									                    //
  //	FIN Seteo de elementos agregados.				            //
  //	Ana Lamorte							                29/12/2014  //
  //******************************************************//


  //DecimalSeparator:='.';
end;

Procedure TFEveDeclaracionAFIP.CargarParametrosRN;
begin
 IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
   if(self.ModoEve = meIndividual)then
   begin
      IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
      IBQSPRN.ParamByName('FECHA').AsDate := DTPAFecha.Date;
   end
   else
   begin
      IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
      IBQSPRN.ParamByName('FECHA').AsDate := IBDSSimpleFECHA.AsDateTime;
   end;
end;

Procedure TFEveDeclaracionAFIP.CargarParametrosSP;
begin
 IBQSPEventoInd.ParamByName('FECHA').AsDate  := DTPAFecha.Date;
 IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IDAnimal;
 IBQSPEventoInd.ParamByName('OBSERVACION').AsString := MAObservacion.GetDato;
 IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
 IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := DBLCBAResponsable.GetDato;
 IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger :=  FPrincipal.UsuarioActual;
 IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;
 IBQSPEventoInd.ParamByName('ID_GRUPO').Value := Null;


end;

Procedure TFEveDeclaracionAFIP.CargarDatosGrilla;
begin
inherited;
{if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple))then
begin
  IBDSSimple.Insert;}
  IDAnimal :=MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
  IBDSSimple.FieldByName('ID_RP').Value:=MSimple.IBQSeleccionados.FieldValues['ID_RP'];
  IBDSSimple.FieldByName('ID_SENASA').Value:=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];

  RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.GetDato]);
  //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
  RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('RESP')],[DBLCBAResponsable.GetDato,DBLCBAResponsable.Text]);
  //IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.GetDato;
  //IBDSSimple.FieldByName('RESP').Value:= DBLCBAResponsable.Text;
  RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
  //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;
//  RealizarCambio(DBLCBADias,[IBDSSimple.FieldByName('DIAS'),IBDSSimple.FieldByName('CODDIAS')],[DBLCBADias.Text,DiasPeso]);
  //IBDSSimple.FieldByName('DIAS').Value:= DBLCBADias.Text;
  //IBDSSimple.FieldByName('CODDIAS').Value:= DiasPeso;
  IBDSSimple.FieldByName('ID_ANIMAL').Value:= IDAnimal;
 // RealizarCambio(EAPeso,[IBDSSimple.FieldByName('PESO')],[StrToFloat(EAPeso.Text){FormatFloat('00.00',StrToFloat(EAPeso.Text))}]);
  //IBDSSimple.FieldByName('PESO').Value:= FormatFloat('00.00',EAPeso.GetDato);
  IBDSSimple.FieldByName('FECHA_NACIMIENTO').AsDateTime:= DMSoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',IDAnimal,'FECHA_NACIMIENTO'); //MSimple.IBQSeleccionados.FieldValues['FECHA_NACIMIENTO'];
//end;
end;

Procedure TFEveDeclaracionAFIP.CargarParametrosMasivo;

begin
  if(CrearGrupo)then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').Value;
  IBQSPEventoInd.ParamByName('FECHA').AsDate := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDate := Date();
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimpleRESPONSABLE.AsInteger;

  //******************************************************//
  //	INCIDENCIA: 403									                    //
  //	INICIO Consulta si hay animales informados a AFIP.  //
  //	Ana Laura Lamorte							          30/12/2014  //
  //******************************************************//
  IBQTabAnimales.Close;
  IBQTabAnimales.ParamByName('id_animal').Value := IBQSPEventoInd.ParamByName('ANIMAL').Value;
  IBQTabAnimales.Open;
  //Con un animal informado a AFIP, pongo en true la bandera
  //para preguntar despues si se desea declarar a AFIP.

  if (IBQTabAnimales.FieldByName('ID_IE').asString <> '') then
  begin
    LineaauxTxt := '['+IBDSSimple.FieldByName('ID_SENASA').asString+IntToStr(UFunctions.DigitoVerificadorCaravana('00'+IBDSSimple.FieldByName('ID_SENASA').asString))+'|'+IBQTabAnimales.FieldByName('ID_IE').asString+']';
    LineaauxXls := IBDSSimple.FieldByName('ID_SENASA').asString+IntToStr(UFunctions.DigitoVerificadorCaravana('00'+IBDSSimple.FieldByName('ID_SENASA').asString))+'|'+IBQTabAnimales.FieldByName('ID_IE').asString;

  end
  else
  begin
    LineaauxTxt := '['+IBDSSimple.FieldByName('ID_SENASA').asString+IntToStr(UFunctions.DigitoVerificadorCaravana('00'+IBDSSimple.FieldByName('ID_SENASA').asString))+'| - ]';
    LineaauxXls := IBDSSimple.FieldByName('ID_SENASA').asString+IntToStr(UFunctions.DigitoVerificadorCaravana('00'+IBDSSimple.FieldByName('ID_SENASA').asString))+'|';

  end;
  MAuxCaravanas.Lines.Add(IBDSSimple.FieldByName('ID_SENASA').asString+IntToStr(UFunctions.DigitoVerificadorCaravana('00'+IBDSSimple.FieldByName('ID_SENASA').asString)));
  CantAnim := CantAnim + 1;
  //Se van cargando los registros de equivalencias correspondientes (TXT).
  Append(arcEquivalenciasTxt);
  Writeln(arcEquivalenciasTxt, LineaauxTxt);
  Append(arcEquivalenciasXls);
  Writeln(arcEquivalenciasXls, LineaauxXls);

  //******************************************************//
  //	INCIDENCIA: 403								                    //
  //	FIN Consulta si hay animales informados a AFIP.     //
  //	Ana Laura Lamorte				              30/12/2014  //
  //******************************************************//


end;

Procedure TFEveDeclaracionAFIP.LoadSQLStringList;
begin
 SQLStringList.AddObject('RESP',DMSoftvet.DSResponsable);
 {DMSoftvet.IBQCodigosGenericos.Close;
 DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').Value := 'DP';
 DMSoftvet.IBQCodigosGenericos.Open; }
 SQLStringList.AddObject('DIAS',DMSoftvet.DSCodigosGenericos);
 inherited;
end;

(*
  Realiza los Chequeos correpondientes a los datos modificados en la grilla detalle
*)
procedure TFEveDeclaracionAFIP.IBDSSimpleFECHASetText(Sender: TField;
  const Text: String);
var PickPos: integer;
    PesoMin, PesoMax, Peso: double;
begin
  inherited;
{  if(IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)) then
  begin
    SetText(Sender,Text);
    if(Sender.FieldName = 'DIAS')then
       begin
         IBQValidaciones.Close;
         IBQValidaciones.Params.Clear;
         IBQValidaciones.SQL.Add('select valor from cod_genericos where ((tipo = ''DP'') and((valor like '''+UpperCase(Text)+'''||''%'')or (ID_CODIGO like '''+UpperCase(Text)+'%'')));');
         IBQValidaciones.Open;
         if not(IBQValidaciones.IsEmpty) then
         begin
            Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
            PickPos := BDBGSimple.ColumnByField('DIAS').PickList.IndexOf(BDBGSimple.ColumnByField('DIAS').Field.AsString);
            IBDSSimpleCODDIAS.Value := TClassType(BDBGSimple.ColumnByField('DIAS').PickList.Objects[PickPos]).getValue;
         end;
       end
    ELSE
     if(Sender.FieldName = 'PESO')then
      begin
        IBQValidaciones.Close;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :ESTABLECIMIENTO) and (sjp.nombre = ''BGPESANI4'')');
        IBQValidaciones.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
        IBQValidaciones.Open;
        PesoMax := IBQValidaciones.FieldByName('valor').AsFloat;
        IBQValidaciones.Close;
        IBQValidaciones.sql.Clear;
        IBQValidaciones.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :ESTABLECIMIENTO) and (sjp.nombre = ''BGPESANI1'')');
        IBQValidaciones.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
        IBQValidaciones.Open;
        PesoMin := IBQValidaciones.FieldByName('valor').AsFloat;
        if (TryStrToFloat(Text,Peso)) then
        begin
          if(Peso >= PesoMin) and (Peso <= PesoMax ) then
            Sender.AsVariant := StrToFloat(Text)
          else
            MostrarMensaje(tmError, Traducir('El Peso debe estar entre ')+FloatToStr(PesoMin)+' y '+FloatToStr(PesoMax)+#13+Traducir(' Según los Parámetros del Establecimiento'));
        end
        else
          MostrarMensaje(tmError, 'El Valor ingresado no corresponde a un peso válido');
      end;
     if ((IBDSSimple.FieldValues['EW'] = 'E') or (IBDSSimple.FieldValues['EW'] = 'W')) then
            IBDSSimple.FieldValues['EW'] := 'M';
  end;     }
end;


procedure TFEveDeclaracionAFIP.FormShow(Sender: TObject);
begin
  inherited;
  MSimple.PasarParametros(0,0);//cambie codigo
  DTPAFecha.Date := now;
  //DTPAFecha.MaxDate:= now;    
  {if(PCBasico.ActivePage = TSDatos)then
   begin
     EAPeso.SetFocus;
   end;}
  //DecimalSeparator:='.';
 // DBLCBADias.Enabled := FPrincipal.FuncActividad;
  //Label1.Enabled := FPrincipal.FuncActividad;
  BDBGSimple.Columns[3].Visible := FPrincipal.FuncActividad;
end;

procedure TFEveDeclaracionAFIP.EAPesoKeyPress(Sender: TObject; var Key: Char);
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

procedure TFEveDeclaracionAFIP.PCBasicoChange(Sender: TObject);
begin
  inherited;
  {if(PCBasico.ActivePage = TSDatos)then
   begin
     EAPeso.SetFocus;
   end;}
end;

procedure TFEveDeclaracionAFIP.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;
  GetEvent(DTPAFecha);
end;

procedure TFEveDeclaracionAFIP.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveDeclaracionAFIP.LObservadorMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= $00606C02;
      LObservador.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveDeclaracionAFIP.LObservadorMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= clWindowText;
      LObservador.Font.Style:= [fsUnderline];
    end;  
end;

{procedure TFEveDeclaracionAFIP.DBLCBADiasCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBADias.KeyValue <> null then
    DiasPeso := DBLCBADias.KeyValue;
  LCM.Visible := ((DBLCBADias.KeyValue = 'A') or (DBLCBADias.KeyValue = 'D') or (DBLCBADias.KeyValue = 'T')) and (FPrincipal.FuncActividad);
end; }

{procedure TFEveDeclaracionAFIP.completarCampos;
begin
    inherited;
    RealizarCambio(EAPeso,[IBDSSimple.FieldByName('PESO')],[IBDSSimple.FieldByName('PESO').Value]);
    EAPeso.Text:=IBDSSimple.FieldByName('PESO').Value;
    //DMSoftvet.IBQResponsable.Close;
    DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQResponsable.Open;
    if DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO')<>Null then
      IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO')
    else
      begin
      IBDSSimple.FieldByName('RESPONSABLE').Value:= 0;
      IBDSSimple.FieldByName('RESP').Value:='INDEFINIDO';
      end;
    DMSoftvet.IBQDatosAnimal.Close;
    DMSoftvet.IBQDatosAnimal.ParamByName('ESTABLECIMIENTO').AsInteger:=FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQDatosAnimal.Open;
    IBDSSimple.FieldByName('ID_SENASA').Value:=DMSoftVet.IBQDatosAnimal.Lookup('ID_RP',IBDSSimple.FieldByName('ID_RP').Value,'ID_SENASA');
    IBDSSimple.FieldByName('FECHA_NACIMIENTO').AsDateTime:= DMSoftVet.IBQDatosAnimal.Lookup('ID_RP',IBDSSimple.FieldByName('ID_RP').Value,'FECHA_NACIMIENTO');

    //DMSoftvet.IBQCodigosGenericos.Close;
    DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').Value := 'DP';
    DMSoftvet.IBQCodigosGenericos.Open;
    if DBLCBADias.ListSource.DataSet.Lookup('ID_CODIGO',IBDSSimple.FieldByName('DIAS').Value,'ID_CODIGO')<>null then
      IBDSSimple.FieldByName('DIAS').Value:=DBLCBADias.ListSource.DataSet.Lookup('ID_CODIGO',IBDSSimple.FieldByName('DIAS').Value,'VALOR');
    IBDSSimple.FieldByName('CODDIAS').Value:=DBLCBADias.ListSource.DataSet.Lookup('VALOR',IBDSSimple.FieldByName('DIAS').Value,'ID_CODIGO');
end;}

procedure TFEveDeclaracionAFIP.cargarDatos(i:integer);
var
  s : String;
begin
inherited;

  //IBDSSimple.FieldByName('ID_ANIMAL').Value:= anim[i].id;
  //IBDSSimple.FieldByName('ID_RP').AsString:= getDato('RP',anim[i]);
  if DMSoftVet.IBQDatosAnimal.Lookup('ID_RP',IBDSSimple.FieldByName('ID_RP').Value,'ID_SENASA')<>null then
    IBDSSimple.FieldByName('ID_SENASA').AsString:=DMSoftVet.IBQDatosAnimal.Lookup('ID_RP',IBDSSimple.FieldByName('ID_RP').Value,'ID_SENASA');
  //IBDSSimple.FieldByName('FECHA').AsDateTime:=getDato('Fecha',anim[i]);
  if DBLCBAResponsable.ListSource.DataSet.Locate('nombre',getDato('Responsable',anim[i]),[]) then
    IBDSSimple.FieldByName('RESP').AsString:=getDato('Responsable',anim[i])
  else
    IBDSSimple.FieldByName('RESP').AsString:='INDEFINIDO';
  IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
  //IBDSSimple.FieldByName('OBSERVACION').AsString:= getDato('Observacion',anim[i]);
  {if DBLCBADias.ListSource.DataSet.Lookup('VALOR',getDato('Días',anim[i]),'ID_CODIGO')<>null then
    IBDSSimple.FieldByName('CODDIAS').AsString:=DBLCBADias.ListSource.DataSet.Lookup('VALOR',getDato('Días',anim[i]),'ID_CODIGO')
  else
    IBDSSimple.FieldByName('CODDIAS').AsString:=getDato('Días',anim[i]);  }
//  IBDSSimple.FieldByName('DIAS').AsString:=DBLCBADias.ListSource.DataSet.Lookup('ID_CODIGO',IBDSSimple.FieldByName('CODDIAS').Value,'VALOR');
  s := StringReplace(getDato('Peso',anim[i]),'.',',',[]);
  IBDSSimple.FieldByName('PESO').AsFloat:= strtofloat(s);//FormatFloat('00.00',getDato('Peso',anim[i]));
  if getDato('ed',anim[i])<>'' then
     IBDSSimple.FieldByName('FECHA_NACIMIENTO').AsDateTime:= StrToDateTime(getDato('ed',anim[i]))
  else
     IBDSSimple.FieldByName('FECHA_NACIMIENTO').AsDateTime:=DMSoftVet.IBQDatosAnimal.Lookup('ID_ANIMAL',anim[i].id,'FECHA_NACIMIENTO');
 // EAPeso.Text:=IBDSSimple.FieldByName('PESO').Value;
end;

procedure TFEveDeclaracionAFIP.IBDSSimpleID_RPSetText(Sender: TField;const Text: String);
var str:string;
begin
  inherited;
end;


procedure TFEveDeclaracionAFIP.LParametrosEstabClick(Sender: TObject);
var
  F : TFModificacionParametros;
begin
  inherited;
  F := TFModificacionParametros.Create(self);
  F.ShowModal;
  F.Destroy;
 
end;

procedure TFEveDeclaracionAFIP.LCMClick(Sender: TObject);
var
  F : TFEveActividad;
begin
  inherited;
  F := TFEveActividad.Create(self);
  F.ConManga := ConManga;
  F.ModoEve := ModoEve;
  if ModoEve = meIndividual then
    F.IDAnimal := IDAnimal;
  F.CBActividad.Checked := true;
  F.CBActividadClick(nil);
  F.CBSubCat.Checked := false;
  F.CBSubCatClick(nil);
  F.DBLCBAActividad.KeyValue := 3;
  F.DBLCBAActividadCloseUp(F.DBLCBAActividad);
  F.PCBasico.ActivePage := F.TSDatos;
  F.DTPAFecha.Date := DTPAFecha.Date;
  F.ShowModal;
  F.Destroy;
end;

procedure TFEveDeclaracionAFIP.BDBGSimpleKeyPress(Sender: TObject; var Key: Char);
var
  Separador : Char;
begin
  inherited;
  Separador := SysUtils.DecimalSeparator;
  if (Key = '.') or (Key = ',') then
    Key := Separador;
end;

function TFEveDeclaracionAFIP.SpecialFolder(Folder: Integer): String;
var
  SFolder : pItemIDList;
  SpecialPath : Array[0..MAX_PATH] Of Char;
begin
  SHGetSpecialFolderLocation(Self.Handle, Folder, SFolder);
  SHGetPathFromIDList(SFolder, SpecialPath);
  Result := StrPas(SpecialPath);
end;


procedure TFEveDeclaracionAFIP.mostrarCaravanas;
var F : TFPanelCaravanas;
begin

  F := TFPanelCaravanas.Create(self);
  F.MACaravanas.Lines.Text := MAuxCaravanas.Lines.Text;
  F.LAnimales.Caption := 'Animales('+ inttostr(CantAnim)+')';
  F.TipoMov := 'Declaracion_afip';
  F.ShowModal;

end;

procedure TFEveDeclaracionAFIP.ATerminarExecute(Sender: TObject);
begin
  inherited;
  if (MAErrors.Lines.Text = '') then
  //******************************************************//
  //	INCIDENCIA: 414									                    //
  //	INICIO Actualizaci�n de datos DTE en tabla.         //
  //         Creaci�n de archivos de equivalencias.       //
  //	Carla Gareis							              16/12/2014  //
  //******************************************************//
  begin
   //Creaci�n del txt para realizar la exportaci�n de las caravanas.

   //Creaci�n del xls a partir de Txt.



   if(self.ModoEve <> meIndividual)then
        if MostrarMensaje(tmConsulta,'Desea ver las caravanas de los animales?') = mrYes then
        begin
             LineaauxTxt := '';
             Append(arcEquivalenciasTxt);
             Writeln(arcEquivalenciasTxt, LineaauxTxt);
             Append(arcEquivalenciasXls);
             Writeln(arcEquivalenciasXls, LineaauxTxt);
             mostrarCaravanas;
        end;

    //Eliminaci�n de archivos temporales creados.
    CloseFile(arcEquivalenciasTxt);
    DeleteFile(ExtractFilePath(Application.ExeName)+'Exportacion\EquivalenciasTempTxt.txt');
    CloseFile(arcEquivalenciasXls);
    DeleteFile(ExtractFilePath(Application.ExeName)+'Exportacion\EquivalenciasTempXls.txt');
  end;
  //******************************************************//
  //	INCIDENCIA: 414									                    //
  //	FIN Actualizaci�n de datos DTE en tabla.            //
  //      Creaci�n de archivos de equivalencias.          //
  //	Carla Gareis							              16/12/2014  //
  //******************************************************//
end;

procedure TFEveDeclaracionAFIP.ACancelarExecute(Sender: TObject);
begin
  //Eliminaci�n de archivos temporales creados.
  CloseFile(arcEquivalenciasTxt);
  Erase(arcEquivalenciasTxt);
  CloseFile(arcEquivalenciasXls);
  Erase(arcEquivalenciasXls);
  inherited;
end;
//******************************************************//
//	INCIDENCIA: 414									                    //
//	FIN Generaci�n de archivos txt y xls.               //
//      Borrado de temporales creados.                  //
//	Carla Gareis							              18/12/2014  //
//******************************************************//


end.

