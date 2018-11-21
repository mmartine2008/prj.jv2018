unit UExpBrangusServicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, Buttons, PngImage, jpeg, Grids, DBGrids, UBDBGrid,
  StdCtrls, ComCtrls, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, JvExControls,
  JvLabel, ExtCtrls, JvGIF, JvExExtCtrls, JvImage;

type
  TFExpBrangusServicios = class(TFUniversal)
    IBQRodeo: TIBQuery;
    IBQPotrero: TIBQuery;
    GBFiltro: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    CBPotrero: TComboBox;
    CBRodeo: TComboBox;
    PCli: TPanel;
    GBGrilla: TGroupBox;
    BDBGDatos: TBitDBGrid;
    PBotones: TPanel;
    Image5: TImage;
    ISalir: TImage;
    IExcel: TImage;
    LExcel: TLabel;
    LSalir: TLabel;
    BitBtn3: TBitBtn;
    ImgVerAnimales: TImage;
    LVerAnimales: TLabel;
    IBQGetAnimales: TIBQuery;
    DSAnimales: TDataSource;
    IBQGetDatos: TIBQuery;
    DSGetDatos: TDataSource;
    IBQDatosExportar: TIBQuery;
  {  ImgSerIndivInac: TImage;
    ImgSerIndAct: TImage;
    ImgSerColecInac: TImage;
    ImgSerColecAct: TImage;
    LServicioIndividual: TLabel;
    LServicioColectivo: TLabel; }
    CBTipoRegistro: TComboBox;
    IBQTipoRegistro: TIBQuery;
    CBTiposServicio: TComboBox;
  {  procedure LServicioNaturalClick(Sender: TObject);
    procedure LInseminacionClick(Sender: TObject);
    procedure LTodosClick(Sender: TObject);
    procedure ImgServNatInactivoClick(Sender: TObject);
    procedure ImgServNatActivoClick(Sender: TObject);
    procedure ImgIATFInactivoClick(Sender: TObject);
    procedure ImgIATFActivoClick(Sender: TObject);
    procedure ImgTodosInactivosClick(Sender: TObject);
    procedure ImgTodosActivoClick(Sender: TObject); }
    procedure LVerAnimalesClick(Sender: TObject);
    procedure CBPotreroChange(Sender: TObject);
    procedure CBRodeoChange(Sender: TObject);
    procedure CBPotreroCloseUp(Sender: TObject);
    procedure CBRodeoCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
    procedure DTPDesdeCloseUp(Sender: TObject);
    procedure DTPHastaCloseUp(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
 {   procedure ImgSerIndActClick(Sender: TObject);
    procedure ImgSerIndivInacClick(Sender: TObject);
    procedure ImgSerColecActClick(Sender: TObject);
    procedure ImgSerColecInacClick(Sender: TObject);
    procedure LServicioIndividualClick(Sender: TObject);
    procedure LServicioColectivoClick(Sender: TObject);   }
    procedure FormShow(Sender: TObject);
    procedure CBTipoRegistroChange(Sender: TObject);
    procedure CBTipoRegistroCloseUp(Sender: TObject);
    procedure CBTiposServicioChange(Sender: TObject);
    procedure CBTiposServicioCloseUp(Sender: TObject);
  private
    { Private declarations }
    procedure Exportar(item : integer);
    procedure ExportarServiciosColectivos;
    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);    procedure ExportarServiciosIndividuales;
    procedure ArmarExcelServiciosColectivos;
    procedure ArmarExcelServiciosColectivosDetalle;
    procedure ArmarExcelServiciosIndividuales;
    function ArmarFecha() : string;
    function ArmarHora : string;
    procedure OrganizarGrilla;
    function ConstruirConsulta: String;
//    procedure validarTipoServicio;
  public
    { Public declarations }
  end;

var
  FExpBrangusServicios: TFExpBrangusServicios;
  id_rodeo, id_potrero, id_tipo_reg, tipo_servicio, serv_Col_Ind : integer;
  fechadesde, fechahasta : TDate;
  DelPotrero, DelRodeo, DelTipoReg, DelTipoServicio : boolean;
  ruta : string;

implementation

{$R *.dfm}

uses UPrincipal,uTiposGlobales, UCartel, UMensajeHuella, UGuardarEstiloHuella, DateUtils;


function TFExpBrangusServicios.ArmarFecha : string;
var dia, mes, anio : Word;
    d, m : string;
begin

  DecodeDate(now(), anio, mes, dia);

  if (length(IntToStr(dia)) = 1) then
      d := '0'+IntToStr(dia)
  else
      d := IntToStr(dia);

  if (length(IntToStr(mes)) = 1) then
      m := '0'+IntToStr(mes)
  else
      m := IntToStr(mes);

  Result := d+'-'+m+'-'+IntToStr(anio);

