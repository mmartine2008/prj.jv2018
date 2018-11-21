unit UExpBrafordNacimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, Grids, DBGrids, UBDBGrid, DBCtrls,
  UDBLookupComboBoxAuto, Buttons, PngImage, jpeg, ImgList, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFExpBrafordNacimientos = class(TFUniversal)
    GBFiltro: TGroupBox;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    IBQRodeo: TIBQuery;
    IBQPotrero: TIBQuery;
    IBQTiposRegistro: TIBQuery;
    CBPotrero: TComboBox;
    BMostrar: TButton;
    IBQGetAnimales: TIBQuery;
    DSDatos: TDataSource;
    PBotones: TPanel;
    Image5: TImage;
    ISalir: TImage;
    IExcel: TImage;
    LExcel: TLabel;
    LSalir: TLabel;
    BitBtn3: TBitBtn;
    IBQDatosExportar: TIBQuery;
    CBRodeo: TComboBox;
    PCli: TPanel;
    GBGrilla: TGroupBox;
    BDBGDatos: TBitDBGrid;
    Label3: TLabel;
    IVerAnimales: TImage;
    CBTiposRegistro: TComboBox;
    CBTiposServicio: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure CBRodeoChange(Sender: TObject);
    procedure CBPotreroChange(Sender: TObject);
    procedure BMostrarClick(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
 //   procedure CBServicioNaturalClick(Sender: TObject);
   // procedure CBInseminacionClick(Sender: TObject);
 //   procedure CBTodosClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
 {   procedure ImgServNatInactivoClick(Sender: TObject);
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
    procedure CBTiposServicioCloseUp(Sender: TObject);
    procedure CBTiposServicioChange(Sender: TObject);
 //   procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
    procedure ArmarExcelNacimientos;
    procedure ArmarExcelNacimientosIndividales;
    procedure ArmarExcelNacimientosAnexo;
    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);

    procedure Exportar(item : integer);
    procedure ExportarNacimientosColectivos;
    procedure ExportarNacimientosIndividuales;

    function ArmarFecha() : string;
    function ArmarHora : string;
  public
    { Public declarations }
  end;

var
  fechaDesde, fechaHasta : TDate;
  ruta : string;
  id_rodeo, id_potrero, id_tipo_reg, tipo_servicio : integer;
  DelRodeo, DelPotrero, DelTipoRegistro, DelTipoServicio : boolean;
  FExpBrafordNacimientos: TFExpBrafordNacimientos;

implementation

uses
  UPrincipal, UCartel, UMensajeHuella, UGuardarEstiloHuella, DateUtils;

{$R *.dfm}

function TFExpBrafordNacimientos.ArmarFecha : string;
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

function TFExpBrafordNacimientos.ArmarHora : string;
var hora, hora_format :string;
begin
    hora := (TimetoStr(Time()));

    hora_format := StringReplace(hora, ':', '', [rfReplaceAll] );

    Result := hora_format;
end;

procedure TFExpBrafordNacimientos.FormCreate(Sender: TObject);
begin
    LTitulo.Caption := 'Exportar Datos de Nacimientos';

    id_rodeo := -1;
    id_potrero := -1;
    id_tipo_reg := -1;

    tipo_servicio := 1;

    DTPDesde.Date := IncYear(Now,-1);
    DTPHasta.Date := Now();  

end;

procedure TFExpBrafordNacimientos.ArmarExcelNacimientos;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQDatosExportar;
  DTXLS.Title.Text:= 'DECLARACION DE NACIMIENTOS COLECTIVOS (SERVICIOS COLECTIVOS).';

  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_servicio','Nº de Servicio.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'cant','Nº Vientres Entorados.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'machos','Nº Terneros Nacidos.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hembras','Nº Terneras Nacidas.',True);

end;

procedure TFExpBrafordNacimientos.ArmarExcelNacimientosIndividales;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQDatosExportar;
  DTXLS.Title.Text := 'DECLARACION DE NACIMIENTOS INDIVIDUALES.';

  AgregarColumnaExcel(column,taLeftJustify,0,'rp','RP Cría.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_raza','Raza',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'subcat','Tipo de Registro',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nom_sexo','Sexo Cría.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'fecha_nacimiento','Fecha Nacimiento Cría.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_cria','Nombre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp_madre_biologica','RP Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'pc_madre_biologica','A.B.A. Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_madre_biologica','HBA Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp_padre','Rp Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'pc_padre','A.B.A. Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_padre','HBA Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'mellizo','Mellizos',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'peso','Peso al Nacer',True);

end;

procedure TFExpBrafordNacimientos.ArmarExcelNacimientosAnexo();
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQGetAnimales;
  DTXLS.Title.Text:= 'NACIMIENTOS COLECTIVOS (DETALLE CRIAS / MADRES).';

  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_servicio','Nº Servicio.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp','RP Cría.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nomsexo','Sexo Cría.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'subcat','Reg. Cría.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp_madre_biologica','RP Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'pc_madre_biologica','A.B.A. Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_madre_biologica','HBA Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'mellizo','Mellizos',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'peso','Peso al Nacer',True);

end;


procedure TFExpBrafordNacimientos.AgregarColumnaExcel(var column: TxlColumn;
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

procedure TFExpBrafordNacimientos.CBRodeoChange(Sender: TObject);
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

procedure TFExpBrafordNacimientos.CBPotreroChange(Sender: TObject);
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

procedure TFExpBrafordNacimientos.BMostrarClick(Sender: TObject);
var cartel : TCartel;
begin

  cartel := TCartel.getInstance();
  cartel.abrircartel('Recuperando datos de nacimientos...');

  IBQGetAnimales.Close;
  IBQGetAnimales.SQL.Clear;
  IBQGetAnimales.SQL.Add('select sp.*, ta.pesonacer as peso,');
  IBQGetAnimales.SQL.Add('CASE ta.SEXO');
  IBQGetAnimales.SQL.Add('  WHEN 1 THEN ''No''');
  IBQGetAnimales.SQL.Add('       WHEN 2 THEN ''No''');
  IBQGetAnimales.SQL.Add('       ELSE ''Si''');
  IBQGetAnimales.SQL.Add('    END AS mellizo');
  IBQGetAnimales.SQL.Add('from rep_export_nacimientos_braford(:esta,:desde,:hasta) sp ');
  IBQGetAnimales.SQL.Add('left join tab_animales ta on (sp.animal = ta.id_animal)');


  IBQGetAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGetAnimales.ParamByName('desde').AsDate := DTPDesde.Date;
  IBQGetAnimales.ParamByName('hasta').AsDate := DTPHasta.Date;




  if (tipo_servicio <> 0) then
  begin
     if (tipo_servicio = 3) then
     begin
         IBQGetAnimales.SQL.Add(' where servicio = :servic');
         IBQGetAnimales.ParamByName('servic').AsInteger := tipo_servicio;
     end
     else
     begin
        IBQGetAnimales.SQL.Add(' where (servicio = :servic) or (servicio = :servic1)');
        IBQGetAnimales.ParamByName('servic').AsInteger := 1;
        IBQGetAnimales.ParamByName('servic1').AsInteger := 2;
     end
  end
  else
  begin
      IBQGetAnimales.SQL.Add(' where (servicio = :servic) or (servicio = :servic1) or (servicio = :servic2)');
      IBQGetAnimales.ParamByName('servic').AsInteger := 1;
      IBQGetAnimales.ParamByName('servic1').AsInteger := 2;
      IBQGetAnimales.ParamByName('servic2').AsInteger := 3;
  end;

  if (id_potrero <> -1) then
  begin
    IBQGetAnimales.SQL.Add(' and (potrero = :potrero)');
    IBQGetAnimales.ParamByName('potrero').AsInteger := id_potrero;
  end;

  if (id_rodeo <> -1) then
  begin
    IBQGetAnimales.SQL.Add(' and (rodeo = :rodeo)');
    IBQGetAnimales.ParamByName('rodeo').AsInteger := id_rodeo;
  end;

  if (id_tipo_reg <> -1) then
  begin
    IBQGetAnimales.SQL.Add(' and (tipo_reg = :tiporeg)');
    IBQGetAnimales.ParamByName('tiporeg').AsInteger := id_tipo_reg;
  end;

  IBQGetAnimales.Open;
  IBQGetAnimales.Last;
  IBQGetAnimales.First;

  GBGrilla.Caption := '  Animales [ '+IntToStr(IBQGetAnimales.RecordCount)+' ]  ';

  cartel.cerrarcartel();
  cartel.FreeInstance;  

end;


procedure TFExpBrafordNacimientos.DTPDesdeChange(Sender: TObject);
begin

  fechaDesde := DTPDesde.Date;

end;

procedure TFExpBrafordNacimientos.DTPHastaChange(Sender: TObject);
begin

  fechaHasta := DTPHasta.Date;

end;

procedure TFExpBrafordNacimientos.ISalirClick(Sender: TObject);
begin

  Close();

end;

procedure TFExpBrafordNacimientos.Exportar(item : integer);
var cartel : TCartel;
begin

  if (item = 1) then //servicio natural
    ExportarNacimientosColectivos;


  if (item = 2) then //servicio ia
    ExportarNacimientosIndividuales;

  if (item = 3) then
  begin
    ExportarNacimientosColectivos;
    ExportarNacimientosIndividuales;
  end;

end;

procedure TFExpBrafordNacimientos.ExportarNacimientosColectivos;
var fecha, hora : string;
begin

    IBQDatosExportar.Close;
    IBQDatosExportar.SQL.Clear;

    IBQDatosExportar.SQL.Add('select nombre_servicio, count(rp_madre_biologica) as cant, sum(cant_machos) as machos, sum(cant_hembras) as hembras, potrero, rodeo, tipo_reg from rep_export_nacimientos_braford(:esta,:desde,:hasta) where servicio in (1,2)');

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
    

    IBQDatosExportar.SQL.Add(' group by nombre_servicio, potrero, rodeo, tipo_reg');

    IBQDatosExportar.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDatosExportar.ParamByName('desde').AsDate := DTPDesde.Date;
    IBQDatosExportar.ParamByName('hasta').AsDate := DTPHasta.Date;
    IBQDatosExportar.Open;

    if not(IBQDatosExportar.IsEmpty) then
    begin
      ArmarExcelNacimientos;
      fecha := ArmarFecha;
      hora := ArmarHora;
      DTXLS.SaveToFile(ruta+'\Planilla Declaracion de Nacimientos Colectivos Braford - '+fecha+'-'+hora+'.xls');
    end;


//-------------------------Armo el anexo---------------------------------------------------------------------------------

    IBQDatosExportar.Close;
    IBQDatosExportar.SQL.Clear;

    IBQDatosExportar.SQL.Add('select nombre_servicio, rp, nomsexo, subcat, rp_madre_biologica, pc_madre_biologica, potrero, rodeo, tipo_reg from rep_export_nacimientos_braford(:esta,:desde,:hasta) where servicio in (1,2)');

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

    IBQDatosExportar.SQL.Add(' group by nombre_servicio, rp, nomsexo, subcat, rp_madre_biologica, pc_madre_biologica, potrero, rodeo, tipo_reg');

    IBQDatosExportar.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDatosExportar.ParamByName('desde').AsDate := DTPDesde.Date;
    IBQDatosExportar.ParamByName('hasta').AsDate := DTPHasta.Date;
    IBQDatosExportar.Open;

    if not(IBQDatosExportar.IsEmpty) then
    begin
      ArmarExcelNacimientosAnexo;
      DTXLS.SaveToFile(ruta+'\Planilla Nacimientos Colectivos Detalle - '+fecha+'-'+hora+'.xls');
    end;
end;

procedure TFExpBrafordNacimientos.ExportarNacimientosIndividuales;
var fecha, hora : string;
begin

    IBQDatosExportar.Close;
    IBQDatosExportar.SQL.Clear;
    IBQDatosExportar.SQL.Add('select sp.*, ta.nombre as nombre_cria , cr.nombre as nombre_raza, ta.pesonacer as peso,');
    IBQDatosExportar.SQL.Add('CASE ta.SEXO');
    IBQDatosExportar.SQL.Add('  WHEN 1 THEN ''No''');
    IBQDatosExportar.SQL.Add('       WHEN 2 THEN ''No''');
    IBQDatosExportar.SQL.Add('       ELSE ''Si''');
    IBQDatosExportar.SQL.Add('    END AS mellizo,');
    IBQDatosExportar.SQL.Add('    CASE css.TIPO');
    IBQDatosExportar.SQL.Add('       WHEN 1 THEN ''Macho''');
    IBQDatosExportar.SQL.Add('       WHEN 2 THEN ''Hembra''');
    IBQDatosExportar.SQL.Add('    END AS nom_sexo');
    IBQDatosExportar.SQL.Add(' from rep_export_nacimientos_braford(:esta,:desde,:hasta) sp ');
    IBQDatosExportar.SQL.Add('left join tab_animales ta on (sp.animal = ta.id_animal)');
    IBQDatosExportar.SQL.Add('left join COD_RAZAS cr on (ta.raza = cr.id_raza)');
    IBQDatosExportar.SQL.Add('LEFT JOIN cod_sexos css ON (ta.SEXO = css.ID_SEXO) where servicio = 3');

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

    //IBQDatosExportar.SQL.Add(' group by sp.nombre_servicio, sp.fecha_nacimiento, sp.rp, nom_sexo, subcat, sp.rp_madre_biologica, sp.pc_madre_biologica, sp.rp_padre, sp.nombre_padre, subcat_padre, razapadrenombre, hba_padre, sp.potrero, sp.rodeo, sp.tipo_reg');

    IBQDatosExportar.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDatosExportar.ParamByName('desde').AsDate := DTPDesde.Date;
    IBQDatosExportar.ParamByName('hasta').AsDate := DTPHasta.Date;
    IBQDatosExportar.Open;

    if not(IBQDatosExportar.IsEmpty) then
    begin
      ArmarExcelNacimientosIndividales;
      fecha := ArmarFecha;
      hora := ArmarHora;
      DTXLS.SaveToFile(ruta+'\Planilla Declaracion de Nacimientos Individuales - '+fecha+'-'+hora+'.xls');
    end;

end;

{procedure TFExpBrafordNacimientos.CBServicioNaturalClick(Sender: TObject);
begin
  tipo_servicio := 1;
  CBInseminacion.Checked := false;
  CBTodos.Checked := false;
end;

procedure TFExpBrafordNacimientos.CBInseminacionClick(Sender: TObject);
begin
  tipo_servicio := 3;
  CBServicioNatural.Checked := false;
  CBTodos.Checked := false;
end;

procedure TFExpBrafordNacimientos.CBTodosClick(Sender: TObject);
begin
  tipo_servicio := 0;
  CBServicioNatural.Checked := false;
  CBInseminacion.Checked := false;
end;   }

procedure TFExpBrafordNacimientos.IExcelClick(Sender: TObject);
var  cartel : TCartel;
F : TFGuardarEstiloHuella;
begin

  if (IBQGetAnimales.IsEmpty) then
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



procedure TFExpBrafordNacimientos.CBPotreroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelPotrero) then
  begin
       CBPotrero.Items.Delete(0);
       DelPotrero := true;
  end;

end;

procedure TFExpBrafordNacimientos.CBRodeoCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelRodeo) then
  begin
       CBRodeo.Items.Delete(0);
       DelRodeo := true; 
  end;

