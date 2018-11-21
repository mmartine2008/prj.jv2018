unit UREPInformePesadasPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, QuickRpt, QRCtrls,
  jpeg, UPrincipal, IBQuery, QRPDFFilt, QRWebFilt, QRExport, ImgList,
  PngImageList, pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel,
  JvGIF, DateUtils, Grids;

type

  RegistroPeso = record
        fecha: TDate;
        peso: double;
        gdpv: double
  end;

  RegistroAnimal = record
        animal_id: string;
        ID_RP: String;
        raza: String;
        categoria: integer;
        fecha_nacimiento: TDate;
        estado: String;

        fecha_inicial: TDate;
        fecha_final: TDate;
        peso_inicial: double;
        peso_final: double;
        gdpv: double;

        vectorPesadas: Array of RegistroPeso;
  end;

  TFREPinformePesadasPreview = class(TFUniversal)
    QRInfoPesadas: TQuickRep;
    QRBand1: TQRBand;
    QRImage2: TQRImage;
    QRLabel4: TQRLabel;
    DetailBand1: TQRBand;
    QRBand4: TQRBand;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    IBQInfoPesadas: TIBQuery;
    QRLabel14: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRHTMLFilter1: TQRHTMLFilter;
    QRBand3: TQRBand;
    QRLabel27: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape11: TQRShape;
    QRShape7: TQRShape;
    QRShape5: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape10: TQRShape;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    IBQueryPesadas: TIBQuery;
    IBQCatNombre: TIBQuery;
    StringGrid1: TStringGrid;
    QRLRP: TQRLabel;
    QRFechaNac: TQRLabel;
    FECHA_PESO1: TQRLabel;
    FECHA_PESO2: TQRLabel;
    FECHA_PESO3: TQRLabel;
    FECHA_PESO4: TQRLabel;
    FECHA_PESO5: TQRLabel;
    PESO_1: TQRLabel;
    PESO_2: TQRLabel;
    PESO_3: TQRLabel;
    PESO_4: TQRLabel;
    PESO_5: TQRLabel;
    PESO_INICIAL: TQRLabel;
    PESO_FINAL: TQRLabel;
    GDPV_2: TQRLabel;
    GDPV_3: TQRLabel;
    GDPV_4: TQRLabel;
    GDPV_5: TQRLabel;
    GDPV_1: TQRLabel;
    KG_PROD: TQRLabel;
    QRLabel33: TQRLabel;
    GDVP_FINAL: TQRLabel;
    QTOTAL_1: TQRLabel;
    QTOTAL_2: TQRLabel;
    QTOTAL_3: TQRLabel;
    QTOTAL_4: TQRLabel;
    PROM_1: TQRLabel;
    PROM_2: TQRLabel;
    PROM_3: TQRLabel;
    PROM_4: TQRLabel;
    QRCategoria: TQRLabel;
    procedure QRInfoPesadasBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QRInfoPesadasNeedData(Sender: TObject;
      var MoreData: Boolean);
  private


    procedure cargarDatosPropietario();

    procedure calcularPesadas;
//    procedure generarEncabezadoPesadas;
    procedure completarPesosIntermedios;
    procedure CargarResultados;
    function getNombreCategoria(id_categoria: integer):string;
  public
    Desde, Hasta : Variant;
    ultimas_2 : Boolean;
    vectorAnimales: Array of RegistroAnimal;

//    StringGrid1: TStringGrid;

    procedure iniciarCalculos;
    procedure mostrarTotales;
    function fechaValidaPesada(fecha: TDate): boolean;
  end;

var
  FREPinformePesadasPreview: TFREPinformePesadasPreview;
  row: integer;
  total_1, total_2, total_3, total_4: double;

implementation

uses URepGeneral, UTiposGlobales;

{$R *.dfm}

procedure TFREPinformePesadasPreview.QRInfoPesadasBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
   if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
    end;
  IBQInfoPesadas.Active := false;
  IBQInfoPesadas.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  if Desde = null then
  begin
    IBQInfoPesadas.ParamByName('Desde').Value := null;
    IBQInfoPesadas.ParamByName('hasta').Value := null;
  end
  else
  begin
    IBQInfoPesadas.ParamByName('desde').AsDate := Desde;
    IBQInfoPesadas.ParamByName('hasta').AsDate := Hasta;
  end;
  if ultimas_2 then
    IBQInfoPesadas.ParamByName('ULTIMAS_2').Value := 'S'
  else
    IBQInfoPesadas.ParamByName('ULTIMAS_2').Value := 'N';    
  //IBQInfoPesadas.Active := true;
  cargarDatosPropietario();
  row := 1;

