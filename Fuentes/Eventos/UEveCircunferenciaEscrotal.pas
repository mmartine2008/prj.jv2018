unit UEveCircunferenciaEscrotal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBCustomDataSet, IBQuery, ActnList, ComCtrls,
  Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto, Buttons,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, DateTimePickerAuto,
  UDBLookupComboBoxAuto, EditAuto, Spin, IBStoredProc, UFrameMangazo,
  DataExport, DataToXLS, WinXP, ImgList, PngImageList, JvExControls,
  JvLabel, PngImage, JvExExtCtrls, JvImage, jpeg, JvGIF, JvComponentBase,
  JvBalloonHint, xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveCircunferenciaEscrotal = class(TFEveSimple)
    LValor: TLabel;
    LObservador: TLabel;
    CBAObservador: TDBLookupComboBoxAuto;
    DTPAFecha: TDateTimePickerAuto;
    LFecha: TLabel;
    SEvalor: TSpinEdit;
    alos18meses: TCheckBox;
    Label1: TLabel;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleID_AUX_EVENTO: TIntegerField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleALOS18MESES: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    EACircunferenciaE: TEditAuto;
    IBDSSimpleVALOR: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Change(Sender: TField);    
    procedure IBDSSimpleFECHASetText(Sender: TField; const Text: String);
    procedure BDBGSimpleDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BDBGSimpleCellClick(Column: TColumn);
    procedure IBDSSimpleVALORSetText(Sender: TField; const Text: String);
    procedure IBDSSimpleALOS18MESESSetText(Sender: TField;
      const Text: String);
    procedure PCBasicoChange(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure SEvalorChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LObservadorMouseEnter(Sender: TObject);
    procedure LObservadorMouseLeave(Sender: TObject);
    procedure SEvalorKeyPress(Sender: TObject; var Key: Char);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure EACircunferenciaEKeyPress(Sender: TObject; var Key: Char);
    procedure EACircunferenciaEChange(Sender: TObject);
    procedure EACircunferenciaEExit(Sender: TObject);
    procedure BDBGSimpleKeyPress(Sender: TObject; var Key: Char);
    procedure CambiarValorColumna(Column: TColumn);
  protected
   procedure CargarParametrosRN; override;
   procedure CargarParametrosSP; override;
   procedure CargarDatosGrilla; override;
   Procedure CargarParametrosMasivo; override;
   procedure LoadSQLStringList;override;
   procedure cargarDatos(i:integer);override;
  public
    { Public declarations }
  end;

var
  FEveCircunferenciaEscrotal: TFEveCircunferenciaEscrotal;

implementation

uses UEveUniversal,UPrincipal,UDMSoftvet,UClassType,DateUtils, UMensajeHuella,
     UABMEmpleados,UImportacion;

{$R *.dfm}

(*
  Carga los parametros necesarios para las Reglas de Negocio Asociadas al evento
*)
Procedure TFEveCircunferenciaEscrotal.CargarParametrosRN;
begin
  IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
   if(self.ModoEve = meIndividual)then
   begin
      IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
      //IBQSPRN.ParamByName('VALOR').AsInteger :=  SEvalor.Value;
      IBQSPRN.ParamByName('VALOR').AsFloat :=  StrToFloat(EACircunferenciaE.Text);
      IBQSPRN.ParamByName('fecha').AsDateTime := DTPAFecha.DateTime;
   end
   else
   begin
     IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
     IBQSPRN.ParamByName('VALOR').AsFloat := IBDSSimple.fieldbyname('valor').AsFloat;
     IBQSPRN.ParamByName('fecha').AsDateTime := IBDSSimple.fieldbyname('fecha').AsDateTime;
   end;
end;

(*
  carga los parametros de la grilla detalle para el SP de insercion correspondiente
*)
Procedure TFEveCircunferenciaEscrotal.CargarParametrosSP;
begin
 IBQSPEventoInd.ParamByName('FECHA').Value  := DTPAFecha.GetDato;
 IBQSPEventoInd.ParamByName('ANIMAL').Value := IDAnimal;
 IBQSPEventoInd.ParamByName('OBSERVACION').Value     := MAObservacion.GetDato;
 IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
 IBQSPEventoInd.ParamByName('RESPONSABLE').Value := CBAObservador.GetDato;
 IBQSPEventoInd.ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
 IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := now;
// IBQSPEventoInd.ParamByName('VALOR').Value := SEvalor.Value;
 IBQSPEventoInd.ParamByName('VALOR').Value := StrToFloat(EACircunferenciaE.Text);
 if(alos18meses.Checked)then
   IBQSPEventoInd.ParamByName('ALOS18MESES').Value := 1
 else
     IBQSPEventoInd.ParamByName('ALOS18MESES').Value := 0;
 IBQSPEventoInd.ParamByName('ID_GRUPO').Value := Null;
end;

procedure TFEveCircunferenciaEscrotal.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Active := False;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Active := True;
  MSimple.SQLBasico := 'select ID_RP, ID_SENASA,ID_ANIMAL, id_pc, id_hba, id_otro, id_ie, nombre, apodo  from VIS_CIRCUNFERENCIA_ESCROTAL';
//  MSimple.PasarParametros(1);//cambie codigo
  alos18meses.Checked := false;
end;

(*
  Agrega los datos del evento a la grilla
*)
procedure TFEveCircunferenciaEscrotal.CargarDatosGrilla;
var
  valor : integer;
begin
  inherited;
  {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple))then
  begin
    IBDSSimple.Insert;}
    IBDSSimple.FieldByName('ID_RP').Value:=MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_SENASA').Value:=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
    IBDSSimple.FieldByName('ID_ANIMAL').Value:= MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];;
    RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.Date]);
    RealizarCambio(CBAObservador,[IBDSSimple.FieldByName('RESP'),IBDSSimple.FieldByName('RESPONSABLE')],[CBAObservador.Text,CBAObservador.GetDato]);
    RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
    RealizarCambio(EACircunferenciaE,[IBDSSimple.FieldByName('VALOR')],[StrToFloat(EACircunferenciaE.Text){ EACircunferenciaE.GetDato}]);

    //IBDSSimple.FieldByName('VALOR').Value:= SEvalor.Value;

    if (alos18meses.Checked) then
      valor := 1
    else
      valor := 0;
      
    RealizarCambio(ALOS18MESES,[IBDSSimple.FieldByName('ALOS18MESES')],[valor])

    {if(alos18meses.Checked)then
        IBDSSimple.FieldByName('ALOS18MESES').Value := 1
    else
       IBDSSimple.FieldByName('ALOS18MESES').Value := 0;}
  //end;
