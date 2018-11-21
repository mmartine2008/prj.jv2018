unit UREPTexto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, CheckLst,
  Buttons, ImgList, QRCtrls, QuickRpt, ADODB, DB,  printers, IBDatabase, IBTable,
  IBCustomDataSet, IBQuery;

  // PARA MANEJAR EL TAMAÑOS DE LOS COMPONENTES EN EL REPORTE

  const C_ESPACIO : Integer = 15;
  const C_ESPACIO_DATE : Integer = 75;
  const C_ESPACIO_TEXTO : Integer = 115;
  const C_ESPACIO_NUMERICO : Integer = 55;

  //**********************************************************

type

  TArregloCampos = record
    campoSql, campoVisible, campoReferencia, campoVisibleUser : string;
    Enabled : boolean;
  end;

  TFREPTexto = class(TFUniversal)
    Panel1: TPanel;
    GBDetalle: TGroupBox;
    CLBDetalle: TCheckListBox;
    ILREPTexto: TImageList;
    AFiltroDetalle: TAction;
    GBAgrupacion: TGroupBox;
    CLBAgrupacion: TCheckListBox;
    PButtons: TPanel;
    BBSalir: TBitBtn;
    AFiltroAgrupacion: TAction;
    ASalir: TAction;
    BBVerReporte: TBitBtn;
    ARepPreview: TAction;
    ARepPrint: TAction;
    BBImprimirReporte: TBitBtn;
    Panel2: TPanel;
    BBFiltrarCampos: TBitBtn;
    Panel3: TPanel;
    BBFiltrarAgrupados: TBitBtn;
    CBAgrupar: TCheckBox;
    AAgrupar: TAction;
    BBAyuda: TBitBtn;

    // acciones
    procedure ASalirExecute(Sender: TObject);
    procedure ARepPreviewExecute(Sender: TObject);
    procedure AAgruparExecute(Sender: TObject);

    // para configurar las bandas en el reporte
    procedure generarBandaDetail();
    procedure generarBandaEncabezadoANDMaster();
    procedure generarBandaEncabezadoANDMaster2();


    // para los query's
    procedure SetSQLMaster (sentencia : AnsiString);
    procedure SetSQLDetail (sentencia : AnsiString);

    // para setear los filtros(si se desea)(SIN USO)
    procedure SetFiltroMaster (sentencia : string);
    procedure SetFiltroDetail (sentencia : string);

    // para configurar las sentencias de los query`s
    procedure generarConsultaMaster();
    procedure generarConsultaDetail();

    // para configurar el master si es detail
    procedure generarConsultaMaster2;

    // para los arreglos
    procedure addCampo(sql, visible, referencia, visibleUsuario : string; var arre:array of TArregloCampos);
    procedure inicArregloMaster( tam : integer);
    procedure inicArregloDetail( tam : integer);
    function cantidadDeCampos( arre : array of TArregloCampos) : integer;
    function retornarSinonimo( item : string; arre : array of TarregloCampos ): string;
    function retornarRerencia( item : string ): string;  //ARREDETAIL
    function retornarCampoVisible( item : string ) : string;   //ARREDETAIL
    function retornarSobreNombre( item : string ) : string;    //ARREDETAIL
    function retornarSobreNombre2( item : string ) : string;   //ARREMASTER

    //para el formulario
    procedure FormShow(Sender: TObject);

    //para los checklistbox
    procedure CLBDetalleClick(Sender: TObject);
    procedure CLBAgrupacionClick(Sender: TObject);
    function cuantosChecked(clb: TCheckListBox):integer;

    //para el quickreport
    function ControlarWidth(desplazamiento_X, anchoDeBanda, CantidadActual, CantidadTotal: integer; var flag:boolean) : boolean;
    function generarTQRLabel ( banda: TQRBand; desplazamiento_X : integer; cadena : string; consulta : TIBQuery; id : integer) : integer;
    procedure generarTQRDBLabel (banda: TQRBand; desplazamiento_X : integer; cadena : string; consulta : TIBQuery; id : integer);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREPTexto: TFREPTexto;

  ArregloDeCamposMaster : array of TarregloCampos;
  ArregloDeCamposDetail : array of TArregloCampos;

  SQLMaster : AnsiString;
  SQLDetail : AnsiString;

  SQLFiltroMaster : string;
  SQLFiltroDetail : string;
  filtroMaster : boolean;
  filtroDetail : boolean;

  tamanioMaster : integer;
  tamanioDetail : integer;