end;

function TFExpBrangusServicios.ArmarHora : string;
var hora, hora_format :string;
begin
    hora := (TimetoStr(Time()));

    hora_format := StringReplace(hora, ':', '', [rfReplaceAll] );

    Result := hora_format;
end;


{procedure TFExpBrangusServicios.LServicioNaturalClick(Sender: TObject);
begin
  inherited;

  if not(ImgServNatActivo.Visible) then
  begin
       tipo_servicio := 1;
       serv_Col_Ind := 2;
       ImgServNatActivo.Visible := true;
       ImgServNatInactivo.Visible := false;

       ImgIATFActivo.Visible := false;
       ImgIATFInactivo.Visible := true;
       ImgTodosActivo.Visible := false;
       ImgTodosInactivos.Visible := true;
  end
  else
  begin
       tipo_servicio := 0;
       serv_Col_Ind := 2;
       ImgServNatActivo.Visible := false;
       ImgServNatInactivo.Visible := true;
       
       ImgIATFActivo.Visible := false;
       ImgIATFInactivo.Visible := true;
       ImgTodosActivo.Visible := true;
       ImgTodosInactivos.Visible := false;
  end;

  OrganizarGrilla;

end;

procedure TFExpBrangusServicios.LInseminacionClick(Sender: TObject);
begin
  inherited;

  if not(ImgIATFActivo.Visible) then
  begin
       tipo_servicio := 3;
       serv_Col_Ind := 1;
       ImgIATFActivo.Visible := true;
       ImgIATFInactivo.Visible := false;

       ImgServNatActivo.Visible := false;
       ImgServNatInactivo.Visible := true;
       ImgTodosActivo.Visible := false;
       ImgTodosInactivos.Visible := true;
  end
  else
  begin
       tipo_servicio := 0;
       serv_Col_Ind := 2;
       ImgIATFActivo.Visible := false;
       ImgIATFInactivo.Visible := true;

       ImgServNatActivo.Visible := false;
       ImgServNatInactivo.Visible := true;
       ImgTodosActivo.Visible := true;
       ImgTodosInactivos.Visible := false; 
  end;

end;

procedure TFExpBrangusServicios.LTodosClick(Sender: TObject);
begin
  inherited;

  if not(ImgTodosActivo.Visible) then
  begin
       tipo_servicio := 0;
       serv_Col_Ind := 2;
       ImgTodosActivo.Visible := true;
       ImgTodosInactivos.Visible := false;

       ImgServNatActivo.Visible := false;
       ImgServNatInactivo.Visible := true;
       ImgIATFActivo.Visible := false;
       ImgIATFInactivo.Visible := true;
  end;

end;

procedure TFExpBrangusServicios.ImgServNatInactivoClick(Sender: TObject);
begin
  inherited;
  ImgServNatInactivo.Visible := not(ImgServNatInactivo.Visible);
  ImgServNatActivo.Visible := not(ImgServNatActivo.Visible);
  tipo_servicio := 1;
  serv_Col_Ind := 2;
end;

procedure TFExpBrangusServicios.ImgServNatActivoClick(Sender: TObject);
begin
  inherited;
  ImgServNatInactivo.Visible := not(ImgServNatInactivo.Visible);
  ImgServNatActivo.Visible := not(ImgServNatActivo.Visible);
  ImgIATFActivo.Visible := false;
  ImgIATFInactivo.Visible := true;
  ImgTodosActivo.Visible := false;
  ImgTodosInactivos.Visible := true;
end;

procedure TFExpBrangusServicios.ImgIATFInactivoClick(Sender: TObject);
begin
  inherited;
  ImgIATFInactivo.Visible := not(ImgIATFInactivo.Visible);
  ImgIATFActivo.Visible := not(ImgIATFActivo.Visible);
  tipo_servicio := 3;
  serv_Col_Ind := 1;
end;

procedure TFExpBrangusServicios.ImgIATFActivoClick(Sender: TObject);
begin
  inherited;
  ImgIATFInactivo.Visible := not(ImgIATFInactivo.Visible);
  ImgIATFActivo.Visible := not(ImgIATFActivo.Visible);
  ImgServNatActivo.Visible := false;
  ImgServNatInactivo.Visible := true;
  ImgTodosActivo.Visible := false;
  ImgTodosInactivos.Visible := true;
end;

procedure TFExpBrangusServicios.ImgTodosInactivosClick(Sender: TObject);
begin
  inherited;
  ImgTodosInactivos.Visible := not(ImgTodosInactivos.Visible);
  ImgTodosActivo.Visible := not(ImgTodosActivo.Visible);
  tipo_servicio := 0;
  serv_Col_Ind := 2;
end;

procedure TFExpBrangusServicios.ImgTodosActivoClick(Sender: TObject);
begin
  inherited;
  ImgTodosInactivos.Visible := not(ImgTodosInactivos.Visible);
  ImgTodosActivo.Visible := not(ImgTodosActivo.Visible);
  ImgIATFActivo.Visible := false;
  ImgIATFInactivo.Visible := true;
  ImgServNatActivo.Visible := false;
  ImgServNatInactivo.Visible := true;
end; }

