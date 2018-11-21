unit UEveBaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, DateTimePickerAuto, DBCtrls,
  UDBLookupComboBoxAuto, EditAuto, WinXP, DataExport, UEveDiagnosticoEnfermedad, DataToXLS,
  ImgList, PngImageList, PngImage, JvExExtCtrls, JvImage, jpeg, JvGIF,
  JvExControls, JvLabel, JvComponentBase, JvBalloonHint, UCartel, IdGlobal,
  xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveBaja = class(TFEveSimple)
    LResponsable: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    DTPAFecha: TDateTimePickerAuto;
    LFecha: TLabel;
    Label1: TLabel;
    DBLCBATipo: TDBLookupComboBoxAuto;
    LPeso: TLabel;
    EAPeso: TEditAuto;
    EAPrecio: TEditAuto;
    LPrecio: TLabel;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleTIPOBAJA: TIBStringField;
    IBDSSimpleIDTIPOBAJA: TIntegerField;
    IBDSSimplePRECIO: TFloatField;
    IBDSSimpleEW: TIBStringField;
    EADta: TEditAuto;
    LDTA: TLabel;
    IBDSSimpleDTA_BAJA: TIBStringField;
    IBQActBaja: TIBQuery;
    IBQCheckFecha: TIBQuery;
    IBQEliminarEventos: TIBQuery;
    LPesoDestino: TLabel;
    EAPesoDestino: TEditAuto;
    LDestino: TLabel;
    DBLCBADestino: TDBLookupComboBoxAuto;
    IBDSSimpleIDDESTINO: TIntegerField;
    IBDSSimpleDESTINO: TIBStringField;
    LRemito: TLabel;
    EARemito: TEditAuto;
    IBDSSimpleREMITO: TIBStringField;
    IBDSSimplePESO: TFloatField;
    IBDSSimplePESODESTINO: TFloatField;
    BAplicarDiagnostico: TButton;

    //******************************************************//
    //	INCIDENCIA: 414									                    //
    //	INICIO Declaración de nuevos elementos.             //
    //	Carla Gareis							              15/12/2014  //
    //******************************************************//
    LDTE: TLabel;
    EADTE: TEditAuto;
    BExaminarDTE: TButton;
    ODExaminarDTE: TOpenDialog;
    IBQActualizarDte: TIBQuery;
    IBQActualizarDteDTE: TIntegerField;
    IBQActualizarDtePATH: TIBStringField;
    IBQTabAnimales: TIBQuery;
    SDEquivalencias: TSaveDialog;
    MAuxCaravanas: TMemoAuto;
    //******************************************************//
    //	INCIDENCIA: 414									                    //
    //	FIN Declaración de nuevos elementos.                //
    //	Carla Gareis							              15/12/2014  //
    //******************************************************//

    procedure FormShow(Sender: TObject);
    procedure DBLCBATipoCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IBDSSimpleFECHASetText(Sender: TField; const Text: String);
    procedure EAPesoKeyPress(Sender: TObject; var Key: Char);
    procedure EAPrecioKeyPress(Sender: TObject; var Key: Char);
    procedure ATerminarExecute(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure LDestinoClick(Sender: TObject);
    procedure BDBGSimpleKeyPress(Sender: TObject; var Key: Char);
    procedure BAplicarDiagnosticoClick(Sender: TObject);

    //******************************************************//
    //	INCIDENCIA: 414									                    //
    //	INICIO Declaración de nuevos métodos.               //
    //	Carla Gareis							              16/12/2014  //
    //******************************************************//
    procedure BExaminarDTEClick(Sender: TObject);
    procedure actualizarDatosDTE();
    procedure CrearCopiaArchivo();
    procedure EADTEKeyPress(Sender: TObject; var Key: Char);
    procedure ACancelarExecute(Sender: TObject);
    procedure mostrarCaravanas;
    //******************************************************//
    //	INCIDENCIA: 414									                    //
    //	FIN Declaración de nuevos métodos.                  //
    //	Carla Gareis							              16/12/2014  //
    //******************************************************//
    
  private
    Diagnosticos : TArrEventos;
    procedure CargarDiagnostico();
    procedure ActualizarBajas();
    function EliminarEventos() : Boolean;
  protected
    procedure CargarParametrosRN; override;
    procedure CargarParametrosSP; override;
    procedure CargarDatosGrilla;override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure TerminarIndividual; override;
    procedure cargarDatos(i:integer);override;


  public
    { Public declarations }
  end;

var
  FEveBaja: TFEveBaja;
  PesoMin, PesoMax: double;
  Diagnosticado: boolean;

  //******************************************************//
  //	INCIDENCIA: 414									                    //
  //	INICIO Declaración de variables.                    //
  //	Carla Gareis							              15/12/2014  //
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
  cantAnim: Integer;
  //******************************************************//
  //	INCIDENCIA: 414									                    //
  //	FIN Declaración de variables.                       //
  //	Carla Gareis							              15/12/2014  //
  //******************************************************//

implementation

{$R *.dfm}

uses UPrincipal,uTiposGlobales, UDMSoftvet,UClassType,DateUtils, Types, UFunctions, UPanelCaravanas,
     UEveUniversal, UABMEmpleados, UMensajeHuella, UABMDestino, UImportacion, UTraduccion, StrUtils;

procedure TFEveBaja.CargarParametrosRN;
begin
  inherited;
  IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  if(self.ModoEve = meIndividual)then
    begin
      IBQSPRN.ParamByName('ANIMAL').AsInteger := IDAnimal;
      IBQSPRN.ParamByName('fecha').AsDateTime := DTPAFecha.DateTime;
      IBQSPRN.ParamByName('tipobaja').AsInteger := DBLCBATipo.KeyValue;
    end
  else
    begin
      IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
      IBQSPRN.ParamByName('fecha').AsDateTime := IBDSSimple.fieldbyname('fecha').AsDateTime;
      IBQSPRN.ParamByName('tipobaja').AsInteger := IBDSSimple.fieldbyname('idtipobaja').AsInteger;
    end;
end;

procedure TFEveBaja.CargarParametrosSP;
begin
  inherited;
  creacionGrupo;
  IBQSPEventoInd.ParamByName('FECHA').AsDate  := DTPAFecha.Date;
  IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IDAnimal;
  IBQSPEventoInd.ParamByName('OBSERVACION').AsString := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := DBLCBAResponsable.GetDato;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger :=  FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;
  IBQSPEventoInd.ParamByName('id_grupo').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').AsInteger;
  IBQSPEventoInd.ParamByName('TIPO').Value := DBLCBATipo.KeyValue;
  IBQSPEventoInd.ParamByName('REMITO').Value := NULL;
  if(DBLCBATipo.KeyValue = 1)then
  begin
   IBQSPEventoInd.ParamByName('REMITO').AsString := EARemito.Text;

   if(Trim(EAPeso.Text) = '')then
     IBQSPEventoInd.ParamByName('PESO').Value := 0
   else
    IBQSPEventoInd.ParamByName('PESO').Value := StrToFloat(EAPeso.Text);
   if(Trim(EAPrecio.Text) = '')then
     IBQSPEventoInd.ParamByName('PRECIO').Value := 0
   else
    IBQSPEventoInd.ParamByName('PRECIO').Value := StrToFloat(EAPrecio.Text);

   if(Trim(EAPesoDestino.Text) = '')then
     IBQSPEventoInd.ParamByName('PESODESTINO').Value := 0
    else
      IBQSPEventoInd.ParamByName('PESODESTINO').Value := StrToFloat(EAPesoDestino.Text);
  end;

  if((DBLCBATipo.KeyValue = 1) or (DBLCBATipo.KeyValue = 2))then
  begin
    IBQSPEventoInd.ParamByName('DTA').AsString := Trim(EADta.Text);
    IBQSPEventoInd.ParamByName('DESTINO').AsInteger := DBLCBADestino.KeyValue;
  end;

end;

procedure TFEveBaja.FormShow(Sender: TObject);
begin
  inherited;
  cantAnim := 0;
  DTPAFecha.DateTime := now;
  //DTPAFecha.MaxDate:= now;  
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;

  DMSoftvet.IBQCodDestino.Close;
  DMSoftvet.IBQCodDestino.Open;

  MSimple.PasarParametros(0,0);{Para filtrar las categorias para el Combo de la Manga} //cambie codigo

  // recupero los pesos necesarios para validar en la grilla
  IBQValidaciones.Close;
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
  //DecimalSeparator:='.';
end;

procedure TFEveBaja.DBLCBATipoCloseUp(Sender: TObject);
begin
  inherited;
  if(DBLCBATipo.KeyValue = 1)then
   begin
     LRemito.Visible := true;
     EARemito.Visible:= true;
     BAplicarDiagnostico.Enabled := false;
   end
  else
   begin
     LRemito.Visible := false;
     EARemito.Visible:= false;
   end;

  if(DBLCBATipo.KeyValue <> 1)then
  begin
   EAPeso.Visible       := false;
   EAPesoDestino.Visible:= false;
   EAPrecio.Visible     := false;

   LPeso.Visible        := false;
   LPesoDestino.Visible := false;
   LPrecio.Visible      := false;
   BAplicarDiagnostico.Enabled := true;
   LDTE.Visible := false;
   EADTE.Visible := false;
   BExaminarDTE.Visible := false;

   if(DBLCBATipo.KeyValue <> 2)then
     begin
       LDTA.Visible         := false;
       EADta.Visible        := false;
       BDBGSimple.ColumnByField('dta_baja').Visible := false;
     end
    else
       begin
         LDTA.Visible         := true;
         EADta.Visible        := true;
         BDBGSimple.ColumnByField('dta_baja').Visible := true;
         LDestino.Visible     := true;
         DBLCBADestino.Visible:= true;
         BDBGSimple.ColumnByField('destino').Visible := true;
       end;
   BDBGSimple.ColumnByField('peso').Visible := false;
   BDBGSimple.ColumnByField('pesodestino').Visible := false;
   BDBGSimple.ColumnByField('precio').Visible := false;
  end
  else
  begin
   EAPeso.Visible       := True;
   EAPesoDestino.Visible:= True;
   EAPrecio.Visible     := True;
   EADta.Visible        := True;
   LPeso.Visible        := True;
   LPesoDestino.Visible := true;
   LPrecio.Visible      := True;
   LDTA.Visible         := True;
   BDBGSimple.ColumnByField('peso').Visible := true;
   BDBGSimple.ColumnByField('pesodestino').Visible := true;
   BDBGSimple.ColumnByField('precio').Visible := true;
   BDBGSimple.ColumnByField('dta_baja').Visible := true;
   BAplicarDiagnostico.Enabled := false;
   LDTE.Visible := true;
   EADTE.Visible := true;
   BExaminarDTE.Visible := true;
  end;

  if((DBLCBATipo.KeyValue = 1) OR (DBLCBATipo.KeyValue = 2)) then
    begin
       //BAplicarDiagnostico.Enabled := true;
       LDestino.Visible     := true;
       DBLCBADestino.Visible:= true;
       BDBGSimple.ColumnByField('destino').Visible := true;
    end
   else
     begin
       //BAplicarDiagnostico.Enabled := true;
       LDestino.Visible     := false;
       DBLCBADestino.Visible:= false;
       BDBGSimple.ColumnByField('destino').Visible := false;
     end;

 {if (ModoEve = meMasivo) then
    CBAplicarDiagnostico.Visible := false;}
end;

procedure TFEveBaja.CargarDatosGrilla;
var
  peso, pesodestino : double;
  precio : double;
begin
  inherited;
  {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['id_animal'],DSSimple))then
  begin
    IBDSSimple.Insert; }
    IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_ANIMAL').Value := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
    IBDSSimple.FieldByName('ID_SENASA').Value :=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];

    RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.GetDato]);
    //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
    RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('RESP')],[DBLCBAResponsable.GetDato,DBLCBAResponsable.Text]);
    //IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.GetDato;
    //IBDSSimple.FieldByName('RESP').Value:= DBLCBAResponsable.Text;
    RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
    //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;
    RealizarCambio(DBLCBATipo,[IBDSSimple.FieldByName('IDTIPOBAJA'),IBDSSimple.FieldByName('TIPOBAJA')],[DBLCBATipo.KeyValue,DBLCBATipo.Text]);
    //IBDSSimple.FieldByName('IDTIPOBAJA').Value:= DBLCBATipo.KeyValue;
    //IBDSSimple.FieldByName('TIPOBAJA').Value:= DBLCBATipo.Text;
    //RealizarCambio(EADta,[IBDSSimple.FieldByName('DTA_BAJA')],[EADta.Text]);
    //IBDSSimple.FieldByName('DTA_BAJA').Value := EADta.Text;
    if(DBLCBATipo.KeyValue = 1 )then
    begin
      if (Trim(EAPeso.Text) = '') then
        peso := 0
      else
        peso := StrToFloat(EAPeso.Text);

      RealizarCambio(EAPeso,[IBDSSimple.FieldByName('PESO')],[peso]);
      //IBDSSimple.FieldByName('PESO').Value := peso;

      if (Trim(EAPesoDestino.Text) = '') then
        pesodestino := 0
      else
        pesodestino := StrToFloat(EAPesoDestino.Text);

      RealizarCambio(EAPesoDestino,[IBDSSimple.FieldByName('PESODESTINO')],[pesodestino]);


      if (Trim(EAPrecio.Text) = '') then
        precio := 0
      else
        precio := StrToFloat(EAPrecio.Text);

     RealizarCambio(EAPrecio,[IBDSSimple.FieldByName('PRECIO')],[precio]);
     //IBDSSimple.FieldByName('PRECIO').Value := precio;
    end;

    if((DBLCBATipo.KeyValue = 1) or (DBLCBATipo.KeyValue = 2))then
    begin
      RealizarCambio(EADta,[IBDSSimple.FieldByName('DTA_BAJA')],[EADta.Text]);
      RealizarCambio(DBLCBADestino,[IBDSSimple.FieldByName('IDDESTINO'),IBDSSimple.FieldByName('DESTINO')],[DBLCBADestino.GetDato,DBLCBADestino.Text]);
      RealizarCambio(EARemito,[IBDSSimple.FieldByName('REMITO')],[EARemito.Text]);
    end;

  //end;