end;



procedure TFExpBrafordNacimientos.FormShow(Sender: TObject);
begin
    inherited;

    IBQPotrero.Close;
    IBQPotrero.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
    IBQPotrero.Open;
    IBQPotrero.First;

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

    CBTiposServicio.AddItem('TIPO SERVICIO',nil);
    CBTiposServicio.AddItem('(TODOS)',nil);
    CBTiposServicio.AddItem('SERVICIO NATURAL',nil);
    CBTiposServicio.AddItem('INSEMINACION ARTIFICIAL',nil);
    CBTiposServicio.ItemIndex := 0;

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
    while not(IBQTiposRegistro.Eof)do
    begin
      CBTiposRegistro.AddItem(IBQTiposRegistro.FieldValues['sinonimo'],nil);
      IBQTiposRegistro.Next;
    end;
    CBTiposRegistro.ItemIndex := 0;

    BMostrarClick(Sender);

end;

procedure TFExpBrafordNacimientos.CBTiposRegistroChange(Sender: TObject);
begin
  inherited;

  if ((CBTiposRegistro.Text <> 'TIPO DE REGISTRO') and (CBTiposRegistro.Text <> '(TODOS)')) then
      id_tipo_reg := IBQTiposRegistro.Lookup('sinonimo',CBTiposRegistro.Text,'id_subcategoria')
  else
  begin
      id_tipo_reg := -1;
      CBTiposRegistro.Items.Insert(0,'TIPO DE REGISTRO');
      CBTiposRegistro.ItemIndex := 0;
      DelTipoRegistro := false;
  end;

end;

procedure TFExpBrafordNacimientos.CBTiposRegistroCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelTipoRegistro) then
  begin
       CBTiposRegistro.Items.Delete(0);
       DelTipoRegistro := true;
  end;

end;

procedure TFExpBrafordNacimientos.CBTiposServicioCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTipoServicio) then
  begin
       CBTiposServicio.Items.Delete(0);
       DelTipoServicio := true;
  end;
end;

procedure TFExpBrafordNacimientos.CBTiposServicioChange(Sender: TObject);
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