function TFExpBrangusServicios.ConstruirConsulta: String;
var
  sqlText, sqlNombreSP, parametros, where : String;
begin
  sqlNombreSP := 'SELECT * FROM GET_DENUNCIA_SERV_ASOCIACIONES';
  parametros :=  '(:esta,:desde,:hasta)';
  where := '((raza = 12) or (raza = 28) or (raza = 30))';

  if (id_potrero <> -1) then
  begin
    if where <> '' then
      where := where + ' AND ';
    where := where + '(potrero = :potrero)';
  end;

  if (id_rodeo <> -1) then
  begin
    if where <> '' then
      where := where + ' AND ';
    where := where + '(rodeo = :rodeo)';
  end;

  if (id_tipo_reg <> -1) then
  begin
    if where <> '' then where := where + ' AND ';
    where := where + '(tiporegistro = :tiporegistro)';
  end;

  if (tipo_servicio <> -1) and (tipo_servicio <> 0) then
  begin
    if where <> '' then
       where := where + ' AND ';
    if (tipo_servicio = 3) then
        where := where + '(tipo = :servic)'
    else
       where := where + '(tipo = :servic or tipo = :servic1)'
  end;

  if (where <> '') then
     where := ' where' + where ;
 
  sqlText := sqlNombreSP + parametros + where;

 // ShowMessage(sqltext);

  ConstruirConsulta := sqlText;



end;

{procedure TFExpBrangusServicios.validarTipoServicio;
begin
   if ((ImgIATFActivo.Visible = false) and (ImgServNatActivo.Visible = false) and (ImgTodosActivo.Visible = false)) then
       tipo_servicio := -1;

   if (ImgTodosActivo.Visible = true) then
       tipo_servicio := 0

   else
      if (ImgServNatActivo.Visible = true) then
          tipo_servicio := 1
      else
          if (ImgIATFActivo.Visible = true) then
              tipo_servicio := 3;
end;  }

procedure TFExpBrangusServicios.LVerAnimalesClick(Sender: TObject);
var cartel : TCartel;
  sqlText : String;
begin
  cartel := TCartel.getInstance();
  cartel.abrircartel('Recuperando datos de servicios...');   

  IBQGetDatos.Close;
  IBQGetDatos.SQL.Clear;
  IBQGetDatos.SQL.Add(ConstruirConsulta);

  IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGetDatos.ParamByName('desde').AsDate := DTPDesde.Date;
  IBQGetDatos.ParamByName('hasta').AsDate := DTPHasta.Date;

 // validarTipoServicio;

  OrganizarGrilla;

  if (id_potrero <> -1) then
  begin
    IBQGetDatos.ParamByName('potrero').AsInteger := id_potrero;
  end;

  if (id_rodeo <> -1) then
  begin
    IBQGetDatos.ParamByName('rodeo').AsInteger := id_rodeo;
  end;

  if (id_tipo_reg <> -1) then
  begin
    IBQGetDatos.ParamByName('tiporegistro').AsInteger := id_tipo_reg;
  end;

  if (tipo_servicio <> -1) and (tipo_servicio <> 0)then
  begin
    if (tipo_servicio = 3) then
       IBQGetDatos.ParamByName('servic').AsInteger := tipo_servicio
    else
    begin
       IBQGetDatos.ParamByName('servic').AsInteger := tipo_servicio;
       IBQGetDatos.ParamByName('servic1').AsInteger := 2;
    end;
  end;

  IBQGetDatos.Open;
  IBQGetDatos.Last;
  IBQGetDatos.First;

  GBGrilla.Caption := '  Animales: '+IntToStr(IBQGetDatos.RecordCount)+'  ';

  cartel.cerrarcartel();
  cartel.FreeInstance;

end;

procedure TFExpBrangusServicios.CBPotreroChange(Sender: TObject);
begin
  inherited;

  if ((CBPotrero.Text <> 'POTRERO') and (CBPotrero.Text <> '(TODOS)')) then
      id_potrero := IBQPotrero.Lookup('nombre',CBPotrero.Text,'id_potrero')
  else
  begin
      id_potrero := -1;
      CBPotrero.Items.Insert(0,'POTRERO');
      CBPotrero.ItemIndex := 0;
      DelPotrero := false;
  end;