end;

procedure TFEveBaja.CargarParametrosMasivo;

begin
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  IBQSPEventoInd.ParamByName('TIPO').Value := IBDSSimpleIDTIPOBAJA.Value;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := IBDSSimpleRESPONSABLE.AsInteger;
  if (CrearGrupo) then
  begin
    IBQSPEventoInd.ParamByName('id_grupo').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').AsInteger;
    nro_grupo := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').AsInteger;
  end;
  if(DBLCBATipo.KeyValue = 1)then
  begin
    IBQSPEventoInd.ParamByName('PESO').AsFloat := IBDSSimplePESO.AsFloat;
    //IBQSPEventoInd.ParamByName('PESODESTINO').AsInteger := IBDSSimplePESODESTINO.AsInteger; //AGREGARLO CUANDO SE AGREGUE LA COLUMNA AL DBGRID
    IBQSPEventoInd.ParamByName('PRECIO').AsFloat := IBDSSimplePRECIO.AsFloat;

    IBQSPEventoInd.ParamByName('PESODESTINO').AsFloat := IBDSSimplePESODESTINO.AsFloat;
    IBQSPEventoInd.ParamByName('REMITO').AsString := IBDSSimpleREMITO.AsString;
  end;


  if((DBLCBATipo.KeyValue = 1) or (DBLCBATipo.KeyValue = 2))then
  begin
    IBQSPEventoInd.ParamByName('DTA').AsString := IBDSSimpleDTA_BAJA.AsString;
    IBQSPEventoInd.ParamByName('DESTINO').AsInteger := IBDSSimpleIDDESTINO.Value;
  end;

  //******************************************************//
  //	INCIDENCIA: 414									                    //
  //	INICIO Consulta si hay animales informados a AFIP.  //
  //	Carla Gareis							              16/12/2014  //
  //******************************************************//
  IBQTabAnimales.Close;
  IBQTabAnimales.ParamByName('id_animal').Value := IBQSPEventoInd.ParamByName('ANIMAL').Value;
  IBQTabAnimales.Open;
  //Con un animal informado a AFIP, pongo en true la bandera
  //para preguntar despues si se desea declarar a AFIP.
  if (IBQTabAnimales.FieldByName('informado_afip').asString = 'S') then
    informar := 1;
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
   cantAnim := cantAnim + 1;
  //Se van cargando los registros de equivalencias correspondientes (TXT).
  try
    Append(arcEquivalenciasTxt);
    Writeln(arcEquivalenciasTxt, LineaauxTxt);
    Append(arcEquivalenciasXls);
    Writeln(arcEquivalenciasXls, LineaauxXls);
  except
  end;  

  //******************************************************//
  //	INCIDENCIA: 414									                    //
  //	FIN Consulta si hay animales informados a AFIP.     //
  //	Carla Gareis							              16/12/2014  //
  //******************************************************//

