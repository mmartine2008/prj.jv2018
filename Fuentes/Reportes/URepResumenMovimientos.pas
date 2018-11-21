unit URepResumenMovimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, DateTimePickerAuto,
  Buttons, PngImage, jpeg, Grids, DBGrids, UBDBGrid, Mask, DBCtrls,
  JvExExtCtrls, JvImage, UREPFichaAnimal;

type
  TFResumenMovimientos = class(TFUniversal)
    PFiltros: TPanel;
    DTPDesde: TDateTimePickerAuto;
    DTPHasta: TDateTimePickerAuto;
    CBRaza: TComboBox;
    CBCategoria: TComboBox;
    CBPotrero: TComboBox;
    CBRodeo: TComboBox;
    CBTipoRegistro: TComboBox;
    CBTipoBaja: TComboBox;
    CBOrigen: TComboBox;
    CBDestino: TComboBox;
    GBFiltros: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    IBQCategoria: TIBQuery;
    IBQRazas: TIBQuery;
    IBQTipoRegistro: TIBQuery;
    IBQRodeo: TIBQuery;
    IBQPotrero: TIBQuery;
    IBQOrigen: TIBQuery;
    IBQTipoBaja: TIBQuery;
    IBQDestino: TIBQuery;
    PGrillaDatos: TPanel;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    LExpExcel: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    GBGrilla: TGroupBox;
    BDBGDatosAnimales: TBitDBGrid;
    IBQDatosAnimales: TIBQuery;
    DSDatosAnimales: TDataSource;
    Label3: TLabel;
    EBuscar: TEdit;
    IBQDatosMov: TIBQuery;
    CBEstado: TComboBox;
    GroupBox1: TGroupBox;
    Button1: TButton;
    JvIBotonBuscar: TJvImage;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBChange(Sender: TObject);
    procedure CBRazaCloseUp(Sender: TObject);
    procedure CBTipoRegistroCloseUp(Sender: TObject);
    procedure CBCategoriaCloseUp(Sender: TObject);
    procedure CBPotreroCloseUp(Sender: TObject);
    procedure CBRodeoCloseUp(Sender: TObject);
    procedure CBDestinoCloseUp(Sender: TObject);
    procedure CBOrigenCloseUp(Sender: TObject);
    procedure CBTipoBajaCloseUp(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure EBuscarChange(Sender: TObject);
    procedure IPreviewClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure IExpExcelClick(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure CBEstadoCloseUp(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BDBGDatosAnimalesDblClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CargarCombo(titulo, sinfiltro, parametro : string; query : TIBQuery; combo : TComboBox);
    procedure SetearParametros(nombreComp, valor : string);
    procedure ActivarSQL(tipoFiltro : integer);
    procedure ActivarSQLExpRep;
    procedure ExportarExcel;
    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);
    procedure CargarTipoRegistro(raza : integer);
  public
    { Public declarations }
  end;

var
  FResumenMovimientos: TFResumenMovimientos;
  id_categoria, id_destino, id_origen, id_potrero, id_raza, id_rodeo, id_tiporegistro, id_tipobaja, id_estado, cambiofecha : integer;
  DelCategoria, DelDestino, DelOrigen, DelPotrero, DelRaza, DelRodeo, DelTipoRegistro, DelTipoBaja, DelEstado : boolean;
  SQLOriginalGrilla, SQLOriginalReporte, SQLAuxiliar : string;

implementation

uses UPrincipal,uTiposGlobales, UCartel, URepResumenMovimientosPreview;

{$R *.dfm}

procedure TFResumenMovimientos.CargarCombo(titulo, sinfiltro, parametro : string; query : TIBQuery; combo : TComboBox);
var i : integer;
begin

     query.First;
     combo.Items.Insert(0,titulo);
     combo.Items.Insert(1,sinfiltro);

     i := 2;
     while not(query.Eof) do
     begin
          combo.Items.Insert(i,query.FieldValues[parametro]);
          Inc(i);
          query.Next;
     end;

     query.First;
     combo.ItemIndex := 0; 

end;

procedure TFResumenMovimientos.FormCreate(Sender: TObject);
begin
  inherited;

  IBQCategoria.Close;
  IBQCategoria.Open;

  IBQDestino.Close;
  IBQDestino.Open;

  IBQOrigen.Close;
  IBQOrigen.Open;

  IBQPotrero.Close;
  IBQPotrero.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotrero.Open;

  IBQRazas.Close;
  IBQRazas.Open;

  IBQRodeo.Close;
  IBQRodeo.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRodeo.Open;

  IBQTipoBaja.Close;
  IBQTipoBaja.Open;

  DelCategoria := false;
  DelDestino := false;
  DelOrigen := false;
  DelPotrero := false;
  DelRaza := false;
  DelRodeo := false;
  DelTipoRegistro := false;
  DelTipoBaja := false;
  DelEstado := false;

  id_categoria := -1;
  id_destino := -1;
  id_origen := -1;
  id_potrero := -1;
  id_raza := -1;
  id_rodeo := -1;
  id_tiporegistro := -1;
  id_tipobaja := -1;
  id_estado := -1;
  cambiofecha := -1;

  CargarTipoRegistro(id_raza);

  SQLOriginalGrilla := 'select * from sp_resumen_mov(:estable, :fecha_desde, :fecha_hasta,  :categoria, :destino, :origen, :potrero, :raza, :rodeo, :tiporegistro, :tipobaja, :estado)';
  SQLOriginalReporte := 'select * from rep_datos_anim_movimientos(:establecimiento, :fecha_desde, :fecha_hasta, :categoria, :destino, :origen, :potrero, :raza, :rodeo, :tiporegistro, :tipobaja, :estado)';
  SQLAuxiliar := '';

end;

procedure TFResumenMovimientos.FormShow(Sender: TObject);
begin
  inherited;

  DTPDesde.Date := Now() - 365;
  DTPHasta.Date := Now();

  CargarCombo('CATEGORIA','(TODAS)','SINONIMO',IBQCategoria,CBCategoria);
  CargarCombo('DESTINO','(TODOS)','SINONIMO',IBQDestino,CBDestino);
  CargarCombo('ORIGEN','(TODOS)','SINONIMO',IBQOrigen,CBOrigen);
  CargarCombo('POTRERO','(TODOS)','NOMBRE',IBQPotrero,CBPotrero);
  CargarCombo('RAZA','(TODAS)','SINONIMO',IBQRazas,CBRaza);
  CargarCombo('RODEO','(TODOS)','NOMBRE',IBQRodeo,CBRodeo);
  CargarCombo('TIPO DE REGISTRO','(TODOS)','SINONIMO',IBQTipoRegistro,CBTipoRegistro);
  CargarCombo('TIPO DE BAJA','(TODAS)','SINONIMO',IBQTipoBaja,CBTipoBaja);


  CBEstado.ItemIndex := 0;
  IBQDatosAnimales.Close;
//  ActivarSQL(0);

end;

procedure TFResumenMovimientos.CBChange(Sender: TObject);
var texto, nombreComp : string;
begin

     nombreComp := uppercase(StringReplace((Sender as TComboBox).Name, 'CB', '', [rfReplaceAll]));
     texto := (Sender as TComboBox).Text;

     if ((texto = '(TODAS)') or (texto = '(TODOS)') or (texto = nombreComp) or (texto = 'TIPO DE REGISTRO') or (texto = 'TIPO DE BAJA')) then
     begin
          if (nombreComp = 'TIPOREGISTRO') then
             (Sender as TComboBox).Items.Insert(0,'TIPO DE REGISTRO')
          else
              if (nombreComp = 'TIPOBAJA') then
                 (Sender as TComboBox).Items.Insert(0,'TIPO DE BAJA')
              else
              begin
                 (Sender as TComboBox).Items.Insert(0,nombreComp);
              end;

          (Sender as TComboBox).ItemIndex := 0;    
          SetearParametros(nombreComp,'');
     end
     else
     begin
          SetearParametros(nombreComp,texto);
     end;
     IBQDatosAnimales.Close;
    // ActivarSQL(1);
end;

procedure TFResumenMovimientos.SetearParametros(nombreComp, valor : string);
begin
     if (nombreComp = 'CATEGORIA') then
     begin
          if (valor <> '') then
          begin
            if (IBQCategoria.Lookup('SINONIMO',valor,'ID_CATEGORIA') <> null) then
              id_categoria := IBQCategoria.Lookup('SINONIMO',valor,'ID_CATEGORIA');
          end
          else
          begin
              DelCategoria := false;
              id_categoria := -1;
          end;
     end;

     if (nombreComp = 'DESTINO') then
     begin
          if (valor <> '') then
          begin
            if (IBQDestino.Lookup('SINONIMO',valor,'ID_DEST_CABANIA') <> null) then
              id_destino := IBQDestino.Lookup('SINONIMO',valor,'ID_DEST_CABANIA');
          end
          else
          begin
              DelDestino := false;
              id_destino := -1;
          end;
     end;

     if (nombreComp = 'ORIGEN') then
     begin
          if (valor <> '') then
          begin
            if (IBQOrigen.Lookup('SINONIMO',valor,'ID_ORIGEN') <> null) then
              id_origen := IBQOrigen.Lookup('SINONIMO',valor,'ID_ORIGEN');
          end
          else
          begin
              DelOrigen := false;
              id_origen := -1;
          end;
     end;

     if (nombreComp = 'POTRERO') then
     begin
          if (valor <> '') then
          begin
            if (IBQPotrero.Lookup('NOMBRE',valor,'ID_POTRERO') <> null) then
              id_potrero := IBQPotrero.Lookup('NOMBRE',valor,'ID_POTRERO');
          end
          else
          begin
              DelPotrero := false;
              id_potrero := -1;
          end;
     end;

     if (nombreComp = 'RAZA') then
     begin
          if (valor <> '') then
          begin
            if (IBQRazas.Lookup('SINONIMO',valor,'ID_RAZA') <> null) then
              id_raza := IBQRazas.Lookup('SINONIMO',valor,'ID_RAZA');
          end
          else
          begin
              DelRaza := false;
              id_raza := -1;
          end;

          CargarTipoRegistro(id_raza);
     end;

     if (nombreComp = 'RODEO') then
     begin
          if (valor <> '') then
          begin
            if (IBQRodeo.Lookup('NOMBRE',valor,'ID_RODEO') <> null) then
              id_rodeo := IBQRodeo.Lookup('NOMBRE',valor,'ID_RODEO');
          end
          else
          begin
              DelRodeo := false;
              id_rodeo := -1;
          end;
     end;

     if (nombreComp = 'TIPOREGISTRO') then
     begin
          if (valor <> '') then
          begin
            if (IBQTipoRegistro.Lookup('SINONIMO',valor,'ID_SUBCATEGORIA') <> null) then
              id_tiporegistro := IBQTipoRegistro.Lookup('SINONIMO',valor,'ID_SUBCATEGORIA');
          end
          else
          begin
              DelTipoRegistro := false;
              id_tiporegistro := -1;
          end;
     end;

     if (nombreComp = 'TIPOBAJA') then
     begin
          if (valor <> '') then
          begin
            if (IBQTipoBaja.Lookup('SINONIMO',valor,'ID_TIPO_BAJA') <> null) then
              id_tipobaja := IBQTipoBaja.Lookup('SINONIMO',valor,'ID_TIPO_BAJA');
          end
          else
          begin
              DelTipoBaja := false;
              id_tipobaja := -1;
          end;
     end;

     if (nombreComp = 'ESTADO') then
     begin
          if (valor <> '') then
          begin
            if (valor = 'ACTIVO') then
              id_estado := 1;

            if (valor = 'INACTIVO') then
              id_estado := 0;
          end
          else
          begin
              DelEstado := false;
              id_estado := -1;
          end;
     end;

end;

procedure TFResumenMovimientos.ActivarSQL(tipoFiltro : integer);
var cartel : TCartel;
begin
    cartel := TCartel.getInstance;
    cartel.abrircartel('Buscando animales. AGUARDE UNOS SEGUNDOS.');


    if (tipoFiltro = 0) then
    begin
        IBQDatosAnimales.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
        IBQDatosAnimales.ParamByName('fecha_desde').AsDateTime := DTPDesde.DateTime;
        IBQDatosAnimales.ParamByName('fecha_hasta').AsDateTime := DTPHasta.DateTime;
        IBQDatosAnimales.ParamByName('categoria').Value := null;
        IBQDatosAnimales.ParamByName('destino').Value := null;
        IBQDatosAnimales.ParamByName('origen').Value := null;
        IBQDatosAnimales.ParamByName('potrero').Value := null;
        IBQDatosAnimales.ParamByName('raza').Value := null;
        IBQDatosAnimales.ParamByName('rodeo').Value := null;
        IBQDatosAnimales.ParamByName('tiporegistro').Value := null;
        IBQDatosAnimales.ParamByName('tipobaja').Value := null;
        IBQDatosAnimales.ParamByName('estado').Value := null;
    end
    else
    begin
         IBQDatosAnimales.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;

         if (cambiofecha <> -1) then
         begin
              IBQDatosAnimales.ParamByName('fecha_desde').AsDateTime := DTPDesde.DateTime;
              IBQDatosAnimales.ParamByName('fecha_hasta').AsDateTime := DTPHasta.DateTime;
         end
         else
         begin
              IBQDatosAnimales.ParamByName('fecha_desde').Value := Null;
              IBQDatosAnimales.ParamByName('fecha_hasta').Value := Null;
         end;

         if (id_categoria <> -1) then
            IBQDatosAnimales.ParamByName('categoria').AsInteger := id_categoria
         else
            IBQDatosAnimales.ParamByName('categoria').Value := null;

         if (id_destino <> -1) then
            IBQDatosAnimales.ParamByName('destino').AsInteger := id_destino
         else
            IBQDatosAnimales.ParamByName('destino').Value := Null;

         if (id_origen <> -1) then
            IBQDatosAnimales.ParamByName('origen').AsInteger := id_origen
         else
            IBQDatosAnimales.ParamByName('origen').Value := Null;

         if (id_potrero <> -1) then
            IBQDatosAnimales.ParamByName('potrero').AsInteger := id_potrero
         else
            IBQDatosAnimales.ParamByName('potrero').Value := Null;

         if (id_raza <> -1) then
            IBQDatosAnimales.ParamByName('raza').AsInteger := id_raza
         else
            IBQDatosAnimales.ParamByName('raza').Value := Null;

         if (id_rodeo <> -1) then
            IBQDatosAnimales.ParamByName('rodeo').AsInteger := id_rodeo
         else
            IBQDatosAnimales.ParamByName('rodeo').Value := Null;

         if (id_tiporegistro <> -1) then
            IBQDatosAnimales.ParamByName('tiporegistro').AsInteger := id_tiporegistro
         else
            IBQDatosAnimales.ParamByName('tiporegistro').Value := Null;

         if (id_tipobaja <> -1) then
            IBQDatosAnimales.ParamByName('tipobaja').AsInteger := id_tipobaja
         else
            IBQDatosAnimales.ParamByName('tipobaja').Value := Null;

         if (id_estado <> -1) then
            IBQDatosAnimales.ParamByName('estado').AsInteger := id_estado
         else
            IBQDatosAnimales.ParamByName('estado').Value := Null;
    end;

    IBQDatosAnimales.Open;
    IBQDatosAnimales.Last;
    IBQDatosAnimales.First;

    cartel.cerrarcartel;
    cartel.FreeInstance;

    GBGrilla.Caption := '  Cantidad de animales: ' + IntToStr(IBQDatosAnimales.RecordCount) + '  ';
end;

procedure TFResumenMovimientos.CBRazaCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelRaza) then
  begin
       CBRaza.Items.Delete(0);
       DelRaza := true;
  end;
end;

procedure TFResumenMovimientos.CBTipoRegistroCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelTipoRegistro) then
  begin
       CBTipoRegistro.Items.Delete(0);
       DelTipoRegistro := true;
  end;
