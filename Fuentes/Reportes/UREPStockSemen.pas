unit UREPStockSemen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, Grids, DBGrids,
  UBDBGrid, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, IBStoredProc,
  WinXP, DataExport, DataToXLS, UMensajeImpresora, PngImage, jpeg, JvGIF,
  JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFREPStockSemen = class(TFUniversal)
    GBGrilla: TGroupBox;
    BDBG: TBitDBGrid;
    IBQAnimales: TIBQuery;
    ASalir: TAction;
    AImprimirReporte: TAction;
    DSAnimales: TDataSource;
    PGrilla: TPanel;
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
    IBQRepStockSemen: TIBQuery;
    PFiltros: TPanel;
    CBxRaza: TComboBox;
    CBxColor: TComboBox;
    LBuscar: TLabel;
    EBuscar: TEdit;
    IBuscarPartida: TImage;
    IBQRaza: TIBQuery;
    IBQColor: TIBQuery;
    PPie: TPanel;
    Label1: TLabel;
    LCantidadTotalValue: TLabel;
    Label3: TLabel;
    LInventarioTotalValue: TLabel;
    CBxTermo: TComboBox;
    CBxCanister: TComboBox;
    CBxPosicion: TComboBox;
    IBQTermos: TIBQuery;
    IHExtrac: TImage;
    LHExtract: TLabel;
    LFicha: TLabel;
    IFicha: TImage;
    CBTipoAlta: TComboBox;
    IBQTipoAlta: TIBQuery;
    IBQParametroDeTerceros: TIBQuery;
    procedure ASalirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AImprimirReporteExecute(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBxRazaChange(Sender: TObject);
    procedure CBxRazaCloseUp(Sender: TObject);
    procedure CBxColorChange(Sender: TObject);
    procedure CBxColorCloseUp(Sender: TObject);
    procedure EBuscarChange(Sender: TObject);
    procedure IBuscarPartidaClick(Sender: TObject);
    procedure EBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure IBQRepStockSemenAfterOpen(DataSet: TDataSet);
    procedure CBxTermoChange(Sender: TObject);
    procedure CBxTermoCloseUp(Sender: TObject);
    procedure CBxCanisterChange(Sender: TObject);
    procedure CBxCanisterCloseUp(Sender: TObject);
    procedure CBxPosicionChange(Sender: TObject);
    procedure CBxPosicionCloseUp(Sender: TObject);
    procedure BDBGDblClick(Sender: TObject);
    procedure BDBGTitleClick(Column: TColumn);
    procedure IFichaClick(Sender: TObject);
    procedure IHExtracClick(Sender: TObject);
    procedure CBTipoAltaChange(Sender: TObject);
    procedure CBTipoAltaCloseUp(Sender: TObject);

  private
    { Private declarations }
    orden_consulta, columna_anterior : String;
    procedure CargarCombos;
    procedure ActualizarConsulta;
  public
    { Public declarations }
  end;

var
  FREPStockSemen: TFREPStockSemen;
  id_raza, id_color, id_tipo_alta : integer;
  DelTipoAlta, DelRaza, DelColor, DelTermo, DelCanister, DelPosicion : boolean;
  totalCantidad, cantRecord : integer;
  totalCapital : double;
  termo, canister, posicion : string;
  id_animal_ex : integer;

implementation

uses UPrincipal,uTiposGlobales, UREPStockSemenPreview, UREPFichaAnimal, UMensajeHuella, UCartel,
     UTraduccion, UModificacionDosisPrecioSemen, URepDetalleSemenAnimal, UAbmPadresExternos,IBDButtonABM, UAbmSimple;

{$R *.dfm}

procedure TFREPStockSemen.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  Close;
end;

procedure TFREPStockSemen.FormCreate(Sender: TObject);
var total : integer;
    cartel : TCartel;
begin
  inherited;
  cartel := TCartel.getInstance;
  cartel.abrircartel('Listando Stock de Semen...');

  IBQParametroDeTerceros.Close;
  IBQParametroDeTerceros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQParametroDeTerceros.Open;
  CBTipoAlta.Visible := false;
  if IBQParametroDeTerceros.FieldValues['valor'] <> null then
    CBTipoAlta.Visible := IBQParametroDeTerceros.FieldByName('valor').AsString = 'S';

  total := 0;
  BDBG.DataSource := nil;
  IBQAnimales.Close;
  IBQAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAnimales.Open;
  IBQAnimales.First;
  while not(IBQAnimales.Eof) do
  begin
      total := total + IBQAnimales.fieldByname('cantidad').AsInteger;
      IBQAnimales.Next;
  end;
  IBQAnimales.First;

  BDBG.DataSource := DSAnimales;

  cartel.cerrarcartel;
  cartel.FreeInstance;  
end;

procedure TFREPStockSemen.AImprimirReporteExecute(Sender: TObject);
var
  cartel : TCartel;
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  cartel := TCartel.getInstance;
  cartel.abrircartel('Generando Reporte de Stock de Semen...');

  Application.CreateForm(TFREPStockSemenPreview, FREPStockSemenPreview);
  FREPStockSemenPreview.QRLCantidad.Caption := IntToStr(totalCantidad);
  FREPStockSemenPreview.QRLInventario.Caption := '$ ' + FloatToStr(totalCapital);

  cartel.cerrarcartel;
  cartel.FreeInstance;

  FREPStockSemenPreview.ShowModal;
  HabilitarDesabilitarControles();  
end;

procedure TFREPStockSemen.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPStockSemen.FormShow(Sender: TObject);
begin
  inherited;

  id_tipo_alta := -1;
  id_raza := -1;
  id_color := -1;
  termo := '';
  canister := '';
  posicion := '';
  DelColor := false;
  DelTipoAlta := false;
  DelRaza := false;
  DelTermo := false;
  DelCanister := false;
  DelPosicion := false;

  CargarCombos;

  orden_consulta := ' order by dosis desc';
  columna_anterior := '';

  ActualizarConsulta;
end;

procedure TFREPStockSemen.CargarCombos;
var i : integer;
begin
    IBQColor.Close;
    IBQColor.Open;
    IBQColor.First;

    CBxColor.Items.Insert(0,'COLOR');
    CBxColor.Items.Insert(1,'(TODOS)');
    i:= 2;
    while not(IBQColor.Eof) do
    begin
         CBxColor.Items.Insert(i,IBQColor.FieldValues['nombre']);
         IBQColor.Next;
         Inc(i);
    end;
    CBxColor.ItemIndex := 0;
    CBxColor.DropDownCount := i;
    

    IBQRaza.Close;
    IBQRaza.Open;
    IBQRaza.First;
    CBxRaza.Items.Insert(0,'RAZA');
    CBxRaza.Items.Insert(1,'(TODAS)');
    i := 2;
    while not(IBQRaza.Eof) do
    begin
         CBxRaza.Items.Insert(i,IBQRaza.FieldValues['sinonimo']);
         IBQRaza.Next;
         Inc(i);
    end;
    CBxRaza.ItemIndex := 0;
    CBxRaza.DropDownCount := i;


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
      Inc(i);
      IBQTipoAlta.Next;
    end;
    CBTipoAlta.ItemIndex := 0;
    CBTipoAlta.DropDownCount := i;
end;

procedure TFREPStockSemen.CBxRazaChange(Sender: TObject);
begin
  inherited;

  if ((CBxRaza.Text <> '(TODAS)') and (CBxRaza.Text <> '') and (CBxRaza.Text <> 'RAZA')) then
  begin
       id_raza := IBQRaza.Lookup('sinonimo',CBxRaza.Text,'id_raza');
  end
  else
  begin
       id_raza := -1;
       DelRaza := false;
       CBxRaza.Items.Insert(0,'RAZA');
       CBxRaza.ItemIndex := 0;
  end;

  ActualizarConsulta;
end;

procedure TFREPStockSemen.CBxRazaCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelRaza) then
  begin
       CBxRaza.Items.Delete(0);
       DelRaza := true;
  end;