End;

procedure TFEveBaja.LoadSQLStringList;
begin
  inherited;
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('TIPOBAJA',TObject(DMSoftvet.DSTiposBaja));
  SQLStringList.AddObject('DESTINO',TObject(DMSoftvet.DSCodDestino));
end;

procedure TFEveBaja.FormCreate(Sender: TObject);
begin
  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, color, nombre, apodo from VIS_BAJA';
  DMSoftvet.IBQTiposBaja.Close;
  DMSoftvet.IBQTiposBaja.Open;
  DMSoftvet.IBQCodDestino.Close;
  DMSoftvet.IBQCodDestino.Open;
  Diagnosticado := false;

  //******************************************************//
  //	INCIDENCIA: 414									                    //
  //	INICIO Seteo de elementos agregados.			          //
  //	Carla Gareis							              18/12/2014  //
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
  try
    Rewrite(arcEquivalenciasTxt);
    AssignFile(arcEquivalenciasXls, ExtractFilePath(Application.ExeName)+'Exportacion\EquivalenciasTempXls.txt');
    Rewrite(arcEquivalenciasXls);
    Append(arcEquivalenciasXls);
    Writeln(arcEquivalenciasXls, 'RP | Identificación electrónica');
  except
  end;
  //******************************************************//
  //	INCIDENCIA: 414									                    //
  //	FIN Seteo de elementos agregados.				            //
  //	Carla Gareis							              18/12/2014  //
  //******************************************************//

  inherited;
