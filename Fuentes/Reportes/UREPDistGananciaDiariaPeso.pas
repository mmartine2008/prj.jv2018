unit UREPDistGananciaDiariaPeso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, UFrameDBSeleccion,
  Buttons, Grids, DBGrids, UBDBGrid, UDMSoftvet, DBCtrls, UPrincipal,
  UDBLookupComboBoxAuto, DateTimePickerAuto, IBQuery, UREPDistGananciaDiariaPesoPreview,
  IBUpdateSQL, IBTable, DateUtils, UMensajeImpresora, JvGIF, PngImage, jpeg,
  JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFREPDistGananciaDiariaPeso = class(TFUniversal)
    Panel1: TPanel;
    GBFechas: TGroupBox;
    DTPAFechaInicio: TDateTimePickerAuto;
    DTPAFechaFin: TDateTimePickerAuto;
    GBGrupos: TGroupBox;
    DBLCBAGrupos: TDBLookupComboBoxAuto;
    GBCategorias: TGroupBox;
    DBLCBACategorias: TDBLookupComboBoxAuto;
    Label1: TLabel;
    Label2: TLabel;
    IBQAnimales: TIBQuery;
    DSAnimales: TDataSource;
    RadioGroup1: TRadioGroup;
    CBCategorias: TCheckBox;
    CBGrupos: TCheckBox;
    IBQGenIDAnimalesDisp: TIBQuery;
    IBQInsertAux: TIBQuery;
    IBQCommit: TIBQuery;
    IBQLimpiarAux: TIBQuery;
    IBQAnimalesID_RP: TIBStringField;
    IBQAnimalesNOMBRE: TIBStringField;
    IBQAnimalesCATEGORIA: TIBStringField;
    IBQAnimalesSEXO: TIBStringField;
    IBQAnimalesID_ANIMAL: TIntegerField;
    GBAnimales: TGroupBox;
    BDBGAnimales: TBitDBGrid;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    LExpExcel: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    GroupBox1: TGroupBox;
    Button1: TButton;
    JvIBotonBuscar: TJvImage;
    procedure BBSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBCategoriasClick(Sender: TObject);
    procedure IBQAnimalesBeforeOpen(DataSet: TDataSet);
    procedure DBLCBACategoriasCloseUp(Sender: TObject);
    procedure CBGruposClick(Sender: TObject);
    procedure DBLCBAGruposCloseUp(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBXlsClick(Sender: TObject);
    procedure IBQAnimalesAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure DBLCBACategoriasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLCBAGruposKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDBGAnimalesKeyPress(Sender: TObject; var Key: Char);
    procedure DTPACloseUpFechas(Sender: TObject);
    procedure DTPAFechaInicioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    FIdAnimal : Integer;
    PORGRUPO : BOOLEAN;
    procedure Ejecutar();
    procedure Seleccionados();
    procedure ArmarParaGrupo();
    procedure DeshacerGrupo();
  public
    procedure Limpiar();
  end;

var
  FREPDistGananciaDiariaPeso: TFREPDistGananciaDiariaPeso;
  SQLBasico, FinSQL, tipoGrupo : String;
  Parametros : Array [0..1] of boolean = (false,false); //categoria, grupo
  valFechaDesde, valFechaHasta : TDate;
  valCategoria, valGrupo : Integer;

  
implementation

uses UREPFichaAnimal, UCartel, UTraduccion;

{$R *.dfm}

procedure TFREPDistGananciaDiariaPeso.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;


procedure TFREPDistGananciaDiariaPeso.FormCreate(Sender: TObject);
begin
  inherited;
  DTPAFechaInicio.Date:= IncYear(Date(),-1);
  DTPAFechaFin.Date:=Date();

  PORGRUPO := FALSE;

  IBQGenIDAnimalesDisp.Close;
  IBQGenIDAnimalesDisp.Open;
  FIdAnimal := IBQGenIDAnimalesDisp.FieldValues['IDAUX'];

  DMSoftvet.IBQCategorias.Active := false;
  DMSoftvet.IBQCategorias.Active := true;
  DMSoftvet.IBQCategorias.First;
  if (DBLCBACategorias.KeyValue = NULL) then
    DBLCBACategorias.KeyValue := DMSoftvet.IBQCategorias.FieldValues['ID_CATEGORIA'];

  DMSoftvet.IBQGrupos.Active := false;
  DMSoftvet.IBQGrupos.ParamByName('idestablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQGrupos.Active := true;
  DMSoftvet.IBQGrupos.First;
  if (DBLCBAGrupos.KeyValue = NULL) then
    DBLCBAGrupos.KeyValue := DMSoftvet.IBQGrupos.FieldValues['ID_GRUPO'];


  Parametros[0] := false;
  Parametros[1] := false;

  IBQAnimales.SQL.Clear;
 { SQLBasico := 'SELECT COUNT(EP.ID_EVENTO) AS CANT, TA.ID_ANIMAL, TA.ID_RP, TA.NOMBRE,'+
               ' (SELECT CC.nombre FROM cod_categorias CC WHERE (CC.id_categoria=TA.categoria)) AS CATEGORIA,'+
               ' (SELECT CS.nombre FROM cod_sexos CS WHERE(CS.id_sexo=TA.sexo)) AS SEXO'+
               ' FROM tab_animales TA JOIN EVE_EVENTOS EE ON TA.ID_ANIMAL=EE.ANIMAL AND TA.ESTABLECIMIENTO=EE.ESTABLECIMIENTO'+
               ' JOIN EVE_PESO EP ON EE.ID_EVENTO=EP.ID_EVENTO WHERE (TA.ESTABLECIMIENTO=:ESTA) AND'+
               ' EE.FECHA BETWEEN :FECHA_INIC AND :FECHA_FIN';  }

               SQLBasico := 'SELECT COUNT(EE.ID_EVENTO) AS CANT, TA.ID_ANIMAL, TA.ID_RP, TA.NOMBRE,'+
               ' (SELECT CC.nombre FROM cod_categorias CC WHERE (CC.id_categoria=TA.categoria)) AS CATEGORIA,'+
               ' (SELECT CS.nombre FROM cod_sexos CS WHERE(CS.id_sexo=TA.sexo)) AS SEXO'+
               ' FROM tab_animales TA JOIN EVE_EVENTOS EE ON TA.ID_ANIMAL=EE.ANIMAL AND TA.ESTABLECIMIENTO=EE.ESTABLECIMIENTO'+
               ' WHERE EE.tipo = 25 AND (TA.ESTABLECIMIENTO=:ESTA) AND'+
               ' EE.FECHA BETWEEN :FECHA_INIC AND :FECHA_FIN';


                {WHERE (establecimiento=:esta) and (EXISTS(SELECT EE.animal FROM eve_eventos EE, eve_peso EP'+
               ' WHERE (EE.id_evento=EP.id_evento and EE.establecimiento=:esta AND EE.ANIMAL=TA.ID_ANIMAL and EE.fecha BETWEEN :fechaInic and :fechaFin) '+
               ' group by EE.animal having count(EE.animal)>2))';}
  FinSQL := ' GROUP BY TA.ID_ANIMAL, TA.ID_RP, TA.NOMBRE, TA.CATEGORIA, SEXO HAVING COUNT(EE.ID_EVENTO)>=2';
  IBQAnimales.SQL.Add(SQLBasico+FinSQL);
end;

procedure TFREPDistGananciaDiariaPeso.CBCategoriasClick(Sender: TObject);
var
  filtro : String;
begin
  inherited;
  filtro := ' and (TA.categoria=:categ)';
  if (CBCategorias.Checked) then
  begin
    SQLBasico := SQLBasico+filtro;
    GBCategorias.Enabled := true;
    DBLCBACategorias.Enabled:= true;
    Parametros[0] := true;
    //DBLCBACategorias.ListFieldIndex := 1;
    DBLCBACategorias.SetFocus;
    DBLCBACategoriasCloseUp(nil);
    //  Ejecutar();

  end
  else
  begin
    SQLBasico := StringReplace(SQLBasico,filtro,'',[rfIgnoreCase]);
    //DBLCBACategorias.KeyValue := -1;
    DBLCBACategorias.Enabled := false;
    GBCategorias.Enabled := false;
    Parametros[0] := false;
    CBGruposClick(nil);
    if((valGrupo<>-1) and (valGrupo<>0)) then
    begin
      Limpiar;
   //   Ejecutar();
    end;
  end;
end;

procedure TFREPDistGananciaDiariaPeso.IBQAnimalesBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  IBQAnimales.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAnimales.ParamByName('FECHA_INIC').AsDate := DTPAFechaInicio.Date;
  IBQAnimales.ParamByName('FECHA_FIN').AsDate := DTPAFechaFin.Date;
end;

procedure TFREPDistGananciaDiariaPeso.DBLCBACategoriasCloseUp(
  Sender: TObject);
begin
  inherited;
  if DBLCBACategorias.KeyValue <> null then
  begin
    valCategoria := DBLCBACategorias.KeyValue;
    Limpiar();
   // Ejecutar();
  end;
end;

procedure TFREPDistGananciaDiariaPeso.Ejecutar();
var cartel: TCartel;
    msje: String;
begin

  IBQAnimales.Close;
  IBQAnimales.SQL.Clear;

  cartel:= TCartel.getInstance();
  msje:= 'Calculando Distribución de Ganancia Diaria de Peso ...';
  cartel.abrircartel(msje);

  IF PORGRUPO THEN
    IBQAnimales.SQL.Add(SQLBasico)
  ELSE
    IBQAnimales.SQL.Add(SQLBasico+FinSQL);
  if (Parametros[0]) then
    IBQAnimales.ParamByName('CATEG').AsInteger := valCategoria;
  if (Parametros[1]) then
    IBQAnimales.ParamByName('GRUPO').AsInteger := valGrupo;
  {if ((CBCategorias.Checked) or (CBGrupos.Checked)) then
    begin
      IBQAnimales.Open;
      if not (DSAnimales.DataSet.IsEmpty) then
        BBImprimirReporte.Enabled := true
      else
        BBImprimirReporte.Enabled := false;
    end
   else
     begin
       BBImprimirReporte.Enabled := false;
       BBXls.Enabled:= false;
     end;  }
     IBQAnimales.Open;

  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

procedure TFREPDistGananciaDiariaPeso.CBGruposClick(Sender: TObject);
var
  filtro : String;
begin
  inherited;

  {  DMSoftvet.IBQGrupos.Active := false;
  DMSoftvet.IBQGrupos.ParamByName('idestablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQGrupos.Active := true; }

  filtro :='';{:= ' and (EXISTS(select RPG.grupo from REL_PERTENECE_GRUPO RPG where(RPG.animal = TA.id_animal and'
           +' RPG.establecimiento=TA.establecimiento and RPG.grupo=:grupo and RPG.Activo=''S'')) or'
           +' EXISTS(select RGE.grupo from REL_GRUPOS_EVENTO RGE, EVE_EVENTOS EE where(EE.animal=TA.id_animal and EE.establecimiento=TA.establecimiento'
           +' and EE.id_evento=RGE.evento and RGE.establecimiento=EE.establecimiento and RGE.grupo=:grupo)))'; }
  if (CBGrupos.Checked) then
  begin
    //SQLBasico := SQLBasico+filtro;
    DBLCBAGrupos.Enabled:= true;
    GBGrupos.Enabled := true;
    DBLCBAGrupos.SetFocus;
   // Parametros[1] := true;
    //DBLCBAGrupos.KeyValue:= 1;
   // PORGRUPO := TRUE;
    if not(DMSoftvet.IBQGrupos.IsEmpty) then
      DBLCBAGruposCloseUp(nil)
    else
       begin
         Parametros[1] := false;
         DeshacerGrupo();
         PORGRUPO := FALSE;
         //SQLBasico := StringReplace(SQLBasico,filtro,'',[rfIgnoreCase]);
       end;
//    if (DBLCBAGrupos.KeyValue <> null) then

    {if (DBLCBAGrupos.KeyValue <> null) then
      Ejecutar();}
  end
  else
  begin
    DeshacerGrupo();
    PORGRUPO := FALSE;
    //SQLBasico := StringReplace(SQLBasico,filtro,'',[rfIgnoreCase]);
    //DBLCBAGrupos.KeyValue:= 0;
    DBLCBAGrupos.Enabled:= false;
    GBGrupos.Enabled := false;
    Parametros[1] := false;
    //DBLCBAGrupos.KeyValue := -1;
    Limpiar;
   // Ejecutar();
  end;
end;

procedure TFREPDistGananciaDiariaPeso.ArmarParaGrupo();
begin
  if (tipoGrupo = 'S') then
    SQLBasico := 'SELECT TA.ID_ANIMAL, TA.ID_RP, TA.NOMBRE,'+
               ' (SELECT CC.nombre FROM cod_categorias CC WHERE (CC.id_categoria=TA.categoria)) AS CATEGORIA,'+
               ' (SELECT CS.nombre FROM cod_sexos CS WHERE(CS.id_sexo=TA.sexo)) AS SEXO'+
               ' FROM TAB_ANIMALES TA JOIN EVE_EVENTOS EE ON TA.ID_ANIMAL=EE.ANIMAL AND TA.ESTABLECIMIENTO=EE.ESTABLECIMIENTO'+
               ' WHERE (TA.ESTABLECIMIENTO=:ESTA) AND (EE.FECHA BETWEEN :FECHA_INIC AND :FECHA_FIN) AND EE.TIPO=25'+
               ' AND (SELECT COUNT(EP.ID_EVENTO) FROM EVE_PESO EP JOIN EVE_EVENTOS EE1 ON EP.ID_EVENTO=EE1.ID_EVENTO'+
               ' WHERE EE1.ANIMAL=TA.ID_ANIMAL)>=2 AND EXISTS(SELECT RGE.EVENTO FROM REL_GRUPOS_EVENTO RGE WHERE RGE.GRUPO=:GRUPO'+
               ' AND RGE.ESTABLECIMIENTO=EE.ESTABLECIMIENTO AND RGE.EVENTO=EE.ID_EVENTO)'
  else
    SQLBasico := 'SELECT distinct(TA.ID_ANIMAL), TA.ID_RP, TA.NOMBRE,'+
               ' (SELECT CC.nombre FROM cod_categorias CC WHERE (CC.id_categoria=TA.categoria)) AS CATEGORIA,'+
               ' (SELECT CS.nombre FROM cod_sexos CS WHERE(CS.id_sexo=TA.sexo)) AS SEXO'+
               ' FROM TAB_ANIMALES TA JOIN EVE_EVENTOS EE ON TA.ID_ANIMAL=EE.ANIMAL AND TA.ESTABLECIMIENTO=EE.ESTABLECIMIENTO'+
               ' WHERE (TA.ESTABLECIMIENTO=:ESTA) AND (EE.FECHA BETWEEN :FECHA_INIC AND :FECHA_FIN) AND EE.TIPO=25'+
               ' AND (SELECT COUNT(EP.ID_EVENTO) FROM EVE_PESO EP JOIN EVE_EVENTOS EE1 ON EP.ID_EVENTO=EE1.ID_EVENTO'+
               ' WHERE EE1.ANIMAL=TA.ID_ANIMAL)>=2 AND EXISTS(SELECT RPG.ANIMAL FROM REL_PERTENECE_GRUPO RPG WHERE RPG.GRUPO=:GRUPO'+
               ' AND RPG.ESTABLECIMIENTO=EE.ESTABLECIMIENTO AND RPG.ANIMAL=TA.ID_ANIMAL)';
  if Parametros[0] then
    SQLBasico := SQLBasico+' and (TA.categoria=:categ)';
end;

procedure TFREPDistGananciaDiariaPeso.DeshacerGrupo();
begin
  SQLBasico := 'SELECT COUNT(EP.ID_EVENTO) AS CANT, TA.ID_ANIMAL, TA.ID_RP, TA.NOMBRE,'+
               ' (SELECT CC.nombre FROM cod_categorias CC WHERE (CC.id_categoria=TA.categoria)) AS CATEGORIA,'+
               ' (SELECT CS.nombre FROM cod_sexos CS WHERE(CS.id_sexo=TA.sexo)) AS SEXO'+
               ' FROM tab_animales TA JOIN EVE_EVENTOS EE ON TA.ID_ANIMAL=EE.ANIMAL AND TA.ESTABLECIMIENTO=EE.ESTABLECIMIENTO'+
               ' JOIN EVE_PESO EP ON EE.ID_EVENTO=EP.ID_EVENTO WHERE (TA.ESTABLECIMIENTO=:ESTA) AND'+
               ' EE.FECHA BETWEEN :FECHA_INIC AND :FECHA_FIN';
  if Parametros[0] then
    SQLBasico := SQLBasico+' and (TA.categoria=:categ)';

end;

procedure TFREPDistGananciaDiariaPeso.DBLCBAGruposCloseUp(Sender: TObject);
begin
  inherited;
  if not(DMSoftvet.IBQGrupos.IsEmpty) then
   if DBLCBAGrupos.KeyValue <> null then
    begin
      Parametros[1] := true;
      PORGRUPO := TRUE;
      valGrupo := DBLCBAGrupos.KeyValue;
      tipoGrupo := DMSoftvet.IBQGrupos.FieldValues['tipo'];
      ArmarParaGrupo();
      Limpiar();
 //     Ejecutar();
    end;
end;

procedure TFREPDistGananciaDiariaPeso.BBImprimirReporteClick(
  Sender: TObject);
var
  cartel : TCartel;
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  cartel := TCartel.getInstance;
  cartel.abrircartel('Generando Reporte de Distribucion de Ganancia Diaria de Peso...');

  Seleccionados();
  Application.CreateForm(TFREPDistGananciaDiariaPesoPreview,FREPDistGananciaDiariaPesoPreview);
  FREPDistGananciaDiariaPesoPreview.FechaFin := DTPAFechaFin.Date;
  FREPDistGananciaDiariaPesoPreview.FechaInic := DTPAFechaInicio.Date;
  if CBCategorias.Checked then
  begin
     FREPDistGananciaDiariaPesoPreview.Cat := true;
     FREPDistGananciaDiariaPesoPreview.Categoria := DBLCBACategorias.Text;
  end;
  if CBGrupos.Checked then
  begin
    FREPDistGananciaDiariaPesoPreview.Grupo := DBLCBAGrupos.Text;
    FREPDistGananciaDiariaPesoPreview.Grup := true;
  end;

  cartel.cerrarcartel;
  cartel.FreeInstance;
  FREPDistGananciaDiariaPesoPreview.ShowModal;
  FREPDistGananciaDiariaPesoPreview.Destroy;
  Limpiar;
  HabilitarDesabilitarControles();
end;

procedure TFREPDistGananciaDiariaPeso.Seleccionados();
begin
  IBQAnimales.First;
  while not(IBQAnimales.Eof) do
  begin
    IBQInsertAux.Close;
    IBQInsertAux.ParamByName('id').AsInteger := FIdAnimal;
    IBQInsertAux.ParamByName('animal').AsInteger := IBQAnimales.FieldByName('ID_ANIMAL').AsInteger;
    IBQInsertAux.Open;
    IBQCommit.Open;
    IBQCommit.Close;
    IBQAnimales.Next;
  end;
  IBQAnimales.Close;
  IBQAnimales.Open;
  IBQAnimales.First;
  IBQInsertAux.Close;
end;

procedure TFREPDistGananciaDiariaPeso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Limpiar();
end;

procedure TFREPDistGananciaDiariaPeso.Limpiar();
begin
  IBQLimpiarAux.Close;
  IBQlimpiarAux.Open;
  FPrincipal.IBTPrincipal.CommitRetaining
 { IBQCommit.Open;
  IBQCommit.Close;  }
end;

procedure TFREPDistGananciaDiariaPeso.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
      DTXLS.SaveToFile(SDXLS.FileName);
end;


procedure TFREPDistGananciaDiariaPeso.IBQAnimalesAfterOpen(DataSet: TDataSet);

begin
  inherited;
  IBQAnimales.Last;
  IBQAnimales.First;
  
  BDBGAnimales.DataSource := DSAnimales;
  GBAnimales.Caption := Traducir('Animales [')+IntToStr(IBQAnimales.RecordCount)+']';
  {BBImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  BBXls.Enabled := not(IBQAnimales.IsEmpty);}
  IPreview.Enabled := not(IBQAnimales.IsEmpty);
  LPreview.Enabled := not(IBQAnimales.IsEmpty);
  LExpExcel.Enabled := not(IBQAnimales.IsEmpty);
  IExpExcel.Enabled := not(IBQAnimales.IsEmpty);
end;

procedure TFREPDistGananciaDiariaPeso.FormShow(Sender: TObject);
begin
  inherited;
  Limpiar();
 // Ejecutar();

end;

procedure TFREPDistGananciaDiariaPeso.BDBGAnimalesDblClick(
  Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (BDBGAnimales.SelectedIndex = 0) then
    if not(IBQAnimales.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQAnimales.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFREPDistGananciaDiariaPeso.DBLCBACategoriasKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  DBLCBACategoriasCloseUp(nil);
end;

procedure TFREPDistGananciaDiariaPeso.DBLCBAGruposKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  DBLCBAGruposCloseUp(nil);
end;

procedure TFREPDistGananciaDiariaPeso.BDBGAnimalesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    BDBGAnimalesDblClick(nil);
end;

procedure TFREPDistGananciaDiariaPeso.DTPACloseUpFechas(Sender: TObject);
begin
  inherited;
  Limpiar();
  //Ejecutar();
end;

procedure TFREPDistGananciaDiariaPeso.DTPAFechaInicioKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    DTPACloseUpFechas(Sender);
end;

procedure TFREPDistGananciaDiariaPeso.Button1Click(Sender: TObject);
begin
  inherited;
  Ejecutar();
end;

procedure TFREPDistGananciaDiariaPeso.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  Button1.OnClick(Sender);
end;

end.
