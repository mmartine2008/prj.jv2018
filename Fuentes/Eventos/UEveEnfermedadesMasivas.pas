unit UEveEnfermedadesMasivas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, DateTimePickerAuto, DBCtrls,
  UDBLookupComboBoxAuto, DataExport, DataToXLS, WinXP, EditAuto, ImgList,
  PngImageList, JvExControls, JvLabel, PngImage, JvExExtCtrls, JvImage,
  jpeg, JvGIF, JvComponentBase, JvBalloonHint, xmldom, XMLIntf, msxmldom,
  XMLDoc, Menus;

type
  TFEveEnfermedadesMasivas = class(TFEveSimple)
    LFecha: TLabel;
    LResponsable: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    DTPAFecha: TDateTimePickerAuto;
    LResultado: TLabel;
    DBLCBAResultado: TDBLookupComboBoxAuto;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleID_AUX_EVENTO: TIntegerField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleID_RESULTADO: TIBStringField;
    IBDSSimpleRESULTADO: TIBStringField;
    IBDSSimpleEW: TIBStringField;

    LResultadoCampi: TLabel;
    DBLCBAResultadoCampi: TDBLookupComboBoxAuto;
    LResultadoTrico: TLabel;
    DBLCBAResultadoTrico: TDBLookupComboBoxAuto;
    IBDSSimpleID_RESULTADO_CAMPI: TIBStringField;
    IBDSSimpleRESULTADO_CAMPI: TIBStringField;
    IBDSSimpleID_RESULTADO_TRICO: TIBStringField;
    IBDSSimpleRESULTADO_TRICO: TIBStringField;
    LPToma: TLabel;
    LPLab: TLabel;
    EPToma: TEdit;
    EPLab: TEdit;
    LPrecio: TLabel;
    EPrecio: TEdit;
    IBQGenericosEspecial: TIBQuery;
    DSGenericosEspecial: TDataSource;
    constructor Create(AOwner: TComponent; ModoEnfermedadParam:TModoEnfermedadMasiva); reintroduce;
    procedure SetText(Sender: TField; const Text: String);
    procedure change(Sender: TField);
    procedure DBLCBAResultadoClick(Sender: TObject);
    procedure DBLCBAResultadoCampiClick(Sender: TObject);
    procedure DBLCBAResultadoCampiCloseUp(Sender: TObject);
    procedure DBLCBAResultadoTricoClick(Sender: TObject);
    procedure DBLCBAResultadoTricoCloseUp(Sender: TObject);
    procedure IBDSSimpleID_RESULTADOChange(Sender: TField);
    procedure IBDSSimpleID_RESULTADO_TRICOChange(Sender: TField);
    procedure PCBasicoChange(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure EPrecioChange(Sender: TObject);
    procedure EPLabChange(Sender: TObject);
    procedure EPTomaChange(Sender: TObject);
    procedure BBXlsImportClick(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure BDBGSimpleDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    precio, precio_toma, precio_lab : double;
    procedure configurarBrucelosis;
    procedure configurarTuberculinizacion;
    procedure configurarRaspadoToro;
    procedure cambiarResultadoEnfermedad();//para raspado de toros solamente
    { Private declarations }
  public
    { Public declarations }
  protected
    ModoEnf: TModoEnfermedadMasiva;//el tipo de tratamiento que se esta realizando
    Procedure CargarParametrosRN;override;
    Procedure CargarParametrosSP;override;
    procedure CargarDatosGrilla;override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure cargarDatos(i:integer);override;
  end;

var
  FEveEnfermedadesMasivas: TFEveEnfermedadesMasivas;

implementation

uses UUniversal, UDMSoftvet, UPrincipal, UClassType, UABMEmpleados, UImportacion, UTraduccion;

{$R *.dfm}

{ TFEveEnfermedadesMasivas }

constructor TFEveEnfermedadesMasivas.Create(AOwner: TComponent; ModoEnfermedadParam: TModoEnfermedadMasiva);
begin
  inherited Create(AOwner);

  ModoEnf:= ModoEnfermedadParam; //pongo el nombre de enfermedad

  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;

  DTPAFecha.DateTime := now;
//  DTPAFecha.MaxDate:= now;

  IBQGenericosEspecial.Close;
  IBQGenericosEspecial.ParamByName('tipo').Value := 'PN';
  IBQGenericosEspecial.Open;

  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.SQL.Clear;
  case ModoEnfermedadParam of
    memSangradoBrucelosis : begin
                              DMSoftvet.IBQCodigosGenericos.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo)');
                              configurarBrucelosis;
                            end;
    memTuberculinizacion  : begin
                              DMSoftvet.IBQCodigosGenericos.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo) and (ID_CODIGO <> ''S'')');
                              configurarTuberculinizacion;
                            end;
    memRaspadoToro        : begin
                              DMSoftvet.IBQCodigosGenericos.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo) and (ID_CODIGO <> ''S'')');
                              configurarRaspadoToro;
                            end;
  end;
  //*/*/*
  DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').Value := 'PN';
  DMSoftvet.IBQCodigosGenericos.Open;

  DMSoftvet.IBQAfterOpen(DMSoftvet.IBQCodigosGenericos);
  DMSoftvet.IBQAfterOpen(IBQGenericosEspecial);

  ///*/**/*/*

  LResultadoCampi.Visible:= false;
  DBLCBAResultadoCampi.Visible:= false;
  DBLCBAResultadoCampi.EsRequerido:= false;
  LResultadoTrico.Visible:= false;
  DBLCBAResultadoTrico.Visible:= false;
  DBLCBAResultadoTrico.EsRequerido:= false;

  if (ModoEnf = memRaspadoToro) then
    begin
       BDBGSimple.Columns[5].Visible:= true;
       BDBGSimple.Columns[6].Visible:= true;
    end
  else
      begin
         BDBGSimple.Columns[5].Visible:= false;
         BDBGSimple.Columns[6].Visible:= false;
      end;