end;

procedure TFREPinformePesadasPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRInfoPesadas.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPinformePesadasPreview.cargarDatosPropietario;
var
  repGeneral : TFRepGeneral;
begin
  repGeneral := TFRepGeneral.Create(self);
  repGeneral.retDatosPropietario();
  QRLNombrePropietario.Caption:= '';
  QRLEmpresa.Caption:= '';
  QRLDatosAbajo.Caption:= '';
  QRLDatosAbajo2.Caption:= '';

  QRLNombrePropietario.Caption:= repGeneral.getNombrePropietario;
  QRLEmpresa.Caption:= repGeneral.getEmpresaPropietario;

  if (Trim(repGeneral.getNombrePropietario) <> '') then
    begin
      QRLRenglon1.Enabled:= false;
      QRLNombrePropietario.Enabled:= true;
    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;
     end;

  if (Trim(repGeneral.getDireccionPropietario) <> '') then
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + repGeneral.getDireccionPropietario + ' - ';

  if (Trim(repGeneral.getTelefonoPropietario) <> '') then
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + repGeneral.getTelefonoPropietario + ' - ';

  if (Trim(repGeneral.getCelularPropietario) <> '') then
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + repGeneral.getCelularPropietario + ' - ';

  if (Trim(repGeneral.getEmailPropietario) <> '') then
    QRLDatosAbajo2.Caption:= QRLDatosAbajo2.Caption + repGeneral.getEmailPropietario + ' - ';

  if (Trim(repGeneral.getUrlPropietario) <> '') then
    QRLDatosAbajo2.Caption:= QRLDatosAbajo2.Caption + repGeneral.getUrlPropietario + ' - ';

  if (FileExists(repGeneral.getPathImage)) then
    begin
       QRImagenEmpresa.Picture.LoadFromFile(repGeneral.getPathImage);
    end;

  repGeneral.Destroy;
end;

procedure TFREPinformePesadasPreview.FormCreate(Sender: TObject);
begin
  inherited;
  ultimas_2 := false;

end;

procedure TFREPinformePesadasPreview.iniciarCalculos;
begin
  IBQueryPesadas.Open;
  IBQueryPesadas.Last;
  IBQueryPesadas.First;


  calcularPesadas;
  completarPesosIntermedios;
  CargarResultados;
end;


procedure TFREPinformePesadasPreview.QRInfoPesadasNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  inherited;

  QRLRP.Caption       := StringGrid1.Cells[0, row];
  QRCategoria.Caption := StringGrid1.Cells[1, row];
  QRFechaNac.Caption  := StringGrid1.Cells[2, row];

  FECHA_PESO1.Caption := StringGrid1.Cells[4, row];
  PESO_1.Caption := StringGrid1.Cells[5, row];
  GDPV_1.Caption := StringGrid1.Cells[6, row];

  FECHA_PESO2.Caption := StringGrid1.Cells[7, row];
  PESO_2.Caption := StringGrid1.Cells[8, row];
  GDPV_2.Caption := StringGrid1.Cells[9, row];

  FECHA_PESO3.Caption := StringGrid1.Cells[10, row];
  PESO_3.Caption := StringGrid1.Cells[11, row];
  GDPV_3.Caption := StringGrid1.Cells[12, row];

  FECHA_PESO4.Caption := StringGrid1.Cells[13, row];
  PESO_4.Caption := StringGrid1.Cells[14, row];
  GDPV_4.Caption := StringGrid1.Cells[15, row];

  FECHA_PESO5.Caption := StringGrid1.Cells[16, row];
  PESO_5.Caption := StringGrid1.Cells[17, row];
  GDPV_5.Caption := StringGrid1.Cells[18, row];


  PESO_INICIAL.caption := StringGrid1.Cells[19, row];
  PESO_FINAL.caption := StringGrid1.Cells[20, row];
  KG_PROD.caption := StringGrid1.Cells[21, row];
  GDVP_FINAL.caption := StringGrid1.Cells[22, row];


  inc(row);
  MoreData := (row <= StringGrid1.RowCount);

  if not MoreData then
  begin
    mostrarTotales;
  end;
