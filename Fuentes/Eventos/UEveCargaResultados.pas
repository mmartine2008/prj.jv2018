unit UEveCargaResultados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls,
  DateTimePickerAuto, DBCtrls, UDBLookupComboBoxAuto, DataExport, DataToXLS,
  WinXP, EditAuto, ImgList, PngImageList, JvExControls, JvLabel, PngImage,
  JvExExtCtrls, JvImage, jpeg, JvGIF, JvComponentBase, JvBalloonHint,
  xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveCargaResultados = class(TFEveSimple)
    LFecha: TLabel;
    LResponsable: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    DTPAFecha: TDateTimePickerAuto;
    DBLCBAResultado: TDBLookupComboBoxAuto;
    LResultado: TLabel;
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
    IBDSSimpleID_EVENTO: TIntegerField;
    DSGenericosEspecial: TDataSource;
    IBQGenericosEspecial: TIBQuery;
    IBQUltimoEvento: TIBQuery;
    LResultadoCampi: TLabel;
    DBLCBAResultadoCampi: TDBLookupComboBoxAuto;
    LResultadoTrico: TLabel;
    DBLCBAResultadoTrico: TDBLookupComboBoxAuto;
    IBDSSimpleID_RESULTADO_CAMPI: TIBStringField;
    IBDSSimpleRESULTADO_CAMPI: TIBStringField;
    IBDSSimpleID_RESULTADO_TRICO: TIBStringField;
    IBDSSimpleRESULTADO_TRICO: TIBStringField;
    LPrecio: TLabel;
    LPLab: TLabel;
    EPrecio: TEdit;
    EPLab: TEdit;
    LPToma: TLabel;
    EPToma: TEdit;
    constructor Create(AOwner: TComponent; ModoEnfermedadParam:TModoEnfermedadMasiva); reintroduce;
    procedure SetText(Sender: TField; const Text: String);
    procedure change(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure DBLCBAResultadoClick(Sender: TObject);
    procedure DBLCBAResultadoCampiClick(Sender: TObject);
    procedure DBLCBAResultadoCampiCloseUp(Sender: TObject);
    procedure DBLCBAResultadoTricoClick(Sender: TObject);
    procedure DBLCBAResultadoTricoCloseUp(Sender: TObject);
    procedure IBDSSimpleID_RESULTADOChange(Sender: TField);
    procedure IBDSSimpleID_RESULTADO_TRICOChange(Sender: TField);
    procedure ATerminarExecute(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure EPTomaChange(Sender: TObject);
    procedure EPLabChange(Sender: TObject);
    procedure EPrecioChange(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure BDBGSimpleDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    precio, precio_toma, precio_lab : double;                                                                        
    procedure configurarBrucelosis;
    procedure configurarTuberculinizacion;
    procedure configurarRaspadoToro;
    procedure cambiarResultadoEnfermedad();//para raspado de toros solamente    
  public
    Procedure CargarParametrosRN;override;
    Procedure CargarParametrosSP;override;
    procedure CargarDatosGrilla;override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
  protected
    ModoEnf: TModoEnfermedadMasiva;//el tipo de tratamiento que se esta realizando
    procedure cargarDatos(i:integer);override;
  end;

var
  FEveCargaResultados: TFEveCargaResultados;

implementation

uses UDMSoftvet, UPrincipal, UClassType, UABMEmpleados, UImportacion, UTraduccion;

{$R *.dfm}

{ TFEveCargaResultados }

constructor TFEveCargaResultados.Create(AOwner: TComponent; ModoEnfermedadParam: TModoEnfermedadMasiva);
begin
  inherited Create(AOwner);

  ModoEnf:= ModoEnfermedadParam; //pongo el nombre de enfermedad

  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;

  IBQGenericosEspecial.Close;
  IBQGenericosEspecial.SQL.Clear;

  DTPAFecha.DateTime := now;
//  DTPAFecha.MaxDate:= now;    

  DMSoftvet.IBQAfterOpen(IBQGenericosEspecial);

  case ModoEnfermedadParam of
    memSangradoBrucelosis : begin
                              IBQGenericosEspecial.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo) and (ID_CODIGO <>''I'')');
                              configurarBrucelosis;
                            end;
    memTuberculinizacion  : begin
                              IBQGenericosEspecial.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo) and (ID_CODIGO <>''I'') and (ID_CODIGO <> ''S'')');
                              configurarTuberculinizacion;
                            end;
    memRaspadoToro        : begin
                              IBQGenericosEspecial.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo) and (ID_CODIGO <>''I'') and (ID_CODIGO <> ''S'')');
                              configurarRaspadoToro;
                            end;
  end;

  IBQGenericosEspecial.ParamByName('tipo').Value := 'PN';
  IBQGenericosEspecial.Open;

  DMSoftvet.IBQAfterOpen(IBQGenericosEspecial);

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
  DBLCBAResponsable.KeyValue:=0;
  DBLCBAResultado.KeyValue:='N';
  DBLCBAResultadoClick(self);
  //DBLCBAResultadoCampi.KeyValue:='N';
  //DBLCBAResultadoTrico.KeyValue:='N';