end;

procedure TFExpBrangusServicios.CBRodeoChange(Sender: TObject);
begin
  inherited;

  if ((CBRodeo.Text <> 'RODEO') and (CBRodeo.Text <> '(TODOS)')) then
      id_rodeo := IBQRodeo.Lookup('nombre',CBRodeo.Text,'id_rodeo')
  else
  begin
      id_rodeo := -1;
      CBRodeo.Items.Insert(0,'RODEO');
      CBRodeo.ItemIndex := 0;
      DelRodeo := false;
  end;

end;

procedure TFExpBrangusServicios.CBPotreroCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelPotrero) then
  begin
       CBPotrero.Items.Delete(0);
       DelPotrero := true; 
  end;

end;

procedure TFExpBrangusServicios.CBRodeoCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelRodeo) then
  begin
       CBRodeo.Items.Delete(0);
       DelRodeo := true; 
  end;

end;

procedure TFExpBrangusServicios.FormCreate(Sender: TObject);
begin
    inherited;
    
    id_rodeo := -1;
    id_potrero := -1;
    id_tipo_reg := -1;
    tipo_servicio := 1;
    serv_Col_Ind := 1;
    DelPotrero := false;
    DelRodeo := false;

{    ImgServNatActivo.Visible := true;
    ImgServNatInactivo.Visible := false;
    ImgIATFActivo.Visible := false;
    ImgIATFInactivo.Visible := true;
    ImgTodosActivo.Visible := false;
    ImgTodosInactivos.Visible := true;

    ImgSerColecAct.Visible := false;
    ImgSerColecInac.Visible := true;
    ImgSerIndAct.Visible := true;
    ImgSerIndivInac.Visible := false;     }

    DTPDesde.Date := IncYear(Now,-1);
    DTPHasta.Date := Now();

    fechadesde := DTPDesde.Date;
    fechahasta := DTPHasta.Date;

end;

procedure TFExpBrangusServicios.ISalirClick(Sender: TObject);
begin
  inherited;

  Close();
end;

procedure TFExpBrangusServicios.IExcelClick(Sender: TObject);
var cartel : TCartel;
F : TFGuardarEstiloHuella;
begin
  if (IBQGetDatos.IsEmpty) then
    MostrarMensaje(tmInformacion,'No existen animales que cumplan con las preferencias seleccionadas.')
  else
  begin
      F := TFGuardarEstiloHuella.Create(self);
      F.setExportXLS('Seleccione la carpeta donde desea que se guarden los archivos exportados');
      F.ShowModal;
      ruta := F.ruta;
      F.Destroy;

      if (ruta <> '') then
      try
        cartel := TCartel.getInstance();
        cartel.abrircartel('Generando archivos de exportación...');

        if (tipo_servicio = 1) then
          Exportar(1);

        if (tipo_servicio = 3) then
          Exportar(2);

        if (tipo_servicio = 0) then
          Exportar(3);

         cartel.cerrarcartel();
         cartel.FreeInstance;

      MostrarMensaje(tmInformacion,'Los datos se guardaron satisfactoriamente.');
      except on e: exception do
      begin
          cartel.cerrarcartel();
          cartel.FreeInstance;
          MostrarMensaje(tmInformacion,'La ruta seleccionada es invalida, debe seleccionar otra.');
      end
      end;
  end;


end;

procedure TFExpBrangusServicios.Exportar(item : integer);
begin

  if (item = 1) then //servicio natural
    ExportarServiciosColectivos;


  if (item = 2) then //servicio ia
    ExportarServiciosIndividuales;

  if (item = 3) then
  begin
    ExportarServiciosColectivos;
    ExportarServiciosIndividuales;
  end;

end;



procedure TFExpBrangusServicios.ExportarServiciosColectivos;
var fecha, hora : string;
begin
  {join tab_servicios ts on sp.servicio = ts.id_servicio}
  IBQDatosExportar.Close;
  IBQDatosExportar.SQL.Clear;
  IBQDatosExportar.SQL.Add('select * from GET_DENUNCIA_SERV_ASOCIACIONES(:esta,:desde,:hasta) sp where (sp.tipo in (1,2)) and ((sp.raza = 12) or (sp.raza = 28) or (sp.raza = 30))');

  if (id_potrero <> -1) then
  begin
    IBQDatosExportar.SQL.Add(' and (potrero = :potrero)');
    IBQDatosExportar.ParamByName('potrero').AsInteger := id_potrero;
  end;

  if (id_rodeo <> -1) then
  begin
    IBQDatosExportar.SQL.Add(' and (rodeo = :rodeo)');
    IBQDatosExportar.ParamByName('rodeo').AsInteger := id_rodeo;
  end;

  IBQDatosExportar.SQL.Add(' order by sp.fecha_inicio, sp.rp_toro');

  IBQDatosExportar.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatosExportar.ParamByName('desde').AsDate := fechaDesde;
  IBQDatosExportar.ParamByName('hasta').AsDate := fechaHasta;
  IBQDatosExportar.Open;

  if not(IBQDatosExportar.IsEmpty) then
  begin
    ArmarExcelServiciosColectivos;
    fecha := ArmarFecha;
    hora := ArmarHora;
    DTXLS.SaveToFile(ruta+'\Planilla Declaracion de Servicios Colectivos Brangus(Toros) - '+fecha+'-'+hora+'.xls');
  end;