implementation

uses UREPPreview;
{$R *.dfm}

// AGREGA CAMPOS A LOS ARREGLOS DE MASTER Y DE DETALLE
procedure TFREPTexto.addCampo(sql, visible, referencia, visibleUsuario: string; var Arre: array of TArregloCampos);
var pos : integer;
begin
  pos := cantidadDeCampos(Arre);
  Arre[pos].campoSql := sql;
  Arre[pos].campoVisible := visible;
  Arre[pos].CampoReferencia := referencia;
  Arre[pos].Enabled := false;
  Arre[pos].campoVisibleUser := visibleUsuario;
end;

// RETORNA LA CANTIDAD DE ELEMENTOS AGREGADOS EN EL ARREGLO PASADO COMO PARAMETRO
function TFREPTexto.cantidadDeCampos( arre: array of TArregloCampos): integer;
var cont : integer;
    flag : boolean;
begin
  flag := true;
  for cont := 0 to Length(arre) do
  begin
    if ((arre[cont].campoSql= '' ) and (flag ))then
      begin
        Result := cont;
        flag := false;
      end;
  end;
  if (flag) then
    Result := Length(arre);
end;

// GENERA LA BANDA DETAIL DEPENDIENDO DE LOS CAMPOS SELECCIONADOS
procedure TFREPTexto.generarBandaDetail;
var cont: integer;
    x : integer;
    next_x : integer;
    flag : boolean;
    fieldName : string;

begin
  flag := true;
  cont:= 0;
  x := 30;
  next_x := 0;

  // configuro la vista de la banda
  FREPPreview.BANDTitleSubDetail.Frame.DrawTop := true;
  FREPPreview.BANDTitleSubDetail.Frame.DrawBottom := true;
  FREPPreview.BANDTitleSubDetail.Frame.Color := clSilver;
  FREPPreview.BANDTitleSubDetail.Frame.Style := psSolid;
  FREPPreview.BANDTitleSubDetail.Frame.Width := 1;
  //*******************************

  while (cont < CLBDetalle.Items.Count) do
    begin
      if (CLBDetalle.Checked[cont]) then
        begin
          next_x := generarTQRLabel (TQRBand(FREPPreview.BANDTitleSubDetail), x, CLBDetalle.Items.Strings[cont], FREPPreview.IBQDetail,0);
          generarTQRDBLabel (TQRBand(FREPPreview.BANDDetail), x, CLBDetalle.Items.Strings[cont], FREPPreview.IBQDetail, 0);
          x := next_x;
          if (ControlarWidth(x, FREPPreview.BANDTitleSubDetail.Width, cont, CLBDetalle.Items.Count, flag))then
            exit;
        end;
      inc(cont);
    end;
end;

// GENERA LAS BANDAS DE ENCABEZADO Y MASTER DEPENDIENDO DE LOS CAMPOS SELECCIONADOS
procedure TFREPTexto.generarBandaEncabezadoANDMaster;
var cont: integer;
    x : integer;
    next_x : integer;
    flag : boolean;

begin
  flag := true;
  cont:= 0;
  x := 0;
  next_x := 0;

  // configuro la vista de la banda
  with FREPPreview.BANDEncabezado.frame do
    begin
      DrawBottom := true;
      color := clSilver;
      style := psSolid;
      width := 1;
    end;

  while (cont < CLBDetalle.Items.Count) do
    begin
      if (CLBDetalle.Checked[cont]) then
        begin
          next_x := generarTQRLabel (FREPPreview.BANDEncabezado, x, CLBDetalle.Items.Strings[cont], FREPPreview.IBQMaster,0);
          generarTQRDBLabel (FREPPreview.BANDMaster, x, CLBDetalle.Items.Strings[cont], FREPPreview.IBQMaster, 0);
          x := next_x;
          if (ControlarWidth(x, FREPPreview.BANDEncabezado.Width, cont, CLBDetalle.Items.Count, flag))then
            exit;
        end;
      inc(cont);
    end;
