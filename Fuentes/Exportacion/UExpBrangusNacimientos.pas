unit UExpBrangusNacimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, Buttons, PngImage,
  jpeg, Grids, DBGrids, UBDBGrid, JvExExtCtrls, JvImage;

type
  TFExpBrangusNacimientos = class(TFUniversal)
    GBFiltros: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
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
    IBQRodeo: TIBQuery;
    IBQPotrero: TIBQuery;
    CBTipoRegistro: TComboBox;
    IBQTipoRegistro: TIBQuery;
    CBTiposServicio: TComboBox;
 {   procedure ImgTodosInactivosClick(Sender: TObject);
    procedure ImgTodosActivoClick(Sender: TObject);
    procedure ImgIATFInactivoClick(Sender: TObject);
    procedure ImgIATFActivoClick(Sender: TObject);
    procedure ImgServNatInactivoClick(Sender: TObject);
    procedure ImgServNatActivoClick(Sender: TObject);   }
    procedure FormCreate(Sender: TObject);
    procedure ImgVerAnimalesClick(Sender: TObject);
 {   procedure LServicioNaturalClick(Sender: TObject);
    procedure LTodosClick(Sender: TObject);
    procedure LInseminacionClick(Sender: TObject);  }
    procedure CBPotreroChange(Sender: TObject);
    procedure CBRodeoChange(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBPotreroCloseUp(Sender: TObject);
    procedure CBRodeoCloseUp(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
    procedure DTPDesdeCloseUp(Sender: TObject);
    procedure DTPHastaCloseUp(Sender: TObject);
    procedure CBTipoRegistroChange(Sender: TObject);
    procedure CBTipoRegistroCloseUp(Sender: TObject);
    procedure CBTiposServicioChange(Sender: TObject);
    procedure CBTiposServicioCloseUp(Sender: TObject);
  private
    { Private declarations }
    function ArmarFecha() : string;
    procedure Exportar();
    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield,title:String; save: Boolean);    
  public
    { Public declarations }
  end;

var
  FExpBrangusNacimientos: TFExpBrangusNacimientos;
  id_rodeo, id_potrero, id_tipo_reg, tipo_servicio : integer;
  fechadesde, fechahasta : TDate;
  DelPotrero, DelRodeo, DelTipoReg, DelTipoServicio : boolean;
  ruta : string;

implementation

{$R *.dfm}

uses UPrincipal,uTiposGlobales, UCartel, UMensajeHuella, UGuardarEstiloHuella, DateUtils;

function TFExpBrangusNacimientos.ArmarFecha : string;
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

{procedure TFExpBrangusNacimientos.ImgTodosInactivosClick(Sender: TObject);
begin
  inherited;
  ImgTodosInactivos.Visible := not(ImgTodosInactivos.Visible);
  ImgTodosActivo.Visible := not(ImgTodosActivo.Visible);
  tipo_servicio := 0;
end;

procedure TFExpBrangusNacimientos.ImgTodosActivoClick(Sender: TObject);
begin
  inherited;
  ImgTodosInactivos.Visible := not(ImgTodosInactivos.Visible);
  ImgTodosActivo.Visible := not(ImgTodosActivo.Visible);
end;

procedure TFExpBrangusNacimientos.ImgIATFInactivoClick(Sender: TObject);
begin
  inherited;
  ImgIATFInactivo.Visible := not(ImgIATFInactivo.Visible);
  ImgIATFActivo.Visible := not(ImgIATFActivo.Visible);
  tipo_servicio := 3;
end;

procedure TFExpBrangusNacimientos.ImgIATFActivoClick(Sender: TObject);
begin
  inherited;
  ImgIATFInactivo.Visible := not(ImgIATFInactivo.Visible);
  ImgIATFActivo.Visible := not(ImgIATFActivo.Visible);
end;

procedure TFExpBrangusNacimientos.ImgServNatInactivoClick(Sender: TObject);
begin
  inherited;
  ImgServNatInactivo.Visible := not(ImgServNatInactivo.Visible);
  ImgServNatActivo.Visible := not(ImgServNatActivo.Visible);
  tipo_servicio := 1;
end;

procedure TFExpBrangusNacimientos.ImgServNatActivoClick(Sender: TObject);
begin
  inherited;
  ImgServNatInactivo.Visible := not(ImgServNatInactivo.Visible);
  ImgServNatActivo.Visible := not(ImgServNatActivo.Visible);
end; }

procedure TFExpBrangusNacimientos.FormCreate(Sender: TObject);
begin
    inherited;
    id_rodeo := -1;
    id_potrero := -1;
    id_tipo_reg := -1;
    tipo_servicio := 1;
    DelPotrero := false;
    DelRodeo := false;
    DelTipoReg := false;

 {   ImgServNatActivo.Visible := true;
    ImgServNatInactivo.Visible := false;
    ImgIATFActivo.Visible := false;
    ImgIATFInactivo.Visible := true;
    ImgTodosActivo.Visible := false;
    ImgTodosInactivos.Visible := true;   }

    DTPDesde.Date := IncYear(Now,-1);
    DTPHasta.Date := Now();

end;

procedure TFExpBrangusNacimientos.ImgVerAnimalesClick(Sender: TObject);
var cartel : TCartel;
begin
  cartel := TCartel.getInstance();
  cartel.abrircartel('Recuperando datos de nacimientos...');

  IBQGetAnimales.Close;
  IBQGetAnimales.SQL.Clear;
  IBQGetAnimales.SQL.Add('select * from rep_export_nacimientos_brangus(:esta,:desde,:hasta)');
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
    IBQGetAnimales.SQL.Add(' and (tiporeg = :tipo_reg)');
    IBQGetAnimales.ParamByName('tipo_reg').AsInteger := id_tipo_reg;
  end;

  IBQGetAnimales.Open;
  IBQGetAnimales.Last;
  IBQGetAnimales.First;

  GBGrilla.Caption := '  Animales: '+IntToStr(IBQGetAnimales.RecordCount)+'  ';

  cartel.cerrarcartel();
  cartel.FreeInstance;

end;

{procedure TFExpBrangusNacimientos.LServicioNaturalClick(Sender: TObject);
begin
  inherited;

  if not(ImgServNatActivo.Visible) then
  begin
       tipo_servicio := 1;
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
       ImgServNatActivo.Visible := false;
       ImgServNatInactivo.Visible := true;
       
       ImgIATFActivo.Visible := false;
       ImgIATFInactivo.Visible := true;
       ImgTodosActivo.Visible := true;
       ImgTodosInactivos.Visible := false;
  end;

end;

procedure TFExpBrangusNacimientos.LTodosClick(Sender: TObject);
begin
  inherited;

  if not(ImgTodosActivo.Visible) then
  begin
       tipo_servicio := 0;
       ImgTodosActivo.Visible := true;
       ImgTodosInactivos.Visible := false;

       ImgServNatActivo.Visible := false;
       ImgServNatInactivo.Visible := true;
       ImgIATFActivo.Visible := false;
       ImgIATFInactivo.Visible := true;
  end;

end;

procedure TFExpBrangusNacimientos.LInseminacionClick(Sender: TObject);
begin
  inherited;

  if not(ImgIATFActivo.Visible) then
  begin
       tipo_servicio := 3;
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
       ImgIATFActivo.Visible := false;
       ImgIATFInactivo.Visible := true;

       ImgServNatActivo.Visible := false;
       ImgServNatInactivo.Visible := true;
       ImgTodosActivo.Visible := true;
       ImgTodosInactivos.Visible := false; 
  end;

end; }

procedure TFExpBrangusNacimientos.CBPotreroChange(Sender: TObject);
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

procedure TFExpBrangusNacimientos.CBRodeoChange(Sender: TObject);
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

procedure TFExpBrangusNacimientos.DTPDesdeChange(Sender: TObject);
begin
  inherited;

  fechaDesde := DTPDesde.Date;
end;

procedure TFExpBrangusNacimientos.DTPHastaChange(Sender: TObject);
begin
  inherited;

  fechaHasta := DTPHasta.Date;
end;

procedure TFExpBrangusNacimientos.ISalirClick(Sender: TObject);
begin
  inherited;

  Close();
end;

procedure TFExpBrangusNacimientos.FormShow(Sender: TObject);
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

    CBTiposServicio.AddItem('TIPO SERVICIO',nil);
    CBTiposServicio.AddItem('(TODOS)',nil);
    CBTiposServicio.AddItem('SERVICIO NATURAL',nil);
    CBTiposServicio.AddItem('INSEMINACION ARTIFICIAL',nil);
    CBTiposServicio.ItemIndex := 0;

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

    ImgVerAnimalesClick(sender);
end;

procedure TFExpBrangusNacimientos.CBPotreroCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelPotrero) then
  begin
       CBPotrero.Items.Delete(0);
       DelPotrero := true; 
  end;
