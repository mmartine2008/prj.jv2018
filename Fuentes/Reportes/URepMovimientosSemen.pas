unit URepMovimientosSemen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, PngImage, jpeg, Grids,
  DBGrids, UBDBGrid, JvExExtCtrls, JvImage;

type
  TFRepMovimientosSemen = class(TFUniversal)
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IPreview: TImage;
    LPreview: TLabel;
    PFiltros: TPanel;
    PCliente: TPanel;
    GBFiltros: TGroupBox;
    LBuscar: TLabel;
    EBuscar: TEdit;
    CBxTipoAlta: TComboBox;
    CBxTiposBaja: TComboBox;
    LDesde: TLabel;
    LHasta: TLabel;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    IBQCodTiposBajaSemen: TIBQuery;
    GBDetalle: TGroupBox;
    BDBGDetalle: TBitDBGrid;
    IBQRepMovimientos: TIBQuery;
    DSMovimientos: TDataSource;
    IBuscarPartida: TImage;
    Label1: TLabel;
    EBuscarPartida: TEdit;
    Image1: TImage;
    IDeshacerBaja: TImage;
    LDeshacerBaja: TLabel;
    IBQUndoBaja: TIBQuery;
    IListadoVentas: TImage;
    LListadoVentas: TLabel;
    CBTipoAlta: TComboBox;
    IBQTipoAlta: TIBQuery;
    IBQParametroDeTerceros: TIBQuery;
    IExcel: TImage;
    LExcel: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Inicializar;
    procedure CBxTipoAltaChange(Sender: TObject);
    procedure CBxTipoAltaCloseUp(Sender: TObject);
    procedure CBxTiposBajaChange(Sender: TObject);
    procedure CBxTiposBajaCloseUp(Sender: TObject);
    procedure EBuscarChange(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure DTPDesdeCloseUp(Sender: TObject);
    procedure DTPHastaCloseUp(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure IBuscarPartidaClick(Sender: TObject);
    procedure IPreviewClick(Sender: TObject);
    procedure EBuscarPartidaChange(Sender: TObject);
    procedure EBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure EBuscarPartidaKeyPress(Sender: TObject; var Key: Char);
    procedure BDBGDetalleCellClick(Column: TColumn);
    procedure IDeshacerBajaClick(Sender: TObject);
    procedure BDBGDetalleHScroll(Sender: TObject; Code: Integer;
      Pos: Smallint);
    procedure BDBGDetalleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDBGDetalleKeyPress(Sender: TObject; var Key: Char);
    procedure BDBGDetalleKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDBGDetalleTitleClick(Column: TColumn);
    procedure IListadoVentasClick(Sender: TObject);
    procedure CBTipoAltaChange(Sender: TObject);
    procedure CBTipoAltaCloseUp(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
  private
    orden_consulta, columna_anterior : String;
    procedure ActualizarConsulta;
  public
    { Public declarations }
  end;

var
  FRepMovimientosSemen: TFRepMovimientosSemen;
  DelTipoAlta, DelTipoBaja, DelAlta, busqueda, busquedaPartida : boolean;
  id_tipo_alta, id_tipo_baja, id_alta : integer;

implementation

{$R *.dfm}

uses UPrincipal,uTiposGlobales, URepMovimientosSemenPreview, UMensajeHuella, URepListadoVentas;

procedure TFRepMovimientosSemen.FormShow(Sender: TObject);
begin
  inherited;

  Inicializar;

  IBQRepMovimientos.Close;
  IBQRepMovimientos.SQL.Clear;
  IBQRepMovimientos.SQL.Add('select * from rep_movimientos_semen(:desde,:hasta,:establecimiento)');
  IBQRepMovimientos.SQL.Add(' order by fecha_movimiento asc');
  IBQRepMovimientos.ParamByName('desde').AsDate := DTPDesde.Date;
  IBQRepMovimientos.ParamByName('hasta').AsDate := DTPHasta.Date;
  IBQRepMovimientos.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRepMovimientos.Open;
  IBQRepMovimientos.Last;
  IBQRepMovimientos.First;

  IDeshacerBaja.Visible := false;
  LDeshacerBaja.Visible := false;

  orden_consulta := ' order by fecha_movimiento asc';
  columna_anterior := '';

  IBQParametroDeTerceros.Close;
  IBQParametroDeTerceros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQParametroDeTerceros.Open;
  CBTipoAlta.Visible := false;
  if IBQParametroDeTerceros.FieldValues['valor'] <> null then
    CBTipoAlta.Visible := IBQParametroDeTerceros.FieldByName('valor').AsString = 'S';
end;

procedure TFRepMovimientosSemen.Inicializar;
var i : integer;
begin

  id_tipo_alta := -1;
  id_tipo_baja := -1;
  id_alta := -1;

  DelAlta := false;
  DelTipoAlta := false;
  DelTipoBaja := false;
  busqueda := false;
  busquedaPartida := false;

  IBQCodTiposBajaSemen.Close;
  IBQCodTiposBajaSemen.Open;
  IBQCodTiposBajaSemen.First;

  CBxTiposBaja.Items.Insert(0,'TIPOS DE BAJA');
  CBxTiposBaja.Items.Insert(1,'SIN FILTRO');
  CBxTiposBaja.Items.Insert(2,'(TODOS)');
  i := 3;
  while not(IBQCodTiposBajaSemen.Eof) do
  begin
       CBxTiposBaja.Items.Insert(i,IBQCodTiposBajaSemen.FieldValues['nombre_tipo_baja_semen']);
       IBQCodTiposBajaSemen.Next;
       Inc(i);
  end;
  CBxTiposBaja.ItemIndex := 0;

  CBxTipoAlta.ItemIndex := 0;

  DTPDesde.Date := Now() - 365;
  DTPHasta.Date := Now();

  EBuscar.Text := '';

  IBQTipoAlta.Close;
  IBQTipoAlta.Open;
  IBQTipoAlta.First;
  CBTipoAlta.Items.Clear;
  CBTipoAlta.Items.Insert(0,'TIPO DE INGRESO');
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

procedure TFRepMovimientosSemen.CBxTipoAltaChange(Sender: TObject);
begin
  inherited;

  if ((CBxTipoAlta.Text <> 'TIPOS DE ALTA') and (CBxTipoAlta.Text <> '') and (CBxTipoAlta.Text <> 'SIN FILTRO')) then
  begin
       if (CBxTipoAlta.Text = 'COMPRA') then
          id_tipo_alta := 1;
       if (CBxTipoAlta.Text = 'EXTRACCION') then
          id_tipo_alta := 2;
       if (CBxTipoAlta.Text = '(TODAS)') then
       begin
            id_tipo_alta := 0;
       end;
  end
  else
  begin
       id_tipo_alta := -1;
       CBxTipoAlta.Items.Insert(0,'TIPOS DE ALTA');
       CBxTipoAlta.ItemIndex := 0;
       DelTipoAlta := false;
  end;
  ActualizarConsulta;
end;

procedure TFRepMovimientosSemen.CBxTipoAltaCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelTipoAlta) then
  begin
       CBxTipoAlta.Items.Delete(0);
       DelTipoAlta := true; 
  end;
end;

procedure TFRepMovimientosSemen.CBxTiposBajaChange(Sender: TObject);
begin
  inherited;

  if ((CBxTiposBaja.Text <> 'TIPOS DE BAJA') and (CBxTiposBaja.Text <> '') and (CBxTiposBaja.Text <> 'SIN FILTRO')) then
  begin
       if (CBxTiposBaja.Text = '(TODOS)') then
          id_tipo_baja := 0
       else
          id_tipo_baja := IBQCodTiposBajaSemen.Lookup('nombre_tipo_baja_semen',CBxTiposBaja.Text,'id_tipo_baja_semen');
  end
  else
  begin
       id_tipo_baja := -1;
       CBxTiposBaja.Items.Insert(0,'TIPOS DE BAJA');
       CBxTiposBaja.ItemIndex := 0;
       DelTipoBaja := false;
  end;
  ActualizarConsulta;
end;

procedure TFRepMovimientosSemen.CBxTiposBajaCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelTipoBaja) then
  begin
       CBxTiposBaja.Items.Delete(0);
       DelTipoBaja := true; 
  end;
end;

procedure TFRepMovimientosSemen.EBuscarChange(Sender: TObject);
begin
  inherited;

  if (EBuscar.Text <> '') then
    busqueda := true
  else
    busqueda := false;

  ActualizarConsulta;
end;

procedure TFRepMovimientosSemen.ActualizarConsulta;
var cadena, sql : string;
begin

  sql := 'select * from rep_movimientos_semen(:desde,:hasta,:establecimiento)';

  IBQRepMovimientos.Close;
  IBQRepMovimientos.SQL.Clear;

  cadena := '';
  if (busqueda) then
  begin
    if (AnsiPos('where',sql) <> 0) then
      cadena := ' and ((rp_toro like ''%'+EBuscar.Text+'%'') or (hba_toro like ''%'+EBuscar.Text+'%'') or (aba_toro like ''%'+EBuscar.Text+'%'') or (nombre_toro like ''%'+EBuscar.Text+'%'') or (apodo_toro like ''%'+EBuscar.Text+'%''))'
    else
      cadena := ' where ((rp_toro like ''%'+EBuscar.Text+'%'') or (hba_toro like ''%'+EBuscar.Text+'%'') or (aba_toro like ''%'+EBuscar.Text+'%'') or (nombre_toro like ''%'+EBuscar.Text+'%'') or (apodo_toro like ''%'+EBuscar.Text+'%''))'
  end;
  sql := sql + cadena;
  cadena := '';

  if (busquedaPartida) then
  begin
      if (AnsiPos('where',sql) <> 0) then
      cadena := ' and ((partida like ''%'+EBuscarPartida.Text+'%''))'
    else
      cadena := ' where ((partida like ''%'+EBuscarPartida.Text+'%''))'
  end;

  sql := sql + cadena;
  cadena := '';

  if (id_tipo_alta <> -1) then
  begin
     if (id_tipo_alta <> 0) then
     begin
           if (AnsiPos('where',sql) <> 0) then
           begin
              if (id_tipo_alta = 1) then
                cadena := ' and (tipo_movimiento = ''COMPRA'')';

              if (id_tipo_alta = 2) then
                cadena := ' and (tipo_movimiento = ''EXTRACCION'')';
           end
           else
           begin
              if (id_tipo_alta = 1) then
                cadena := ' where (tipo_movimiento = ''COMPRA'')';

              if (id_tipo_alta = 2) then
                cadena := ' where (tipo_movimiento = ''EXTRACCION'')';
           end;
     end
     else
     begin
          if (AnsiPos('where',sql) <> 0) then
          begin
               cadena := ' and ((tipo_movimiento = ''COMPRA'') or (tipo_movimiento = ''EXTRACCION''))';
          end
          else
          begin
               cadena := ' where ((tipo_movimiento = ''COMPRA'') or (tipo_movimiento = ''EXTRACCION''))';
          end;
     end;
  end;

  sql := sql + cadena;
  cadena := '';

  if (id_tipo_baja <> -1) then
  begin
     if (id_tipo_baja <> 0) then
     begin
         if (AnsiPos('where',sql) <> 0) then
         begin
            if (id_tipo_baja = 1) then
              cadena := ' and (tipo_movimiento = ''VENTA'')';

            if (id_tipo_baja = 2) then
              cadena := ' and (tipo_movimiento = ''BONIFICACION'')';

            if (id_tipo_baja = 3) then
              cadena := ' and (tipo_movimiento = ''ELIMINAR DOSIS'')';

            if (id_tipo_baja = 4) then
              cadena := ' and (tipo_movimiento = ''INSEMINACION'')';
         end
         else
         begin
            if (id_tipo_baja = 1) then
              cadena := ' where (tipo_movimiento = ''VENTA'')';

            if (id_tipo_baja = 2) then
              cadena := ' where (tipo_movimiento = ''BONIFICACION'')';

            if (id_tipo_baja = 3) then
              cadena := ' where (tipo_movimiento = ''ELIMINAR DOSIS'')';

            if (id_tipo_baja = 4) then
              cadena := ' where (tipo_movimiento = ''INSEMINACION'')';
         end;
     end
     else
     begin
          if (AnsiPos('where',sql) <> 0) then
            cadena := ' and ((tipo_movimiento = ''VENTA'') or (tipo_movimiento = ''BONIFICACION'') or (tipo_movimiento = ''ELIMINAR DOSIS'') or (tipo_movimiento = ''INSEMINACION''))'
          else
            cadena := 'where  ((tipo_movimiento = ''VENTA'') or (tipo_movimiento = ''BONIFICACION'') or (tipo_movimiento = ''ELIMINAR DOSIS'') or (tipo_movimiento = ''INSEMINACION''))';
     end;
  end;
  sql := sql + cadena;
  cadena := '';

  if id_alta <> -1 then
  begin
    if (AnsiPos('where',sql) <> 0) then
      cadena := ' and id_animal in (select ee.animal from eve_eventos ee join eve_alta_directa ead on ee.id_evento = ead.id_evento where ead.tipo = '+IntToStr(id_alta)+')'
    else
      cadena := ' where id_animal in (select ee.animal from eve_eventos ee join eve_alta_directa ead on ee.id_evento = ead.id_evento where ead.tipo = '+IntToStr(id_alta)+')';
  end;
  sql := sql + cadena;
  cadena := '';

  IBQRepMovimientos.SQL.Add(sql);
  IBQRepMovimientos.SQL.Add(orden_consulta);
  IBQRepMovimientos.ParamByName('desde').AsDate := DTPDesde.Date;
  IBQRepMovimientos.ParamByName('hasta').AsDate := DTPHasta.Date;
  IBQRepMovimientos.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRepMovimientos.Open;
  IBQRepMovimientos.Last;
  IBQRepMovimientos.First;

  GBDetalle.Caption := 'Detalle de Animales ('+IntToStr(IBQRepMovimientos.RecordCount)+')';
  
end;

procedure TFRepMovimientosSemen.ISalirClick(Sender: TObject);
begin
  inherited;

  Close();
end;

procedure TFRepMovimientosSemen.DTPDesdeCloseUp(Sender: TObject);
begin
  inherited;
  ActualizarConsulta;
end;

procedure TFRepMovimientosSemen.DTPHastaCloseUp(Sender: TObject);
begin
  inherited;
  ActualizarConsulta;
end;

procedure TFRepMovimientosSemen.DTPDesdeChange(Sender: TObject);
begin
  inherited;
  ActualizarConsulta;
end;

procedure TFRepMovimientosSemen.DTPHastaChange(Sender: TObject);
begin
  inherited;
  ActualizarConsulta;
end;

procedure TFRepMovimientosSemen.IBuscarPartidaClick(Sender: TObject);
begin
  inherited;
  ActualizarConsulta;
end;

procedure TFRepMovimientosSemen.IPreviewClick(Sender: TObject);
var F : TFRepMovimientosSemenPreview;
begin
  inherited;

  F := TFRepMovimientosSemenPreview.Create(self);

  F.ShowModal;
  F.QRMovimientosSemen.DataSet := IBQRepMovimientos;
  F.Destroy;

end;

procedure TFRepMovimientosSemen.EBuscarPartidaChange(Sender: TObject);
begin
  inherited;
  if (EBuscarPartida.Text <> '') then
    busquedaPartida := true
  else
    busquedaPartida := false;

  ActualizarConsulta;
end;

procedure TFRepMovimientosSemen.EBuscarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if (key = #13) then
  begin
    if (EBuscar.Text <> '') then
      busqueda := true
    else
      busqueda := false;

    ActualizarConsulta;
  end;

end;

procedure TFRepMovimientosSemen.EBuscarPartidaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if (key = #13) then
  begin
    if (EBuscarPartida.Text <> '') then
      busquedaPartida := true
    else
      busquedaPartida := false;

    ActualizarConsulta;
  end;

end;

procedure TFRepMovimientosSemen.BDBGDetalleCellClick(Column: TColumn);
begin
  inherited;

  if (IBQRepMovimientos.FieldValues['id_tipo_movimiento_baja'] <> null) then
  begin
       IDeshacerBaja.Visible := true;
       LDeshacerBaja.Visible := true;
  end
  else
  begin
       IDeshacerBaja.Visible := false;
       LDeshacerBaja.Visible := false;
  end;

end;

procedure TFRepMovimientosSemen.IDeshacerBajaClick(Sender: TObject);
begin
  inherited;

  if (MostrarMensaje(tmConsulta,'¿Desea realmente deshacer la baja de semen?') = mrYes ) then
  begin
      try
        IBQUndoBaja.Close;
        IBQUndoBaja.ParamByName('id_animal').AsInteger := IBQRepMovimientos.FieldValues['id_animal'];
        IBQUndoBaja.ParamByName('id_tipo_baja').AsInteger := IBQRepMovimientos.FieldValues['id_tipo_movimiento_baja'];
        IBQUndoBaja.ParamByName('fecha_baja').AsDate := IBQRepMovimientos.FieldValues['fecha_movimiento'];
        IBQUndoBaja.ParamByName('dosis').AsInteger := IBQRepMovimientos.FieldValues['dosis_movimiento'];
        IBQUndoBaja.Open;

        FPrincipal.IBTPrincipal.CommitRetaining;

        ActualizarConsulta;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
  end;

end;

procedure TFRepMovimientosSemen.BDBGDetalleHScroll(Sender: TObject;
  Code: Integer; Pos: Smallint);
begin
  inherited;

  if (IBQRepMovimientos.FieldValues['id_tipo_movimiento_baja'] <> null) then
  begin
       IDeshacerBaja.Visible := true;
       LDeshacerBaja.Visible := true;
  end
  else
  begin
       IDeshacerBaja.Visible := false;
       LDeshacerBaja.Visible := false;
  end;
  

end;

procedure TFRepMovimientosSemen.BDBGDetalleKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if (IBQRepMovimientos.FieldValues['id_tipo_movimiento_baja'] <> null) then
  begin
       IDeshacerBaja.Visible := true;
       LDeshacerBaja.Visible := true;
  end
  else
  begin
       IDeshacerBaja.Visible := false;
       LDeshacerBaja.Visible := false;
  end;

end;

procedure TFRepMovimientosSemen.BDBGDetalleKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (IBQRepMovimientos.FieldValues['id_tipo_movimiento_baja'] <> null) then
  begin
       IDeshacerBaja.Visible := true;
       LDeshacerBaja.Visible := true;
  end
  else
  begin
       IDeshacerBaja.Visible := false;
       LDeshacerBaja.Visible := false;
  end;

end;

procedure TFRepMovimientosSemen.BDBGDetalleKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (IBQRepMovimientos.FieldValues['id_tipo_movimiento_baja'] <> null) then
  begin
       IDeshacerBaja.Visible := true;
       LDeshacerBaja.Visible := true;
  end
  else
  begin
       IDeshacerBaja.Visible := false;
       LDeshacerBaja.Visible := false;
  end;

end;

procedure TFRepMovimientosSemen.BDBGDetalleTitleClick(Column: TColumn);
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
  ActualizarConsulta;
end;

procedure TFRepMovimientosSemen.IListadoVentasClick(Sender: TObject);
var F : TFListadoVentas;
    sql1, sql2, sql3, sqlGral, sqlConsulta : string;
begin
  inherited;

  sqlConsulta := IBQRepMovimientos.SQL.GetText;

  sqlConsulta := StringReplace(sqlConsulta,'select *','select id_animal',[rfReplaceAll]);

  sql1 := 'select * from rep_listado_ventas(:desde,:hasta,:establecimiento)';
  sql2 := ' where id_animal in (' + sqlConsulta + ')';
  sql3 := ' order by dosis desc';

  sqlGral := sql1 + sql2 + sql3;

  F := TFListadoVentas.Create(self);

  F.IBQListadoVentas.Close;
  F.IBQListadoVentas.SQL.Clear;
  F.IBQListadoVentas.SQL.Add(sqlGral);
  F.IBQListadoVentas.ParamByName('desde').AsDate := DTPDesde.Date;
  F.IBQListadoVentas.ParamByName('hasta').AsDate := DTPHasta.Date;
  F.IBQListadoVentas.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  F.IBQListadoVentas.Open;

  F.QRListadoVentas.Preview;
  F.Destroy;

end;

procedure TFRepMovimientosSemen.CBTipoAltaChange(Sender: TObject);
begin
  inherited;
  if ((CBTipoAlta.Text <> 'TIPO DE INGRESO') and (CBTipoAlta.Text <> '')) then
  begin
       id_alta := IBQTipoAlta.Lookup('nombre',CBTipoAlta.Text,'id_tipo_alta');
  end
  else
  begin
       id_alta := -1;
       CBTipoAlta.Items.Insert(0,'TIPO DE INGRESO');
       CBTipoAlta.ItemIndex := 0;
       DelAlta := false;
  end;
  ActualizarConsulta;
end;

procedure TFRepMovimientosSemen.CBTipoAltaCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelAlta) then
  begin
       CBTipoAlta.Items.Delete(0);
       DelAlta := true; 
  end;
end;

procedure TFRepMovimientosSemen.IExcelClick(Sender: TObject);
begin
  inherited;
  if SDXLS.Execute then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

end.
