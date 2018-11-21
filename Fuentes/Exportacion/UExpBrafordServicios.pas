unit UExpBrafordServicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  ExtCtrls, JvGIF, Grids, DBGrids, UBDBGrid, Buttons, PngImage, jpeg,
  ImgList, PngImageList, JvExExtCtrls, JvImage;
                                                                                                                                    
type
  TFExpBrafordServicios = class(TFUniversal)
    GBFiltro: TGroupBox;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    CBPotrero: TComboBox;
    CBRodeo: TComboBox;
    BMostrarDatos: TButton;
    IBQPotrero: TIBQuery;
    IBQRodeo: TIBQuery;
    IBQGetDatos: TIBQuery;
    DSGetDatos: TDataSource;
    PBotones: TPanel;
    Image5: TImage;
    ISalir: TImage;
    IExcel: TImage;
    LExcel: TLabel;
    LSalir: TLabel;
    BitBtn3: TBitBtn;
    IBQDatosExportar: TIBQuery;
    PCli: TPanel;
    GBGrilla: TGroupBox;
    BDBGDatos: TBitDBGrid;
    IVerAnimales: TImage;
    Label3: TLabel;
    CBTiposRegistro: TComboBox;
    IBQTiposRegistro: TIBQuery;
    CBTiposServicio: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure BMostrarDatosClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
  {  procedure CBServicioNaturalClick(Sender: TObject);
    procedure CBInseminacionClick(Sender: TObject);
    procedure CBTodosClick(Sender: TObject);  }
    procedure IExcelClick(Sender: TObject);
    procedure CBPotreroChange(Sender: TObject);
    procedure CBRodeoChange(Sender: TObject);
{    procedure ImgServNatInactivoClick(Sender: TObject);
    procedure ImgServNatActivoClick(Sender: TObject);
    procedure ImgIATFInactivoClick(Sender: TObject);
    procedure ImgIATFActivoClick(Sender: TObject);
    procedure ImgTodosInactivosClick(Sender: TObject);
    procedure ImgTodosActivoClick(Sender: TObject);
    procedure LServicioNaturalClick(Sender: TObject);
    procedure LInseminacionClick(Sender: TObject);
    procedure LTodosClick(Sender: TObject); }
    procedure CBPotreroCloseUp(Sender: TObject);
    procedure CBRodeoCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBTiposRegistroChange(Sender: TObject);
    procedure CBTiposRegistroCloseUp(Sender: TObject);
    procedure CBTiposServicioChange(Sender: TObject);
    procedure CBTiposServicioCloseUp(Sender: TObject);
  private
    { Private declarations }
    procedure Exportar(item : integer);
    procedure ExportarServiciosColectivos;
    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);
    procedure ExportarServiciosIndividuales;
    procedure ArmarExcelServiciosColectivos;
    procedure ArmarExcelServiciosColectivosDetalle;
    procedure ArmarExcelServiciosIndividuales;
    function ArmarFecha() : string;
    function Armarhora() : string;
    function ConstruirConsulta: String;
 //   procedure validarTipoServicio;
  public

    { Public declarations }
  end;

var
  fechaDesde, fechaHasta : TDate;
  id_rodeo, id_potrero, id_tipo_reg, tipo_servicio : integer;
  DelRodeo, DelPotrero, DelTipoReg, DelTipoServicio : boolean;
  ruta : string;
  FExpBrafordServicios: TFExpBrafordServicios;


implementation

uses
  UPrincipal, UCartel, UMensajeHuella, UGuardarEstiloHuella, DateUtils;

{$R *.dfm}


function TFExpBrafordServicios.ArmarFecha : string;
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

function TFExpBrafordServicios.ArmarHora : string;
var hora, hora_format :string;
begin
    hora := (TimetoStr(Time()));

    hora_format := StringReplace(hora, ':', '', [rfReplaceAll] );

    Result := hora_format;
end;