end;

// genero la consulta master en caso de que se halla seleccionado alguna agrupacion
procedure TFREPTexto.generarConsultaMaster2;
var cont : integer;
    sel : string;
    subSql : string;
begin
  cont := 0;
  sel := ' ';
  while (cont < CLBAgrupacion.Items.Count) do
    begin
      if (CLBAgrupacion.Checked[cont]) then
        begin
          if (cont >= 1) and (CLBAgrupacion.Checked[cont-1])then
            sel := sel + ', ';
          if (cuantosChecked(CLBAgrupacion)=1) then
            sel := 'distinct( '+ retornarSinonimo(CLBAgrupacion.Items.Strings[cont], arregloDeCamposDetail)+') , '+retornarCampoVisible(CLBAgrupacion.Items.Strings[cont])
          else
            sel := sel + retornarSinonimo(CLBAgrupacion.Items.Strings[cont], arregloDeCamposDetail)+' , '+retornarCampoVisible(CLBAgrupacion.Items.Strings[cont]);
        end;
    inc(cont);
    end;

   with FREPPreview.IBQMaster do
    begin
       active := false;
       sql.Clear;
       subSql := stringReplace(SQLDetail, '<<SUM>>', sel, [rfIgnoreCase]);
       if (filtroMaster) then
         subSql := stringReplace(subSql, '<<FILTRO>>', SQLFiltroMaster, [rfIgnoreCase]);
       sql.Add(subSql);
       active := true;
    end;
end;

// GENERO LA CONSULTA DEL DETAIL DEPENDIENDO DE LOS CAMPOS SELECCIONADOS
procedure TFREPTexto.generarConsultaDetail;
var cont : integer;
    sel : string;
    subSql : string;
    where : string;
begin
  cont := 0;
  sel := ' ';
  where := ' ';
  while (cont < CLBAgrupacion.Items.Count) do
    begin
      if (CLBAgrupacion.Checked[cont]) then
        begin
          if (cont >= 1) then
            where := where + ' and '
          else
            where := 'where ';
          where := where + '( '+retornarRerencia(CLBAgrupacion.items.Strings[cont]) + ' = :'+ retornarSinonimo(CLBAgrupacion.items.Strings[cont], arregloDeCamposDetail)+' )';
        end;
    inc(cont);
    end;

  cont := 0;
  while (cont < CLBDetalle.Items.Count) do
    begin
      if (cont >= 1) then
          sel := sel + ', ';
      sel := sel + retornarSinonimo(CLBDetalle.Items.Strings[cont], arregloDeCamposMaster);
      inc(cont);
    end;

   with FREPPreview.IBQDetail do
    begin
       active := false;
       sql.Clear;
       subSql := stringReplace(SQLMaster, '<<SUM>>', sel, [rfIgnoreCase]);
       if (filtroDetail) then
          subSql := stringReplace(subSql, '<<FILTRO>>', SQLFiltroDetail, [rfIgnoreCase])
       else
          subSql := stringReplace(subSql, '<<FILTRO>>', '', [rfIgnoreCase]);
       subSql := subSql +' '+ where;
       sql.Add(subSql);
       active := true;
    end;

end;

// GENERO LA CONSULTA DEL MASTER DEPENDIENDO DE LOS CAMPOS SELECCIONADOS
procedure TFREPTexto.generarConsultaMaster;
var cont : integer;
    sel : string;
    subSql : string;
begin
  cont := 0;
  sel := ' ';

  while (cont < CLBDetalle.Items.Count) do
    begin
      if (CLBDetalle.Checked[cont]) then
        begin
          if (cont >= 1) and (sel <> ' ')then
            sel := sel + ', ';
          sel := sel + retornarSinonimo(CLBDetalle.Items.Strings[cont], arregloDeCamposMaster);
        end;
    inc(cont);
    end;

   with FREPPreview.IBQMaster do
    begin
       active := false;
       sql.Clear;
       subSql := stringReplace(SQLMaster, '<<SUM>>', sel, [rfIgnoreCase]);
       if (filtroMaster) then
         subSql := stringReplace(subSql, '<<FILTRO>>', SQLFiltroMaster, [rfIgnoreCase]);
       sql.Add(subSql);
       active := true;
    end;