end;

procedure TFEveBaja.TerminarIndividual;
begin
 { if (CBAplicarDiagnostico.Checked) then // Si Diagnostica
    begin
      Application.CreateForm(TFEveDiagnosticoEnfermedad, FEveDiagnosticoEnfermedad);
      FEveDiagnosticoEnfermedad.ModoEve := meIndividual;
      FEveDiagnosticoEnfermedad.ConManga := false;
      FEveDiagnosticoEnfermedad.HacerCommit := false;
      FEveDiagnosticoEnfermedad.ConTratamiento := false;
      FEveDiagnosticoEnfermedad.IDAnimal := IDAnimal;
      //FEveDiagnosticoEnfermedad.DTPAFecha.MaxDate := DTPAFecha.Date;
      FEveDiagnosticoEnfermedad.ShowModal;
      if (FEveDiagnosticoEnfermedad.ModalResult = mrOk)then // actualizo la tabla del diagnostico de enfermedad cuando termino bien
        IBQSPEventoInd.ParamByName('disparador').AsInteger := FEveDiagnosticoEnfermedad.EventoGenerado;
    end;   }
    inherited;// ejecuta el terminar individual del simple
end;

procedure TFEveBaja.IBDSSimpleFECHASetText(Sender: TField;
  const Text: String);