procedure TFExpBrafordServicios.FormCreate(Sender: TObject);
begin
    LTitulo.Caption := 'Exportar Datos de Servicios';

    DelRodeo := false;
    DelPotrero := false;
    DelTipoReg := false;

    id_rodeo := -1;
    id_potrero := -1;
    id_tipo_reg := -1;
    
    tipo_servicio := 1;

{    ImgIATFActivo.Visible := false;
    ImgIATFInactivo.Visible := true;

    ImgServNatActivo.Visible := true;
    ImgServNatInactivo.Visible := false;

    ImgTodosActivo.Visible := false;
    ImgTodosInactivos.Visible := true;   }

    DTPDesde.Date := IncYear(Now,-1);
    DTPHasta.Date := Now();

end;

procedure TFExpBrafordServicios.DTPDesdeChange(Sender: TObject);
begin
    fechaDesde := DTPDesde.Date;
end;

procedure TFExpBrafordServicios.DTPHastaChange(Sender: TObject);
begin
    fechaHasta := DTPHasta.Date;
end;


function TFExpBrafordServicios.ConstruirConsulta: String;
var
  sqlText, sqlNombreSP, parametros, where : String;
begin
  sqlNombreSP := 'SELECT * FROM GET_DENUNCIA_SERV_ASOCIACIONES';
  parametros :=  '(:esta,:desde,:hasta)';
  where := '(raza = 11)';

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
    if where <> '' then
       where := where + ' AND ';
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

  ConstruirConsulta := sqlText;


end;

{procedure TFExpBrafordServicios.validarTipoServicio;
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
end; }

procedure TFExpBrafordServicios.BMostrarDatosClick(Sender: TObject);
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

procedure TFExpBrafordServicios.ISalirClick(Sender: TObject);
begin
    Close();
end;

{procedure TFExpBrafordServicios.CBServicioNaturalClick(Sender: TObject);
begin
    tipo_servicio := 1;
    CBInseminacion.Checked := false;
    CBTodos.Checked := false;

    CBPotrero.ItemIndex := 0;
    CBRodeo.ItemIndex := 0;
end;

procedure TFExpBrafordServicios.CBInseminacionClick(Sender: TObject);
begin
    tipo_servicio := 3;
    CBServicioNatural.Checked := false;
    CBTodos.Checked := false;

    CBPotrero.ItemIndex := 0;
    CBRodeo.ItemIndex := 0;

end;

procedure TFExpBrafordServicios.CBTodosClick(Sender: TObject);
begin
    tipo_servicio := 0;
    CBServicioNatural.Checked := false;
    CBInseminacion.Checked := false;

    CBPotrero.ItemIndex := 0;
    CBRodeo.ItemIndex := 0;

end;     }

procedure TFExpBrafordServicios.IExcelClick(Sender: TObject);
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

procedure TFExpBrafordServicios.Exportar(item : integer);
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

procedure TFExpBrafordServicios.ExportarServiciosColectivos;
var fecha, hora : string;
begin

  IBQDatosExportar.Close;
  IBQDatosExportar.SQL.Clear;

  IBQDatosExportar.SQL.Add('select nombre_servicio,  sp.fecha_inicio,  sp.fecha_fin_estimada,  rp_padre, ');
  IBQDatosExportar.SQL.Add('nombre_padre,  razapadrenombre,  subcat_padre,  pc_toro,  hba_toro ');
  IBQDatosExportar.SQL.Add('from GET_DENUNCIA_SERV_ASOCIACIONES(:esta,:desde,:hasta) sp ');
  IBQDatosExportar.SQL.Add('join tab_servicios ts on sp.tipo = ts.tipo ');
  IBQDatosExportar.SQL.Add('where (sp.tipo = 1 or sp.tipo = 2) and sp.raza = 11 ');

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

  if (id_tipo_reg <> -1) then
  begin
    IBQDatosExportar.SQL.Add(' and (tipo_reg = :tiporeg)');
    IBQDatosExportar.ParamByName('tiporeg').AsInteger := id_tipo_reg;
  end;

  IBQDatosExportar.SQL.Add('GROUP BY SP.nombre_servicio,  sp.fecha_inicio,  sp.fecha_fin_estimada,   ');
  IBQDatosExportar.SQL.Add('rp_padre,  nombre_padre,  razapadrenombre,  subcat_padre,  pc_toro,  hba_toro ');
  IBQDatosExportar.SQL.Add('order by sp.fecha_inicio, rp_padre ');

  IBQDatosExportar.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatosExportar.ParamByName('desde').AsDate := DTPDesde.Date;
  IBQDatosExportar.ParamByName('hasta').AsDate := DTPHasta.Date;


  IBQDatosExportar.Open;

  if not(IBQDatosExportar.IsEmpty) then
  begin
    ArmarExcelServiciosColectivos;
    fecha := ArmarFecha;
    hora := ArmarHora;
    DTXLS.SaveToFile(ruta+'\Planilla Declaracion de Servicios Colectivos Braford - '+fecha+'-'+hora+'.xls');
  end;