{  if (ModoEnfermedadParam = memRaspadoToro) then
    begin
      LResultado.Visible:= true;
      DBLCBAResultado.Visible:= true;
    end
  else
    begin
        LResultado.Visible:= true;
        DBLCBAResultado.Visible:= true;
    end; }
   DBLCBAResponsable.KeyValue:=0;
   DBLCBAResultado.KeyValue:='I';
   //DBLCBAResultadoCampi.KeyValue:='P';
   //DBLCBAResultadoTrico.KeyValue:='P';
end;

// configuraciones para el sangrado de brucelosis
procedure TFEveEnfermedadesMasivas.configurarBrucelosis;
begin
  PTitulo.Caption := Traducir('Sangrado para Brucelosis');
  Msimple.SQLBasico := 'select id_animal, id_rp, id_senasa, id_pc, id_hba, id_otro, id_ie, nombre, apodo from Vis_Sangrado_Brucelosis';
  MSimple.PasarParametros(0,0);//cambie codigo

  FTipoEvento := 30;

  Precio_Toma := 0;
  Precio_Lab := 0;

  IBQSPRN.Params.Clear;
  IBQSPRN.SQL.Clear;
  IBQSPRN.SQL.Add('select * from RN_Sangrado_Brucelosis(:animal, :fecha)');

  IBQSPEventoInd.Params.Clear;
  IBQSPEventoInd.SQL.Clear;
  IBQSPEventoInd.SQL.Add('EXECUTE PROCEDURE SP_Sangrado_Brucelosis (:id_resultado,:FECHA,:ANIMAL,:OBSERVACION,:ESTABLECIMIENTO,:RESPONSABLE,:LOG_USUARIO,:LOG_FECHA_MODIFICADO, null,:grupo,:PRECIO_TOMA,:PRECIO_LAB)');

  DTXLS.Title.Text:='Evento Sangrado para Brucelosis';
end;

// configuracion para la tubeculinizacion
procedure TFEveEnfermedadesMasivas.configurarTuberculinizacion;
begin
  PTitulo.Caption := Traducir('Tuberculinización');
  Msimple.SQLBasico := 'select id_animal, id_rp, id_senasa, id_pc, id_hba, id_otro, id_ie, nombre, apodo from vis_Tuberculinizacion';
  MSimple.PasarParametros(0,0);//cambie codigo

  FTipoEvento := 31;

  Precio := 0;

  EPLab.Visible := false;
  LPLab.Visible := false;
  EPToma.Visible := false;
  LPToma.Visible := false;
  LPrecio.Visible := true;
  EPrecio.Visible := true;

  IBQSPRN.Params.Clear;
  IBQSPRN.SQL.Clear;
  IBQSPRN.SQL.Add('select * from RN_Tuberculinizacion(:animal, :fecha)');

  IBQSPEventoInd.Params.Clear;
  IBQSPEventoInd.SQL.Clear;
  IBQSPEventoInd.SQL.Add('EXECUTE PROCEDURE SP_tuberculinizacion (:id_resultado,:FECHA,:ANIMAL,:OBSERVACION,:ESTABLECIMIENTO,:RESPONSABLE,:LOG_USUARIO,:LOG_FECHA_MODIFICADO, null,:grupo,:PRECIO)');

  DTXLS.Title.Text:='Evento Tuberculinización';

end;