var PickPos:integer;
    peso: double;
    auxText : String;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin
      SetText(Sender,text);
      if(Sender.FieldName = 'TIPOBAJA')then
       begin
           IBQValidaciones.Close;
           IBQValidaciones.Params.Clear;
           IBQValidaciones.SQL.Add('select sinonimo as valor from COD_TIPOS_BAJA where ((sinonimo like '''+UpperCase(Text)+'''||''%''))or (CODIGO like '''+UpperCase(Text)+'%'')');
           IBQValidaciones.Open;
           if not(IBQValidaciones.IsEmpty) then
           begin
              Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
              PickPos := BDBGSimple.ColumnByField('TIPOBAJA').PickList.IndexOf(BDBGSimple.ColumnByField('TIPOBAJA').Field.AsString);
              IBDSSimpleIDTIPOBAJA.Value := TClassType(BDBGSimple.ColumnByField('TIPOBAJA').PickList.Objects[PickPos]).getValue;
           end;
      end
      else
      if((Sender.FieldName = 'PESO') or (Sender.FieldName = 'PESODESTINO')) then
        begin
          auxText := Text;
          auxText := FixDecimal(auxText);
          if (TryStrToFloat(auxText, peso)) then
            if ((peso > PesoMin)and(peso < PesoMax)) then
              Sender.AsVariant := peso;
        end;
      if ((IBDSSimple.FieldValues['EW'] = 'E') or (IBDSSimple.FieldValues['EW'] = 'W')) then
              IBDSSimple.FieldValues['EW'] := 'M';
      if(Sender.FieldName = 'DESTINO')then
       begin
           IBQValidaciones.Close;
           IBQValidaciones.Params.Clear;
           IBQValidaciones.SQL.Add('select sinonimo as valor from COD_DESTINO where ((sinonimo like '''+UpperCase(Text)+'''||''%''))or (CODIGO like '''+UpperCase(Text)+'%'')');
           IBQValidaciones.Open;
           if not(IBQValidaciones.IsEmpty) then
           begin
              Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
              PickPos := BDBGSimple.ColumnByField('DESTINO').PickList.IndexOf(BDBGSimple.ColumnByField('DESTINO').Field.AsString);
              IBDSSimpleIDDESTINO.Value := TClassType(BDBGSimple.ColumnByField('DESTINO').PickList.Objects[PickPos]).getValue;
           end;
      end
   end;