end;

(*
  carga los parametros de la grilla detalle para el SP de insercion correspondiente
*)
Procedure TFEveCircunferenciaEscrotal.CargarParametrosMasivo;
begin
  if (CrearGrupo) then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').Value;
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimpleRESPONSABLE.AsInteger;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  IBQSPEventoInd.ParamByName('VALOR').Value := IBDSSimple.FieldValues['VALOR'];
  IBQSPEventoInd.ParamByName('ALOS18MESES').Value := IBDSSimple.FieldValues['ALOS18MESES'];

end;

(*
  Carga el string List que se va a mostrar en el lookup de la columna correspondiente
*)
procedure TFEveCircunferenciaEscrotal.LoadSQLStringList;
begin
  SQLStringList.AddObject('RESP',DMSoftvet.DSResponsable);
  inherited;
end;


procedure TFEveCircunferenciaEscrotal.FormShow(Sender: TObject);
begin
  inherited;
  DTPAFecha.Date := DateOf(now);
//  DTPAFecha.MaxDate:= now;    
//  MSimple.PasarParametros(1);{Para filtrar las categorias para el Combo de la Manga}//aca cambie codigo
  MSimple.PasarParametros(1,6);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
  CBAObservador.AsignarValorDefecto;
  //SEvalor.Value :=0;
  EACircunferenciaE.Text:= '0';  
  {if(PCBasico.ActivePage = TSDatos)then
   begin
     SEvalor.SetFocus;
     SEvalor.SelectAll;
   end;}