end;

procedure TFREPStockSemen.CBxColorChange(Sender: TObject);
begin
  inherited;

  if ((CBxColor.Text <> '(TODOS)') and (CBxColor.Text <> '') and (CBxColor.Text <> 'COLOR')) then
  begin
       id_color := IBQColor.Lookup('nombre',CBxColor.Text,'id_color');
  end
  else
  begin
       id_color := -1;
       DelColor := false;
       CBxColor.Items.Insert(0,'COLOR');
       CBxColor.ItemIndex := 0;
  end;

  ActualizarConsulta;
end;

procedure TFREPStockSemen.CBxColorCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelColor) then
  begin
       CBxColor.Items.Delete(0);
       DelColor := true;
  end;
end;

procedure TFREPStockSemen.ActualizarConsulta;
var sql, cadena : string;
begin
     IBQRepStockSemen.Close;
     IBQRepStockSemen.SQL.Clear;

     sql := 'select * from rep_stock_semen(:esta)';

     if (id_raza <> -1) then
     begin
        cadena := ' where (id_raza_animal = :raza)';
        sql := sql + cadena;
     end;

     if (id_color <> -1) then
     begin
        if (AnsiPos('where',sql) <> 0) then
            cadena := ' and (id_color_animal = :color)'
        else
            cadena := ' where (id_color_animal = :color)';

        sql := sql + cadena;
     end;

     if (EBuscar.Text <> '') then
     begin
        if (AnsiPos('where',sql) <> 0) then
            cadena := ' and ((rp_animal like ''%'+EBuscar.Text+'%'') or (hba_animal like ''%'+EBuscar.Text+'%'') or (aba_animal like ''%'+EBuscar.Text+'%'') or (nombre_animal like ''%'+EBuscar.Text+'%'') or (apodo_animal like ''%'+EBuscar.Text+'%''))'
        else
            cadena := ' where ((rp_animal like ''%'+EBuscar.Text+'%'') or (hba_animal like ''%'+EBuscar.Text+'%'') or (aba_animal like ''%'+EBuscar.Text+'%'') or (nombre_animal like ''%'+EBuscar.Text+'%'') or (apodo_animal like ''%'+EBuscar.Text+'%''))';

        sql := sql + cadena;
     end;

     if (termo <> '') then
     begin
        if (AnsiPos('where',sql) <> 0) then
            cadena := ' and (id_animal in (select ees.id_animal from eve_extraccion_semen ees join tab_stock_semen_termo tsst on (ees.partida = tsst.partida) where tsst.termo = :t))'
        else
            cadena := ' where id_animal in (select ees.id_animal from eve_extraccion_semen ees join tab_stock_semen_termo tsst on (ees.partida = tsst.partida) where tsst.termo = :t)';
        sql := sql + cadena;
     end;

     if (canister <> '') then
     begin
        if (AnsiPos('where',sql) <> 0) then
            cadena := ' and (id_animal in (select ees.id_animal from eve_extraccion_semen ees join tab_stock_semen_termo tsst on (ees.partida = tsst.partida) where tsst.canister = :c))'
        else
            cadena := ' where id_animal in (select ees.id_animal from eve_extraccion_semen ees join tab_stock_semen_termo tsst on (ees.partida = tsst.partida) where tsst.canister = :c)';
        sql := sql + cadena;
     end;

     if (posicion <> '') then
     begin
        if (AnsiPos('where',sql) <> 0) then
            cadena := ' and (id_animal in (select ees.id_animal from eve_extraccion_semen ees join tab_stock_semen_termo tsst on (ees.partida = tsst.partida) where tsst.posicion = :p))'
        else
            cadena := ' where id_animal in (select ees.id_animal from eve_extraccion_semen ees join tab_stock_semen_termo tsst on (ees.partida = tsst.partida) where tsst.posicion = :p)';
        sql := sql + cadena;
     end;

     if id_tipo_alta <> -1 then
     begin
      if AnsiPos('where',sql) <> 0 then
        cadena := ' and id_animal in (select ee.animal from eve_eventos ee join eve_alta_directa ead on ee.id_evento = ead.id_evento where ead.tipo = '+IntToStr(id_tipo_alta)+')'
      else
        cadena := ' where id_animal in (select ee.animal from eve_eventos ee join eve_alta_directa ead on ee.id_evento = ead.id_evento where ead.tipo = '+IntToStr(id_tipo_alta)+')';
      sql := sql + cadena;
     end;


     sql := sql + orden_consulta;
     IBQRepStockSemen.SQL.Add(sql);

     IBQRepStockSemen.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;

     if (id_raza <> -1) then
        IBQRepStockSemen.ParamByName('raza').AsInteger := id_raza;

     if (id_color <> -1) then
        IBQRepStockSemen.ParamByName('color').AsInteger := id_color;

     if (termo <> '') then
        IBQRepStockSemen.ParamByName('t').AsString := termo;

     if (canister <> '') then
        IBQRepStockSemen.ParamByName('c').AsString := canister;

     if (posicion <> '') then
        IBQRepStockSemen.ParamByName('p').AsString := posicion;

     IBQRepStockSemen.Open;
     IBQRepStockSemen.First;

     totalCantidad := 0;
     totalCapital := 0;
     cantRecord := 0;
     while not(IBQRepStockSemen.Eof) do
     begin
          totalCantidad := totalCantidad + IBQRepStockSemen.FieldValues['dosis'];
          totalCapital := totalCapital + IBQRepStockSemen.FieldValues['capital'];
          Inc(cantRecord);
          IBQRepStockSemen.Next;
     end;
     IBQRepStockSemen.First;

     GBGrilla.Caption := '  Animales en Stock: '+IntToStr(cantRecord)+'  ';
     LCantidadTotalValue.Caption := IntToStr(totalCantidad);
     LInventarioTotalValue.Caption := '$' + FloatToStr(totalCapital);