end;

procedure TFResumenMovimientos.CBCategoriaCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelCategoria) then
  begin
       CBCategoria.Items.Delete(0);
       DelCategoria := true;
  end;
end;

procedure TFResumenMovimientos.CBPotreroCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelPotrero) then
  begin
    CBPotrero.Items.Delete(0);
    DelPotrero := true;
  end;
end;

procedure TFResumenMovimientos.CBRodeoCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelRodeo) then
  begin
    CBRodeo.Items.Delete(0);
    DelRodeo := true;
  end;
end;

procedure TFResumenMovimientos.CBDestinoCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelDestino) then
  begin
    CBDestino.Items.Delete(0);
    DelDestino := true;
  end;
end;

procedure TFResumenMovimientos.CBOrigenCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelOrigen) then
  begin
       CBOrigen.Items.Delete(0);
       DelOrigen := true;
  end;
end;

procedure TFResumenMovimientos.CBTipoBajaCloseUp(Sender: TObject);
begin
  inherited;

  if((CBTipoBaja.Text = 'TIPO DE BAJA') or (CBTipoBaja.Text = '') or (CBTipoBaja.Text = '(TODAS)'))then
    begin
      Label1.Enabled := False;
      Label2.Enabled := False;
      DTPDesde.Enabled := False;
      DTPHasta.Enabled := False;
    end
  else
    begin
      Label1.Enabled := True;
      Label2.Enabled := True;
      DTPDesde.Enabled := True;
      DTPHasta.Enabled := True;
      DTPDesdeChange(Self);
    end;
  if not(DelTipoBaja) then
  begin
    CBTipoBaja.Items.Delete(0);
    DelTipoBaja := true;
  end;