end;

//INICIALIZO EL ARREGLO DE DETALLE
procedure TFREPTexto.inicArregloDetail(tam: integer);
begin
  SetLength(ArregloDeCamposDetail,tam);
  tamanioDetail := tam;
end;

//INICIALIZO EL ARREGLO DE MASTER
procedure TFREPTexto.inicArregloMaster(tam: integer);
begin
  SetLength(ArregloDeCamposMaster,tam);
  tamanioMaster := tam;
end;

// RETORNA EL SINONIMO EN SQL DEL CAMPO QUE APARECE EN LOS LISTBOX
function TFREPTexto.retornarSinonimo(item: string; arre: array of TarregloCampos): string;
var flag : boolean;
    cont : integer;
begin
  flag := false;
  cont := 0;
  while not(flag) do
    begin
      if (StrComp(PChar(arre[cont].campoVisible), PChar(item)) = 0) then
        begin
          Result := arre[cont].campoSql;
          flag := not(flag);
        end;
      inc(cont);
    end;
end;

// ACA VA LA IMPLEMENTACIO DE LOS FILTROS
procedure TFREPTexto.SetFiltroDetail(sentencia: string);
begin
// codigo
end;
procedure TFREPTexto.SetFiltroMaster(sentencia: string);
begin
// codigo
end;
//****************************************

// SETEO UNA CONSULTA GENERICA PARA EL DETALLE
procedure TFREPTexto.SetSQLDetail(sentencia: AnsiString);
begin
  SQLDetail := sentencia;
end;

// SETEO UNA CONSULTA GENERICA PARA EL MASTER
procedure TFREPTexto.SetSQLMaster(sentencia: AnsiString);
begin
  SQLMaster := sentencia;
end;

// METODO SHOW DEL FORMULARIO
procedure TFREPTexto.FormShow(Sender: TObject);
var cont : integer;
begin
  inherited;

  filtroMaster := false;
  filtroDetail := false;

  SetSQLMaster('select <<SUM>> from Tab_animales join eve_eventos on (tab_animales.id_animal = eve_eventos.animal) join eve_diagnostico_Gestacion on (eve_eventos.id_evento = eve_diagnostico_gestacion.dom_id_evento)');

  SetSQLDetail('select <<SUM>> from tab_rodeos, cod_preneces');

  inicArregloMaster(5);
  addCampo('eve_diagnostico_gestacion.condicion_corporal as condicion', 'Condición Corporal','','',ArregloDeCamposMaster);
  addCampo('fecha_nacimiento', 'Nacido el','','',ArregloDeCamposMaster);
  addCampo('rodeo', 'Rodeo','','',ArregloDeCamposMaster);
  addCampo('codigo_prenez', 'Tipo Preñez','','',ArregloDeCamposMaster);
  addCampo('fecha', 'Fecha de tacto','','',ArregloDeCamposMaster);

  inicArregloDetail(2);
  addCampo('id_rodeo','Rodeos','rodeo','Tab_rodeos.nombre as nombre1', ArregloDeCamposDetail);
  addCampo('id_codigo_prenez','Tipo de preñez','codigo_prenez','Cod_preneces.nombre as nombreTipo', ArregloDeCamposDetail);

  cont := 0;
  CLBDetalle.Clear;
  while (cont < tamanioMaster) do
    begin
      CLBDetalle.Items.Add(ArregloDeCamposMaster[cont].campoVisible);
      CLBDetalle.Checked[cont] := ArregloDeCamposMaster[cont].Enabled;
      inc(cont);
    end;
  cont := 0;
  CLBAgrupacion.Clear;
  while (cont < tamanioDetail) do
    begin
      CLBAgrupacion.Items.Add(ArregloDeCamposDetail[cont].campoVisible);
      CLBAgrupacion.Checked[cont] := ArregloDeCamposDetail[cont].Enabled;
      inc(cont);
    end;