end;

// La fecha es valida, si no se controla o si esta dentro de los limites
function TFREPinformePesadasPreview.fechaValidaPesada(fecha: TDate): boolean;
var
  resultado: boolean;
begin
  resultado := false;

   if (Desde = null) then
   begin
      resultado := true;
   end
   else
   begin
      if (  VarToDateTime(Desde) <= fecha) AND (fecha <= VarToDateTime(Hasta) ) then
      begin
        resultado := true;
      end
   end;

  fechaValidaPesada := resultado;
end;

procedure TFREPinformePesadasPreview.calcularPesadas;
var
  actual_rp, last_rp : string;
  cant_pesadas, cant_animales : integer;
  peso: double;
  fecha: TDate;
begin
  SetLength(vectorAnimales, 0);

  actual_rp := '';
  cant_pesadas := 0;
  cant_animales := 0;

  // Recorro la grilla para procesar:
  IBQueryPesadas.First;
  while not IBQueryPesadas.Eof do
  begin
    last_rp := actual_rp;
    actual_rp := IBQueryPesadas.FieldByName('ID_RP').AsString;

    // Las pesadas estan rdenadas por RP, con lo cual si es igual es el mismo animal
    if (actual_rp <> last_rp) then
    begin
      cant_pesadas := 0;
      cant_animales := cant_animales +1;
      SetLength(vectorAnimales, cant_animales);
      vectorAnimales[cant_animales -1].ID_RP := actual_rp;
      vectorAnimales[cant_animales -1].categoria := IBQueryPesadas.FieldByName('CATEGORIA').AsInteger;
      vectorAnimales[cant_animales -1].fecha_nacimiento := IBQueryPesadas.FieldByName('FECHA_NACIMIENTO').AsDateTime;
      vectorAnimales[cant_animales -1].raza := IBQueryPesadas.FieldByName('RAZA').AsString;
      vectorAnimales[cant_animales -1].estado := IBQueryPesadas.FieldByName('TIPOBAJA').AsString;
    end;

    if (cant_pesadas < 5) then
    begin
        fecha := IBQueryPesadas.FieldByName('FECHA').AsDateTime;

        if fechaValidaPesada(fecha) then
        begin
          cant_pesadas := cant_pesadas +1;
          SetLength(vectorAnimales[cant_animales -1].vectorPesadas, cant_pesadas);

          peso := IBQueryPesadas.FieldByName('PESO').AsFloat;

          vectorAnimales[cant_animales -1].vectorPesadas[cant_pesadas -1].peso := peso;
          vectorAnimales[cant_animales -1].vectorPesadas[cant_pesadas -1].fecha := fecha;
          vectorAnimales[cant_animales -1].vectorPesadas[cant_pesadas -1].gdpv := 0;
        end;
    end;

    IBQueryPesadas.Next;
  end;


end;

procedure TFREPinformePesadasPreview.completarPesosIntermedios;
var
  animal: integer;
  pesada: integer;
  diffDias: integer;
  diffPeso: double;
  last, first: integer;
begin

  for animal := Low(vectorAnimales) to High(vectorAnimales) do
  begin
     last := High(vectorAnimales[animal].vectorPesadas);
     first := Low(vectorAnimales[animal].vectorPesadas);
     if (last <> -1) then
     begin
       for pesada := last downto first do
       begin
          vectorAnimales[animal].vectorPesadas[pesada].gdpv := 0;
          if (pesada > 0) then
          begin
           diffPeso := vectorAnimales[animal].vectorPesadas[pesada].peso -
                       vectorAnimales[animal].vectorPesadas[pesada -1].peso;

           diffDias := DaysBetween(vectorAnimales[animal].vectorPesadas[pesada].fecha,
                       vectorAnimales[animal].vectorPesadas[pesada -1].fecha);

             if diffDias > 0 then
             begin
               vectorAnimales[animal].vectorPesadas[pesada].gdpv := diffPeso / diffDias;
             end
             else
             begin
               vectorAnimales[animal].vectorPesadas[pesada].gdpv := 0;
             end ;
          end
       end;

       vectorAnimales[animal].peso_inicial := vectorAnimales[animal].vectorPesadas[first].peso;
       vectorAnimales[animal].peso_final := vectorAnimales[animal].vectorPesadas[last].peso;
       vectorAnimales[animal].fecha_inicial := vectorAnimales[animal].vectorPesadas[first].fecha;
       vectorAnimales[animal].fecha_final := vectorAnimales[animal].vectorPesadas[last].fecha;
       diffDias := DaysBetween(vectorAnimales[animal].fecha_final, vectorAnimales[animal].fecha_inicial);
       diffPeso := vectorAnimales[animal].peso_final - vectorAnimales[animal].peso_inicial;

       if (diffPeso) > 0 then
       begin
         vectorAnimales[animal].gdpv := diffPeso / diffDias;
       end
       else
       begin
         vectorAnimales[animal].gdpv := 0;
       end

     end;
  end;