end;

procedure TFEveBaja.EAPesoKeyPress(Sender: TObject; var Key: Char);
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

procedure TFEveBaja.EAPrecioKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = '.') then
    Key := ',';

  if (pos(',',TEditAuto(Sender).Text)=0) then
    begin
      if not (key in ['0'..'9',',',#8]) then key:=#0;
    end
  else if not (key in ['0'..'9',#8]) then key:=#0;
end;

procedure TFEveBaja.mostrarCaravanas;
var F : TFPanelCaravanas;
begin

  F := TFPanelCaravanas.Create(self);
  F.MACaravanas.Lines.Text := MAuxCaravanas.Lines.Text;
  F.LAnimales.Caption := 'Animales('+ inttostr(CantAnim)+')';
  F.TipoMov := 'Baja';
  F.ShowModal;


end;

procedure TFEveBaja.ATerminarExecute(Sender: TObject);
var
  baja : boolean;
begin
  baja := ((ModoEve = meIndividual) AND EliminarEventos()) OR (ModoEve = meMasivo);

  if baja then
  begin
    inherited;
    if Diagnosticado and PuedeTerminar then
      ActualizarBajas();

  //******************************************************//
  //	INCIDENCIA: 414									                    //
  //	INICIO Actualización de datos DTE en tabla.         //
  //         Creación de archivos de equivalencias.       //
  //	Carla Gareis							              16/12/2014  //
  //******************************************************//
    ActualizarDatosDTE();
    //Chequeo si alguno de los animales a dar de baja están informados en AFIP.
    if (informar = 1) then
       if MostrarMensaje(tmConsulta,'Desea ver las caravanas de los animales?') = mrYes then
       begin
         try
            LineaauxTxt := '';
            Append(arcEquivalenciasTxt);
            Writeln(arcEquivalenciasTxt, LineaauxTxt);
            Append(arcEquivalenciasXls);
            Writeln(arcEquivalenciasXls, LineaauxTxt);
            mostrarCaravanas;
         except
         end;
       end;     

    //Eliminación de archivos temporales creados.
    try
      CloseFile(arcEquivalenciasTxt);
      DeleteFile(ExtractFilePath(Application.ExeName)+'Exportacion\EquivalenciasTempTxt.txt');
      CloseFile(arcEquivalenciasXls);
      DeleteFile(ExtractFilePath(Application.ExeName)+'Exportacion\EquivalenciasTempXls.txt');
    except
    end;
  //******************************************************//
  //	INCIDENCIA: 414									                    //
  //	FIN Actualización de datos DTE en tabla.            //
  //      Creación de archivos de equivalencias.          //
  //	Carla Gareis							              16/12/2014  //
  //******************************************************//

  end;
end;

procedure TFEveBaja.ActualizarBajas();
var
  I : Integer;
begin
  for I := 0 to Length(Diagnosticos)-1 do
  begin
    try
      IBQActBaja.Close;
      IBQActBaja.ParamByName('animal').AsInteger := Diagnosticos[I].animal;
      IBQActBaja.ParamByName('evento').AsInteger := Diagnosticos[I].evento;
      IBQActBaja.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;
end;

procedure TFEveBaja.CargarDiagnostico();
var
  F : TFEveDiagnosticoEnfermedad;
begin
  F := TFEveDiagnosticoEnfermedad.Create(self);
  F.ConManga := ModoEve = meMasivo;
  F.ModoEve := ModoEve;
  F.deBaja := true;
  F.DTPAFecha.Date := DTPAFecha.Date;
  F.FechaBaja := DTPAFecha.Date;
  F.ConTratamiento := false;
  //F.DS := IBDSSimple;
  if not F.ConManga then
    F.IDAnimal := IDAnimal;
  F.ShowModal;
  Diagnosticos := F.ObtenerDiagnosticos;
  F.Destroy;
end;

procedure TFEveBaja.PCBasicoChange(Sender: TObject);
begin
  inherited;
  if (ModoEve = meIndividual) then
  begin
    LDTE.Visible := false;
    EADTE.Visible := false;
    BExaminarDTE.Visible := false;
  end
  else
  begin
    LDTE.Visible := true;
    EADTE.Visible := true;
    BExaminarDTE.Visible := true;
  end
  {if (PCBasico.ActivePage = TSDatos) then
    CBAplicarDiagnostico.Visible := false;}
end;

procedure TFEveBaja.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;

end;

procedure TFEveBaja.LResponsableClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMEmpleados.Create(self));
      DMSoftvet.IBQResponsable.Close;
      DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQResponsable.Open;
    end;
  //cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveBaja.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= $00606C02;
    (Sender as TLabel).Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFEveBaja.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= clWindowText;
    (Sender as TLabel).Font.Style:= [fsUnderline];
  end;
end;

function TFEveBaja.EliminarEventos() : Boolean;
var
  F_Ultimo : TDate;
begin
  Result := false;
  IBQCheckFecha.Close;
  IBQCheckFecha.ParamByName('ANIMAL').AsInteger := IDAnimal;
  IBQCheckFecha.Open;
  if IBQCheckFecha.FieldByName('FECHA').Value <> null then
  begin
    F_Ultimo := IBQCheckFecha.FieldByName('FECHA').AsDateTime;
    if CompareDate(F_Ultimo,DTPAFecha.Date) = GreaterThanValue then
    begin
      if MostrarMensaje(tmConsulta,'Hay eventos posteriores a la fecha de baja. Desea eliminarlos?') = mrYes then
      begin
        try
          IBQEliminarEventos.Close;
          IBQEliminarEventos.ParamByName('ANIMAL').AsInteger := IDAnimal;
          IBQEliminarEventos.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
          IBQEliminarEventos.ParamByName('FECHA').AsDate := DTPAFecha.Date;
          IBQEliminarEventos.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
        if IBQEliminarEventos.FieldByName('MENSAJE').AsString <> '' then
          MostrarMensaje(tmError,Traducir(IBQEliminarEventos.FieldByName('MENSAJE').AsString))
        else Result := true;
      end;
    end
    else Result := true;
  end;
end;

procedure TFEveBaja.LDestinoClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMDestino.Create(self));
      DMSoftvet.IBQCodDestino.Close;
      DMSoftvet.IBQCodDestino.Open;
    end;
  cambiarCB(DBLCBADestino,nroID);
end;

procedure TFEveBaja.BDBGSimpleKeyPress(Sender: TObject; var Key: Char);
var
  Separador : Char;
begin
  inherited;
  Separador := SysUtils.DecimalSeparator;
  if (Key = '.') or (Key = ',') then
    Key := Separador;
end;

procedure TFEveBaja.cargarDatos(i : Integer);
var
  str : String;
begin
  inherited;
  IBDSSimple.FieldByName('ID_ANIMAL').Value:= anim[i].id;
  IBDSSimple.FieldByName('ID_SENASA').Value:=getDato('senasa',anim[i]);
  IBDSSimple.FieldByName('DTA_BAJA').Value := getDato('dta',anim[i]);
  str:=getDato('responsable',anim[i]);
  if DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',str,'ID_EMPLEADO')<>null then
    IBDSSimple.FieldByName('RESP').Value:=str
  else
    IBDSSimple.FieldByName('RESP').Value:='INDEFINIDO';
  IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
  DBLCBAResponsable.KeyValue := DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
  str := getDato('tipo de baja',anim[i]);
  if DMSoftvet.IBQTiposBaja.Lookup('SINONIMO',str,'ID_TIPO_BAJA') <> null then
    IBDSSimple.FieldByName('TIPOBAJA').Value := str
  else
    IBDSSimple.FieldByName('TIPOBAJA').Value := 'VENTA';
  str := IBDSSimple.FieldByName('TIPOBAJA').Value;
  IBDSSimple.FieldByName('IDTIPOBAJA').Value := DMSoftvet.IBQTiposBaja.Lookup('SINONIMO',str,'ID_TIPO_BAJA');
  if getDato('peso',anim[i]) = '' then
    IBDSSimple.FieldByName('PESO').Value := null
  else
    IBDSSimple.FieldByName('PESO').Value := getDato('peso',anim[i]);

  if getDato('precio',anim[i]) = '' then
    IBDSSimple.FieldByName('PRECIO').Value := 0
  else
    IBDSSimple.FieldByName('PRECIO').Value := getDato('precio',anim[i]);
end;

procedure TFEveBaja.BAplicarDiagnosticoClick(Sender: TObject);
begin
  inherited;
  CargarDiagnostico();
  Diagnosticado := true;
end;

//******************************************************//
//	INCIDENCIA: 414									                    //
//	INICIO Incorporación de DTE y PATH_DTE a TAB_GRUPOS.//
//         Copia de archivo en /SIFTA.                  //
//         Validación valor DTE.                        //
//	Carla Gareis							              15/12/2014  //
//******************************************************//
procedure TFEveBaja.BExaminarDTEClick(Sender: TObject);
begin
  if (ODExaminarDTE.Execute) then
  pathOrigen := ODExaminarDTE.FileName;
end;

procedure TFEveBaja.actualizarDatosDTE();
begin
  inherited;
  if (pathOrigen <> '') then
    CrearCopiaArchivo();
  IBQActualizarDte.ParamByName('id_grupo').Value := IBQSPEventoInd.ParamByName('id_grupo').Value;
  IBQActualizarDte.ParamByName('estable').Value := FPrincipal.EstablecimientoActual;
  if (EADTE.Text <> '') then
      IBQActualizarDte.ParamByName('DTE').Value := Strtoint(EADTE.Text)
  else
    IBQActualizarDte.ParamByName('DTE').Value := Null;
  if (nomDestino <> '') then
    IBQActualizarDte.ParamByName('PDTE').Value := nomDestino
  else
    IBQActualizarDte.ParamByName('PDTE').Value := null;
  IBQActualizarDte.ExecSQL;
  FPrincipal.IBTPrincipal.CommitRetaining;
end;

procedure TFEveBaja.CrearCopiaArchivo();
begin
  //Nombre del archivo de destino (copia).
  nomDestino := 'SIFTA\DTE'+IntToStr(FPrincipal.EstablecimientoActual)+'_Grupo'+IntToStr(nro_grupo)+'.pdf';
  //Path final de la copia del archivo DTE.pdf.
  if not (DirectoryExists(ExtractFilePath(Application.ExeName)+'SIFTA')) then
    CreateDir(ExtractFilePath(Application.ExeName)+'SIFTA');
  archivo := ExtractFilePath(Application.ExeName)+nomdestino;
  //Realización de copia de archivo.
  CopyFile(pchar(pathOrigen),pchar(archivo),true);
  SetFileAttributes(Pchar(archivo),FILE_ATTRIBUTE_READONLY);
end;

procedure TFEveBaja.EADTEKeyPress(Sender: TObject; var Key: Char);
begin
  if (key <#48) or (key >#57) then
    if (key<>#8) then
    begin
      MostrarMensaje(tmError, 'El DTE debe ser un valor numérico positivo');
      key:=#0;
    end;
end;
//******************************************************//
//	INCIDENCIA: 414									                    //
//	FIN Incorporación de DTE y PATH_DTE a TAB_GRUPOS.   //
//      Copia de archivo en /SIFTA.                     //
//      Validación valor DTE.                           //
//	Carla Gareis							              15/12/2014  //
//******************************************************//



//******************************************************//
//	INCIDENCIA: 414									                    //
//	INICIO Generación de archivos txt y xls.            //
//         Borrado de temporales creados.               //
//	Carla Gareis							              18/12/2014  //
//******************************************************//



procedure TFEveBaja.ACancelarExecute(Sender: TObject);
begin
  //Eliminación de archivos temporales creados.
 try
  CloseFile(arcEquivalenciasTxt);
  Erase(arcEquivalenciasTxt);
  CloseFile(arcEquivalenciasXls);
  Erase(arcEquivalenciasXls);
  inherited;
 except
 end
end;
//******************************************************//
//	INCIDENCIA: 414									                    //
//	FIN Generación de archivos txt y xls.               //
//      Borrado de temporales creados.                  //
//	Carla Gareis							              18/12/2014  //
//******************************************************//

end.