end;

// METODO PARA HACER EL PREVIEW DEL REPORTE
procedure TFREPTexto.ARepPreviewExecute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFREPPreview, FREPPreview);
  FREPPreview.LabelTitle.Caption := 'Todos los tactos realizados';

  if (CBAgrupar.Checked) and ((cuantosChecked(CLBAgrupacion)> 0)) then
    begin
      FREPPreview.BANDDetail.Enabled := true;
      FREPPreview.BANDTitleSubDetail.Enabled := true;

      generarConsultaMaster2();
      generarBandaEncabezadoANDMaster2();
      generarConsultaDetail();
      generarBandaDetail();
      FREPPreview.QR1.PreviewModal;
    end
  else
    begin
      if (cuantosChecked(CLBDetalle)> 0) then
        begin
          generarConsultaMaster();
          generarBandaEncabezadoANDMaster();
          FREPPreview.QR1.PreviewModal;
        end
      else
        begin
          ShowMessage('No ha seleccionado ningún campo para el reporte');
        end;
    end;
end;

// METODO PARA SALIR
procedure TFREPTexto.ASalirExecute(Sender: TObject);
begin
  inherited;
  close;
end;

// GUARDO EN EL ARREGLO DE DETALLE LA SELECCION DE COLUMNAS HECHA
procedure TFREPTexto.CLBDetalleClick(Sender: TObject);
begin
  inherited;
  if (CLBDetalle.Checked[CLBDetalle.ItemIndex]) then
    ArregloDeCamposMaster[CLBDetalle.ItemIndex].Enabled := true
  else
    ArregloDeCamposMaster[CLBDetalle.ItemIndex].Enabled := false;
end;

// GUARDO EN EL ARREGLO DE AGRUPACION LA SELECCION DE COLUMNAS HECHA
procedure TFREPTexto.CLBAgrupacionClick(Sender: TObject);
begin
  inherited;
  if (CLBAgrupacion.Checked[CLBAgrupacion.ItemIndex]) then
    ArregloDeCamposDetail[CLBAgrupacion.ItemIndex].Enabled := true
  else
    ArregloDeCamposDetail[CLBAgrupacion.ItemIndex].Enabled := false;
end;

// metodo que retorna la refernecia a la sentencia sql master
function TFREPTexto.retornarRerencia(item: string): string;
var flag : boolean;
    cont : integer;
begin
  flag := false;
  cont := 0;
  while not(flag) do
    begin
      if (StrComp(PChar(ArregloDeCamposDetail[cont].campoVisible), PChar(item)) = 0) then
        begin
          Result := ArregloDeCamposDetail[cont].CampoReferencia;
          flag := not(flag);
        end;
      inc(cont);
    end;
end;

// Para el caso de que se desea agrupar se necesita configurar estas bandas de diferente forma
procedure TFREPTexto.generarBandaEncabezadoANDMaster2;
var cont: integer;
    x : integer;
    next_x : integer;
    flag : boolean;

begin
  flag := true;
  cont:= 0;
  x := 0;
  next_x := 0;

  // configuro las vistas de las bandas
  FREPPreview.BANDMaster.Frame.DrawTop := true;
  FREPPreview.BANDMaster.Frame.color := clSilver;
  FREPPreview.BANDMaster.Frame.Style := psSolid;
  FREPPreview.BANDMaster.Frame.Width := 1;

  FREPPreview.BANDTitleSubDetail.Frame.DrawTop := true;
  FREPPreview.BANDTitleSubDetail.Frame.DrawBottom := true;
  FREPPreview.BANDTitleSubDetail.Frame.Color := clSilver;
  FREPPreview.BANDTitleSubDetail.Frame.Style := psSolid;
  FREPPreview.BANDTitleSubDetail.Frame.Width := 1;
  //**********************

  while (cont < CLBAgrupacion.Items.Count) do
    begin
      if (CLBAgrupacion.Checked[cont]) then
        begin
          next_x := generarTQRLabel (FREPPreview.BANDEncabezado, x, CLBAgrupacion.Items.Strings[cont], FREPPreview.IBQMaster,1);
          generarTQRDBLabel (FREPPreview.BANDMaster, x, CLBAgrupacion.Items.Strings[cont], FREPPreview.IBQMaster, 1);
          x := next_x;
          if (ControlarWidth(x, FREPPreview.BANDEncabezado.Width, cont, CLBAgrupacion.Items.Count, flag))then
            exit;
        end;
      inc(cont);
    end;
