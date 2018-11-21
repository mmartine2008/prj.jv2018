unit UPartidasSemenAprobar;

interface        

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, Buttons, PngImage, jpeg,
  Grids, DBGrids, UBDBGrid, JvExExtCtrls, JvImage;

type
  TFPartidasSemenAprobar = class(TFUniversal)
    PFiltros: TPanel;
    PGrilla: TPanel;
    PBotones: TPanel;
    Image5: TImage;
    ISalir: TImage;
    IVerFicha: TImage;
    LVerFicha: TLabel;
    LSalir: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    BitBtn3: TBitBtn;
    GBFiltros: TGroupBox;
    LPartida: TLabel;
    EPartida: TEdit;
    DTPFechaHasta: TDateTimePicker;
    LFechaHasta: TLabel;
    DTPFechaDesde: TDateTimePicker;
    LFechaDesde: TLabel;
    GBGrilla: TGroupBox;
    BDBGDetalle: TBitDBGrid;
    DSPartidas: TDataSource;
    IBQPartidas: TIBQuery;
    IBuscarPartida: TImage;
    ImgImprimirListado: TImage;
    Label1: TLabel;
    CBxTermo: TComboBox;
    CBxCanister: TComboBox;
    CBxPosicion: TComboBox;
    IBQTermos: TIBQuery;
    Label2: TLabel;
    EAnimal: TEdit;
    IBuscarAnimal: TImage;
    CBTipoAlta: TComboBox;
    IBQParametroDeTerceros: TIBQuery;
    IBQTipoAlta: TIBQuery;
    IBQCantDosisAprobar: TIBQuery;
    IExcel: TImage;
    LExcel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EPartidaChange(Sender: TObject);
    procedure IBuscarPartidaClick(Sender: TObject);
    procedure EPartidaKeyPress(Sender: TObject; var Key: Char);
    procedure IVerFichaClick(Sender: TObject);
    procedure DTPFechaDesdeCloseUp(Sender: TObject);
    procedure DTPFechaDesdeChange(Sender: TObject);
    procedure DTPFechaHastaChange(Sender: TObject);
    procedure DTPFechaHastaCloseUp(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure BDBGDetalleTitleClick(Column: TColumn);
    procedure ImgImprimirListadoClick(Sender: TObject);
    procedure CBxTermoChange(Sender: TObject);
    procedure CBxTermoCloseUp(Sender: TObject);
    procedure CBxCanisterChange(Sender: TObject);
    procedure CBxPosicionChange(Sender: TObject);
    procedure CBxPosicionCloseUp(Sender: TObject);
    procedure EAnimalChange(Sender: TObject);
    procedure CBTipoAltaChange(Sender: TObject);
    procedure CBTipoAltaCloseUp(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
  private
    { Private declarations }
    orden_consulta, columna_anterior : String;
    procedure MostrarPorPartida;
    procedure Actualizar;
    procedure CargarCombos;
  public
    { Public declarations }
  end;

var
  FPartidasSemenAprobar: TFPartidasSemenAprobar;
  cadena_partida, cadena_animal : string;
  id_tipo_alta : Integer;
  DelRaza, DelColor, DelTermo, DelCanister, DelPosicion, DelTipoAlta : boolean;
  termo, canister, posicion : string;

implementation

uses UPrincipal,uTiposGlobales, DateUtils, UEveExtraccionSemen, URepListadoPartidas, UDMSoftvet;

{$R *.dfm}

procedure TFPartidasSemenAprobar.CargarCombos;
var i : integer;
begin
    IBQTermos.Close;
    IBQTermos.Open;
    IBQTermos.First;
    CBxTermo.Items.Insert(0,'TERMO');
    CBxTermo.Items.Insert(1,'(TODOS)');
    i := 2;
    while not(IBQTermos.Eof) do
    begin
         CBxTermo.Items.Insert(i,IBQTermos.FieldValues['termo']);
         IBQTermos.Next;
         Inc(i);
    end;
    CBxTermo.ItemIndex := 0;
    CBxTermo.DropDownCount := i;

    CBxCanister.ItemIndex := 0;
    CBxPosicion.ItemIndex := 0;

    IBQTipoAlta.Close;
    IBQTipoAlta.Open;
    IBQTipoAlta.First;
    CBTipoAlta.Items.Clear;
    CBTipoAlta.Items.Insert(0,'TIPO DE ALTA');
    CBTipoAlta.Items.Insert(1,'(TODOS)');
    i := 2;
    while not IBQTipoAlta.Eof do
    begin
      CBTipoAlta.Items.Insert(i,IBQTipoAlta.FieldValues['NOMBRE']);
      IBQTipoAlta.Next;
      inc(i);
    end;
    CBTipoAlta.ItemIndex := 0;
    CBTipoAlta.DropDownCount := i;
end;

procedure TFPartidasSemenAprobar.FormCreate(Sender: TObject);
begin
  inherited;

  DTPFechaDesde.Date := IncYear(now,-1);
  DTPFechaHasta.Date := Now();

  cadena_partida := '';
  cadena_animal := '';

end;

procedure TFPartidasSemenAprobar.FormShow(Sender: TObject);
begin
  inherited;

  IBQParametroDeTerceros.Close;
  IBQParametroDeTerceros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQParametroDeTerceros.Open;
  CBTipoAlta.Visible := false;
  if IBQParametroDeTerceros.FieldValues['valor'] <> null then
    CBTipoAlta.Visible := IBQParametroDeTerceros.FieldByName('valor').AsString = 'S';

  termo := '';
  canister := '';
  posicion := '';
  id_tipo_alta := -1;
  DelTermo := false;
  DelCanister := false;
  DelPosicion := false;
  DelTipoAlta := false;

  CargarCombos;


  orden_consulta := ' order by fecha_extraccion, partida_extraccion';
  columna_anterior := '';

  IBQPartidas.Close;
  IBQPartidas.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPartidas.ParamByName('desde').AsDate := DTPFechaDesde.Date;
  IBQPartidas.ParamByName('hasta').AsDate := DTPFechaHasta.Date;
  IBQPartidas.Open;

  IBQCantDosisAprobar.Close;
  IBQCantDosisAprobar.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQCantDosisAprobar.ParamByName('desde').AsDate := DTPFechaDesde.Date;
  IBQCantDosisAprobar.ParamByName('hasta').AsDate := DTPFechaHasta.Date;
  IBQCantDosisAprobar.Open;

  IBQPartidas.Last;
  IBQPartidas.First;


  if (IBQCantDosisAprobar.FieldValues['cant_dosis'] = null) then
      GBGrilla.Caption := '  Partidas pendientes de aprobación ('+IntToStr(IBQPartidas.RecordCount)+') - Dosis pendientes de aprobación (0))'
  else
      GBGrilla.Caption := '  Partidas pendientes de aprobación ('+IntToStr(IBQPartidas.RecordCount)+') - Dosis pendientes de aprobación ('+IntToStr(IBQCantDosisAprobar.FieldValues['cant_dosis'])+')';

end;

procedure TFPartidasSemenAprobar.EPartidaChange(Sender: TObject);
begin
  inherited;

  if (EPartida.Text <> '') then
      cadena_partida := EPartida.Text
  else
  begin
      cadena_partida := '';
      MostrarPorPartida;
  end;

end;

procedure TFPartidasSemenAprobar.MostrarPorPartida;
var sqltermo, sqlcanister, sqlposicion, sqlanimal, SQLFinal, SQLFinalCant : string;
    conWhere : boolean;
begin
  SQLFinal := '';
  sqlanimal := '';
  sqlcanister := '';
  sqlposicion := '';
  sqltermo := '';
  conWhere := false;
  if (cadena_partida <> '') then
  begin
    SQLFinal := 'select * from rep_partidas_pendientes_aprobar(:esta,:desde,:hasta) where (partida_extraccion like ''%'+cadena_partida+'%'')';
    if (cadena_animal <> '') then
      sqlanimal := ' and ((rp_animal like ''%'+cadena_animal+'%'') or (nombre_animal like ''%'+cadena_animal+'%'') or (apodo_animal like ''%'+cadena_animal+'%''))';
    if (termo <> '') then
      sqltermo := ' and (termo like ''%'+termo+'%'')';
    if (canister <> '') then
      sqlcanister := ' and (termo like ''%'+termo+'%'')';
    if (posicion <> '') then
      sqlposicion := ' and (termo like ''%'+termo+'%'')';
    if (id_tipo_alta <> -1) then
      sqlposicion := ' and id_animal in (select ee.animal from eve_eventos ee join eve_alta_directa ead on ee.id_evento = ead.id_evento where ead.tipo = '+IntToStr(id_tipo_alta)+')';
  end
  else
  begin
    SQLFinal := 'select * from rep_partidas_pendientes_aprobar(:esta,:desde,:hasta)';
    if (cadena_animal <> '') then
    begin
      sqlanimal := ' where ((rp_animal like ''%'+cadena_animal+'%'') or (nombre_animal like ''%'+cadena_animal+'%'') or (apodo_animal like ''%'+cadena_animal+'%''))';
      conWhere := true;
    end;
    if (termo <> '') then
    begin
      if (conWhere) then
        sqltermo := ' and (termo like ''%'+termo+'%'')'
      else
      begin
        sqltermo := ' where (termo like ''%'+termo+'%'')';
        conWhere := true;
      end;
    end;
    if (canister <> '') then
    begin
      if (conWhere) then
        sqlcanister := ' and (termo like ''%'+termo+'%'')'
      else
      begin
        sqlcanister := ' where (termo like ''%'+termo+'%'')';
        conWhere := true;
      end;
    end;
    if (posicion <> '') then
    begin
      if (conWhere) then
        sqlposicion := ' and (termo like ''%'+termo+'%'')'
      else
      begin
        sqlposicion := ' where (termo like ''%'+termo+'%'')';
        conWhere := true;
      end;
    end;
    if (id_tipo_alta <> -1) then
    begin
      if (conWhere) then
        sqlposicion := ' and id_animal in (select ee.animal from eve_eventos ee join eve_alta_directa ead on ee.id_evento = ead.id_evento where ead.tipo = '+IntToStr(id_tipo_alta)+')'
      else
      begin
        sqlposicion := ' where id_animal in (select ee.animal from eve_eventos ee join eve_alta_directa ead on ee.id_evento = ead.id_evento where ead.tipo = '+IntToStr(id_tipo_alta)+')';
        conWhere := true;
      end;
    end;
  end;

  SQLFinalCant := SQLFinal + sqlanimal + sqlcanister + sqltermo + sqlposicion;
  SQLFinal := SQLFinal + sqlanimal + sqlcanister + sqltermo + sqlposicion + orden_consulta;

  SQLFinalCant := StringReplace(SQLFinalCant,'*','sum(dosis) as cant_dosis',[]);


  IBQPartidas.Close;
  IBQPartidas.SQL.Clear;
  IBQPartidas.SQL.Add(SQLFinal);
  IBQPartidas.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPartidas.ParamByName('desde').AsDate := DTPFechaDesde.Date;
  IBQPartidas.ParamByName('hasta').AsDate := DTPFechaHasta.Date;
  IBQPartidas.Open;
  IBQPartidas.Last;
  IBQPartidas.First;
                                                                                     
  IBQCantDosisAprobar.Close;
  IBQCantDosisAprobar.SQL.Clear;
  IBQCantDosisAprobar.SQL.Add(SQLFinalCant);
  IBQCantDosisAprobar.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQCantDosisAprobar.ParamByName('desde').AsDate := DTPFechaDesde.Date;
  IBQCantDosisAprobar.ParamByName('hasta').AsDate := DTPFechaHasta.Date;
  IBQCantDosisAprobar.Open;

  if IBQCantDosisAprobar.FieldValues['cant_dosis'] <> null then
    GBGrilla.Caption := '  Partidas pendientes de aprobación ('+IntToStr(IBQPartidas.RecordCount)+') - Dosis pendientes de aprobación ('+IntToStr(IBQCantDosisAprobar.FieldValues['cant_dosis'])+')'
  else
    GBGrilla.Caption := '  Partidas pendientes de aprobación ('+IntToStr(IBQPartidas.RecordCount)+')';

  BDBGDetalle.SetFocus;
end;

procedure TFPartidasSemenAprobar.IBuscarPartidaClick(Sender: TObject);
begin
  inherited;

  MostrarPorPartida;
end;

procedure TFPartidasSemenAprobar.EPartidaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if (key = #13) then
      MostrarPorPartida;
end;

procedure TFPartidasSemenAprobar.IVerFichaClick(Sender: TObject);
var F : TFEveExtraccionSemen;
begin
  inherited;

  F := TFEveExtraccionSemen.Create(self);
  F.evento := IBQPartidas.FieldValues['id_evento'];
  F.IDAnimal := IBQPartidas.FieldValues['id_animal'];
  
  F.ShowModal;
  F.Destroy;

  Actualizar;
  
end;

procedure TFPartidasSemenAprobar.Actualizar;
begin
     cadena_partida := '';
     MostrarPorPartida;
end;

procedure TFPartidasSemenAprobar.DTPFechaDesdeCloseUp(Sender: TObject);
begin
  inherited;

  actualizar;
end;

procedure TFPartidasSemenAprobar.DTPFechaDesdeChange(Sender: TObject);
begin
  inherited;

  actualizar;
end;

procedure TFPartidasSemenAprobar.DTPFechaHastaChange(Sender: TObject);
begin
  inherited;

  actualizar;
end;

procedure TFPartidasSemenAprobar.DTPFechaHastaCloseUp(Sender: TObject);
begin
  inherited;

  actualizar;
end;

procedure TFPartidasSemenAprobar.ISalirClick(Sender: TObject);
begin
  inherited;

  close();
end;

procedure TFPartidasSemenAprobar.BDBGDetalleTitleClick(Column: TColumn);
var
  i : Integer;
begin
  inherited;

  for i := 0 to BDBGDetalle.Columns.Count-1 do
    BDBGDetalle.Columns[i].Title.Color := clBtnFace;

  if Column.FieldName = columna_anterior then
  begin
    orden_consulta := ' order by '+Column.FieldName+' asc';
    Column.Title.Color := clMoneyGreen;
    columna_anterior := '';
  end
  else
  begin
    orden_consulta := ' order by '+Column.FieldName+' desc';
    columna_anterior := Column.FieldName;
    Column.Title.Color := clMoneyGreen;
  end;
  MostrarPorPartida;
end;

procedure TFPartidasSemenAprobar.ImgImprimirListadoClick(Sender: TObject);
var F : TFRepListadoPartidas;
    sql : string;
begin
  inherited;

  sql := IBQPartidas.SQL.GetText;

  F := TFRepListadoPartidas.Create(self);
  F.IBQListadoPartidas.Close;
  F.IBQListadoPartidas.SQL.Clear;
  F.IBQListadoPartidas.SQL.Add(sql);

  F.IBQListadoPartidas.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  F.IBQListadoPartidas.ParamByName('desde').AsDate := DTPFechaDesde.Date;
  F.IBQListadoPartidas.ParamByName('hasta').AsDate := DTPFechaHasta.Date;

  F.IBQListadoPartidas.Open;

  F.IBQListadoPartidas.Last;
  F.IBQListadoPartidas.First;
  F.QRLCantPartidas.Caption := ' Hay '+IntToStr(F.IBQListadoPartidas.RecordCount)+' partidas por aprobar';

  F.QRListadoPartidas.Preview;
//  F.ShowModal;
  F.Destroy;

end;

procedure TFPartidasSemenAprobar.CBxTermoChange(Sender: TObject);
begin
  inherited;

  if ((CBxTermo.Text <> '(TODOS)') and (CBxTermo.Text <> '') and (CBxTermo.Text <> 'TERMO')) then
  begin
       termo := cbxTermo.text;
  end
  else
  begin
       termo := '';
       DelTermo := false;
       CBxTermo.Items.Insert(0,'TERMO');
       CBxTermo.ItemIndex := 0;
  end;

  Actualizar;

end;

procedure TFPartidasSemenAprobar.CBxTermoCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTermo) then
  begin
       CBxTermo.Items.Delete(0);
       DelTermo := true;
  end;

end;

procedure TFPartidasSemenAprobar.CBxCanisterChange(Sender: TObject);
begin
  inherited;
  if ((CBxCanister.Text <> '(TODOS)') and (CBxCanister.Text <> '') and (CBxCanister.Text <> 'CANISTER')) then
  begin
       canister := CBxCanister.text;
  end
  else
  begin
       canister := '';
       DelCanister := false;
       CBxCanister.Items.Insert(0,'CANISTER');
       CBxCanister.ItemIndex := 0;
  end;

  Actualizar;

end;

procedure TFPartidasSemenAprobar.CBxPosicionChange(Sender: TObject);
begin
  inherited;
  if ((CBxPosicion.Text <> '(TODAS)') and (CBxPosicion.Text <> '') and (CBxPosicion.Text <> 'POSICION')) then
  begin
       posicion := CBxPosicion.text;
  end
  else
  begin
       posicion := '';
       DelPosicion := false;
       CBxPosicion.Items.Insert(0,'POSICION');
       CBxPosicion.ItemIndex := 0;
  end;

  Actualizar;

end;

procedure TFPartidasSemenAprobar.CBxPosicionCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelPosicion) then
  begin
       CBxPosicion.Items.Delete(0);
       DelPosicion := true;
  end;

end;

procedure TFPartidasSemenAprobar.EAnimalChange(Sender: TObject);
begin
  inherited;

  if (EAnimal.Text <> '') then
      cadena_animal := EAnimal.Text
  else
  begin
      cadena_animal := '';
      MostrarPorPartida;
  end;

end;

procedure TFPartidasSemenAprobar.CBTipoAltaChange(Sender: TObject);
begin
  inherited;
  if ((CBTipoAlta.Text <> '(TODOS)') and (CBTipoAlta.Text <> '') and (CBTipoAlta.Text <> 'TIPO DE ALTA')) then
  begin
    id_tipo_alta := IBQTipoAlta.Lookup('nombre',CBTipoAlta.Text,'id_tipo_alta');
  end
  else
  begin
       id_tipo_alta := -1;
       DelTipoAlta := false;
       CBTipoAlta.Items.Insert(0,'TIPO DE ALTA');
       CBTipoAlta.ItemIndex := 0;
  end;

  Actualizar;
end;

procedure TFPartidasSemenAprobar.CBTipoAltaCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTipoAlta) then
  begin
       CBTipoAlta.Items.Delete(0);
       DelTipoAlta := true;
  end;

end;

procedure TFPartidasSemenAprobar.IExcelClick(Sender: TObject);
begin
  inherited;
  if SDXLS.Execute then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

end.