//  configuracion de para el muestreo de toros
procedure TFEveEnfermedadesMasivas.configurarRaspadoToro;
begin
  PTitulo.Caption := Traducir('Muestreo de toros por venéreas');
  Msimple.SQLBasico := 'select id_animal, id_rp, id_senasa, id_pc, id_hba, id_otro, id_ie, nombre, apodo from vis_Raspado_Toro';
  //MSimple.PasarParametros(1,0);//aca cambie codigo
  MSimple.PasarParametros(1,6);//cambie codigo
  MSimple.ActualizarCategoria(3);  //agregue codigo

  Precio_Toma := 0;
  Precio_Lab := 0;

  FTipoEvento := 32;

  IBQSPRN.Params.Clear;
  IBQSPRN.SQL.Clear;
  IBQSPRN.SQL.Add('select * from RN_Raspado_Toro(:animal, :fecha)');

  IBQSPEventoInd.Params.Clear;
  IBQSPEventoInd.SQL.Clear;
  IBQSPEventoInd.SQL.Add('EXECUTE PROCEDURE SP_Raspado_Toro (:id_resultado,:FECHA,:ANIMAL,:OBSERVACION,:ESTABLECIMIENTO,:RESPONSABLE,:LOG_USUARIO,:LOG_FECHA_MODIFICADO, null,:grupo,:id_resultado_campi,:id_resultado_trico,:PRECIO_TOMA,:PRECIO_LAB)');

  DTXLS.Title.Text:='Evento Muestreo de Toros por Venéreas';
end;


// cargamos la grilla detalle
procedure TFEveEnfermedadesMasivas.CargarDatosGrilla;
begin
  inherited;
  {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_animal'],DSSimple))then
    begin
      IBDSSimple.Insert; }
      IBDSSimple.FieldByName('ID_RP').Value:=MSimple.IBQSeleccionados.FieldValues['ID_RP'];
      IBDSSimple.FieldByName('ID_ANIMAL').Value:=MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];


      RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.GetDato]);
      //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
      RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('RESP')],[DBLCBAResponsable.GetDato,DBLCBAResponsable.Text]);
      //IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.GetDato;
      //IBDSSimple.FieldByName('RESP').Value:= DBLCBAResponsable.Text;
      RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
      //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;
      RealizarCambio(DBLCBAResultado,[IBDSSimple.FieldByName('id_resultado'),IBDSSimple.FieldByName('Resultado')],[DBLCBAResultado.KeyValue,DBLCBAResultado.Text]);
      //IBDSSimple.FieldByName('id_resultado').Value:= DBLCBAResultado.KeyValue;
      //IBDSSimple.FieldByName('Resultado').Value:= DBLCBAResultado.Text;

 //     if (DBLCBAResultado.KeyValue <> 'I') then
 //       begin
       if (ModoEnf = memRaspadoToro) then
         begin
          IBDSSimpleID_RESULTADO_CAMPI.OnChange := nil;
          IBDSSimpleID_RESULTADO_TRICO.OnChange := nil;

          RealizarCambio(DBLCBAResultadoCampi,[IBDSSimple.FieldByName('id_resultado_Campi'),IBDSSimple.FieldByName('Resultado_Campi')],[DBLCBAResultadoCampi.KeyValue,DBLCBAResultadoCampi.Text]);
          //IBDSSimple.FieldByName('id_resultado_Campi').Value:= DBLCBAResultadoCampi.KeyValue;
          //IBDSSimple.FieldByName('Resultado_Campi').Value:= DBLCBAResultadoCampi.Text;

          RealizarCambio(DBLCBAResultadoTrico,[IBDSSimple.FieldByName('id_resultado_Trico'),IBDSSimple.FieldByName('Resultado_Trico')],[DBLCBAResultadoTrico.KeyValue,DBLCBAResultadoTrico.Text]);
          //IBDSSimple.FieldByName('id_resultado_Trico').Value:= DBLCBAResultadoTrico.KeyValue;
          //IBDSSimple.FieldByName('Resultado_Trico').Value:= DBLCBAResultadoTrico.Text;

          IBDSSimpleID_RESULTADO_CAMPI.OnChange := IBDSSimpleID_RESULTADO_TRICOChange;
          IBDSSimpleID_RESULTADO_TRICO.OnChange := IBDSSimpleID_RESULTADO_TRICOChange;
         end;
 //       end;
    //end;
end;