end;

// simplemente retorna la cantidad de items chequeados(TRUE) que hay en un CheckListBox
function TFREPTexto.cuantosChecked(clb: TCheckListBox): integer;
var cont : integer;
    retorno : integer;
begin
  cont := 0;
  retorno := 0;
  while (cont < clb.Items.Count) do
    begin
      if (clb.Checked[cont])then
        inc(retorno);
      inc(cont);
    end;
  result := retorno;
end;

// cuando tengo que agrupar por algun campo no muestro un identificados, sino una descripcion o nombre,
// entonces dado un string en el checklistbox retorno el campo adecuado
function TFREPTexto.retornarCampoVisible(item: string): string;
var flag : boolean;
    cont : integer;
begin
  flag := false;
  cont := 0;
  while not(flag) do
    begin
      if (StrComp(PChar(ArregloDeCamposDetail[cont].campoVisible), PChar(item)) = 0) then
        begin
          Result := ArregloDeCamposDetail[cont].campoVisibleUser;
          flag := not(flag);
        end;
      inc(cont);
    end;
end;

// si tengo un sobrenombre en el agrupamiento ya sea por un ensamble devuelvo el sobrenombre
function TFREPTexto.retornarSobreNombre(item: string): string;
var aux : string;
    cont : integer;
    indice : integer;
    flag : boolean;
begin
  aux := retornarCampoVisible(item);
  flag := false;
  indice := 0;
  cont := 0;
  while (cont < length(aux))and not(flag) do
    begin
      if (aux[cont]= ' ' )and (aux[cont+1]='a') and (aux[cont+2]='s') and (aux[cont+3]= ' ') then
        begin
          flag := true;
          indice := cont+4;
          cont := cont+4;
        end;
      inc(cont);
    end;
  result := '';
   while (indice <= length(aux)) do
    begin
      result := result + aux[indice];
      inc(indice);
    end;
end;

// lo mismo que para el agrupamiento pero para el detalle, ademas se fija en distintos campos
function TFREPTexto.retornarSobreNombre2(item: string): string;
var aux : string;
    cont : integer;
    indice : integer;
    flag : boolean;
begin
  aux := retornarSinonimo(item, ArregloDeCamposMaster);
  flag := false;
  indice := 0;
  cont := 0;
  while (cont < length(aux))and not(flag) do
    begin
      if (aux[cont]= ' ' )and (aux[cont+1]='a') and (aux[cont+2]='s') and (aux[cont+3]= ' ') then
        begin
          flag := true;
          indice := cont+4;
          cont := cont+4;
        end;
      inc(cont);
    end;
  result := '';
   while (indice <= length(aux)) do
    begin
      result := result + aux[indice];
      inc(indice);
    end;
end;

// METODO QUE HABILITA O DESHABILITA LA PARTE DE AGRUPACION
procedure TFREPTexto.AAgruparExecute(Sender: TObject);
begin
  inherited;
  if (CBAgrupar.Checked) then
    begin
      GBAgrupacion.Enabled := true;
      CLBAgrupacion.Enabled := true;
    end
  else
    begin
      GBAgrupacion.Enabled := false;
      CLBAgrupacion.Enabled := false;
      FREPPreview.BANDDetail.Enabled := false;
      FREPPreview.BANDTitleSubDetail.Enabled := false;
    end;
end;

// este metodo controla si se debe apaisar o no la hoja, avisa por medio de un messagedlg
// y de acuerdo a la respuesta del usuario, actua
function TFREPTexto.ControlarWidth(desplazamiento_X, anchoDeBanda, CantidadActual, CantidadTotal: integer; var flag: boolean): boolean;