end;

procedure TFREPinformePesadasPreview.CargarResultados;
var
  animal, lin: integer;
  pesada, col: integer;
begin
  total_1 := 0;
  total_2 := 0;
  total_3 := 0;
  total_4 := 0;

  for animal := Low(vectorAnimales) to High(vectorAnimales) do
  begin
     StringGrid1.RowCount := StringGrid1.RowCount +1;
     lin := animal+1;
     with vectorAnimales[animal] do
     begin
      StringGrid1.Cells[0, Lin] := ID_RP;
      StringGrid1.Cells[1, Lin] := getNombreCategoria(categoria);
      StringGrid1.Cells[2, Lin] := DateToStr(fecha_nacimiento);
      StringGrid1.Cells[3, Lin] := raza;
      StringGrid1.Cells[4, Lin] := estado;

      col := 6;
      for pesada := High(vectorPesadas) downto Low(vectorPesadas) do
      begin
        with vectorPesadas[pesada] do
        begin
          StringGrid1.Cells[col*3 +1, Lin] :=  DateToStr(fecha);
          StringGrid1.Cells[col*3 +2, Lin] :=  Format('%.2f', [peso]);
          StringGrid1.Cells[col*3 +3, Lin] :=  Format('%.2f', [gdpv]);

          col := col -1;
        end;
      end;

      StringGrid1.Cells[20, Lin] :=  Format('%.2f', [peso_inicial]);
      StringGrid1.Cells[21, Lin] :=  Format('%.2f', [peso_final]);
      StringGrid1.Cells[22, Lin] :=  Format('%.2f', [peso_final - peso_inicial]);
      StringGrid1.Cells[23, Lin] :=  Format('%.2f', [gdpv]);

      total_1 := total_1 + peso_inicial;
      total_2 := total_2 + peso_final;
      total_3 := total_3 + (peso_final - peso_inicial);
      total_4 := total_4 + gdpv;

     end;

  end;

end;

function TFREPinformePesadasPreview.getNombreCategoria(id_categoria: integer):string;
var
  nombre: String;
begin

  IBQCatNombre.ParamByName('id_categoria').value := id_categoria;
  IBQCatNombre.Close;
  IBQCatNombre.Open;
  IBQCatNombre.First;

  nombre := IBQCatNombre.FieldByName('nombre').AsString;

  getNombreCategoria := nombre;
end;

procedure TFREPinformePesadasPreview.mostrarTotales;
var
  cantidad: integer;
begin
  inherited;

  cantidad := Length(vectorAnimales);

  QTOTAL_1.caption := FloatToStr(total_1);
  QTOTAL_2.caption := FloatToStr(total_2);
  QTOTAL_3.caption := FloatToStr(total_3);
  QTOTAL_4.caption := Format('%1.2f', [total_4]);

  if cantidad > 0 then
  begin
    PROM_1.caption := Format('%5.2f', [total_1/cantidad]);
    PROM_2.caption := Format('%5.2f', [total_2/cantidad]);
    PROM_3.caption := Format('%5.2f', [total_3/cantidad]);
    PROM_4.caption := Format('%1.2f', [total_4/cantidad]);
  end
  else
  begin
    PROM_1.caption := '0.00';
    PROM_2.caption := '0.00';
    PROM_3.caption := '0.00';
    PROM_4.caption := '0.00';
  end;

end;


end.