procedure TFEveEnfermedadesMasivas.CargarParametrosMasivo;
begin
  inherited;
  IBQSPEventoInd.ParamByName('id_resultado').AsString := IBDSSimple.FieldValues['ID_resultado'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('FECHA').AsDateTime := IBDSSimple.FieldByName('FECHA').AsDateTime;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;
  IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimple.FieldValues['RESPONSABLE'];
   if (crearGrupo) then
    IBQSPEventoInd.ParamByName('grupo').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;

//  if (DBLCBAResultado.KeyValue <> 'I') then
//    begin
  if (ModoEnf = memRaspadoToro) then
    begin
{      IBQSPEventoInd.ParamByName('id_resultado_campi').AsString := IBDSSimple.FieldValues['ID_resultado_campi'];
      IBQSPEventoInd.ParamByName('id_resultado_trico').AsString := IBDSSimple.FieldValues['ID_resultado_trico'];}

      //*/*/*/*/*/
      IBQSPEventoInd.ParamByName('id_resultado_campi').Value := IBDSSimple.FieldValues['ID_resultado_campi'];
      IBQSPEventoInd.ParamByName('id_resultado_trico').Value := IBDSSimple.FieldValues['ID_resultado_trico'];
      //*/*/*/*/*

    end;


    case ModoEnf of
      memSangradoBrucelosis, memRaspadoToro  : begin
                                                IBQSPEventoInd.ParamByName('PRECIO_TOMA').Value := Precio_Toma;
                                                IBQSPEventoInd.ParamByName('PRECIO_LAB').Value := Precio_Lab;
                                               end;
      memTuberculinizacion  : IBQSPEventoInd.ParamByName('PRECIO').Value := Precio;
    end;

//    end;
end;

procedure TFEveEnfermedadesMasivas.CargarParametrosRN;
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

procedure TFEveEnfermedadesMasivas.CargarParametrosSP;
begin
  inherited;
  IBQSPEventoInd.ParamByName('id_resultado').AsString := DBLCBAResultado.KeyValue;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('FECHA').Value := DTPAFecha.GetDato;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;
  IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IDAnimal;
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := DBLCBAResponsable.KeyValue;

//  if (DBLCBAResultado.KeyValue <> 'I') then
//    begin
  if (ModoEnf = memRaspadoToro) then
    begin
      if (DBLCBAResultadoCampi.KeyValue <> null) then
        IBQSPEventoInd.ParamByName('id_resultado_campi').AsString := DBLCBAResultadoCampi.KeyValue
       else
        IBQSPEventoInd.ParamByName('id_resultado_campi').Value:= null;

      if (DBLCBAResultadoTrico.KeyValue <> null) then
        IBQSPEventoInd.ParamByName('id_resultado_trico').AsString := DBLCBAResultadoTrico.KeyValue
       else
        IBQSPEventoInd.ParamByName('id_resultado_trico').Value:= null;

    end;
//    end;

    case ModoEnf of
      memSangradoBrucelosis, memRaspadoToro  : begin
                                                IBQSPEventoInd.ParamByName('PRECIO_TOMA').Value := Precio_Toma;
                                                IBQSPEventoInd.ParamByName('PRECIO_LAB').Value := Precio_Lab;
                                               end;
      memTuberculinizacion  : IBQSPEventoInd.ParamByName('PRECIO').Value := Precio;
    end;
end;

procedure TFEveEnfermedadesMasivas.LoadSQLStringList;
begin
  inherited;
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('RESULTADO',TObject(DMSoftvet.DSCodigosGenericos));

  if (ModoEnf = memRaspadoToro) then
   begin
   //*/*/*/*/*
     SQLStringList.AddObject('RESULTADO_CAMPI',TObject(DSGenericosEspecial));
     SQLStringList.AddObject('RESULTADO_TRICO',TObject(DSGenericosEspecial));
   //*/*/*/*/*/
     {SQLStringList.AddObject('RESULTADO_CAMPI',TObject(DMSoftvet.DSCodigosGenericos));
     SQLStringList.AddObject('RESULTADO_TRICO',TObject(DMSoftvet.DSCodigosGenericos));}
   end;  
end;

procedure TFEveEnfermedadesMasivas.SetText(Sender: TField; const Text: String);
begin
  if ((IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      case (Sender.Index) of
        4 : begin      // OBSERVACIONES
              Sender.AsString := Text;
            end;
        6 : begin      // RESPONSABLE
              IBQValidaciones.SQL.Add('select NOMBRE || '' '' || APELLIDO as NombreyApellido from TAB_EMPLEADOS where (establecimiento = :esta) and ((apellido like '''+UpperCase(Text)+'%'') or(nombre like '''+UpperCase(Text)+'%'')or (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%''))');
              IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
              IBQValidaciones.Active := true;
              if not(IBQValidaciones.IsEmpty) then
                Sender.AsString := IBQValidaciones.FieldByName('NombreyApellido').AsString;
            end;
        8 : begin      // RESULTADO
              IBQValidaciones.SQL.Add('select VALOR from COD_GENERICOS where (tipo = ''PN'')and (VALOR like '''+UpperCase(Text)+'%'')');
              IBQValidaciones.Active := true;
              if not(IBQValidaciones.IsEmpty) then
                Sender.AsString := IBQValidaciones.FieldByName('VALOR').AsString;
            end;

        11 : begin      // RESULTADO Campi
              IBQValidaciones.SQL.Add('select VALOR from COD_GENERICOS where (tipo = ''PN'') and (VALOR like '''+UpperCase(Text)+'%'')');
              IBQValidaciones.Active := true;
              if not(IBQValidaciones.IsEmpty) then
                Sender.AsString := IBQValidaciones.FieldByName('VALOR').AsString;
            end;

        13 : begin      // RESULTADO Trico
              IBQValidaciones.SQL.Add('select VALOR from COD_GENERICOS where (tipo = ''PN'') and (VALOR like '''+UpperCase(Text)+'%'')');
              IBQValidaciones.Active := true;
              if not(IBQValidaciones.IsEmpty) then
                Sender.AsString := IBQValidaciones.FieldByName('VALOR').AsString;
            end;
      end;
    end;
end;

procedure TFEveEnfermedadesMasivas.change(Sender: TField);
var PickPos : integer;
begin
  if (IBDSSimple.State <> dsInsert ) then
    case (Sender.Index) of
      6:  begin      // RESPONSABLE
            PickPos := BDBGSimple.ColumnByField('RESP').PickList.IndexOf(BDBGSimple.ColumnByField('RESP').Field.AsString);
            IBDSSimpleRESPONSABLE.Value := TClassType(BDBGSimple.ColumnByField('RESP').PickList.Objects[PickPos]).getValue;
          end;
      8:  begin      // RESULTADO
            PickPos := BDBGSimple.ColumnByField('RESULTADO').PickList.IndexOf(BDBGSimple.ColumnByField('RESULTADO').Field.AsString);
            IBDSSimpleID_RESULTADO.Value := TClassType(BDBGSimple.ColumnByField('RESULTADO').PickList.Objects[PickPos]).getValue;
            //
            if (IBDSSimple.FieldValues['id_resultado'] = 'I') then
              begin
                IBDSSimple.FieldValues['id_resultado_Campi'] := null;
                IBDSSimple.FieldValues['id_Resultado_trico'] := null;
                IBDSSimple.FieldValues['resultado_Campi'] := null;
                IBDSSimple.FieldValues['Resultado_trico'] := null;

                //IBDSSimpleRESULTADO_CAMPI.ReadOnly := true;
                //IBDSSimpleRESULTADO_TRICO.ReadOnly := true;
              end
             else
                begin
                  IBDSSimpleRESULTADO_CAMPI.ReadOnly := false;
                  IBDSSimpleRESULTADO_TRICO.ReadOnly := false;
                end;   //
          end;

      11:  begin      // RESULTADO campi
            if (ModoEnf = memRaspadoToro) then
              begin
                //if (IBDSSimple.FieldValues['id_resultado'] <> 'I') then
                if (BDBGSimple.ColumnByField('RESULTADO').Field.AsString <> 'NO DEFINIDO') then
                  begin
                  //TClassType(BDBGSimple.ColumnByField('METODO').PickList.Objects[PickPos]).getValue
                    PickPos := BDBGSimple.ColumnByField('RESULTADO_Campi').PickList.IndexOf(BDBGSimple.ColumnByField('RESULTADO_Campi').Field.AsString);
                    IBDSSimpleID_RESULTADO_CAMPI.Value := TClassType(BDBGSimple.ColumnByField('RESULTADO_Campi').PickList.Objects[PickPos]).getValue;
                  end
                { else
                  begin
                    IBDSSimple.FieldValues['id_resultado_Campi'] := null;
                    IBDSSimple.FieldValues['resultado_Campi'] := null;
                  end; }
                  //
              end;
          end;

      13:  begin      // RESULTADO trico
            if (ModoEnf = memRaspadoToro) then
              begin
                if (IBDSSimple.FieldValues['id_resultado'] <> 'I') then
                  begin
                    PickPos := BDBGSimple.ColumnByField('RESULTADO_Trico').PickList.IndexOf(BDBGSimple.ColumnByField('RESULTADO_Trico').Field.AsString);
                    IBDSSimpleID_RESULTADO_TRICO.Value := TClassType(BDBGSimple.ColumnByField('RESULTADO_Trico').PickList.Objects[PickPos]).getValue;
                  end;  
              end;                
          end;
    end;

  {if (IBDSSimple.State = dsEdit ) then
    begin
      IBDSSimple.Post;
    end;
  }  
end;

procedure TFEveEnfermedadesMasivas.DBLCBAResultadoClick(Sender: TObject);
begin
  inherited;
  if (ModoEnf = memRaspadoToro) then
    begin
      GetEvent(DBLCBAResultadoCampi);
      GetEvent(DBLCBAResultadoTrico);
      DBLCBAResultadoCampi.Enabled:= true;
      DBLCBAResultadoTrico.Enabled:= true;
      if (DBLCBAResultado.KeyValue = 'I') then
        begin
          LResultadoCampi.Visible:= false;
          DBLCBAResultadoCampi.Visible:= false;
          DBLCBAResultadoCampi.EsRequerido:= false;
          LResultadoTrico.Visible:= false;
          DBLCBAResultadoTrico.Visible:= false;
          DBLCBAResultadoTrico.EsRequerido:= false;
          {DBLCBAResultadoCampi.KeyValue:= 'I';
          DBLCBAResultadoTrico.KeyValue:= 'I';}
          //*/*/*/*/*
          DBLCBAResultadoCampi.KeyValue:= null;
          DBLCBAResultadoTrico.KeyValue:= null;
          //*/*/*/*/*
        end
       else
        begin
         LResultadoCampi.Visible:= true;
         DBLCBAResultadoCampi.Visible:= true;
         DBLCBAResultadoCampi.EsRequerido:= true;
         LResultadoTrico.Visible:= true;
         DBLCBAResultadoTrico.Visible:= true;
         DBLCBAResultadoTrico.EsRequerido:= true;
         if (DBLCBAResultado.KeyValue = 'P') then
            begin
              DBLCBAResultadoCampi.KeyValue:= 'P';
              DBLCBAResultadoTrico.KeyValue:= 'P';
            end
          else
           if (DBLCBAResultado.KeyValue = 'N') then
              begin
                DBLCBAResultadoCampi.KeyValue:= 'N';
                DBLCBAResultadoTrico.KeyValue:= 'N';
                DBLCBAResultadoCampi.Enabled:= false;
                DBLCBAResultadoTrico.Enabled:= false;
              end
        end;
    end;
end;

procedure TFEveEnfermedadesMasivas.cambiarResultadoEnfermedad;
begin
      GetEvent(DBLCBAResultadoCampi);
      GetEvent(DBLCBAResultadoTrico);

      DBLCBAResultadoCampi.Enabled:= true;
      DBLCBAResultadoTrico.Enabled:= true;

      if ((DBLCBAResultado.KeyValue = 'P') and
        (((DBLCBAResultadoCampi.KeyValue = 'P') and (DBLCBAResultadoTrico.KeyValue = 'I')) or
        ((DBLCBAResultadoCampi.KeyValue = 'I') and (DBLCBAResultadoTrico.KeyValue = 'P'))
        or ((DBLCBAResultadoCampi.KeyValue = 'N') and (DBLCBAResultadoTrico.KeyValue = 'I')) or
        ((DBLCBAResultadoCampi.KeyValue = 'I') and (DBLCBAResultadoTrico.KeyValue = 'N')))) then
        begin
          DBLCBAResultadoTrico.KeyValue:= 'P';
          DBLCBAResultadoCampi.KeyValue:= 'P';
        end            
      else
        if (DBLCBAResultadoCampi.KeyValue = 'P') and (DBLCBAResultadoTrico.KeyValue = 'P') then
            DBLCBAResultado.KeyValue:= 'P'
         else
           if (DBLCBAResultadoCampi.KeyValue = 'N') and (DBLCBAResultadoTrico.KeyValue = 'N') then
              begin
                DBLCBAResultado.KeyValue:= 'N';
                DBLCBAResultadoCampi.Enabled:= false;
                DBLCBAResultadoTrico.Enabled:= false;
              end
            else
             if (DBLCBAResultadoCampi.KeyValue = 'I') and (DBLCBAResultadoTrico.KeyValue = 'I') then
                begin
                  DBLCBAResultado.KeyValue:= 'I';
                  DBLCBAResultadoClick(nil);
                end;
end;

procedure TFEveEnfermedadesMasivas.DBLCBAResultadoCampiClick(
  Sender: TObject);
begin
  inherited;
  cambiarResultadoEnfermedad();
end;

procedure TFEveEnfermedadesMasivas.DBLCBAResultadoCampiCloseUp(
  Sender: TObject);
begin
  inherited;
  cambiarResultadoEnfermedad();
end;

procedure TFEveEnfermedadesMasivas.DBLCBAResultadoTricoClick(
  Sender: TObject);
begin
  inherited;
  cambiarResultadoEnfermedad();
end;

procedure TFEveEnfermedadesMasivas.DBLCBAResultadoTricoCloseUp(
  Sender: TObject);
begin
  inherited;
  cambiarResultadoEnfermedad();
end;

procedure TFEveEnfermedadesMasivas.IBDSSimpleID_RESULTADOChange(
  Sender: TField);
var
  i : integer;
begin
  inherited;
  IBDSSimpleID_RESULTADO_TRICO.OnChange:= nil;
  IBDSSimpleID_RESULTADO_CAMPI.OnChange:= nil;

  IBDSSimpleRESULTADO_CAMPI.ReadOnly := false;
  IBDSSimpleRESULTADO_TRICO.ReadOnly := false;

  if (IBDSSimple.FieldValues['id_resultado'] = 'I') then
    begin
      //IBDSSimple.FieldValues['id_Resultado_campi'] := IBDSSimple.FieldValues['id_resultado'];

      IBDSSimple.FieldValues['id_resultado_Campi'] := null ;
      //((IBDSSimple.FieldByName('id_resultado_Campi').Components[IBDSSimple.FieldByName('id_resultado_Campi').Index]) as TDBLookupComboBoxAuto).KeyValue:= null;

      //ShowMessage(IntToStr(IBDSSimple.FieldByName('id_resultado_Campi').ComponentIndex));

      //((SQLStringList.Objects[SQLStringList.IndexOfName('id_resultado_Campi')]) as TDBLookupComboBoxAuto).KeyValue:= null;
      //SQLStringList.AddObject('RESULTADO_TRICO',TObject(DSGenericosEspecial));
       //IBDSSimple.FieldValues['Resultado_Campi'] := '';
      //IBDSSimpleRESULTADO_CAMPI.Value:='';
      IBDSSimple.FieldValues['id_Resultado_trico'] := null;
      //IBDSSimple.FieldValues['Resultado_trico'] := '';
      //IBDSSimpleRESULTADO_CAMPI.ReadOnly := true;  //
      //IBDSSimpleRESULTADO_TRICO.ReadOnly := true;  //
    end
   else
     begin
        IBDSSimple.FieldValues['id_Resultado_campi'] := IBDSSimple.FieldValues['id_resultado'];
        IBDSSimple.FieldValues['Resultado_campi'] := IBDSSimple.FieldValues['resultado'];
        IBDSSimple.FieldValues['id_Resultado_trico'] := IBDSSimple.FieldValues['id_resultado'];
        IBDSSimple.FieldValues['Resultado_trico'] := IBDSSimple.FieldValues['resultado'];
     end;
  {if (IBDSSimpleID_RESULTADO.GetAsVariant = 'I') then
    begin
       IBDSSimpleID_RESULTADO.
    end
   else  }
  IBDSSimpleID_RESULTADO_TRICO.OnChange:= IBDSSimpleID_RESULTADO_TRICOChange;
  IBDSSimpleID_RESULTADO_CAMPI.OnChange:= IBDSSimpleID_RESULTADO_TRICOChange;

end;

procedure TFEveEnfermedadesMasivas.IBDSSimpleID_RESULTADO_TRICOChange(
  Sender: TField);
begin
  inherited;

  if ((IBDSSimple.FieldValues['id_Resultado'] = 'P') and
     (((IBDSSimple.FieldValues['id_Resultado_campi'] = 'I') and (IBDSSimple.FieldValues['id_Resultado_trico'] = 'P')) or
     ((IBDSSimple.FieldValues['id_Resultado_campi'] = 'P') and (IBDSSimple.FieldValues['id_Resultado_trico'] = 'I')) or
     ((IBDSSimple.FieldValues['id_Resultado_campi'] = 'I') and (IBDSSimple.FieldValues['id_Resultado_trico'] = 'N')) or
     ((IBDSSimple.FieldValues['id_Resultado_campi'] = 'N') and (IBDSSimple.FieldValues['id_Resultado_trico'] = 'I')))) then
     IBDSSimpleID_RESULTADOChange(nil)
   else
    if ((IBDSSimple.FieldValues['id_Resultado'] <> 'N') and (IBDSSimple.FieldValues['id_Resultado'] <> 'I')) then
      begin
        if (IBDSSimple.FieldValues['id_Resultado_campi'] = IBDSSimple.FieldValues['id_Resultado_trico']) then
          begin
            IBDSSimpleID_RESULTADO.OnChange:= nil;
            IBDSSimple.FieldValues['id_Resultado'] := IBDSSimple.FieldValues['id_resultado_campi'];
            IBDSSimple.FieldValues['Resultado'] := IBDSSimple.FieldValues['resultado_campi'];
            IBDSSimpleID_RESULTADO.OnChange:= IBDSSimpleID_RESULTADOChange;
          end;
       end
     else
       IBDSSimpleID_RESULTADOChange(nil);

end;

procedure TFEveEnfermedadesMasivas.PCBasicoChange(Sender: TObject);
begin
  inherited;
 {if (PCBasico.ActivePage = TsGrilla) then
   begin
     IBDSSimpleID_RESULTADO_TRICO.OnChange:= IBDSSimpleID_RESULTADO_TRICOChange;

   end
  else
    begin
      IBDSSimpleID_RESULTADO_TRICO.OnChange:= nil;

    end;
      }
end;

procedure TFEveEnfermedadesMasivas.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
    fecha.Date:=now;
  GetEvent(DTPAFecha);
end;

procedure TFEveEnfermedadesMasivas.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveEnfermedadesMasivas.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveEnfermedadesMasivas.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveEnfermedadesMasivas.EPrecioChange(Sender: TObject);
begin
  inherited;
  if not TryStrToFloat(EPrecio.Text,Precio) then
  begin
    EPrecio.Text := '';
    Precio := 0;
  end
  else
    if (Precio > 999999) then
    begin
      EPrecio.Text := '';
      Precio := 0;
    end;
end;

procedure TFEveEnfermedadesMasivas.EPLabChange(Sender: TObject);
begin
  inherited;
  if not TryStrToFloat(EPLab.Text,Precio_Lab) then
  begin
    EPLab.Text := '';
    Precio_lab := 0;
  end
  else
    if (Precio_Lab > 999999) then
    begin
      EPLab.Text := '';
      Precio_lab := 0;
    end;
end;

procedure TFEveEnfermedadesMasivas.EPTomaChange(Sender: TObject);
begin
  inherited;
  if not TryStrToFloat(EPToma.Text,Precio_Toma) then
  begin
    EPToma.Text := '';
    Precio_Toma := 0;
  end
  else
    if (Precio_Toma > 999999) then
    begin
      EPToma.Text := '';
      Precio_Toma := 0;
    end;
end;

procedure TFEveEnfermedadesMasivas.cargarDatos(i:integer);
begin
  inherited;
      DMSoftvet.IBQCodigosGenericos.Close;
      DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').Value:='PN';
      DMSoftvet.IBQCodigosGenericos.Open;
      IBDSSimple.FieldByName('RESP').Value:= getDato('responsable',anim[i]);
      IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
      //if getDato('resultado',anim[i])='' then
       // IBDSSimple.FieldByName('Resultado').Value:= :='NO DEFINIDO'
      //else
      IBDSSimple.FieldByName('Resultado').Value:= getDato('resultado',anim[i]);
      IBDSSimple.FieldByName('id_resultado').Value:=DBLCBAResultado.ListSource.DataSet.Lookup('VALOR',IBDSSimple.FieldByName('Resultado').Value,'ID_CODIGO');

       if (ModoEnf = memRaspadoToro) then
         begin
          IBDSSimpleID_RESULTADO_CAMPI.OnChange := nil;
          IBDSSimpleID_RESULTADO_TRICO.OnChange := nil;
          if IBDSSimple.FieldByName('Resultado').Value='POSITIVO' then
            begin
            IBDSSimple.FieldByName('id_resultado_Campi').Value:='P';
            IBDSSimple.FieldByName('resultado_Campi').Value:='POSITIVO';
            IBDSSimple.FieldByName('id_resultado_Trico').Value:='P';
            IBDSSimple.FieldByName('resultado_Trico').Value:='POSITIVO';
            end
          else if IBDSSimple.FieldByName('Resultado').Value='NEGATIVO' then
              begin
              IBDSSimple.FieldByName('id_resultado_Campi').Value:='N';
              IBDSSimple.FieldByName('resultado_Campi').Value:='NEGATIVO';
              IBDSSimple.FieldByName('id_resultado_Trico').Value:='N';
              IBDSSimple.FieldByName('resultado_Trico').Value:='NEGATIVO';
              end
            else if IBDSSimple.FieldByName('Resultado').Value='NO DEFINIDO' then
              begin
              IBDSSimple.FieldByName('id_resultado_Campi').Value:='';
              IBDSSimple.FieldByName('resultado_Campi').Value:='';
              IBDSSimple.FieldByName('id_resultado_Trico').Value:='';
              IBDSSimple.FieldByName('resultado_Trico').Value:='';
              end;
          IBDSSimpleID_RESULTADO_CAMPI.OnChange := IBDSSimpleID_RESULTADO_TRICOChange;
          IBDSSimpleID_RESULTADO_TRICO.OnChange := IBDSSimpleID_RESULTADO_TRICOChange;
         end;
end;

procedure TFEveEnfermedadesMasivas.BBXlsImportClick(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').Value:='PN';
  DMSoftvet.IBQCodigosGenericos.Open;
end;

procedure TFEveEnfermedadesMasivas.IBDSSimpleID_RPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  //hereda de evesimple
end;

procedure TFEveEnfermedadesMasivas.BDBGSimpleDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  BDBGSimple.Canvas.Font.Color := clBlack;
  if Column.FieldName = 'RESULTADO' then
  begin
    if IBDSSimpleRESULTADO.AsString = 'POSITIVO' then
      BDBGSimple.Canvas.Font.Color := clRed;
  end;
  BDBGSimple.Canvas.FillRect(Rect);
  BDBGSimple.Canvas.TextOut( Rect.Left+2, Rect.Top+2, Column.Field.Text);
end;

end.