end;

procedure TFEveCargaResultados.configurarBrucelosis;
begin
  PTitulo.Caption := Traducir('Resultados de Sangrado para Brucelosis');
  Msimple.SQLBasico := 'select id_animal, id_rp, id_senasa, id_pc, id_hba, id_otro, id_ie, id_evento from vis_resultado_brucelosis';
  MSimple.PasarParametros(0,0);//cambie codigo

  Precio_Toma := 0;
  Precio_Lab := 0;

  IBQSPRN.Params.Clear;
  IBQSPRN.SQL.Clear;
  IBQSPRN.SQL.Add('select * from RN_Resultado_Brucelosis(:animal, :fecha, :PRECIO_TOMA, :PRECIO_LAB)');

  IBQSPEventoInd.Params.Clear;
  IBQSPEventoInd.SQL.Clear;
  IBQSPEventoInd.SQL.Add('EXECUTE PROCEDURE SP_RESULTADO_BRUCELOSIS (:id_evento, :observacion, :id_resultado, :PRECIO_TOMA, :PRECIO_LAB)');

  IBQUltimoEvento.Close;
  IBQUltimoEvento.SQL.Clear;
  IBQUltimoEvento.SQL.Add('select ee.id_evento from eve_eventos ee, eve_sangrado_brucelosis esb where (ee.id_evento = esb.id_evento) and (ee.animal = :animal) and (esb.resultado = ''I'') ');
  IBQUltimoEvento.SQL.Add('and (ee.id_evento in (select max(ee1.id_evento) from eve_eventos ee1, eve_sangrado_brucelosis esb1 where (ee1.id_evento = esb1.id_evento) and (ee1.animal = :animal)))');
  IBQUltimoEvento.Open;

  DTXLS.Title.Text:='Evento Carga Resultados de Sangrado para Brucelosis';

end;

procedure TFEveCargaResultados.configurarRaspadoToro;
begin
  PTitulo.Caption := Traducir('Resultados de Muestreo de toros por venéreas');
  Msimple.SQLBasico := 'select id_animal, id_rp, id_senasa, id_pc, id_hba, id_otro, id_ie, id_evento  from Vis_Resultado_raspado_toro';
  MSimple.PasarParametros(1,0);//cambie codigo

  IBQSPRN.Params.Clear;
  IBQSPRN.SQL.Clear;
  IBQSPRN.SQL.Add('select * from RN_Resultado_raspado_toro(:animal, :fecha, :PRECIO_TOMA, :PRECIO_LAB)');

  Precio_Toma := 0;
  Precio_Lab := 0;

  IBQSPEventoInd.Params.Clear;
  IBQSPEventoInd.SQL.Clear;
  IBQSPEventoInd.SQL.Add('EXECUTE PROCEDURE SP_RESULTADO_Raspado_toro (:id_evento, :observacion, :id_resultado,:id_resultado_campi,:id_resultado_trico,:PRECIO_TOMA,:PRECIO_LAB)');

  IBQUltimoEvento.Close;
  IBQUltimoEvento.SQL.Clear;
  IBQUltimoEvento.SQL.Add('select ee.id_evento from eve_eventos ee, eve_Raspado_toro ert where (ee.id_evento = ert.id_evento) and (ee.animal = :animal) and (ert.resultado = ''I'')');
  IBQUltimoEvento.SQL.Add('and (ee.id_evento in (select max(ee1.id_evento) from eve_eventos ee1, eve_Raspado_toro ert1 where (ee1.id_evento = ert1.id_evento) and (ee1.animal = :animal)))');
  IBQUltimoEvento.Open;

  DTXLS.Title.Text:='Evento Carga Resultados Muestreo de Toros por Venereas';