end;

procedure TFREPStockSemen.EBuscarChange(Sender: TObject);
begin
  inherited;

  ActualizarConsulta;
end;

procedure TFREPStockSemen.IBuscarPartidaClick(Sender: TObject);
begin
  inherited;

  ActualizarConsulta;
end;

procedure TFREPStockSemen.EBuscarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if (key = #13) then
    IBuscarPartidaClick(self);
end;

procedure TFREPStockSemen.IBQRepStockSemenAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IPreview.Enabled := not(IBQAnimales.IsEmpty);
  LPreview.Enabled := not(IBQAnimales.IsEmpty);
  LExpExcel.Enabled := not(IBQAnimales.IsEmpty);
  IExpExcel.Enabled := not(IBQAnimales.IsEmpty);
end;

procedure TFREPStockSemen.CBxTermoChange(Sender: TObject);
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

  ActualizarConsulta;
end;

procedure TFREPStockSemen.CBxTermoCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelTermo) then
  begin
       CBxTermo.Items.Delete(0);
       DelTermo := true;
  end;
end;

procedure TFREPStockSemen.CBxCanisterChange(Sender: TObject);
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

  ActualizarConsulta;

end;

procedure TFREPStockSemen.CBxCanisterCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelCanister) then
  begin
       CBxCanister.Items.Delete(0);
       DelCanister := true;
  end;