end;

procedure TFResumenMovimientos.DTPHastaChange(Sender: TObject);
begin
  inherited;

  cambiofecha := 0;
  IBQDatosAnimales.Close;
//  ActivarSQL(1);
end;

procedure TFResumenMovimientos.EBuscarChange(Sender: TObject);
var cadena : string;
begin
  inherited;

  if (EBuscar.Text <> '') then
  begin
       cadena := ' where (id_rp like ''%' + EBuscar.Text + '%'' ) or (id_hba like ''%' + EBuscar.Text + '%'' ) or (id_pc like ''%' + EBuscar.Text + '%'' ) or (id_senasa like ''%' + EBuscar.Text + '%'' ) or (nombre like ''%' + EBuscar.Text + '%'' ) or (apodo like ''%' + EBuscar.Text + '%'')';
       SQLAuxiliar := SQLOriginalGrilla + cadena + ' order by id_rp';

       IBQDatosAnimales.Close;
       IBQDatosAnimales.SQL.Clear;
       IBQDatosAnimales.SQL.Add(SQLAuxiliar);

      // ActivarSQL(1);
  end
  else
  begin
       SQLAuxiliar := '';
       IBQDatosAnimales.Close;
       IBQDatosAnimales.SQL.Clear;
       IBQDatosAnimales.SQL.Add(SQLOriginalGrilla + ' order by id_rp');
    //   ActivarSQL(1); 
  end;