end;

procedure TFExpBrangusNacimientos.CBRodeoCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelRodeo) then
  begin
       CBRodeo.Items.Delete(0);
       DelRodeo := true; 
  end;
end;

procedure TFExpBrangusNacimientos.IExcelClick(Sender: TObject);
var F : TFGuardarEstiloHuella;
    fecha : string;
begin

  fecha := ArmarFecha;

  if (IBQGetAnimales.IsEmpty) then
    MostrarMensaje(tmInformacion,'No existen animales que cumplan con las preferencias seleccionadas.')
  else
  begin
      F := TFGuardarEstiloHuella.Create(self);
      F.ShowModal;
      ruta := F.ruta;
      F.Destroy;

      if (ruta <> '') then
      try
          Exportar();
          DTXLS.SaveToFile(ruta+'\Planilla Declaracion de Nacimientos - '+fecha+'.xls');
          MostrarMensaje(tmInformacion,'Los datos se guardaron satisfactoriamente.'); 
      except on e: exception do
          MostrarMensaje(tmInformacion,'La ruta seleccionada es invalida, debe seleccionar otra.');
      end;
  end;

end;

procedure TFExpBrangusNacimientos.Exportar();
var column: TxlColumn;
begin
  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQGetAnimales;
  DTXLS.Title.Text:= 'PLANILLA DE NACIMIENTOS INDIVIDUALES';

  AgregarColumnaExcel(column,taLeftJustify,0,'RP','RP(CRIA)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'NOMBRE_ANIMAL','NOMBRE(CRIA)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_NACIMIENTO','FECHA NAC.(CRIA)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'SEXOTIPO','SEXO(CRIA)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'TIPO_SERVICIO','TS(CRIA)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'TIPO_PARTO','TP(CRIA)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'CODIGO_MUERTE','CM(CRIA)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'SUBCAT','REG(CRIA)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'COLOR','COLOR(CRIA)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'PESO_ANIMAL','PESO(CRIA)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'RP_MADRE_BIOLOGICA','RP(MADRE-DONANTE)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'CRIADOR_MADRE_BIOLOGICA','Nº CRIADOR(MADRE-DONANTE)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'HBA_MADRE_BIOLOGICA','HBA O AAB(MADRE-DONANTE)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'RAZAMADRENOMBREBIOLOGICA','RAZA(MADRE-DONANTE)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'NACIMIENTO_MADRE_BIOLOGICA','FECHA NAC.(MADRE-DONANTE)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'CATEGORIA_MADRE_BIOLOGICA','CAT.(MADRE-DONANTE)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'RP_MADRE_RECEPTORA','RP(RECEPTORA)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'RAZAMADRERECEPTORA','RAZA(RECEPTORA)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'NACIMIENTO_MADRE_RECEPTORA','FECHA NAC.(RECEPTORA)',True);
//  AgregarColumnaExcel(column,taLeftJustify,0,'RP','CAT.(RECEPTORA)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'RP_PADRE','RP(PADRE)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'CRIADOR_PADRE','Nº CRIADOR(PADRE)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'APODO_PADRE','APODO(PADRE)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'PC_PADRE','AAB(PADRE)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'HBA_PADRE','HBA (PADRE)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'RAZAPADRE','RAZA(PADRE)',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'NACIMIENTO_PADRE','FECHA NAC.(PADRE)',True);


end;

procedure TFExpBrangusNacimientos.AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);
begin
    column:= TxlColumn.Create(nil);
    column:= DTXLS.Columns.Add;
    column.Alignment:= alig;
    column.ColWidth:= coldwidth;
    column.DataField:= datafield;
    column.Save:= save;
    column.Title:= title;
end;

procedure TFExpBrangusNacimientos.DTPDesdeCloseUp(Sender: TObject);
begin
  inherited;

  fechadesde := DTPDesde.Date;
end;

procedure TFExpBrangusNacimientos.DTPHastaCloseUp(Sender: TObject);
begin
  inherited;

  fechahasta := DTPHasta.Date;
end;

procedure TFExpBrangusNacimientos.CBTipoRegistroChange(Sender: TObject);
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

procedure TFExpBrangusNacimientos.CBTipoRegistroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTipoReg) then
  begin
       CBTipoRegistro.Items.Delete(0);
       DelTipoReg := true;
  end;

end;

procedure TFExpBrangusNacimientos.CBTiposServicioCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTipoServicio) then
  begin
       CBTiposServicio.Items.Delete(0);
       DelTipoServicio := true;
  end;
end;

procedure TFExpBrangusNacimientos.CBTiposServicioChange(Sender: TObject);
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