end;

procedure TFREPStockSemen.CBxPosicionChange(Sender: TObject);
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

  ActualizarConsulta;
end;

procedure TFREPStockSemen.CBxPosicionCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelPosicion) then
  begin
       CBxPosicion.Items.Delete(0);
       DelPosicion := true;
  end;
end;

procedure TFREPStockSemen.BDBGDblClick(Sender: TObject);
var F : TFModificacionDosisPrecioSemen;
begin
  inherited;

  F := TFModificacionDosisPrecioSemen.Create(self);
  F.id_animal := IBQRepStockSemen.FieldValues['id_animal'];
  F.tipo_animal := IBQRepStockSemen.FieldValues['tipo_animal'];
  if IBQRepStockSemen.FieldValues['dosis'] <> null then
     F.dosis_actuales := IBQRepStockSemen.FieldValues['dosis']
  else
    F.dosis_actuales := 0;
  if IBQRepStockSemen.FieldValues['precio_dosis'] <> null then
    F.precio_actual := IBQRepStockSemen.FieldValues['precio_dosis']
  else
    F.precio_actual := 0;
  F.ShowModal;
  F.Destroy;

  ActualizarConsulta;

end;

procedure TFREPStockSemen.BDBGTitleClick(Column: TColumn);
var
  i : Integer;
begin
  inherited;

  for i := 0 to BDBG.Columns.Count-1 do
    BDBG.Columns[i].Title.Color := clBtnFace;

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
  ActualizarConsulta;
end;

procedure TFREPStockSemen.IFichaClick(Sender: TObject);
var F : TFREPFichaAnimal;
    form : TFABMPadresExternos;
    Iabm : IButtonABM;
    
begin
  inherited;
  if (BDBG.DataSource.DataSet.FieldValues['tipo_animal'] = 'INTERNO' ) then
  begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := BDBG.DataSource.DataSet.FieldValues['id_animal'];
      F.ShowModal;
      F.Destroy;
  end
  else
  begin
   {  form := TFABMPadresExternos.Create(self);
     Iabm := IButtonABM(form);
     Iabm.IFitrate(-1,FPrincipal.EstablecimientoActual);
     Iabm.ISetCampoRetorno('id_animal_externo');
    // form.AcEditarExecute(sender);
     Iabm.IAbrir(faElegir);    }


     id_animal_ex := BDBG.DataSource.DataSet.FieldValues['id_animal'];
     //id_animal_ex := (Sender as Tlabel).Tag;
     Application.CreateForm(TFABMPadresExternos, FABMPadresExternos);
          FABMPadresExternos:=TFABMPadresExternos.Create(self);
          FABMPadresExternos.EstabAux := FPrincipal.EstabAnimalExterno(id_animal_ex);
          FABMPadresExternos.nom:=inttostr(id_animal_ex);
          FABMPadresExternos.id_animal_ex := id_animal_ex;
          Iabm := IButtonABM(FABMPadresExternos);
         // FABMPadresExternos.AcEditarExecute(Sender);
          Iabm.ISetCampoRetorno('id_animal_externo');
          Iabm.IFitrate(-1,FPrincipal.EstabAnimalExterno(id_animal_ex));
          Iabm.IAbrir(faabm);



  end;
end;

procedure TFREPStockSemen.IHExtracClick(Sender: TObject);
var F : TFRepDetalleSemenAnimal;
begin
  inherited;

  F := TFRepDetalleSemenAnimal.Create(self);
  F.id_animal := BDBG.DataSource.DataSet.FieldValues['id_animal'];
  F.ShowModal;
  F.Destroy;

end;

procedure TFREPStockSemen.CBTipoAltaChange(Sender: TObject);
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

  ActualizarConsulta;
end;

procedure TFREPStockSemen.CBTipoAltaCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTipoAlta) then
  begin
       CBTipoAlta.Items.Delete(0);
       DelTipoAlta := true;
  end;
end;



end.