end;

procedure TFEveCargaResultados.configurarTuberculinizacion;
begin
  PTitulo.Caption := Traducir('Resultados de Tuberculinización');
  Msimple.SQLBasico := 'select id_animal, id_rp, id_senasa, id_pc, id_hba, id_otro, id_ie, id_evento, nombre, apodo  from Vis_resultado_tuberculina';
  MSimple.PasarParametros(0,0);//cambie codigo

  IBQSPRN.Params.Clear;
  IBQSPRN.SQL.Clear;
  IBQSPRN.SQL.Add('select * from RN_Resultado_tuberculina(:animal, :fecha, :PRECIO)');

  Precio := 0;

  EPLab.Visible := false;
  LPLab.Visible := false;
  EPToma.Visible := false;
  LPToma.Visible := false;
  LPrecio.Visible := true;
  EPrecio.Visible := true;

  IBQSPEventoInd.Params.Clear;
  IBQSPEventoInd.SQL.Clear;
  IBQSPEventoInd.SQL.Add('EXECUTE PROCEDURE SP_RESULTADO_Tuberculinizacion (:id_evento, :observacion, :id_resultado, :PRECIO)');

  IBQUltimoEvento.Close;
  IBQUltimoEvento.SQL.Clear;
  IBQUltimoEvento.SQL.Add('select ee.id_evento from eve_eventos ee, eve_Tuberculinizacion et where (ee.id_evento = et.id_evento) and (ee.animal = :animal) and (et.resultado = ''I'')');
  IBQUltimoEvento.SQL.Add('and (ee.id_evento in (select max(ee1.id_evento) from eve_eventos ee1, eve_Tuberculinizacion et1 where (ee1.id_evento = et1.id_evento) and (ee1.animal = :animal)))');
  IBQUltimoEvento.Open;

  DTXLS.Title.Text:='Evento Carga Resultados de Tuberculinización';
end;


procedure TFEveCargaResultados.CargarDatosGrilla;
begin
  inherited;
  {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['id_animal'],DSSimple))then
    begin
      IBDSSimple.Insert;}
      IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];
      IBDSSimple.FieldByName('ID_ANIMAL').Value := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
      IBDSSimple.FieldByName('ID_EVENTO').Value := MSimple.IBQSeleccionados.FieldValues['id_evento'];

      RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
      //IBDSSimple.FieldByName('OBSERVACION').Value :=MAObservacion.GetDato;
      RealizarCambio(DBLCBAResultado,[IBDSSimple.FieldByName('id_resultado'),IBDSSimple.FieldByName('Resultado')],[DBLCBAResultado.KeyValue,DBLCBAResultado.Text]);
      //IBDSSimple.FieldByName('id_resultado').Value:= DBLCBAResultado.KeyValue;
      //IBDSSimple.FieldByName('Resultado').Value:= DBLCBAResultado.Text;

       if (ModoEnf = memRaspadoToro) then
         begin
          IBDSSimpleID_RESULTADO_CAMPI.OnChange := nil;
          IBDSSimpleID_RESULTADO_TRICO.OnChange := nil;

          RealizarCambio(DBLCBAResultadoCampi,[IBDSSimple.FieldByName('id_resultado_Campi'),IBDSSimple.FieldByName('Resultado_Campi')],[DBLCBAResultadoCampi.KeyValue,DBLCBAResultadoCampi.Text]);
          //IBDSSimple.FieldByName('id_resultado_Campi').Value := DBLCBAResultadoCampi.KeyValue;
          //IBDSSimple.FieldByName('Resultado_Campi').Value := DBLCBAResultadoCampi.Text;

          RealizarCambio(DBLCBAResultadoTrico,[IBDSSimple.FieldByName('id_resultado_Trico'),IBDSSimple.FieldByName('Resultado_Trico')],[DBLCBAResultadoTrico.KeyValue,DBLCBAResultadoTrico.Text]);
          //IBDSSimple.FieldByName('id_resultado_Trico').Value:= DBLCBAResultadoTrico.KeyValue;
          //IBDSSimple.FieldByName('Resultado_Trico').Value:= DBLCBAResultadoTrico.Text;

          IBDSSimpleID_RESULTADO_CAMPI.OnChange := IBDSSimpleID_RESULTADO_TRICOChange;
          IBDSSimpleID_RESULTADO_TRICO.OnChange := IBDSSimpleID_RESULTADO_TRICOChange;
         end;
   // end;