//-----------------------------Armo el detalle

  IBQDatosExportar.Close;
  IBQDatosExportar.SQL.Clear;
  IBQDatosExportar.SQL.Add('select * from GET_DENUNCIA_SERV_ASOCIACIONES(:esta,:desde,:hasta) where tipo in (1,2) and raza = 11');

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

  if (id_tipo_reg <> -1) then
  begin
    IBQDatosExportar.SQL.Add(' and (tipo_reg = :tiporeg)');
    IBQDatosExportar.ParamByName('tiporeg').AsInteger := id_tipo_reg;
  end;

  IBQDatosExportar.SQL.Add(' order by fecha_inicio, rp_toro');

  IBQDatosExportar.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatosExportar.ParamByName('desde').AsDate := DTPDesde.Date;
  IBQDatosExportar.ParamByName('hasta').AsDate := DTPHasta.Date;
  IBQDatosExportar.Open;

  if not(IBQDatosExportar.IsEmpty) then
  begin
    ArmarExcelServiciosColectivosDetalle;
    DTXLS.SaveToFile(ruta+'\Planilla Declaracion de Servicios Colectivos Detalle Braford - '+fecha+'-'+hora+'.xls');
  end;

end;

procedure TFExpBrafordServicios.ExportarServiciosIndividuales;
var fecha, hora : string;
begin

  IBQDatosExportar.Close;
  IBQDatosExportar.SQL.Clear;
  IBQDatosExportar.SQL.Add('select * from GET_DENUNCIA_SERV_ASOCIACIONES (:esta,:desde,:hasta) where tipo = 3 and raza = 11');

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

  if (id_tipo_reg <> -1) then
  begin
    IBQDatosExportar.SQL.Add(' and (tipo_reg = :tiporeg)');
    IBQDatosExportar.ParamByName('tiporeg').AsInteger := id_tipo_reg;
  end;

  IBQDatosExportar.SQL.Add(' order by fecha_inicio, rp_toro');

  IBQDatosExportar.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatosExportar.ParamByName('desde').AsDate := DTPDesde.Date;
  IBQDatosExportar.ParamByName('hasta').AsDate := DTPHasta.Date;
  IBQDatosExportar.Open;

  if not(IBQDatosExportar.IsEmpty) then
  begin
    ArmarExcelServiciosIndividuales;
    fecha := ArmarFecha;
    hora := ArmarHora;
    DTXLS.SaveToFile(ruta+'\Planilla Declaracion de Servicios Individuales Braford - '+fecha+'-'+hora+'.xls');
  end;


end;