end;

procedure TFResumenMovimientos.IPreviewClick(Sender: TObject);
var F : TFRepResumenMovimientosPreview;
    cartel : TCartel;
begin
  cartel := TCartel.getInstance;
  cartel.abrircartel('Generando Reporte. AGUARDE UNOS SEGUNDOS.');

  F := TFRepResumenMovimientosPreview.Create(self);

  ActivarSQLExpRep;

  cartel.cerrarcartel;
  cartel.FreeInstance;

  F.ShowModal;
  F.Destroy;

end;

procedure TFResumenMovimientos.ISalirClick(Sender: TObject);
begin
  inherited;

  Close();
end;

procedure TFResumenMovimientos.IExpExcelClick(Sender: TObject);
var cartel : TCartel;
begin
  inherited;
  if SDXLS.Execute then
  begin
    cartel := TCartel.getInstance;
    cartel.abrircartel('Exportando datos a Excel...');
    try
      ActivarSQLExpRep;
      ExportarExcel;
      DTXLS.SaveToFile(SDXLS.FileName);
    except
    end;
    cartel.cerrarcartel;
    cartel.FreeInstance;
  end;

end;

procedure TFResumenMovimientos.ExportarExcel;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQDatosMov;
  DTXLS.Title.Text:= 'LISTADO DE ANIMALES.';

  AgregarColumnaExcel(column,taLeftJustify,2900,'id_rp','RP ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'id_hba','HBA ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'id_pc','ABA ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'id_senasa','SENASA ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'nombre','NOMBRE ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'apodo','APODO ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'fecha_nacimiento','FECHA NACIMIENTO',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'nombre_raza','RAZA',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'nombre_categ','CATEGORIA',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'tipo_reg','T.R.',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'dato_origen','ORIGEN ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'nombre_criador','CRIADOR ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'nombre_propietario','PROPIETARIO ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'dato_alta','TIPO ALTA',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'fecha_alta','FECHA ALTA',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'precio_bruto_alta','PREC. BRUTO ALTA',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'precio_unitario_alta','PREC. UNIT. ALTA',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'gastos_alta','GASTOS ALTA',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'dta_alta','DTA ALTA',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'dato_baja','TIPO BAJA',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'fecha_baja','FECHA BAJA',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'precio_baja','PREC. BAJA',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'pesodestino_baja','PESO DEST. BAJA',True);
  AgregarColumnaExcel(column,taLeftJustify,2900,'dta_baja','DTA BAJA',True);
  
end;

procedure TFResumenMovimientos.AgregarColumnaExcel(var column: TxlColumn;
  alig: TAlignment; coldwidth: Integer; datafield, title: String;
  save: Boolean);
begin
    column:= TxlColumn.Create(nil);
    column:= DTXLS.Columns.Add;
    column.Alignment:= alig;
    column.ColWidth:= coldwidth;
    column.DataField:= datafield;
    column.Save:= save;
    column.Title:= title;
end;

procedure TFResumenMovimientos.ActivarSQLExpRep;
var cadena, SQLAux : string;
begin

  SQLAux := '';

  if (EBuscar.Text <> '') then
  begin
       cadena := ' where (id_rp like ''%' + EBuscar.Text + '%'' ) or (id_hba like ''%' + EBuscar.Text + '%'' ) or (id_pc like ''%' + EBuscar.Text + '%'' ) or (id_senasa like ''%' + EBuscar.Text + '%'' ) or (nombre like ''%' + EBuscar.Text + '%'' ) or (apodo like ''%' + EBuscar.Text + '%'')';
       SQLAux := SQLOriginalReporte + cadena + ' order by id_rp';
       IBQDatosMov.Close;
       IBQDatosMov.SQL.Clear;
       IBQDatosMov.SQL.Add(SQLAux);
  end
  else
  begin
       IBQDatosMov.Close;
       IBQDatosMov.SQL.Clear;
       IBQDatosMov.SQL.Add(SQLOriginalReporte + ' order by id_rp');
  end;

  IBQDatosMov.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;

  if (cambiofecha <> -1) then
  begin
       IBQDatosMov.ParamByName('fecha_desde').AsDate := DTPDesde.Date;
       IBQDatosMov.ParamByName('fecha_hasta').AsDate := DTPHasta.Date;
  end
  else
  begin
       IBQDatosMov.ParamByName('fecha_desde').Value := Null;
       IBQDatosMov.ParamByName('fecha_hasta').Value := Null;
  end;

  if (id_categoria <> -1) then
       IBQDatosMov.ParamByName('categoria').AsInteger := id_categoria
  else
       IBQDatosMov.ParamByName('categoria').Value := null;

  if (id_destino <> -1) then
       IBQDatosMov.ParamByName('destino').AsInteger := id_destino
  else
       IBQDatosMov.ParamByName('destino').Value := Null;

  if (id_origen <> -1) then
       IBQDatosMov.ParamByName('origen').AsInteger := id_origen
  else
       IBQDatosMov.ParamByName('origen').Value := Null;

  if (id_potrero <> -1) then
       IBQDatosMov.ParamByName('potrero').AsInteger := id_potrero
  else
       IBQDatosMov.ParamByName('potrero').Value := Null;

  if (id_raza <> -1) then
       IBQDatosMov.ParamByName('raza').AsInteger := id_raza
  else
       IBQDatosMov.ParamByName('raza').Value := Null;

  if (id_rodeo <> -1) then
       IBQDatosMov.ParamByName('rodeo').AsInteger := id_rodeo
  else
       IBQDatosMov.ParamByName('rodeo').Value := Null;

  if (id_tiporegistro <> -1) then
       IBQDatosMov.ParamByName('tiporegistro').AsInteger := id_tiporegistro
  else
       IBQDatosMov.ParamByName('tiporegistro').Value := Null;

  if (id_tipobaja <> -1) then
       IBQDatosMov.ParamByName('tipobaja').AsInteger := id_tipobaja
  else
       IBQDatosMov.ParamByName('tipobaja').Value := Null;

  if (id_estado <> -1) then
        IBQDatosMov.ParamByName('estado').AsInteger := id_estado
  else
        IBQDatosMov.ParamByName('estado').Value := Null;

  IBQDatosMov.Open;
  IBQDatosMov.First;
end;

procedure TFResumenMovimientos.CargarTipoRegistro(raza : integer);
begin

     if (raza <> -1) then
     begin
           IBQTipoRegistro.Close;
           IBQTipoRegistro.SQL.Clear;
           IBQTipoRegistro.SQL.Add('select cs.* from cod_razas cr join rel_subcategoria_raza rsr on cr.id_raza = rsr.id_raza join cod_subcategorias cs on cs.id_subcategoria = rsr.id_subcategoria where (cr.visible = 1) and (cr.id_raza = :raza)');
           IBQTipoRegistro.ParamByName('raza').AsInteger := raza;
           IBQTipoRegistro.Open;
     end
     else
     begin
          IBQTipoRegistro.Close;
          IBQTipoRegistro.SQL.Clear;
          IBQTipoRegistro.SQL.Add('select cs.* from cod_razas cr join rel_subcategoria_raza rsr on cr.id_raza = rsr.id_raza join cod_subcategorias cs on cs.id_subcategoria = rsr.id_subcategoria where (cr.visible = 1)');
          IBQTipoRegistro.Open;
     end;

     IBQTipoRegistro.First;
     CBTipoRegistro.Clear;
     CBTipoRegistro.AddItem('TIPO DE REGISTRO',nil);
     CBTipoRegistro.AddItem('(TODOS)',nil);

     while not(IBQTipoRegistro.Eof) do
     begin
          CBTipoRegistro.AddItem(IBQTipoRegistro.FieldValues['sinonimo'],nil);
          IBQTipoRegistro.Next;
     end;

     CBTipoRegistro.ItemIndex := 0;
end;

procedure TFResumenMovimientos.DTPDesdeChange(Sender: TObject);
begin
  inherited;

  cambiofecha := 0;
  IBQDatosAnimales.Close;
 // ActivarSQL(1);
  
end;

procedure TFResumenMovimientos.CBEstadoCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelEstado) then
  begin
       CBEstado.Items.Delete(0); 
       DelEstado := true;
  end;

end;

procedure TFResumenMovimientos.Button1Click(Sender: TObject);
begin
  inherited;
  ActivarSQL(1);
end;

procedure TFResumenMovimientos.BDBGDatosAnimalesDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (BDBGDatosAnimales.SelectedIndex = BDBGDatosAnimales.ColumnByField('id_rp').Index) then
  begin
    if not(BDBGDatosAnimales.DataSource.DataSet.IsEmpty) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := BDBGDatosAnimales.DataSource.DataSet.fieldByName('id_animal').AsInteger;
      F.modificar := false;
      F.BAgregarEvento.Visible:=true;
      F.BEliminar.Visible:=true;
      F.ShowModal;
      F.Destroy;
     end;
  end;
end;

procedure TFResumenMovimientos.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  Button1.OnClick(Sender);
end;

end.