begin
  result := false;
  case (FREPPreview.QR1.Page.Orientation) of
    poLandScape : begin
                    if (desplazamiento_X > (anchoDeBanda - 50)) and (CantidadActual+1 <> CantidadTotal) and (flag) then
                      if MessageDlg('Ha sobrepasado el tamaño de la hoja, ¿Desea Continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                        begin
                          Result := true;
                          close;

                        end
                      else
                        flag := false;
                  end;
    poPortrait  : begin
                    if (desplazamiento_X > (anchoDeBanda - 50)) and (CantidadActual+1 <> CantidadTotal) and (flag)then
                       begin
                         if MessageDlg('Desea apaisar la hoja', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                           begin
                             FREPPreview.QR1.Page.Orientation := poLandScape;
                             flag := true;
                           end
                         else
                            flag := false;
                       end;
                  end;
  end;
end;

// agrega un TQRLabel en la banda que pasamos como parametro, sirve para las bandas que haces de encabezados
function TFREPTexto.generarTQRLabel(banda: TQRBand; desplazamiento_X: integer; cadena: string; consulta: TIBQuery; id : integer): integer;

var espacio : integer;
    espacioTexto : integer;
    espacioNumerico : integer;
    espacioDate : integer;
    fieldName : string;

begin
  espacio := C_ESPACIO;
  espacioTexto := C_ESPACIO_TEXTO;
  espacioNumerico := C_ESPACIO_NUMERICO;
  espacioDate := C_ESPACIO_DATE;

  with  (TQRLabel (banda.AddPrintable(TQRLabel))) do
    begin
      Left := desplazamiento_X;
      Top := 0;
      font.Style := [fsBold];
      color := clWhite;
      autoSize := false;
      alignment := taLeftJustify;
      if (id = 0) then
        fieldName := retornarSobreNombre2(cadena)
      else
        fieldName := retornarSobreNombre(cadena);
      case (TDataType(consulta.FieldByName(fieldName).DataType)) of
        TfieldType(ftString) :  begin
                                  Width := espacioTexto;
                                  result := desplazamiento_X + espacioTexto + espacio;
                                end;
        TfieldType(ftInteger), TfieldType(ftFloat):
                                begin
                                  Width := espacioNumerico;
                                  result := desplazamiento_X + espacioNumerico + espacio;
                                end;
        TfieldType(ftDate):
                                begin
                                  Width := espacioDate;
                                  result := desplazamiento_X + espacioDate + espacio;
                                end;
      end;
      Caption := cadena;
    end;
end;

//genera un TQRDBLabel en la banda que le pasemos como parametro

procedure TFREPTexto.generarTQRDBLabel(banda: TQRBand;
  desplazamiento_X: integer; cadena: string; consulta: TIBQuery; id : integer);
var espacioTexto : integer;
    espacioNumerico : integer;
    espacioDate : integer;
    fieldName : string;

begin
  espacioTexto := C_ESPACIO_TEXTO;
  espacioNumerico := C_ESPACIO_NUMERICO;
  espacioDate := C_ESPACIO_DATE;

  if (id = 0) then
    fieldName := retornarSobreNombre2(cadena)
  else
    fieldName := retornarSobreNombre(cadena);

  with (TQRDBText(banda.AddPrintable(TQRDBText))) do
    begin
      left := desplazamiento_X;
      top := 0;
      color := clWhite;
      autoSize := false;
      dataset := consulta;
      DataField := fieldName;
      case (TDataType(consulta.FieldByName(fieldName).DataType)) of
        TfieldType(ftString) :  begin
                                  Width := espacioTexto;
                                  alignment := taLeftJustify;
                                end;
        TfieldType(ftInteger) : begin
                                  alignment := taRightJustify;
                                  Width := espacioNumerico-20;
                                end;

        TfieldType(ftFloat):
                                begin
                                  alignment := taRightJustify;
                                  Width := espacioNumerico;
                                end;
        TfieldType(ftDate):
                                begin
                                  Width := espacioDate;
                                  alignment := taCenter;
                                end;
      end;
    end;
end;

end.