end;

procedure TFEveCargaResultados.CargarParametrosMasivo;
begin
  inherited;
  IBQSPEventoInd.ParamByName('id_resultado').AsString := IBDSSimple.FieldByName('id_resultado').AsString;
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldByName('OBSERVACION').Value;//IBDSSimple.FieldValues['OBSERVACION']
  IBQSPEventoInd.ParamByName('id_evento').AsInteger := IBDSSimple.FieldByName('ID_EVENTO').AsInteger;

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
end;

procedure TFEveCargaResultados.CargarParametrosRN;
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

  case ModoEnf of
      memSangradoBrucelosis, memRaspadoToro  : begin
                                                IBQSPRN.ParamByName('PRECIO_TOMA').Value := Precio_Toma;
                                                IBQSPRN.ParamByName('PRECIO_LAB').Value := Precio_Lab;
                                               end;
      memTuberculinizacion  : IBQSPRN.ParamByName('PRECIO').Value := Precio;
  end;
end;

procedure TFEveCargaResultados.CargarParametrosSP;
begin
  inherited;
  IBQUltimoEvento.Close;
  IBQUltimoEvento.ParamByName('animal').AsInteger := IDAnimal;
  IBQUltimoEvento.Open;

  IBQSPEventoInd.ParamByName('id_resultado').AsString := DBLCBAResultado.KeyValue;
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('id_evento').AsInteger := IBQUltimoEvento.fieldByname('id_evento').AsInteger;

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
    case ModoEnf of
      memSangradoBrucelosis, memRaspadoToro  : begin
                                                IBQSPEventoInd.ParamByName('PRECIO_TOMA').Value := Precio_Toma;
                                                IBQSPEventoInd.ParamByName('PRECIO_LAB').Value := Precio_Lab;
                                               end;
      memTuberculinizacion  : IBQSPEventoInd.ParamByName('PRECIO').Value := Precio;
    end;
end;

procedure TFEveCargaResultados.LoadSQLStringList;
begin
  inherited;
  SQLStringList.AddObject('RESULTADO',TObject(DSGenericosEspecial));

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