procedure TFExpBrafordServicios.AgregarColumnaExcel(var column: TxlColumn;
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

procedure TFExpBrafordServicios.ArmarExcelServiciosIndividuales;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQDatosExportar;
  DTXLS.Title.Text:= 'DECLARACION SERVICIOS INDIVIDUALES.';

  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_servicio','Nº Servicio.',True);

  AgregarColumnaExcel(column,taLeftJustify,0,'rp_padre','Rp Toro.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_padre','Nombre Toro.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'razapadrenombre','Raza Toro.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'subcat_padre','Registro Toro.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'pc_toro','ABA Toro.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_toro','HBA Toro.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'subcat_mbi','Registro Vaca.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp_madre_biologica','RP Vaca.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_INICIO','Fec. Ini. Serv.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_FIN_ESTIMADA','Fec. Fin Serv.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'pc_madre_biologica','A.B.A. Vaca.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_vaca','HBA Vaca.',True);

end;


procedure TFExpBrafordServicios.ArmarExcelServiciosColectivosDetalle;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQDatosExportar;
  DTXLS.Title.Text:= 'SERVICIOS COLECTIVOS DETALLE MADRES)';

  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_servicio','Nº de Servicio.',True);

  AgregarColumnaExcel(column,taLeftJustify,0,'subcat_mbi','Reg. Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp_madre_biologica','RP Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_INICIO','Fec. Ini. Serv.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_FIN_ESTIMADA','Fec. Fin Serv.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'pc_madre_biologica','Nº A.B.A. Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_vaca','Nº HBA Madre.',True);

end;

procedure TFExpBrafordServicios.ArmarExcelServiciosColectivos;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQDatosExportar;
  DTXLS.Title.Text := 'DECLARACION DE SERVICIOS COLECTIVOS.';

  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_servicio','Nº Servicio.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'fecha_inicio','Fecha de inicio del servicio.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'fecha_fin_estimada','Fecha de fin del servicio.',True);

  AgregarColumnaExcel(column,taLeftJustify,0,'rp_padre','Rp Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_padre','Nombre Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'razapadrenombre','Raza Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'subcat_padre','Registro Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'pc_toro','ABA Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_toro','HBA Padre.',True);

end;



procedure TFExpBrafordServicios.CBPotreroChange(Sender: TObject);
begin

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

procedure TFExpBrafordServicios.CBRodeoChange(Sender: TObject);
begin

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



{procedure TFExpBrafordServicios.ImgServNatInactivoClick(Sender: TObject);
begin
  inherited;
  ImgServNatInactivo.Visible := not(ImgServNatInactivo.Visible);
  ImgServNatActivo.Visible := not(ImgServNatActivo.Visible);
  tipo_servicio := 1;
//  serv_Col_Ind := 2;

end;

procedure TFExpBrafordServicios.ImgServNatActivoClick(Sender: TObject);
begin
  inherited;
  ImgServNatInactivo.Visible := not(ImgServNatInactivo.Visible);
  ImgServNatActivo.Visible := not(ImgServNatActivo.Visible);
  ImgIATFActivo.Visible := false;
  ImgIATFInactivo.Visible := true;
  ImgTodosActivo.Visible := false;
  ImgTodosInactivos.Visible := true;

end;

procedure TFExpBrafordServicios.ImgIATFInactivoClick(Sender: TObject);
begin
  inherited;
  ImgIATFInactivo.Visible := not(ImgIATFInactivo.Visible);
  ImgIATFActivo.Visible := not(ImgIATFActivo.Visible);
  tipo_servicio := 3;
//  serv_Col_Ind := 1;

end;

procedure TFExpBrafordServicios.ImgIATFActivoClick(Sender: TObject);
begin
  inherited;
  ImgIATFInactivo.Visible := not(ImgIATFInactivo.Visible);
  ImgIATFActivo.Visible := not(ImgIATFActivo.Visible);
  ImgServNatActivo.Visible := false;
  ImgServNatInactivo.Visible := true;
  ImgTodosActivo.Visible := false;
  ImgTodosInactivos.Visible := true;

end;

procedure TFExpBrafordServicios.ImgTodosInactivosClick(Sender: TObject);
begin
  inherited;
  ImgTodosInactivos.Visible := not(ImgTodosInactivos.Visible);
  ImgTodosActivo.Visible := not(ImgTodosActivo.Visible);
  tipo_servicio := 0;
//  serv_Col_Ind := 2;

end;

procedure TFExpBrafordServicios.ImgTodosActivoClick(Sender: TObject);
begin
  inherited;
  ImgTodosInactivos.Visible := not(ImgTodosInactivos.Visible);
  ImgTodosActivo.Visible := not(ImgTodosActivo.Visible);
  ImgIATFActivo.Visible := false;
  ImgIATFInactivo.Visible := true;
  ImgServNatActivo.Visible := false;
  ImgServNatInactivo.Visible := true;

end;

procedure TFExpBrafordServicios.LServicioNaturalClick(Sender: TObject);
begin
  inherited;
  if not(ImgServNatActivo.Visible) then
  begin
       tipo_servicio := 1;
//       serv_Col_Ind := 2;
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
//       serv_Col_Ind := 2;
       ImgServNatActivo.Visible := false;
       ImgServNatInactivo.Visible := true;
       
       ImgIATFActivo.Visible := false;
       ImgIATFInactivo.Visible := true;
       ImgTodosActivo.Visible := true;
       ImgTodosInactivos.Visible := false;
  end;

end;

procedure TFExpBrafordServicios.LInseminacionClick(Sender: TObject);
begin
  inherited;
  if not(ImgIATFActivo.Visible) then
  begin
       tipo_servicio := 3;
//       serv_Col_Ind := 1;
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
//       serv_Col_Ind := 2;
       ImgIATFActivo.Visible := false;
       ImgIATFInactivo.Visible := true;

       ImgServNatActivo.Visible := false;
       ImgServNatInactivo.Visible := true;
       ImgTodosActivo.Visible := true;
       ImgTodosInactivos.Visible := false; 
  end;

end;

procedure TFExpBrafordServicios.LTodosClick(Sender: TObject);
begin
  inherited;
  if not(ImgTodosActivo.Visible) then
  begin
       tipo_servicio := 0;
//       serv_Col_Ind := 2;
       ImgTodosActivo.Visible := true;
       ImgTodosInactivos.Visible := false;

       ImgServNatActivo.Visible := false;
       ImgServNatInactivo.Visible := true;
       ImgIATFActivo.Visible := false;
       ImgIATFInactivo.Visible := true;
  end;

end;  }

procedure TFExpBrafordServicios.CBPotreroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelPotrero) then
  begin
       CBPotrero.Items.Delete(0);
       DelPotrero := true;
  end;

end;

procedure TFExpBrafordServicios.CBRodeoCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelRodeo) then
  begin
       CBRodeo.Items.Delete(0);
       DelRodeo := true; 
  end;

end;

procedure TFExpBrafordServicios.FormShow(Sender: TObject);
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

    IBQTiposRegistro.Close;
    IBQTiposRegistro.ParamByName('raza').AsInteger := 11;
    IBQTiposRegistro.Open;
    IBQTiposRegistro.First;

    CBTiposRegistro.AddItem('TIPO DE REGISTRO',nil);
    CBTiposRegistro.AddItem('(TODOS)',nil);
    while not(IBQTiposRegistro.Eof) do
    begin
        CBTiposRegistro.AddItem(IBQTiposRegistro.FieldValues['sinonimo'],nil);
        IBQTiposRegistro.Next;
    end;
    CBTiposRegistro.ItemIndex := 0;

end;

procedure TFExpBrafordServicios.CBTiposRegistroChange(Sender: TObject);
begin
  inherited;

  if ((CBTiposRegistro.Text <> 'TIPO DE REGISTRO') and (CBTiposRegistro.Text <> '(TODOS)')) then
      id_tipo_reg := IBQTiposRegistro.Lookup('sinonimo',CBTiposRegistro.Text,'id_subcategoria')
  else
  begin
      id_tipo_reg := -1;
      CBTiposRegistro.Items.Insert(0,'TIPO DE REGISTRO');
      CBTiposRegistro.ItemIndex := 0;
      DelTipoReg := false;
  end;

end;

procedure TFExpBrafordServicios.CBTiposRegistroCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelTipoReg) then
  begin
       CBTiposRegistro.Items.Delete(0);
       DelTipoReg := true;
  end;

end;

procedure TFExpBrafordServicios.CBTiposServicioCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTipoServicio) then
  begin
       CBTiposServicio.Items.Delete(0);
       DelTipoServicio := true;
  end;
end;

procedure TFExpBrafordServicios.CBTiposServicioChange(Sender: TObject);
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