//-----------------------------Armo el detalle de Madres

  IBQDatosExportar.Close;
  IBQDatosExportar.SQL.Clear;
  IBQDatosExportar.SQL.Add('select * from GET_DENUNCIA_SERV_ASOCIACIONES(:esta,:desde,:hasta) sp where (sp.tipo in (1,2)) and ((sp.raza = 12) or (sp.raza = 28) or (sp.raza = 30))');

  if (id_potrero <> -1) then
  begin
     IBQDatosExportar.SQL.Add(' and (potrero = :potrero)');
     IBQDatosExportar.ParamByName('potrero').AsInteger := id_potrero;
  end;

  if (id_rodeo <> -1) then
  begin
     IBQDatosExportar.SQL.Add(' and (rodeo = :rodeo)');
     IBQDatosExportar.ParamByName('rodeo').AsInteger := id_rodeo;
  end;

  IBQDatosExportar.SQL.Add(' order by sp.fecha_inicio, sp.rp_toro');

  IBQDatosExportar.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatosExportar.ParamByName('desde').AsDate := fechaDesde;
  IBQDatosExportar.ParamByName('hasta').AsDate := fechaHasta;
  IBQDatosExportar.Open;

  if not(IBQDatosExportar.IsEmpty) then
  begin
    ArmarExcelServiciosColectivosDetalle;
    DTXLS.SaveToFile(ruta+'\Planilla Declaracion de Servicios Colectivos Brangus(Madres) - '+fecha+'-'+hora+'.xls');
  end;

end;

procedure TFExpBrangusServicios.ExportarServiciosIndividuales;
var fecha, hora : string;
begin

  IBQDatosExportar.Close;
  IBQDatosExportar.SQL.Clear;
  IBQDatosExportar.SQL.Add('select * from GET_DENUNCIA_SERV_ASOCIACIONES(:esta,:desde,:hasta) sp where sp.tipo = 3 and ((sp.raza = 12) or (sp.raza = 28) or (sp.raza = 30))');

  if (id_potrero <> -1) then
  begin
     IBQDatosExportar.SQL.Add(' and (potrero = :potrero)');
     IBQDatosExportar.ParamByName('potrero').AsInteger := id_potrero;
  end;

  if (id_rodeo <> -1) then
  begin
     IBQDatosExportar.SQL.Add(' and (rodeo = :rodeo)');
     IBQDatosExportar.ParamByName('rodeo').AsInteger := id_rodeo;
  end;

  IBQDatosExportar.SQL.Add(' order by sp.fecha_inicio, sp.rp_toro');

  IBQDatosExportar.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatosExportar.ParamByName('desde').AsDate := fechaDesde;
  IBQDatosExportar.ParamByName('hasta').AsDate := fechaHasta;
  IBQDatosExportar.Open;

  if not(IBQDatosExportar.IsEmpty) then
  begin
    ArmarExcelServiciosIndividuales;
    fecha := ArmarFecha;
    hora := ArmarHora;
    DTXLS.SaveToFile(ruta+'\Planilla Declaracion de Servicios Individuales Brangus - '+fecha+'-'+hora+'.xls');
  end;


end;