// controlo la grilla
procedure TFEveCargaResultados.SetText(Sender: TField; const Text: String);
begin
  if ((IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
     case (Sender.Index) of
        8 : begin      // RESULTADO
              IBQValidaciones.SQL.Add('select VALOR from COD_GENERICOS where (tipo = ''PN'')and (VALOR like '''+UpperCase(Text)+'%'')');
              IBQValidaciones.Active := true;
              if not(IBQValidaciones.IsEmpty) and (IBQValidaciones.FieldByName('VALOR').AsString <> 'NO DEFINIDO') then
                Sender.AsString := IBQValidaciones.FieldByName('VALOR').AsString;
            end;

        12 : begin      // RESULTADO Campi
              IBQValidaciones.SQL.Add('select VALOR from COD_GENERICOS where (tipo = ''PN'') and (VALOR like '''+UpperCase(Text)+'%'')');
              IBQValidaciones.Active := true;
              if not(IBQValidaciones.IsEmpty) then
                Sender.AsString := IBQValidaciones.FieldByName('VALOR').AsString;
            end;

        14 : begin      // RESULTADO Trico
              IBQValidaciones.SQL.Add('select VALOR from COD_GENERICOS where (tipo = ''PN'') and (VALOR like '''+UpperCase(Text)+'%'')');
              IBQValidaciones.Active := true;
              if not(IBQValidaciones.IsEmpty) then
                Sender.AsString := IBQValidaciones.FieldByName('VALOR').AsString;
            end;            
      end;
    end;
end;

procedure TFEveCargaResultados.change(Sender: TField);
var PickPos : integer;
begin
  if (IBDSSimple.State <> dsInsert ) then
    case (Sender.Index) of
      8:  begin      // RESULTADO
            PickPos := BDBGSimple.ColumnByField('RESULTADO').PickList.IndexOf(BDBGSimple.ColumnByField('RESULTADO').Field.AsString);
            IBDSSimpleID_RESULTADO.Value := TClassType(BDBGSimple.ColumnByField('RESULTADO').PickList.Objects[PickPos]).getValue;
          end;
      12:  begin      // RESULTADO campi
            if (ModoEnf = memRaspadoToro) then
              begin
                PickPos := BDBGSimple.ColumnByField('RESULTADO_Campi').PickList.IndexOf(BDBGSimple.ColumnByField('RESULTADO_Campi').Field.AsString);
                IBDSSimpleID_RESULTADO_CAMPI.Value := TClassType(BDBGSimple.ColumnByField('RESULTADO_Campi').PickList.Objects[PickPos]).getValue;
              end;
          end;

      14:  begin      // RESULTADO
            if (ModoEnf = memRaspadoToro) then
              begin
                PickPos := BDBGSimple.ColumnByField('RESULTADO_Trico').PickList.IndexOf(BDBGSimple.ColumnByField('RESULTADO_Trico').Field.AsString);
                IBDSSimpleID_RESULTADO_TRICO.Value := TClassType(BDBGSimple.ColumnByField('RESULTADO_Trico').PickList.Objects[PickPos]).getValue;
              end;
          end;

    end;


  {
  if (IBDSSimple.State = dsEdit ) then
    begin
      IBDSSimple.Post;
    end;}
end;

procedure TFEveCargaResultados.FormShow(Sender: TObject);
begin
  inherited;
  {*
     ponemos en invisible la seleccion por grupos, porque el sp que retorna la informacion de los animales
     de un grupo que se necesitan para este evento (en particular no devuelve el id evento de un evento con
     resultado indefinido que es lo que presisamos)
  *}
  MSimple.CBGrupo.Visible := false;
  MSimple.RBGrupo.Visible := false;
  MSimple.DBLCBGrupo.Visible := false;
end;

procedure TFEveCargaResultados.DBLCBAResultadoClick(Sender: TObject);
begin
  inherited;
  if (ModoEnf = memRaspadoToro) then
    begin
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

procedure TFEveCargaResultados.cambiarResultadoEnfermedad;
begin
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

procedure TFEveCargaResultados.DBLCBAResultadoCampiClick(Sender: TObject);
begin
  inherited;
  cambiarResultadoEnfermedad();
end;

procedure TFEveCargaResultados.DBLCBAResultadoCampiCloseUp(
  Sender: TObject);
begin
  inherited;
  cambiarResultadoEnfermedad();
end;

procedure TFEveCargaResultados.DBLCBAResultadoTricoClick(Sender: TObject);
begin
  inherited;
  cambiarResultadoEnfermedad();
end;

procedure TFEveCargaResultados.DBLCBAResultadoTricoCloseUp(
  Sender: TObject);
begin
  inherited;
  cambiarResultadoEnfermedad();
end;

procedure TFEveCargaResultados.IBDSSimpleID_RESULTADOChange(
  Sender: TField);
begin
  inherited;
  IBDSSimpleID_RESULTADO_TRICO.OnChange:= nil;
  IBDSSimpleID_RESULTADO_CAMPI.OnChange:= nil;

  if (IBDSSimple.FieldValues['id_resultado'] = 'I') then
    begin
      //IBDSSimple.FieldValues['id_Resultado_campi'] := IBDSSimple.FieldValues['id_resultado'];

      IBDSSimple.FieldValues['id_resultado_Campi']:= null ;

      //((IBDSSimple.FieldByName('id_resultado_Campi').Components[IBDSSimple.FieldByName('id_resultado_Campi').Index]) as TDBLookupComboBoxAuto).KeyValue:= null;

      //ShowMessage(IntToStr(IBDSSimple.FieldByName('id_resultado_Campi').ComponentIndex));

      //((SQLStringList.Objects[SQLStringList.IndexOfName('id_resultado_Campi')]) as TDBLookupComboBoxAuto).KeyValue:= null;
      //SQLStringList.AddObject('RESULTADO_TRICO',TObject(DSGenericosEspecial));
       //IBDSSimple.FieldValues['Resultado_Campi'] := '';
      //IBDSSimpleRESULTADO_CAMPI.Value:='';
      IBDSSimple.FieldValues['id_Resultado_trico']:= null;
      //IBDSSimple.FieldValues['Resultado_trico'] := '';
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

procedure TFEveCargaResultados.IBDSSimpleID_RESULTADO_TRICOChange(
  Sender: TField);
begin
  inherited;
  if ((IBDSSimple.FieldValues['id_Resultado'] = 'P') and
     (((IBDSSimple.FieldValues['id_Resultado_campi'] = 'I') and
       (IBDSSimple.FieldValues['id_Resultado_trico'] = 'P')) or
       ((IBDSSimple.FieldValues['id_Resultado_campi'] = 'P') and
       (IBDSSimple.FieldValues['id_Resultado_trico'] = 'I'))) or
     (((IBDSSimple.FieldValues['id_Resultado_campi'] = 'I') and
       (IBDSSimple.FieldValues['id_Resultado_trico'] = 'N')) or
       ((IBDSSimple.FieldValues['id_Resultado_campi'] = 'N') and
       (IBDSSimple.FieldValues['id_Resultado_trico'] = 'I')))) then
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

procedure TFEveCargaResultados.ATerminarExecute(Sender: TObject);
begin
  if (ModoEnf = memRaspadoToro)then
       PTitulo.Caption := Traducir('Result. Muestr. de toros por venéreas'); // esto lo hago para que cuando pongo el titulo al grupo no supere los 50 caracteres despues al ptitulo lo vuelvo a poner como estaba antes
  inherited;
  if (ModoEnf = memRaspadoToro)then
    PTitulo.Caption := Traducir('Resultados de Muestreo de toros por venéreas');
end;

procedure TFEveCargaResultados.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
    fecha.Date:=now;
  GetEvent(DTPAFecha);
end;

procedure TFEveCargaResultados.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveCargaResultados.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveCargaResultados.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveCargaResultados.EPrecioChange(Sender: TObject);
begin
  inherited;
  if not TryStrToFloat(EPrecio.Text,Precio) then
  begin
    EPrecio.Text := '';
    Precio := 0;
  end;
end;

procedure TFEveCargaResultados.EPLabChange(Sender: TObject);
begin
  inherited;
  if not TryStrToFloat(EPLab.Text,Precio_Lab) then
  begin
    EPLab.Text := '';
    Precio_lab := 0;
  end;
end;

procedure TFEveCargaResultados.EPTomaChange(Sender: TObject);
begin
  inherited;
  if not TryStrToFloat(EPToma.Text,Precio_Toma) then
  begin
    EPToma.Text := '';
    Precio_Toma := 0;
  end;
end;

procedure TFEveCargaResultados.cargarDatos(i:integer);
begin
  inherited;
      IBDSSimple.FieldByName('ID_EVENTO').Value := MSimple.IBQSeleccionados.FieldValues['id_evento'];
      IBDSSimple.FieldByName('Resultado').Value:= getDato('resultado',anim[i]);
      IBDSSimple.FieldByName('id_resultado').Value:= DBLCBAResultado.ListSource.DataSet.Lookup('VALOR',IBDSSimple.FieldByName('Resultado').Value,'ID_CODIGO');
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
          else
            begin
            IBDSSimple.FieldByName('id_resultado_Campi').Value:='N';
            IBDSSimple.FieldByName('resultado_Campi').Value:='NEGATIVO';
            IBDSSimple.FieldByName('id_resultado_Trico').Value:='N';
            IBDSSimple.FieldByName('resultado_Trico').Value:='NEGATIVO';
            end;
         IBDSSimpleID_RESULTADO_CAMPI.OnChange := IBDSSimpleID_RESULTADO_TRICOChange;
         IBDSSimpleID_RESULTADO_TRICO.OnChange := IBDSSimpleID_RESULTADO_TRICOChange;
         end;
        DBLCBAResultado.KeyValue:=IBDSSimple.FieldByName('id_Resultado').Value;
        DBLCBAResultadoCampi.KeyValue:=IBDSSimple.FieldByName('id_resultado_Campi').Value;
        DBLCBAResultadoTrico.KeyValue:=IBDSSimple.FieldByName('id_resultado_Trico').Value;
end;

procedure TFEveCargaResultados.IBDSSimpleID_RPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  //hereda de evesimple
end;

procedure TFEveCargaResultados.BDBGSimpleDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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