end;

procedure TFEveCircunferenciaEscrotal.IBDSSimpleFECHASetText(
  Sender: TField; const Text: String);
var valor: integer;
begin
  inherited;

  SetText(Sender,Text);
  if(Sender.FieldName = 'ALOS18MESES')then
   begin
     IBQValidaciones.Params.Clear;
     IBQValidaciones.SQL.Add('select valor from cod_genericos where ((tipo = ''SN'') and (valor like '''+UpperCase(Text)+'''||''%''))');
     IBQValidaciones.Open;
     if not(IBQValidaciones.IsEmpty) then
        Sender.AsString := IBQValidaciones.FieldByName('valor').AsString ;
   end
   else
    if (Sender.FieldName = 'VALOR')then
    begin
      valor := StrToInt(Text);
      if not ((Valor >= 0) and (Valor <= 60)) then
        begin
          IBDSSimple.Cancel;
          MostrarMensaje(tmError, 'El Valor Ingresado se sale del rango Valido para Circ. Escrotal' );
        end
        else
            Sender.AsInteger := valor;
    end;
end;



procedure TFEveCircunferenciaEscrotal.BDBGSimpleDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

var   CheckBoxRectangle : TRect;
Const

 CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,

     DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  inherited;
  if (Column.FieldName = 'ALOS18MESES') and (Column.Field.Value <> null)then
   begin
     Self.BDBGSimple.Canvas.FillRect(Rect);
     CheckBoxRectangle.Left := Rect.Left + 2;
     CheckBoxRectangle.Right := Rect.Right - 2;
     CheckBoxRectangle.Top := Rect.Top + 2;
     CheckBoxRectangle.Bottom := Rect.Bottom - 2;
     if(Column.Field.AsInteger = 0)then
        DrawFrameControl(Self.BDBGSimple.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[false])
     else
         DrawFrameControl(Self.BDBGSimple.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[true])
 end;
end;


procedure TFEveCircunferenciaEscrotal.CambiarValorColumna(Column: TColumn);
begin
  Column.Field.DataSet.Edit;
  if(Column.Field.AsInteger = 0)then
    Column.Field.AsInteger := 1
  else
    Column.Field.AsInteger := 0;
  Column.Field.DataSet.Post;
end;


procedure TFEveCircunferenciaEscrotal.BDBGSimpleCellClick(Column: TColumn);
begin
  inherited;
  if(Column.FieldName = 'ALOS18MESES')then
    CambiarValorColumna(Column);
  if ((IBDSSimple.FieldValues['EW'] = 'E') or (IBDSSimple.FieldValues['EW'] = 'W')) then
  //        IBDSSimple.FieldValues['EW'] := 'M';
end;

procedure TFEveCircunferenciaEscrotal.IBDSSimpleVALORSetText(Sender: TField; const Text: String);
var valor : double;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin
    if (TryStrToFloat(Text,valor)) then
      begin
        try
          Sender.AsString := Text;
        except on e:Exception do
         begin
           MostrarMensaje(tmError, 'El valor de la circunferencia escrotal tiene que encontrarse entre 0 y 60 cm.');
         end;
        end; 
      end;
  end;
end;

procedure TFEveCircunferenciaEscrotal.IBDSSimpleALOS18MESESSetText(
  Sender: TField; const Text: String);
var valor: integer;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin
    if (TryStrToInt(Text,valor)) then
       Sender.AsString := Text;
  end;

end;

procedure TFEveCircunferenciaEscrotal.PCBasicoChange(Sender: TObject);
begin
  inherited;
  {if(PCBasico.ActivePage = TSDatos)then
   begin
     SEvalor.SetFocus;
     SEvalor.SelectAll;
   end;}
end;

procedure TFEveCircunferenciaEscrotal.Change(Sender: TField);
var valor: Integer;
begin
  inherited;
  if (IBDSSimple.State <> dsInsert ) then
    case (Sender.Index) of
       9: begin // Eval manual.
             if (TryStrToInt(IBDSSimple.FieldValues['ALOS18MESES'],valor)) then
               begin
                if (IBDSSimple.FieldValues['ALOS18MESES'] = null) or (IBDSSimple.FieldValues['ALOS18MESES'] < 0) or (IBDSSimple.FieldValues['ALOS18MESES'] > 1)then
                  IBDSSimple.FieldValues['ALOS18MESES']:= 0;
               end
              else
                   IBDSSimple.FieldValues['ALOS18MESES']:= 0;
          end;

    end; //del CASE.

end;


procedure TFEveCircunferenciaEscrotal.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;
  GetEvent(DTPAFecha);
end;

procedure TFEveCircunferenciaEscrotal.SEvalorChange(Sender: TObject);
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

procedure TFEveCircunferenciaEscrotal.LResponsableClick(Sender: TObject);
begin
  inherited;
  if nroID>0 then
        begin
        CBAObservador.KeyValue:=nroID;
        nroID:=-1;
        end;
end;

procedure TFEveCircunferenciaEscrotal.LObservadorMouseEnter(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= $00606C02;
      LObservador.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveCircunferenciaEscrotal.LObservadorMouseLeave(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= clWindowText;
      LObservador.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveCircunferenciaEscrotal.SEvalorKeyPress(Sender: TObject;
  var Key: Char);
var Separador: Char;
begin
  inherited;

 // DecimalSeparator:='.';
  Separador := SysUtils.DecimalSeparator;
//  if not(key in (['0'..'9'])) then
//    key := #0;



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

procedure TFEveCircunferenciaEscrotal.cargarDatos(i:integer);
var
  valor : integer;
begin
  inherited;
    IBDSSimple.FieldByName('ID_SENASA').Value:=getDato('senasa',anim[i]);
    IBDSSimple.FieldByName('ALOS18MESES').Value := getDato('18 meses',anim[i]);
    IBDSSimple.FieldByName('VALOR').Value:= getDato('valor',anim[i]);
    IBDSSimple.FieldByName('RESP').Value:= getDato('responsable',anim[i]);
    IBDSSimple.FieldByName('RESPONSABLE').Value:=CBAObservador.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
end;

procedure TFEveCircunferenciaEscrotal.IBDSSimpleID_RPSetText(
  Sender: TField; const Text: String);
begin
  inherited;
  //hereda
end;

procedure TFEveCircunferenciaEscrotal.EACircunferenciaEKeyPress(
  Sender: TObject; var Key: Char);
var Separador: Char;
begin
  inherited;

  //DecimalSeparator:='.';
  Separador := SysUtils.DecimalSeparator;
//  if not(key in (['0'..'9'])) then
//    key := #0;



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

procedure TFEveCircunferenciaEscrotal.EACircunferenciaEChange(
  Sender: TObject);
begin
  inherited;
  //if((EACircunferenciaE.Text <> '') and (FloatToStr(EACircunferenciaE.MaxValue) <> '')) then
 // begin
 //     if( StrToInt(EACircunferenciaE.Text) > EACircunferenciaE.MaxValue ) then
 //       EACircunferenciaE.Text:=FloatToStr(EACircunferenciaE.MaxValue);
 // end
 // else
   //  EACircunferenciaE.Text:='0';
end;

procedure TFEveCircunferenciaEscrotal.EACircunferenciaEExit(
  Sender: TObject);
begin
  inherited;
  GetEvent(Sender);
  if (EACircunferenciaE.Text <> '') then
  if ((StrToFloat(EACircunferenciaE.Text)<0) or (StrToFloat(EACircunferenciaE.Text)>60) ) then
    begin
      MostrarMensaje(tmError, 'La circunferencia escrotal debe estar entre 0 y 60');
      EACircunferenciaE.SetFocus;
    end
end;

procedure TFEveCircunferenciaEscrotal.BDBGSimpleKeyPress(Sender: TObject;
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