procedure TFExpBrangusServicios.ArmarExcelServiciosColectivos;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQDatosExportar;
  DTXLS.Title.Text := 'DECLARACION DE SERVICIOS COLECTIVOS - (TOROS).';

  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_INICIO','Fec. Ini. Serv.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_FIN_ESTIMADA','Fec. Fin Serv.',True);

  AgregarColumnaExcel(column,taLeftJustify,0,'rp_padre','Rp Padre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'criador_padre','Nº Criador Padre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'apodo_padre','Apodo Padre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_toro','HBA Padre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'pc_toro','AAB Padre',True);

end;


procedure TFExpBrangusServicios.ArmarExcelServiciosColectivosDetalle;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQDatosExportar;
  DTXLS.Title.Text:= 'DECLARACION DE SERVICIOS COLECTIVOS - (MADRES).';

  AgregarColumnaExcel(column,taLeftJustify,0,'rp_madre_biologica','RP Madre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'criador_madre_biologica','Nº Criador Madre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'pc_madre_biologica','AAB Madre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_vaca','HBA Madre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'subcat_mbi','Reg. Madre',True);


end;

procedure TFExpBrangusServicios.AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);
begin
    column:= TxlColumn.Create(nil);
    column:= DTXLS.Columns.Add;
    column.Alignment:= alig;
    column.ColWidth:= coldwidth;
    column.DataField:= datafield;
    column.Save:= save;
    column.Title:= title;
end;

procedure TFExpBrangusServicios.ArmarExcelServiciosIndividuales;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQDatosExportar;
  DTXLS.Title.Text:= 'DECLARACION SERVICIOS INDIVIDUALES.';

  AgregarColumnaExcel(column,taLeftJustify,0,'rp_madre_biologica','RP Madre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'criador_madre_biologica','Nº Criador Madre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'pc_madre_biologica','AAB Vaca',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_vaca','HBA Vaca',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp_padre','Rp Padre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'criador_padre','Nº Criador Padre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'apodo_padre','Apodo Padre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'pc_toro','AAB Padre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_toro','HBA Padre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_INICIO','Fec. Ini. Serv.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_FIN_ESTIMADA','Fec. Fin Serv.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'tipo_servicio','Tipo Serv.',True);

end;


procedure TFExpBrangusServicios.DTPDesdeCloseUp(Sender: TObject);
begin
  inherited;

  fechadesde := DTPDesde.Date;
end;

procedure TFExpBrangusServicios.DTPHastaCloseUp(Sender: TObject);
begin
  inherited;

  fechahasta := DTPHasta.Date;
end;

procedure TFExpBrangusServicios.DTPDesdeChange(Sender: TObject);
begin
  inherited;

  fechadesde := DTPDesde.Date;
end;

procedure TFExpBrangusServicios.DTPHastaChange(Sender: TObject);
begin
  inherited;

  fechahasta := DTPHasta.Date;
end;

procedure TFExpBrangusServicios.OrganizarGrilla;
begin

          case serv_Col_Ind of
            1 : begin             //Servicio Individual
                  BDBGDatos.Columns[0].Title.Caption := 'Rp Madre';
                  BDBGDatos.Columns[0].FieldName := 'RP_MADRE_BIOLOGICA';
                  BDBGDatos.Columns[0].Width := 90;
                  BDBGDatos.Columns[1].Title.Caption := 'Nº Criador Madre';
                  BDBGDatos.Columns[1].FieldName := 'CRIADOR_MADRE_BIOLOGICA';
                  BDBGDatos.Columns[1].Width := 90;
                  BDBGDatos.Columns[2].Title.Caption := 'HBA o AAB Madre';
                  BDBGDatos.Columns[2].FieldName := 'IDENT_MADRE';
                  BDBGDatos.Columns[2].Width := 90;
                  BDBGDatos.Columns[3].Title.Caption := 'Rp Padre';
                  BDBGDatos.Columns[3].FieldName := 'RP_PADRE';
                  BDBGDatos.Columns[3].Width := 90;
                  BDBGDatos.Columns[4].Title.Caption := 'Nº Criador Padre';
                  BDBGDatos.Columns[4].FieldName := 'CRIADOR_PADRE';
                  BDBGDatos.Columns[4].Width := 90;
                  BDBGDatos.Columns[5].Title.Caption := 'Apodo Padre';
                  BDBGDatos.Columns[5].FieldName := 'APODO_PADRE';
                  BDBGDatos.Columns[5].Width := 200;
                  BDBGDatos.Columns[6].Title.Caption := 'HBA o AAB Padre';
                  BDBGDatos.Columns[6].FieldName := 'IDENT_PADRE';
                  BDBGDatos.Columns[6].Width := 90;
                  BDBGDatos.Columns[7].Title.Caption := 'Serv. Desde';
                  BDBGDatos.Columns[7].FieldName := 'FECHA_INICIO';
                  BDBGDatos.Columns[7].Width := 90;
                  BDBGDatos.Columns[8].Title.Caption := 'Serv. Hasta';
                  BDBGDatos.Columns[8].FieldName := 'FECHA_FIN_ESTIMADA';
                  BDBGDatos.Columns[8].Width := 90;
                  BDBGDatos.Columns[9].Title.Caption := 'Serv. Tipo';
                  BDBGDatos.Columns[9].FieldName := 'TIPO_SERVICIO';
                  BDBGDatos.Columns[9].Width := 90;
                end;
            2 : begin    //Servicio Colectivo
                  BDBGDatos.Columns[0].Title.Caption := 'Fec. Serv. Desde';
                  BDBGDatos.Columns[0].FieldName := 'FECHA_INICIO';
                  BDBGDatos.Columns[0].Width := 90;
                  BDBGDatos.Columns[1].Title.Caption := 'Fec. Serv. Hasta';
                  BDBGDatos.Columns[1].FieldName := 'FECHA_FIN_ESTIMADA';
                  BDBGDatos.Columns[1].Width := 90;
                  BDBGDatos.Columns[2].Title.Caption := 'Rp Toro';
                  BDBGDatos.Columns[2].FieldName := 'RP_PADRE';
                  BDBGDatos.Columns[2].Width := 90;
                  BDBGDatos.Columns[3].Title.Caption := 'Nº Criador Toro';
                  BDBGDatos.Columns[3].FieldName := 'CRIADOR_PADRE';
                  BDBGDatos.Columns[3].Width := 90;
                  BDBGDatos.Columns[4].Title.Caption := 'Apodo Toro';
                  BDBGDatos.Columns[4].FieldName := 'APODO_PADRE';
                  BDBGDatos.Columns[4].Width := 200;
                  BDBGDatos.Columns[5].Title.Caption := 'HBA o AAB Toro';
                  BDBGDatos.Columns[5].FieldName := 'IDENT_PADRE';
                  BDBGDatos.Columns[5].Width := 90;
                  BDBGDatos.Columns[6].Title.Caption := 'Rp Madre';
                  BDBGDatos.Columns[6].FieldName := 'RP_MADRE_BIOLOGICA';
                  BDBGDatos.Columns[6].Width := 90;
                  BDBGDatos.Columns[7].Title.Caption := 'Nº Criador Madre';
                  BDBGDatos.Columns[7].FieldName := 'CRIADOR_MADRE';
                  BDBGDatos.Columns[7].Width := 90;
                  BDBGDatos.Columns[8].Title.Caption := 'HBA o AAB Madre';
                  BDBGDatos.Columns[8].FieldName := 'IDENT_MADRE';
                  BDBGDatos.Columns[8].Width := 90;
                  BDBGDatos.Columns[9].Title.Caption := 'Reg. Madre';
                  BDBGDatos.Columns[9].FieldName := 'SUBCAT_MBI';
                  BDBGDatos.Columns[9].Width := 90;
                end;
          end;
end;

{procedure TFExpBrangusServicios.ImgSerIndActClick(Sender: TObject);
begin
  inherited;

  ImgSerIndAct.Visible := not(ImgSerIndAct.Visible);
  ImgSerIndivInac.Visible := not(ImgSerIndivInac.Visible);
  ImgSerColecAct.Visible := not(ImgSerColecAct.Visible);
  ImgSerColecInac.Visible := not(ImgSerColecInac.Visible);
  serv_Col_Ind := 1;
  OrganizarGrilla;
end;

procedure TFExpBrangusServicios.ImgSerIndivInacClick(Sender: TObject);
begin
  inherited;

  ImgSerIndAct.Visible := not(ImgSerIndAct.Visible);
  ImgSerIndivInac.Visible := not(ImgSerIndivInac.Visible);
  ImgSerColecAct.Visible := not(ImgSerColecAct.Visible);
  ImgSerColecInac.Visible := not(ImgSerColecInac.Visible);
  serv_Col_Ind := 1;
  OrganizarGrilla;
end;

procedure TFExpBrangusServicios.ImgSerColecActClick(Sender: TObject);
begin
  inherited;

  ImgSerIndAct.Visible := not(ImgSerIndAct.Visible);
  ImgSerIndivInac.Visible := not(ImgSerIndivInac.Visible);
  ImgSerColecAct.Visible := not(ImgSerColecAct.Visible);
  ImgSerColecInac.Visible := not(ImgSerColecInac.Visible);
  serv_Col_Ind := 2;
  OrganizarGrilla;
end;

procedure TFExpBrangusServicios.ImgSerColecInacClick(Sender: TObject);
begin
  inherited;

  ImgSerIndAct.Visible := not(ImgSerIndAct.Visible);
  ImgSerIndivInac.Visible := not(ImgSerIndivInac.Visible);
  ImgSerColecAct.Visible := not(ImgSerColecAct.Visible);
  ImgSerColecInac.Visible := not(ImgSerColecInac.Visible);
  serv_Col_Ind := 1;
  OrganizarGrilla;
end;

procedure TFExpBrangusServicios.LServicioIndividualClick(Sender: TObject);
begin
  inherited;

  if (ImgSerIndAct.Visible) then
  begin
      ImgSerIndAct.Visible := false;
      ImgSerIndivInac.Visible := true;
      ImgSerColecAct.Visible := true;
      ImgSerColecInac.Visible := false;
      serv_Col_Ind := 2;
  end
  else
  begin
      ImgSerIndAct.Visible := true;
      ImgSerIndivInac.Visible := false;
      ImgSerColecAct.Visible := false;
      ImgSerColecInac.Visible := true;
      serv_Col_Ind := 1;
  end;

  OrganizarGrilla;
end;

procedure TFExpBrangusServicios.LServicioColectivoClick(Sender: TObject);
begin
  inherited;

  if (ImgSerColecAct.Visible) then
  begin
      ImgSerIndAct.Visible := true;
      ImgSerIndivInac.Visible := false;
      ImgSerColecAct.Visible := false;
      ImgSerColecInac.Visible := true;
      serv_Col_Ind := 1;
  end
  else
  begin
      ImgSerIndAct.Visible := false;
      ImgSerIndivInac.Visible := true;
      ImgSerColecAct.Visible := true;
      ImgSerColecInac.Visible := false;
      serv_Col_Ind := 2;
  end;

  OrganizarGrilla;
end;  }

procedure TFExpBrangusServicios.FormShow(Sender: TObject);
begin
  inherited;

    IBQPotrero.Close;
    IBQPotrero.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
    IBQPotrero.Open;
    IBQPotrero.First;

    CBTiposServicio.AddItem('TIPO SERVICIO',nil);
    CBTiposServicio.AddItem('(TODOS)',nil);
    CBTiposServicio.AddItem('SERVICIO NATURAL',nil);
    CBTiposServicio.AddItem('INSEMINACION ARTIFICIAL',nil);
    CBTiposServicio.ItemIndex := 0;

    CBPotrero.AddItem('POTRERO',nil);
    CBPotrero.AddItem('(TODOS)',nil);
    while not(IBQPotrero.Eof) do
    begin
        CBPotrero.AddItem(IBQPotrero.FieldValues['nombre'],nil);
        IBQPotrero.Next;
    end;
    CBPotrero.ItemIndex := 0;

    IBQRodeo.Close;
    IBQRodeo.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
    IBQRodeo.Open;
    IBQRodeo.First;

    CBRodeo.AddItem('RODEO',nil);
    CBRodeo.AddItem('(TODOS)',nil);
    while not(IBQRodeo.Eof)do
    begin
        CBRodeo.AddItem(IBQRodeo.FieldValues['nombre'],nil);
        IBQRodeo.Next;
    end;
    CBRodeo.ItemIndex := 0;

    IBQTipoRegistro.Close;
    IBQTipoRegistro.Open;
    IBQTipoRegistro.First;

    CBTipoRegistro.AddItem('TIPO DE REGISTRO',nil);
    CBTipoRegistro.AddItem('(TODOS)',nil);
    while not(IBQTipoRegistro.Eof) do
    begin
      CBTipoRegistro.AddItem(IBQTipoRegistro.FieldValues['sinonimo'],nil);
      IBQTipoRegistro.Next;
    end;
    CBTipoRegistro.ItemIndex := 0;

    OrganizarGrilla;


end;

procedure TFExpBrangusServicios.CBTipoRegistroChange(Sender: TObject);
begin
  inherited;
  if ((CBTipoRegistro.Text <> 'TIPO DE REGISTRO') and (CBTipoRegistro.Text <> '(TODOS)')) then
      id_tipo_reg := IBQTipoRegistro.Lookup('sinonimo',CBTipoRegistro.Text,'id_subcategoria')
  else
  begin
      id_tipo_reg := -1;
      CBTipoRegistro.Items.Insert(0,'TIPO DE REGISTRO');
      CBTipoRegistro.ItemIndex := 0;
      DelTipoReg := false;
  end;

end;

procedure TFExpBrangusServicios.CBTipoRegistroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTipoReg) then
  begin
       CBTipoRegistro.Items.Delete(0);
       DelTipoReg := true;
  end;

end;

procedure TFExpBrangusServicios.CBTiposServicioCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTipoServicio) then
  begin
       CBTiposServicio.Items.Delete(0);
       DelTipoServicio := true;
  end;
end;

procedure TFExpBrangusServicios.CBTiposServicioChange(Sender: TObject);
begin
  inherited;
  if ((CBTiposServicio.Text = 'INSEMINACION ARTIFICIAL')) then
  begin
      tipo_servicio := 3;
  end
  else
    if ((CBTiposServicio.Text = 'SERVICIO NATURAL')) then
    begin
       tipo_servicio := 1;
     end
  else
  begin
      tipo_servicio := 0;
      CBTiposServicio.Items.Insert(0,'TIPO SERVICIO');
      CBTiposServicio.ItemIndex := 0;
      DelTipoServicio := false;
  end;
end;

end.
