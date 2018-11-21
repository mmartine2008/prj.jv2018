unit USelectorAnimales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, Buttons, PngImage, jpeg, Grids, DBGrids,
  UBDBGrid, UPrincipal, JvFullColorSpaces, JvFullColorCtrls, EditAuto,
  ImgList, Menus, UEveSimple, UEveEliminarAnimal, JvExExtCtrls, JvImage,
  Mask, PngImageList, ULectorElectronico,ULectorAllFlexSerie;

type
  TFSelectorAnimales = class(TFUniversal)
    PCentral: TPanel;
    PSuperior: TPanel;
    PIzq: TPanel;
    GBListadoAnimales: TGroupBox;
    BDBGListado: TBitDBGrid;
    DSListadoAnimales: TDataSource;
    ISubirIzq: TImage;
    IBajarIzq: TImage;
    PDer: TPanel;
    IBQListadoAux: TIBQuery;
    IBQRodeo: TIBQuery;
    IBQPotrero: TIBQuery;
    IBQOrigen: TIBQuery;
    IBQCategoria: TIBQuery;
    IBQRazas: TIBQuery;
    PMListadoAnimales: TPopupMenu;
    ListadodeAnimales1: TMenuItem;
    ListadodeAnimalesCab1: TMenuItem;
    ImageList1: TImageList;
    IBQParametros: TIBQuery;
    ActionList1: TActionList;
    Action1: TAction;
    ACSalir: TAction;
    ACReportPrint: TAction;
    ACReportPreview: TAction;
    AVerFicha: TAction;
    AImprimirListado: TAction;
    AEliminarAnimal: TAction;
    IBQAux: TIBQuery;
    IBStoredProc1: TIBStoredProc;
    PopupMenu1: TPopupMenu;
    IBQTipoRegistro: TIBQuery;
    IBQColor: TIBQuery;
    IBQEstadoRepro: TIBQuery;
    IBQCondCorporal: TIBQuery;
    IBQEstadoParicion: TIBQuery;
    ISubirDer: TImage;
    IBajarDer: TImage;
    PBotones: TPanel;
    IFondoB: TImage;
    IAyuda: TImage;
    LAyuda: TLabel;
    IFicha: TImage;
    LFicha: TLabel;
    IPreview: TImage;
    LPreliminar: TLabel;
    IExcel: TImage;
    LExcel: TLabel;
    IEliminarAnim: TImage;
    LEliminarAnimal: TLabel;
    ISalir: TImage;
    LSalir: TLabel;
    BitBtn3: TBitBtn;
    BBAyuda: TBitBtn;
    BitBtn1: TBitBtn;
    BBXls: TBitBtn;
    BBSalir: TBitBtn;
    BBImprimirListado: TBitBtn;
    BBFichaAnimal: TBitBtn;
    BBEliminarAnimal: TBitBtn;
    PListados: TPanel;
    IListadoAnimales: TImage;
    LRepIndividual: TJvLabel;
    IRepIndividual: TImage;
    TPanel: TTimer;
    PSuperiorFiltros: TPanel;
    PSelecBusq: TPanel;
    PFiltros: TPanel;
    GBFiltros: TGroupBox;
    CBRodeo: TComboBox;
    CBPotrero: TComboBox;
    CBOrigen: TComboBox;
    CBCategoria: TComboBox;
    CBEstadoRepro: TComboBox;
    CBCantPartos: TComboBox;
    CBRaza: TComboBox;
    CBTipoRegistro: TComboBox;
    CBColor: TComboBox;
    CBCondCorporal: TComboBox;
    GBPeso: TGroupBox;
    LPesoHasta: TLabel;
    LPesoDesde: TLabel;
    LPeso: TLabel;
    EAPesoHasta: TEditAuto;
    EAPesoDesde: TEditAuto;
    GBFrame: TGroupBox;
    LFrameHasta: TLabel;
    LFrameDesde: TLabel;
    LFrame: TLabel;
    EAFrameHasta: TEditAuto;
    EAFrameDesde: TEditAuto;
    GBNacidos: TGroupBox;
    LY: TLabel;
    LNacidosEntre: TLabel;
    DTPHasta: TDateTimePicker;
    DTPDesde: TDateTimePicker;
    CBAnimalesInactivos: TCheckBox;
    GroupBox1: TGroupBox;
    EARP: TEditAuto;
    JvIBuscar: TJvImage;
    JvIBotonBuscar: TJvImage;
    EAHastaDia: TEdit;
    EAHastaMes: TEdit;
    EAHastaAnio: TEdit;
    Label2: TLabel;
    GBFechaDesde: TGroupBox;
    EADesdeMes: TEdit;
    Label1: TLabel;
    EADesdeAnio: TEdit;
    EADesdeDia: TEdit;
    GBFechaHasta: TGroupBox;
    TimerLector: TTimer;
    LRepPedigree: TJvLabel;
    IRepPedigree: TImage;
    Label3: TLabel;
    LOrdenNumerico: TLabel;
    LOrdenAlfanumerico: TLabel;
    IVerAnimalesInacOn: TImage;
    IVerAnimalesInacOff: TImage;
    IOrdenNumericoOn: TImage;
    IOrdenNumericoOff: TImage;
    IOrdenAlfanumericoOn: TImage;
    IOrdenAlfanumericoOff: TImage;
    LRepListadoCabBra: TLabel;
    IRepListadoCabBra: TImage;
    CBSexo: TComboBox;
    procedure BDBGListadoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure IBajarIzqClick(Sender: TObject);
    procedure ISubirIzqClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure LVerAnimalesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBTodosClick(Sender: TObject);
    procedure CBRodeoChange(Sender: TObject);
    procedure CBPotreroChange(Sender: TObject);
    procedure CBOrigenChange(Sender: TObject);
    procedure IFichaClick(Sender: TObject);
    procedure CBRazaChange(Sender: TObject);
    procedure CBColorChange(Sender: TObject);
    procedure CBTipoRegistroChange(Sender: TObject);
    procedure CBCategoriaChange(Sender: TObject);
    procedure CBEstadoReproChange(Sender: TObject);
    procedure CBCondCorporalChange(Sender: TObject);
    procedure CBCantPartosChange(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure EAPesoDesdeChange(Sender: TObject);
    procedure EAPesoHastaChange(Sender: TObject);
    procedure EAFrameDesdeChange(Sender: TObject);
    procedure EAFrameHastaChange(Sender: TObject);
    procedure EARPChange(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
    procedure IPreviewClick(Sender: TObject);
    procedure LRepIndividualClick(Sender: TObject);
    procedure TPanelTimer(Sender: TObject);
    procedure IEliminarAnimClick(Sender: TObject);
    procedure EARPKeyPress(Sender: TObject; var Key: Char);
    procedure EAPesoDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure EAPesoHastaKeyPress(Sender: TObject; var Key: Char);
    procedure EAFrameDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure EAFrameHastaKeyPress(Sender: TObject; var Key: Char);
    procedure CBAnimalesInactivosClick(Sender: TObject);
    procedure EADTPDesdeDiaChange(Sender: TObject);
    procedure EADTPHastaDiaChange(Sender: TObject);
    procedure EADTPDesdeDiaKeyPress(Sender: TObject; var Key: Char);
    procedure EADesdeDiaKeyPress(Sender: TObject; var Key: Char);
    procedure EADesdeMesKeyPress(Sender: TObject; var Key: Char);
    procedure EADesdeAnioKeyPress(Sender: TObject; var Key: Char);
    procedure EAHastaDiaKeyPress(Sender: TObject; var Key: Char);
    procedure EAHastaMesKeyPress(Sender: TObject; var Key: Char);
    procedure EAHastaMesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAHastaDiaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADesdeAnioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADesdeMesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADesdeDiaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAHastaAnioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAHastaAnioKeyPress(Sender: TObject; var Key: Char);
    procedure EAHastaAnioChange(Sender: TObject);
    procedure EAHastaMesChange(Sender: TObject);
    procedure EAHastaDiaChange(Sender: TObject);
    procedure EADesdeAnioChange(Sender: TObject);
    procedure EADesdeMesChange(Sender: TObject);
    procedure EADesdeDiaChange(Sender: TObject);
    procedure CBRazaCloseUp(Sender: TObject);
    procedure CBCategoriaCloseUp(Sender: TObject);
    procedure CBRodeoCloseUp(Sender: TObject);
    procedure CBColorCloseUp(Sender: TObject);
    procedure CBEstadoReproCloseUp(Sender: TObject);
    procedure CBPotreroCloseUp(Sender: TObject);
    procedure CBTipoRegistroCloseUp(Sender: TObject);
    procedure CBCondCorporalCloseUp(Sender: TObject);
    procedure CBOrigenCloseUp(Sender: TObject);
    procedure CBCantPartosCloseUp(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerLectorTimer(Sender: TObject);
    procedure LOrdenNumericoClick(Sender: TObject);
    procedure LOrdenAlfanumericoClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure LRepListadoCabBraClick(Sender: TObject);
    procedure CBSexoChange(Sender: TObject);
    procedure CBSexoCloseUp(Sender: TObject);
  private
    { Private declarations }

    procedure AgregarColumnaExcel(var column: TxlColumn;
  alig: TAlignment; coldwidth: Integer; datafield, title: String;
  save: Boolean);

    procedure Exportar;    

    procedure AutoAjustarColumnas;
    procedure AbrirSqlFiltros;
    procedure CargarCombos;
    procedure InicializarIDS;
    procedure InicializarCombos;
    procedure LimpiarFiltros;

    procedure crearLector;
    procedure cerrarLector;

    procedure ListadoDeAnimales(Sender : Tobject);
    procedure AbrirEventoIndividual(Eve : TFEveSimple);
    procedure HabilitarDeshabilitarOpcionesDeFiltrado(val : boolean);
    procedure CargarTiposRegistro(id_raza : integer);
    function ArmarFecha(id : integer) : string;
    procedure ChequearPrimeraFecha;
    procedure ChequearSegundaFecha;
  public
    { Public declarations }
  end;

var
  FSelectorAnimales: TFSelectorAnimales;
  vActivos, consulta, queryOrig, queryAgr, valId : string;
  filtrado : boolean;
  id_rodeo, id_potrero, id_origen, id_raza, id_color, id_tipo_reg, id_categoria, id_sexo,
  id_estado_repro, id_cond_corpo, id_cant_partos, cantAnimalesPrinc, id_fecha_desde, id_fecha_hasta, id_peso_desde, id_peso_hasta, id_frame_desde, id_frame_hasta : integer;
  txtNoAplicaFiltro : string = 'NO USAR FILTRO';
  fecha_D_Ok : boolean = false;
  fecha_H_Ok : boolean = false;
  DelRaza : boolean = false;
  DelCategoria : boolean = false;
  DelTR : boolean = false;
  DelCC : boolean = false;
  DelCP : boolean = false;
  DelColor : boolean = false;
  DelPotrero : boolean = false;
  DelRodeo : boolean = false;
  DelOrigen : boolean = false;
  DelEstado : boolean = false;
  DelSexo : boolean = false;
  cantDD, cantMD, cantAD, cantDH, cantMH, cantAH : integer;
  FLectorElectronico:TLectorElectronico;
  tipoOrdenNumerico, tipoOrdenAlfanumerico : boolean;
  PosAnimal : integer;

implementation

uses UREPFichaAnimal, UCartel, UREPHistorialAnimalPreview, UMensajeHuella, UTraduccion, UMensajeImpresora,
     UDMSoftvet, URepListadoCabBraf;

{$R *.dfm}

function TFSelectorAnimales.ArmarFecha(id : integer) : string;
var fecha : string;
    diaOk, mesOk, anioOk : boolean;
begin

     diaOk := false;
     mesOk := false;
     anioOk := false;

     if (id = 0) then //fecha desde
     begin
          if ((Length(EADesdeDia.Text) = 1) and (EADesdeDia.Text <> '0')) then
          begin
              fecha := '0'+EADesdeDia.Text;
              diaOk := true;
          end
          else
              if (EADesdeDia.Text >= '01') and (EADesdeDia.Text <= '31') then
              begin
                fecha := EADesdeDia.Text;
                diaOk := true;
              end
              else
              begin
                diaOk := false;
                MostrarMensaje(tmError,'Valor de día ingresado no valido.');
                EADesdeDia.SetFocus;
              end;

          if (Length(EADesdeMes.Text) = 1) then
          begin
              mesOk := true;
              fecha := fecha+'/0'+EADesdeMes.Text;
          end
          else
              if (EADesdeMes.Text >= '01') and (EADesdeMes.Text <= '12') then
              begin
                fecha := fecha+'/'+EADesdeMes.Text;
                mesOk := true;
              end
              else
              begin
                mesOk := false;
                MostrarMensaje(tmError,'Valor de mes ingresado no valido.');
                EADesdeMes.SetFocus;
              end;

          if (Length(EADesdeAnio.Text) = 2) then
          begin
              fecha := fecha+'/20'+EADesdeAnio.Text;
              if ((diaOk) and (mesOk)) then
                fecha_D_Ok := true;
          end
          else
          begin
//              if (Length(EADesdeAnio.Text) > 3) then
//              begin
                fecha := fecha+'/'+EADesdeAnio.Text;
                if ((diaOk) and (mesOk)) then
                  fecha_D_Ok := true;
//              end
//              else
//              begin
//                anioOk := false;
//                MostrarMensaje(tmError,'Valor de año ingresado no valido.');
//                EADesdeAnio.SetFocus;
//              end;
          end;
     end
     else
     begin
          if ((Length(EAHastaDia.Text) = 1) and (EAHastaDia.Text <> '0')) then
          begin
              diaOk := true;
              fecha := '0'+EAHastaDia.Text;
          end
          else
              if (EAHastaDia.Text >= '01') and (EAHastaDia.Text <= '31') then
              begin
                fecha := EAHastaDia.Text;
                diaOk := true;
              end
              else
              begin
                diaOk := false;
                MostrarMensaje(tmError,'Valor de día ingresado no valido.');
                EAHastaDia.SetFocus;
              end;

          if (Length(EAHastaMes.Text) = 1) then
          begin
              mesOk := true;
              fecha := fecha+'/0'+EAHastaMes.Text;
          end
          else
              if (EAHastaMes.Text >= '01') and (EAHastaMes.Text <= '12') then
              begin
                fecha := fecha+'/'+EAHastaMes.Text;
                mesOk := true;
              end
              else
              begin
                mesOk := false;
                MostrarMensaje(tmError,'Valor de mes ingresado no valido.');
                EAHastaMes.SetFocus;
              end;

          if (Length(EAHastaAnio.Text) = 2) then
          begin
              fecha := fecha+'/20'+EAHastaAnio.Text;
              if ((diaOk) and (mesOk)) then
                fecha_H_Ok := true;
          end
          else
          begin
//              if (Length(EAHastaAnio.Text) > 3) then
  //            begin
                fecha := fecha+'/'+EAHastaAnio.Text;
                if ((diaOk) and (mesOk)) then
                  fecha_H_Ok := true;
//              end
//              else
//              begin
//                anioOk := false;
//                MostrarMensaje(tmError,'Valor de año ingresado no valido.');
//                EAHastaAnio.SetFocus;
//              end;
          end;
     end;

     Result := fecha;
end;

procedure TFSelectorAnimales.BDBGListadoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Num: Integer;
  R: TRect;
begin

    if (BDBGListado.DataSource.DataSet.FieldByName('activo').AsString = 'N') then
    begin
      if (gdSelected in State) then
      begin
        //BDBGListado.Canvas.Brush.Color := RGB(0, 149, 130);
        BDBGListado.Canvas.Brush.Color := RGB(139, 181, 107);
        BDBGListado.Canvas.Font.Style := [fsBold];
        BDBGListado.Canvas.Font.Color := clBlack;
      end
      else
      begin
        BDBGListado.Canvas.Brush.Color := clWhite;
        BDBGListado.Canvas.Font.Color := clGray;
      end;
    end
    else
    begin
      if (gdSelected in State) then
      begin
        //BDBGListado.Canvas.Brush.Color := RGB(0, 149, 130);
        BDBGListado.Canvas.Brush.Color := RGB(139, 181, 107);
        BDBGListado.Canvas.Font.Style := [fsBold];
        BDBGListado.Canvas.Font.Color := clWhite;
      end
      else
      begin
        BDBGListado.Canvas.Brush.Color := clWhite;
        BDBGListado.Canvas.Font.Color := clBlack;
      end;
    end;

    BDBGListado.DefaultDrawColumnCell(rect,DataCol,Column,State);

end;

procedure TFSelectorAnimales.IBajarIzqClick(Sender: TObject);
begin

  BDBGListado.SelectedRows.CurrentRowSelected := false;
  BDBGListado.DataSource.DataSet.Next;
  BDBGListado.SetFocus;

end;

procedure TFSelectorAnimales.ISubirIzqClick(Sender: TObject);
begin

  BDBGListado.SelectedRows.CurrentRowSelected := false;
  BDBGListado.DataSource.DataSet.Prior;
  BDBGListado.SetFocus;

end;

procedure TFSelectorAnimales.FormShow(Sender: TObject);
begin
  inherited;

  PosAnimal := 0;

//  if ((FPrincipal.RazaPredom = 1) or (FPrincipal.RazaPredom = -1)) then
//  begin
        LRepListadoCabBra.Visible := false;
        IRepListadoCabBra.Visible := false;

        LRepIndividual.Visible := true;
        IRepIndividual.Visible := true;
//  end;

{  if (FPrincipal.RazaPredom = 2) then
  begin
        LRepListadoCabBra.Visible := true;
        IRepListadoCabBra.Visible := true;

        LRepIndividual.Visible := false;
        IRepIndividual.Visible := false;
  end;
}
  IVerAnimalesInacOff.Visible := true;
  IVerAnimalesInacOn.Visible := not(IVerAnimalesInacOff.Visible);

  IOrdenAlfanumericoOff.Visible := true;
  IOrdenAlfanumericoOn.Visible := not(IOrdenAlfanumericoOff.Visible);

  IOrdenNumericoOff.Visible := true;
  IOrdenNumericoOn.Visible := not(IOrdenNumericoOff.Visible);

  tipoOrdenAlfanumerico := false;
  tipoOrdenNumerico := false;


  BDBGListado.DataSource.DataSet.Last;
  BDBGListado.DataSource.DataSet.First;

  GBListadoAnimales.Caption := ' Listado Animales. Cantidad: '+ IntToStr(BDBGListado.DataSource.DataSet.RecordCount) +' ';

  if FPrincipal._USO_DISP then
  begin
    DMSoftvet.IBQDatosAnimal.Close;
    DMSoftvet.IBQDatosAnimal.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQDatosAnimal.Open;
    //crearLector;
    TimerLector.Enabled:=true;
  end;

  if not FPrincipal.FuncDEPs then
  begin


    BDBGListado.Columns[1].Visible := false;
    BDBGListado.Columns[2].Visible := false;
    BDBGListado.Columns[3].Visible := false;

    GroupBox1.Caption := 'Rp / SENASA';

    CBCantPartos.Left := CBTipoRegistro.Left;
    CBTipoRegistro.Visible := false;

  end;

end;

procedure TFSelectorAnimales.AutoAjustarColumnas;
var ind_col : integer;
begin

       for ind_col := 0 to BDBGListado.Columns.Count - 1 do
       begin
           BDBGListado.Columns[ind_col].Title.Alignment := taCenter;
           BDBGListado.Columns[ind_col].Title.Font.Size := 9;
           BDBGListado.Columns[ind_col].Title.Font.Style := BDBGListado.Columns[ind_col].Title.Font.Style + [fsBold];
       end;

       if FPrincipal.FuncDEPs then
       begin
         BDBGListado.Columns[0].Width := 70;
         BDBGListado.Columns[1].Width := 70;
         BDBGListado.Columns[2].Width := 300;
         BDBGListado.Columns[3].Width := 40;
         BDBGListado.Columns[4].Width := 90;
         BDBGListado.Columns[5].Width := 90;
         BDBGListado.Columns[6].Width := 40;
         BDBGListado.Columns[7].Width := 85;
         BDBGListado.Columns[8].Width := 75;
       end
       else
       begin
          BDBGListado.Columns[0].Width := 170;
          BDBGListado.Columns[4].Width := 144;
          BDBGListado.Columns[5].Width := 133;
          BDBGListado.Columns[6].Width := 169;
          BDBGListado.Columns[7].Width := 153;
          BDBGListado.Columns[8].Width := 100;
       end;

end;

procedure TFSelectorAnimales.ISalirClick(Sender: TObject);
begin

  Close();

end;

procedure TFSelectorAnimales.LVerAnimalesClick(Sender: TObject);
var fraD, fraH, desde, hasta : string;
begin

  consulta := queryOrig + queryAgr;

  if (filtrado) then
  begin
    BDBGListado.DataSource.DataSet := IBQListadoAux;

    IBQListadoAux.Close;
    IBQListadoAux.SQL.Clear;
    IBQListadoAux.SQL.Add(consulta);

    if (EARP.Text <> '') then
    begin
      valId := EARP.Text;
      if Length(EARP.Text) < 10 then
        queryAgr := queryAgr + ' and ( ( ta.id_rp like ''%' + EARP.Text + '%'' ) or ( ta.id_senasa like ''%' + EARP.Text + '%'' ) or (ta.id_hba like ''%' + EARP.Text + '%'') or (ta.nombre like ''%' + EARP.Text + '%'') or (ta.apodo like ''%' + EARP.Text + '%''))'
      else
        queryAgr := queryAgr + ' and ( (ta.nombre like ''%' + EARP.Text + '%'') or (ta.apodo like ''%' + EARP.Text + '%''))';
      consulta := queryOrig + queryAgr;
      IBQListadoAux.SQL.Clear;
      IBQListadoAux.SQL.Add(consulta);
    end;

    if ((id_fecha_desde <> -1) and (id_fecha_hasta <> -1)) then
    begin
      desde := ArmarFecha(0);
      hasta := ArmarFecha(1);
      if ((fecha_D_Ok) and (fecha_H_Ok)) then
      begin
           IBQListadoAux.ParamByName('fecha_desde').AsDate := StrToDate(desde);//DTPDesde.Date;
           IBQListadoAux.ParamByName('fecha_hasta').AsDate := StrToDate(hasta);//DTPHasta.Date;
           fecha_D_Ok := false;
           fecha_H_Ok := false;
      end;
    end
    else
    begin
      consulta := StringReplace(consulta,' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)','',[rfReplaceAll]);
      IBQListadoAux.SQL.Clear;
      IBQListadoAux.SQL.Add(consulta);
    end;

    if (CBAnimalesInactivos.Checked) then
    begin
      consulta := StringReplace(consulta,' and (ta.activo = ''S'')','',[rfReplaceAll]);
      IBQListadoAux.SQL.Clear;
      IBQListadoAux.SQL.Add(consulta);
    end;

    if (id_raza <> -1) then
      IBQListadoAux.ParamByName('raza').AsInteger := id_raza;

    if (id_color <> -1) then
      IBQListadoAux.ParamByName('color').AsInteger := id_color;

    if (id_tipo_reg <> -1) then
      IBQListadoAux.ParamByName('tipo_reg').AsInteger := id_tipo_reg;

    if (id_categoria <> -1) then
      IBQListadoAux.ParamByName('categoria').AsInteger := id_categoria;

    if (id_sexo <> -1) then
      IBQListadoAux.ParamByName('sexo').AsInteger := id_sexo; 

    if (id_estado_repro <> -1) then
      IBQListadoAux.ParamByName('estado_repro').AsInteger := id_estado_repro;

    if (id_cond_corpo <> -1) then
      IBQListadoAux.ParamByName('cond_corpo').AsInteger := id_cond_corpo;

    if (id_cant_partos <> -1) then
      IBQListadoAux.ParamByName('cant_partos').AsInteger := id_cant_partos;

    if (id_rodeo <> -1) then
      IBQListadoAux.ParamByName('rodeo').AsInteger := id_rodeo;

    if (id_potrero <> -1) then
      IBQListadoAux.ParamByName('potrero').AsInteger := id_potrero;

    if (id_origen <> -1) then
      IBQListadoAux.ParamByName('origen').AsInteger := id_origen;

    if ((id_peso_desde <> -1) and (id_peso_hasta <> -1)) then
    begin
      IBQListadoAux.ParamByName('peso_desde').AsInteger := StrToInt(EAPesoDesde.Text);
      IBQListadoAux.ParamByName('peso_hasta').AsInteger := StrToInt(EAPesoHasta.Text);
    end;

    if ((id_frame_desde <> -1) and (id_frame_hasta <> -1)) then
    begin
      fraD := StringReplace(EAFrameDesde.Text,'.',',',[rfReplaceAll]);
      fraH := StringReplace(EAFrameHasta.Text,'.',',',[rfReplaceAll]);
      IBQListadoAux.ParamByName('frame_desde').AsFloat := StrToFloat(fraD);
      IBQListadoAux.ParamByName('frame_hasta').AsFloat := StrToFloat(fraH);
    end;


    if (tipoOrdenAlfanumerico) then
      IBQListadoAux.SQL.Add(' order by ta.id_rp')
    else
      if (tipoOrdenNumerico) then
        IBQListadoAux.SQL.Add(' ORDER BY (SELECT NUMERO FROM OBTENER_ENTERO(TA.ID_RP)) ASC')
      else
        IBQListadoAux.SQL.Add(' ORDER BY (SELECT NUMERO FROM OBTENER_ENTERO(TA.ID_RP)) ASC');

    IBQListadoAux.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;

    IBQListadoAux.Open;
    IBQListadoAux.Last;
    IBQListadoAux.First;

    GBListadoAnimales.Caption := ' Listado Animales. Cantidad: '+ IntToStr(IBQListadoAux.RecordCount) +' ';

     if Length(EARP.Text) < 10 then
        queryAgr := StringReplace(queryAgr,' and ( ( ta.id_rp like ''%' + EARP.Text + '%'' ) or ( ta.id_senasa like ''%' + EARP.Text + '%'' ) or (ta.id_hba like ''%' + EARP.Text + '%'') or (ta.nombre like ''%' + EARP.Text + '%'') or (ta.apodo like ''%' + EARP.Text + '%''))','',[rfReplaceAll])
      else
        queryAgr := StringReplace(queryAgr,' and ( (ta.nombre like ''%' + EARP.Text + '%'') or (ta.apodo like ''%' + EARP.Text + '%''))','',[rfReplaceAll]);

    consulta := '';

  end
  else
  begin
    BDBGListado.DataSource.DataSet := FPrincipal.IBQListaAnimales;
    FPrincipal.IBQListaAnimales.Close;
    FPrincipal.IBQListaAnimales.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
    FPrincipal.IBQListaAnimales.Open;
    FPrincipal.IBQListaAnimales.Last;
    FPrincipal.IBQListaAnimales.First;
    cantAnimalesPrinc := FPrincipal.IBQListaAnimales.RecordCount;

    GBListadoAnimales.Caption := ' Listado Animales. Cantidad: '+ IntToStr(cantAnimalesPrinc) +' ';
  end;

end;

procedure TFSelectorAnimales.FormCreate(Sender: TObject);
var c1, c2, c3, c4, c5, c6 : string;
begin
  inherited;
  FPrincipal.IBQListaAnimales.Close;
  FPrincipal.IBQListaAnimales.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
  FPrincipal.IBQListaAnimales.Open;
  FPrincipal.IBQListaAnimales.Last;
  FPrincipal.IBQListaAnimales.First;


  cantAnimalesPrinc := FPrincipal.IBQListaAnimales.RecordCount;

  filtrado := false;

  queryAgr := '';

  InicializarIDS;
  InicializarCombos;

  c1 := 'select ta.id_animal as id_animal, ta.id_rp as rp, ta.id_hba as hba, ta.id_senasa as senasa, ta.fecha_nacimiento as fecha_nac, cc.sinonimo as categoria, ta.estado_actual as estadoAct, cr.sinonimo as raza, ta.activo as activo, ';
  c4 := 'ccol.nombre as color, csc.nombre as nomsubcat, csc.codigo as codsubcat, ta.raza as id_raza, cr.codigo as codraza, ';
  c2 := 'ta.subcategoria as subcatego, ta.nombre as nombre, ta.pesonacer as pesonacer, ta.tipificacion_sanguinea as ts, ta.adn as adn, ta.padre_interno as padreI, ta.padre_externo as padreE, ta.madre_biologica_externa as mbe, ta.madre_biologica_interna as mbi, ';
  c3 := 'ta.sexo, cs.nombre as nom_sex from tab_animales ta join cod_categorias cc on (ta.categoria = cc.id_categoria) join cod_razas cr on (ta.raza = cr.id_raza) join cod_colores ccol on (ta.color = ccol.id_color) join cod_subcategorias csc ';
  c5 := 'on (csc.id_subcategoria = ta.subcategoria), cod_sexos cs ';
  c6 := ' where (ta.establecimiento = :estable) and (ta.activo = ''S'') and (cs.id_sexo = ta.sexo)';

  queryOrig := c1 + c4 + c2 + c3 + c5 + c6;

  consulta := queryOrig;

  AutoAjustarColumnas;

  AbrirSqlFiltros;

  CargarCombos;

end;

procedure TFSelectorAnimales.CBTodosClick(Sender: TObject);
begin

  consulta := queryOrig;

  queryAgr := StringReplace(queryAgr,' and ta.activo = ''N''','',[rfReplaceAll]);
  queryAgr := StringReplace(queryAgr,' and ta.activo = ''S''','',[rfReplaceAll]);

end;

procedure TFSelectorAnimales.AbrirSqlFiltros;
begin

  IBQOrigen.Close;
  IBQOrigen.Open;
  IBQOrigen.First;

  IBQPotrero.Close;
  IBQPotrero.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotrero.Open;
  IBQPotrero.First;

  IBQRodeo.Close;
  IBQRodeo.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRodeo.Open;
  IBQRodeo.First;

  IBQRazas.Close;
  IBQRazas.Open;
  IBQRazas.First;

  IBQColor.Close;
  IBQColor.Open;
  IBQColor.First;

  IBQCategoria.Close;
  IBQCategoria.Open;
  IBQCategoria.First;

  IBQEstadoRepro.Close;
  IBQEstadoRepro.Open;
  IBQEstadoRepro.First;

  IBQCondCorporal.Close;
  IBQCondCorporal.Open;
  IBQCondCorporal.First;

  IBQEstadoParicion.Close;
  IBQEstadoParicion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQEstadoParicion.Open;
  IBQEstadoParicion.First;

  CargarTiposRegistro(-1);

end;

procedure TFSelectorAnimales.CargarCombos;
begin

   InicializarCombos;

   CBRaza.AddItem('(TODAS)',nil);
   while not(IBQRazas.Eof) do
   begin
        CBRaza.AddItem(IBQRazas.FieldValues['nombre'],nil);
        IBQRazas.Next;
   end;

   CBColor.AddItem('(TODOS)',nil);
   while not(IBQColor.Eof) do
   begin
        CBColor.AddItem(IBQColor.FieldValues['nombre'],nil);
        IBQColor.Next;
   end;

   CBTipoRegistro.AddItem('(TODOS)',nil);
   while not(IBQTipoRegistro.Eof) do
   begin
        CBTipoRegistro.AddItem(IBQTipoRegistro.FieldValues['sinonimo'],nil);
        IBQTipoRegistro.Next;
   end;

   CBCategoria.AddItem('(TODAS)',nil);
   while not(IBQCategoria.Eof) do
   begin
        CBCategoria.AddItem(IBQCategoria.FieldValues['sinonimo'],nil);
        IBQCategoria.Next;
   end;

   CBEstadoRepro.AddItem('(TODOS)',nil);
   while not(IBQEstadoRepro.Eof) do
   begin
        CBEstadoRepro.AddItem(IBQEstadoRepro.FieldValues['nombre'],nil);
        IBQEstadoRepro.Next;
   end;

   CBCondCorporal.AddItem('(TODAS)',nil);

   IBQParametros.Close;
   IBQParametros.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
   IBQParametros.ParamByName('param').AsInteger := 3; //Codigo de la condicion corporal
   IBQParametros.Open;

   while not(IBQCondCorporal.Eof) do
   begin
        if (IBQParametros.FieldValues['valor'] = 10) then
          CBCondCorporal.AddItem(IBQCondCorporal.FieldValues['valor_escala_10'], nil)
        else
          CBCondCorporal.AddItem(IBQCondCorporal.FieldValues['valor_escala_5'], nil);

        IBQCondCorporal.Next;
   end;

   CBCantPartos.AddItem('(TODOS)',nil);
   while not(IBQEstadoParicion.Eof) do
   begin
        CBCantPartos.AddItem(IBQEstadoParicion.FieldValues['estado_lactacion'],nil);
        IBQEstadoParicion.Next;
   end;

   CBOrigen.AddItem('(TODOS)',nil);
   while not(IBQOrigen.Eof) do
   begin
        CBOrigen.AddItem(IBQOrigen.FieldValues['sinonimo'],nil);
        IBQOrigen.Next;
   end;

   CBPotrero.AddItem('(TODOS)',nil);
   while not(IBQPotrero.Eof) do
   begin
        CBPotrero.AddItem(IBQPotrero.FieldValues['nombre'],nil);
        IBQPotrero.Next;
   end;

   CBRodeo.AddItem('(TODOS)',nil);
   while not(IBQRodeo.Eof) do
   begin
        CBRodeo.AddItem(IBQRodeo.FieldValues['nombre'],nil);
        IBQRodeo.Next;
   end;

end;

procedure TFSelectorAnimales.CBRodeoChange(Sender: TObject);
var txt : string;
begin

    txt := CBRodeo.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODOS)'))then
    begin
      id_rodeo := -1;
      queryAgr := StringReplace(queryAgr,' and ta.rodeo = :rodeo','',[rfReplaceAll]);
      CBRodeo.Items.Insert(0,'RODEO');
      CBRodeo.ItemIndex := 0;
      DelRodeo := false;
    end
    else
    begin
      id_rodeo := IBQRodeo.Lookup('NOMBRE',txt,'ID_RODEO');
      queryAgr := queryAgr + ' and ta.rodeo = :rodeo';
    end;

    filtrado := true;
    LVerAnimalesClick(sender);
end;

procedure TFSelectorAnimales.CBPotreroChange(Sender: TObject);
var txt : string;
begin

    txt := CBPotrero.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODOS)'))then
    begin
      id_potrero := -1;
      queryAgr := StringReplace(queryAgr,' and ta.potrero = :potrero','',[rfReplaceAll]);
      CBPotrero.Items.Insert(0,'POTRERO');
      CBPotrero.ItemIndex := 0;
      DelPotrero := false;
    end
    else
    begin
      id_potrero := IBQPotrero.Lookup('NOMBRE',txt,'ID_POTRERO');
      queryAgr := queryAgr + ' and ta.potrero = :potrero';
    end;
    
    filtrado := true;
    LVerAnimalesClick(sender);
end;

procedure TFSelectorAnimales.CBOrigenChange(Sender: TObject);
var txt : string;
begin

    txt := CBOrigen.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODOS)'))then
    begin
      id_origen := -1;
      queryAgr := StringReplace(queryAgr,' and ta.origen_animal = :origen','',[rfReplaceAll]);
      CBOrigen.Items.Insert(0,'ORIGEN');
      CBOrigen.ItemIndex := 0;
      DelOrigen := false;
    end
    else
    begin
      id_origen := IBQOrigen.Lookup('SINONIMO',txt,'ID_ORIGEN');
      queryAgr := queryAgr + ' and ta.origen_animal = :origen';
    end;
    filtrado := true;
    LVerAnimalesClick(sender);
end;

procedure TFSelectorAnimales.IFichaClick(Sender: TObject);
var cartel : TCartel;
begin
  inherited;

  PosAnimal := BDBGListado.DataSource.DataSet.RecNo;

  if (FREPFichaAnimal = nil) then
    Application.CreateForm(TFREPFichaAnimal, FREPFichaAnimal);

  FREPFichaAnimal.animal := BDBGListado.DataSource.DataSet.FieldValues['id_animal'];
  FREPFichaAnimal.ShowModal;

  LVerAnimalesClick(sender);

  BDBGListado.DataSource.DataSet.RecNo := PosAnimal;

end;

procedure TFSelectorAnimales.CBRazaChange(Sender: TObject);
var txt : string;
begin

    txt := CBRaza.Text;

    if ((txt = 'RAZA') or (txt = '(TODAS)') or (txt = ''))then
    begin
      id_raza := -1;
      queryAgr := StringReplace(queryAgr,' and ta.raza = :raza','',[rfReplaceAll]);
      CBColor.Enabled := false;
      CBRaza.Items.Insert(0,'RAZA');
      CBRaza.ItemIndex := 0;
      DelRaza := false;
    end
    else
    begin
      if (id_raza = -1) then
        queryAgr := queryAgr + ' and ta.raza = :raza';

      id_raza := IBQRazas.Lookup('NOMBRE',txt,'ID_RAZA');

      if ((id_raza = 29) or (id_raza = 30)) then
        CBColor.Enabled := true
      else
        CBColor.Enabled := false;
    end;

    CargarTiposRegistro(id_raza);
    filtrado := true;
    LVerAnimalesClick(sender);
end;

procedure TFSelectorAnimales.CBColorChange(Sender: TObject);
var txt : string;
begin

    txt := CBColor.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODOS)'))then
    begin
      id_color := -1;
      queryAgr := StringReplace(queryAgr,' and ta.color = :color','',[rfReplaceAll]);
      CBColor.Items.Insert(0,'COLOR');
      CBColor.ItemIndex := 0;
      DelColor := false;
    end
    else
    begin
      if (id_color = -1) then
        queryAgr := queryAgr + ' and ta.color = :color';
      id_color := IBQColor.Lookup('NOMBRE',txt,'ID_COLOR');
    end;

    filtrado := true;
    LVerAnimalesClick(sender);
end;

procedure TFSelectorAnimales.CBTipoRegistroChange(Sender: TObject);
var txt : string;
begin

    txt := CBTipoRegistro.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODOS)')) then
    begin
      id_tipo_reg := -1;
      queryAgr := StringReplace(queryAgr,' and ta.subcategoria = :tipo_reg','',[rfReplaceAll]);
      CBTipoRegistro.Items.Insert(0,'TIPO DE REGISTRO');
      CBTipoRegistro.ItemIndex := 0;
      DelTR := false;
    end
    else
    begin
      if (id_tipo_reg = -1) then
        queryAgr := queryAgr + ' and ta.subcategoria = :tipo_reg';
      id_tipo_reg := IBQTipoRegistro.Lookup('NOMBRE',txt,'ID_SUBCATEGORIA');
    end;

    filtrado := true;
    LVerAnimalesClick(sender);

end;

procedure TFSelectorAnimales.CBCategoriaChange(Sender: TObject);
var txt : string;
begin

    txt := CBCategoria.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODAS)'))then
    begin
      id_categoria := -1;
      queryAgr := StringReplace(queryAgr,' and ta.categoria = :categoria','',[rfReplaceAll]);
      CBCategoria.Items.Insert(0,'CATEGORIA');
      CBCategoria.ItemIndex := 0;
      DelCategoria := false;
    end
    else
    begin
      if (id_categoria = -1) then
        queryAgr := queryAgr + ' and ta.categoria = :categoria';
      id_categoria := IBQCategoria.Lookup('SINONIMO',txt,'ID_CATEGORIA');
    end;

    filtrado := true;
    LVerAnimalesClick(sender);
end;

procedure TFSelectorAnimales.CBEstadoReproChange(Sender: TObject);
var txt : string;
begin

    txt := CBEstadoRepro.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODOS)')) then
    begin
      id_estado_repro := -1;
      queryAgr := StringReplace(queryAgr,' and ta.estado_reproductivo = :estado_repro','',[rfReplaceAll]);
      CBEstadoRepro.Items.Insert(0,'ESTADO REPRODUCTIVO');
      CBEstadoRepro.ItemIndex := 0;
      DelEstado := false;
    end
    else
    begin
      if (id_estado_repro = -1) then
        queryAgr := queryAgr + ' and ta.estado_reproductivo = :estado_repro';
      id_estado_repro := IBQEstadoRepro.Lookup('NOMBRE',txt,'ID_ESTADO_REPRODUCTIVO');
    end;

    filtrado := true;
    LVerAnimalesClick(sender);
end;

procedure TFSelectorAnimales.CBCondCorporalChange(Sender: TObject);
var txt : string;
begin

    txt := CBCondCorporal.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODAS)'))then
    begin
      id_cond_corpo := -1;
      queryAgr := StringReplace(queryAgr,' and ta.condicion_corporal = :cond_corpo','',[rfReplaceAll]);
      CBCondCorporal.Items.Insert(0,'CONDICION CORPORAL');
      CBCondCorporal.ItemIndex := 0;
      DelCC := false;
    end
    else
    begin
      if (id_cond_corpo = -1) then
        queryAgr := queryAgr + ' and ta.condicion_corporal = :cond_corpo';

      IBQParametros.Close;
      IBQParametros.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      IBQParametros.ParamByName('param').AsInteger := 3; //Codigo de la condicion corporal
      IBQParametros.Open;

      if (IBQParametros.FieldValues['valor'] = 10) then
        id_cond_corpo := IBQCondCorporal.Lookup('valor_escala_10',txt,'ID_CONDICION_CORPORAL')
      else
        id_cond_corpo := IBQCondCorporal.Lookup('valor_escala_5',txt,'ID_CONDICION_CORPORAL')
    end;

    filtrado := true;
    LVerAnimalesClick(sender);
    
end;

procedure TFSelectorAnimales.CBCantPartosChange(Sender: TObject);
var txt : string;
begin

    txt := CBCantPartos.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODOS)'))then
    begin
      id_cant_partos := -1;
      queryAgr := StringReplace(queryAgr,' and ta.estado_lactacion = :cant_partos','',[rfReplaceAll]);
      CBCantPartos.Items.Insert(0,'CANTIDAD DE PARTOS');
      CBCantPartos.ItemIndex := 0;
      DelCP := false;
    end
    else
    begin
      if (id_cant_partos = -1) then
        queryAgr := queryAgr + ' and ta.estado_lactacion = :cant_partos';
      id_cant_partos := StrToInt(CBCantPartos.Text);
    end;

    filtrado := true;
    LVerAnimalesClick(sender);
end;

procedure TFSelectorAnimales.DTPDesdeChange(Sender: TObject);
var  aNo, Mes, Dia :word;
begin
     DecodeDate(DTPDesde.Date, aNo, Mes, Dia);
     EADesdeDia.Text := IntToStr(Dia);
     EADesdeMes.Text := IntToStr(Mes);
     EADesdeAnio.Text := IntToStr(aNo);

     if (id_fecha_desde = -1) then
     begin
       id_fecha_desde := 1;

       queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';
     end;

    filtrado := true;
    LVerAnimalesClick(sender);

end;

procedure TFSelectorAnimales.DTPHastaChange(Sender: TObject);
var  aNo, Mes, Dia :word;
begin
     DecodeDate(DTPHasta.Date, aNo, Mes, Dia);
     EAHastaDia.Text := IntToStr(Dia);
     EAHastaMes.Text := IntToStr(Mes);
     EAHastaAnio.Text := IntToStr(aNo);

     if (id_fecha_hasta = -1) then
     begin
      id_fecha_hasta := 1;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';
     end;

    filtrado := true;
    LVerAnimalesClick(sender);

end;

procedure TFSelectorAnimales.EAPesoDesdeChange(Sender: TObject);
begin
     filtrado := true;

     if (EAPesoDesde.Text <> '') then
     begin
       if (id_peso_desde = -1) then
       begin
        id_peso_desde := 1;
        queryAgr := queryAgr + ' and (ta.peso >= :peso_desde)';
       end;
     end
     else
     begin
        id_peso_desde := -1;
        queryAgr := StringReplace(queryAgr,' and (ta.peso >= :peso_desde)','',[rfReplaceAll]);
        LVerAnimalesClick(sender);
     end;
end;

procedure TFSelectorAnimales.EAPesoHastaChange(Sender: TObject);
begin
     filtrado := true;

     if (EAPesoHasta.Text <> '' ) then
     begin
       if (id_peso_hasta = -1) then
       begin
        id_peso_hasta := 1;
        queryAgr := queryAgr + ' and (ta.peso <= :peso_hasta)';
       end;
     end
     else
     begin
        id_peso_hasta := -1;
        queryAgr := StringReplace(queryAgr,' and (ta.peso <= :peso_hasta)','',[rfReplaceAll]);
        LVerAnimalesClick(sender);
     end;
end;

procedure TFSelectorAnimales.EAFrameDesdeChange(Sender: TObject);
begin

     filtrado := true;

     if (EAFrameDesde.Text <> '') then
     begin
       if (id_frame_desde = -1) then
       begin
        id_frame_desde := 1;
        queryAgr := queryAgr + ' and (ta.frame >= :frame_desde)';
       end;
     end
     else
     begin
        id_frame_desde := -1;
        queryAgr := StringReplace(queryAgr,' and (ta.frame >= :frame_desde)','',[rfReplaceAll]);
        LVerAnimalesClick(sender);
     end;
end;

procedure TFSelectorAnimales.EAFrameHastaChange(Sender: TObject);
begin
     filtrado := true;

     if (EAFrameHasta.Text <> '') then
     begin
       if (id_frame_hasta = -1) then
       begin
        id_frame_hasta := 1;
        queryAgr := queryAgr + ' and (ta.frame <= :frame_hasta)';
       end;
     end
     else
     begin
        id_frame_hasta := -1;
        queryAgr := StringReplace(queryAgr,' and (ta.frame <= :frame_hasta)','',[rfReplaceAll]);
        LVerAnimalesClick(sender);
     end;
end;

procedure TFSelectorAnimales.InicializarIDS;
begin
  id_rodeo := -1;
  id_potrero := -1;
  id_origen := -1;
  id_raza := -1;
  id_color := -1;
  id_tipo_reg := -1;
  id_categoria := -1;
  id_estado_repro := -1;
  id_cond_corpo := -1;
  id_cant_partos := -1;
  id_fecha_desde := -1;
  id_fecha_hasta := -1;
  id_peso_desde := -1;
  id_peso_hasta := -1;
  id_frame_desde := -1;
  id_frame_hasta := -1;
  id_sexo := -1;
end;

procedure TFSelectorAnimales.InicializarCombos;
begin
   CBOrigen.ItemIndex := 0;       //.Text := 'ORIGEN';
   CBPotrero.ItemIndex := 0;      //.Text := 'POTRERO';
   CBRodeo.ItemIndex := 0;        //.Text := 'RODEO';
   CBRaza.ItemIndex := 0;         //Text := 'RAZA';
   CBColor.ItemIndex := 0;        //Text := 'COLOR';
   CBColor.Enabled := false;
   CBTipoRegistro.ItemIndex := 0; //Text := 'TIPO DE REGISTRO';
   CBCategoria.ItemIndex := 0;    //Text := 'CATEGORIA';
   CBEstadoRepro.ItemIndex := 0;  //Text := 'ESTADO REPRODUCTIVO';
   CBCondCorporal.ItemIndex := 0; //Text := 'CONDICION CORPORAL';
   CBCantPartos.ItemIndex := 0;   //Text := 'CANTIDAD DE PARTOS';
   CBSexo.ItemIndex := 0;         //Text := 'SEXO';

   DelRaza := false;
   DelCategoria := false;
   DelTR := false;
   DelCC := false;
   DelCP := false;
   DelColor := false;
   DelPotrero := false;
   DelRodeo := false;
   DelOrigen := false;
   DelEstado := false;
   DelSexo := false;

end;

procedure TFSelectorAnimales.LimpiarFiltros;
begin
     id_fecha_desde := -1;
     id_fecha_hasta := -1;
     id_frame_desde := -1;
     id_frame_hasta := -1;
     id_peso_desde := -1;
     id_peso_hasta := -1;
     EAPesoDesde.Text := '';
     EAPesoHasta.Text := '';
     EAFrameDesde.Text := '';
     EAFrameHasta.Text := '';
     DTPDesde.Date := NOw();
     DTPHasta.Date := Now();
end;

procedure TFSelectorAnimales.EARPChange(Sender: TObject);
begin
  filtrado := true;

  if (EARP.Text = '') then
    LVerAnimalesClick(sender);
end;

procedure TFSelectorAnimales.IExcelClick(Sender: TObject);
var
  cartel : TCartel;
begin
  inherited;
  if SDXLS.Execute then
  begin
    cartel := TCartel.getInstance;
    cartel.abrircartel('Exportando datos a Excel...');
    try
      Exportar;
      DTXLS.SaveToFile(SDXLS.FileName);
    except
    end;
    cartel.cerrarcartel;
    cartel.FreeInstance;
  end;
end;

procedure TFSelectorAnimales.Exportar;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= BDBGListado.DataSource.DataSet;
  DTXLS.Title.Text:= 'LISTADO DE ANIMALES.';

  AgregarColumnaExcel(column,taLeftJustify,2800,'rp','RP ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'hba','HBA ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'senasa','SENASA ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'nombre','NOMBRE ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'fecha_nac','FECHA NACIMIENTO',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'categoria','CATEGORIA ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'nom_sex','SEXO ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'raza','RAZA ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'color','COLOR ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'nomsubcat','T.R. ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'estadoAct','ESTADO ACTUAL',True); 
  
end;

procedure TFSelectorAnimales.AgregarColumnaExcel(var column: TxlColumn;
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

procedure TFSelectorAnimales.IPreviewClick(Sender: TObject);
begin
  TPanel.Enabled := true;
  PListados.Visible := true;
  IRepIndividual.Enabled := FPrincipal.FuncActividad;
  LRepIndividual.Enabled := FPrincipal.FuncActividad;
  PListados.Top := 0;
end;

procedure TFSelectorAnimales.LRepIndividualClick(Sender: TObject);
begin
  ListadoDeAnimales(Sender);
end;

procedure TFSelectorAnimales.ListadoDeAnimales(Sender : Tobject);
var cont : integer;
    cartel: TCartel;
    msje: String;
    Rect: TRect;
    F : TFREPHistorialAnimalPreview;
begin
  MostrarMensajeImpresion();
  cartel:= TCartel.getInstance();
  HabilitarDesabilitarControles();
  msje:= 'Generando vista previa del listado de animales ...';
  cartel.abrircartel(msje);

  inherited;

  self.Tag := 0;

  if (Sender is TJvLabel) then
  begin
    if ((Sender as TJvLabel).Caption = 'Listado de animales') then
      self.Tag := 1
    else
      self.Tag := 2;
  end
  else
  begin
    if ((Sender as TImage).Name = 'IRepPedigree') then
      self.Tag := 1
    else
      self.Tag := 2;
  end;

  F := TFREPHistorialAnimalPreview.Create(self);

  F.IBQListadoAnimal.Close;
  F.IBQListadoAnimal.SQL.Clear;

  cont := 0;

  if (filtrado) then
  begin
    F.IBQListadoAnimal.SQL.Add(IBQListadoAux.SQL.GetText);
    while (cont < IBQListadoAux.Params.Count) do
    begin
      F.IBQListadoAnimal.ParamByName(IBQListadoAux.Params.Items[cont].Name).Value := IBQListadoAux.Params.Items[cont].Value;
      inc(cont);
    end;
  end
  else
  begin
    F.IBQListadoAnimal.SQL.Add(FPrincipal.IBQListaAnimales.SQL.GetText);
    while (cont < FPrincipal.IBQListaAnimales.Params.Count) do
    begin
      F.IBQListadoAnimal.ParamByName(FPrincipal.IBQListaAnimales.Params.Items[cont].Name).Value := FPrincipal.IBQListaAnimales.Params.Items[cont].Value;
      inc(cont);
    end;
  end;

  F.IBQListadoAnimal.Open;
  F.IBQListadoAnimal.Last;
  F.IBQListadoAnimal.First;

  cartel.cerrarcartel();
  cartel.FreeInstance();

  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();

end;

procedure TFSelectorAnimales.TPanelTimer(Sender: TObject);
begin
  inherited;
  TPanel.Enabled := false;
  PListados.Visible := false;
end;

procedure TFSelectorAnimales.IEliminarAnimClick(Sender: TObject);
begin
  inherited;

  if (MostrarMensaje(tmConsulta, Traducir('¿Está seguro de eliminar el animal ')+ BDBGListado.DataSource.DataSet.FieldValues['rp']+ '?') = mrYes)then
  begin
         AbrirEventoIndividual(TFEveEliminarAnimal.Create(self));
         FPrincipal.IBQListaAnimales.Close;
         FPrincipal.IBQListaAnimales.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
         FPrincipal.IBQListaAnimales.Open;
         FPrincipal.IBTPrincipal.CommitRetaining;
  end;
end;

procedure TFSelectorAnimales.AbrirEventoIndividual(Eve : TFEveSimple);
begin
  Eve.IDAnimal := BDBGListado.DataSource.DataSet.FieldValues['id_animal'];// IBQAnimales.fieldbyname('ANIMAL').AsInteger;
  Eve.IDRP := BDBGListado.DataSource.DataSet.FieldValues['rp']; //IBQAnimales.fieldbyname('RP').AsString;
  Eve.ConManga := false;
  Eve.ModoEve := meIndividual;
  Eve.ShowModal;
  Eve.Destroy;
end;

procedure TFSelectorAnimales.HabilitarDeshabilitarOpcionesDeFiltrado(val : boolean);
begin
     CBRaza.Enabled := val;
     CBCategoria.Enabled := val;
     CBEstadoRepro.Enabled := val;
     CBCantPartos.Enabled := val;
     CBCondCorporal.Enabled := val;
     CBOrigen.Enabled := val;
     CBPotrero.Enabled := val;
     CBTipoRegistro.Enabled := val;
     CBRodeo.Enabled := val;
     CBSexo.Enabled := val;
     LNacidosEntre.Enabled := val;
     LY.Enabled := val;
     DTPDesde.Enabled := val;
     DTPHasta.Enabled := val;
     LFrameDesde.Enabled := val;
     LFrameHasta.Enabled := val;
     EAFrameDesde.Enabled := val;
     EAFrameHasta.Enabled := val;
     LPesoDesde.Enabled := val;
     LPesoHasta.Enabled := val;
     EAPesoDesde.Enabled := val;
     EAPesoHasta.Enabled := val; 
end;
procedure TFSelectorAnimales.EARPKeyPress(Sender: TObject; var Key: Char);
begin

    if (key =#13) then
    begin
      LVerAnimalesClick(sender);
      Key:= #0;
    end;
end;

procedure TFSelectorAnimales.CargarTiposRegistro(id_raza : integer);
var raza : integer;
begin

     if (id_raza <> -1) then
        raza := id_raza
     else
     begin
          if not(BDBGListado.DataSource.DataSet.IsEmpty) then
            raza := BDBGListado.DataSource.DataSet.FieldValues['id_raza']
          else
            raza := 0;
     end;

     IBQTipoRegistro.Close;
     IBQTipoRegistro.ParamByName('raza').AsInteger := raza;
     IBQTipoRegistro.Open;

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

procedure TFSelectorAnimales.EAPesoDesdeKeyPress(Sender: TObject;
  var Key: Char);
begin

  if (key =#13) then
  begin
      LVerAnimalesClick(sender);
      EAPesoHasta.SetFocus;
      Key:= #0;
  end;

end;

procedure TFSelectorAnimales.EAPesoHastaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if (key =#13) then
  begin
      LVerAnimalesClick(sender);
      Key:= #0;
  end;

end;

procedure TFSelectorAnimales.EAFrameDesdeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key =#13) then
  begin
      LVerAnimalesClick(sender);
      EAFrameHasta.SetFocus;
      Key:= #0;
  end;

end;

procedure TFSelectorAnimales.EAFrameHastaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key =#13) then
  begin
      LVerAnimalesClick(sender);
      Key:= #0;
  end;

end;

procedure TFSelectorAnimales.CBAnimalesInactivosClick(Sender: TObject);
begin
  inherited;

  filtrado := true;
  LVerAnimalesClick(sender);

end;

procedure TFSelectorAnimales.EADTPDesdeDiaChange(Sender: TObject);
begin
{
  if (EADTPDesde.Text = '') then
  begin
       DTPDesde.Date := now();
       id_fecha_desde := -1;
       LVerAnimalesClick(sender);
  end; }

end;

procedure TFSelectorAnimales.EADTPHastaDiaChange(Sender: TObject);
begin

{  if (EADTPHasta.Text = '') then
  begin
       DTPHasta.Date := now();
       id_fecha_hasta := -1;
       LVerAnimalesClick(sender);
  end; }

end;

procedure TFSelectorAnimales.EADTPDesdeDiaKeyPress(Sender: TObject; var Key: Char);
begin

{  if (key #13) then
  begin
      LVerAnimalesClick(sender);
      Key:= #0;
  end; }

end;

procedure TFSelectorAnimales.EADesdeDiaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if (key = #13) then
  begin
      EADesdeMes.SetFocus;
      ChequearPrimeraFecha;
      LVerAnimalesClick(sender);
      Key:= #0;
  end;

end;

procedure TFSelectorAnimales.EADesdeMesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key = #13) then
  begin
      EADesdeAnio.SetFocus;
      ChequearPrimeraFecha;
      LVerAnimalesClick(sender);
      Key:= #0;
  end;
end;

procedure TFSelectorAnimales.EADesdeAnioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key = #13) then
  begin
      EAHastaDia.SetFocus;
      ChequearPrimeraFecha;
      LVerAnimalesClick(sender);
      Key:= #0;
  end;

end;

procedure TFSelectorAnimales.EAHastaDiaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key = #13) then
  begin
      EAHastaMes.SetFocus;
      ChequearSegundaFecha;
      LVerAnimalesClick(sender);
      Key:= #0;
  end;

end;

procedure TFSelectorAnimales.EAHastaMesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key = #13) then
  begin
      EAHastaAnio.SetFocus;
      ChequearSegundaFecha;
      LVerAnimalesClick(sender);
      Key:= #0;
  end;
end;

procedure TFSelectorAnimales.EAHastaMesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  EAHastaAnio.SetFocus;
  ChequearSegundaFecha;
end;

procedure TFSelectorAnimales.EAHastaDiaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  EAHastaMes.SetFocus;
  ChequearSegundaFecha;
end;

procedure TFSelectorAnimales.EADesdeAnioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  EAHastaDia.SetFocus;
  ChequearPrimeraFecha;
end;

procedure TFSelectorAnimales.EADesdeMesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  EADesdeAnio.SetFocus;
  ChequearPrimeraFecha;
end;

procedure TFSelectorAnimales.EADesdeDiaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  EADesdeMes.SetFocus;
  ChequearPrimeraFecha;
end;

procedure TFSelectorAnimales.ChequearPrimeraFecha;
begin

     if ((EADesdeDia.Text <> '') and (EADesdeMes.Text <> '') and (EADesdeAnio.Text <> '')) then
        id_fecha_desde := 1
     else
        id_fecha_desde := -1;

end;

procedure TFSelectorAnimales.ChequearSegundaFecha;
begin

     if ((EAHastaDia.Text <> '') and (EAHastaMes.Text <> '') and (EAHastaAnio.Text <> '')) then
        id_fecha_hasta := 1
     else
        id_fecha_hasta := -1;

end;

procedure TFSelectorAnimales.EAHastaAnioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
ChequearSegundaFecha;
end;

procedure TFSelectorAnimales.EAHastaAnioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if (key = #13) then
  begin
      ChequearSegundaFecha;
      filtrado := true;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';

      LVerAnimalesClick(sender);
      Key:= #0;
  end;
end;

procedure TFSelectorAnimales.EAHastaAnioChange(Sender: TObject);
begin
  inherited;

  cantAH := Length(EAHastaAnio.Text);

  if ((cantAH = 4)) then
  begin
      ChequearSegundaFecha;
      filtrado := true;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';

      LVerAnimalesClick(sender);
  end;

  if (EAHastaAnio.Text = '') then
  begin
    id_fecha_desde := -1;
    id_fecha_hasta := -1;
    EAHastaMes.SetFocus;
  end;

  LVerAnimalesClick(sender);     
end;

procedure TFSelectorAnimales.EAHastaMesChange(Sender: TObject);
begin
  inherited;

  cantMH := Length(EAHastaMes.Text);

  if (cantMH = 2) then
  begin
      ChequearPrimeraFecha;
      filtrado := true;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';

      LVerAnimalesClick(sender);

      EAHastaAnio.SetFocus;
  end
  else
     filtrado := false;


  if (EAHastaMes.Text = '') then
  begin
    id_fecha_desde := -1;
    id_fecha_hasta := -1;
    EAHastaDia.SetFocus;
  end;

  LVerAnimalesClick(sender);  
end;

procedure TFSelectorAnimales.EAHastaDiaChange(Sender: TObject);
begin
  inherited;

  cantDH := length(EAHastaDia.Text);

  if (cantDH = 2) then
  begin
      ChequearPrimeraFecha;
      filtrado := true;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';

      LVerAnimalesClick(sender);
      EAHastaMes.SetFocus;
  end
  else
     filtrado := false;

  if (EAHastaDia.Text = '') then
  begin
    id_fecha_desde := -1;
    id_fecha_hasta := -1;
    EADesdeAnio.SetFocus;
  end;
  LVerAnimalesClick(sender);  
end;

procedure TFSelectorAnimales.EADesdeAnioChange(Sender: TObject);
begin
  inherited;

  cantAD := Length(EADesdeAnio.Text);

  if ((cantAD = 4)) then
  begin
      ChequearPrimeraFecha;
      filtrado := true;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';

      LVerAnimalesClick(sender);

      EAHastaDia.SetFocus;
  end
  else
     filtrado := false;


  if (EADesdeAnio.Text = '') then
  begin
    EADesdeMes.SetFocus;
    id_fecha_desde := -1;
    id_fecha_hasta := -1;
  end;

  LVerAnimalesClick(sender);
    
end;

procedure TFSelectorAnimales.EADesdeMesChange(Sender: TObject);
begin
  inherited;

  cantMD := Length(EADesdeMes.Text);

  if (cantMD = 2) then
  begin
      ChequearPrimeraFecha;
      filtrado := true;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';

      LVerAnimalesClick(sender);

      EADesdeAnio.SetFocus;
  end
  else
     filtrado := false;


  if (EADesdeMes.Text = '') then
    EADesdeDia.SetFocus;

  LVerAnimalesClick(sender);
    
end;

procedure TFSelectorAnimales.EADesdeDiaChange(Sender: TObject);
begin
  inherited;

  cantDD := Length(EADesdeDia.Text);

  if (cantDD = 2) then
  begin
      ChequearPrimeraFecha;
      filtrado := true;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';

      LVerAnimalesClick(sender);

      EADesdeMes.SetFocus;
  end
  else
     filtrado := false;

  if (EADesdeDia.Text = '') then
  begin
       DTPDesde.Date := Now();
       DTPHasta.Date := Now();
       EADesdeDia.SetFocus;
       id_fecha_desde := -1;
       id_fecha_hasta := -1;
       LVerAnimalesClick(sender);
  end;

  LVerAnimalesClick(sender);
end;

procedure TFSelectorAnimales.CBRazaCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelRaza) then
  begin
    CBRaza.Items.Delete(0);
    DelRaza := true;
  end;
end;

procedure TFSelectorAnimales.CBCategoriaCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelCategoria) then
  begin
    CBCategoria.Items.Delete(0);
    DelCategoria := true;
  end;
end;

procedure TFSelectorAnimales.CBRodeoCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelRodeo) then
  begin
    CBRodeo.Items.Delete(0);
    DelRodeo := true;
  end;
end;

procedure TFSelectorAnimales.CBColorCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelColor) then
  begin
    CBColor.Items.Delete(0);
    DelColor := true;
  end;
end;

procedure TFSelectorAnimales.CBEstadoReproCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelEstado) then
  begin
    CBEstadoRepro.Items.Delete(0);
    DelEstado := true;
  end;
end;

procedure TFSelectorAnimales.CBPotreroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelPotrero) then
  begin
    CBPotrero.Items.Delete(0);
    DelPotrero := true;
  end;
end;

procedure TFSelectorAnimales.CBTipoRegistroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTR) then
  begin
    CBTipoRegistro.Items.Delete(0);
    DelTR := true;
  end;
end;

procedure TFSelectorAnimales.CBCondCorporalCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelCC) then
  begin
    CBCondCorporal.Items.Delete(0);
    DelCC := true;
  end;
end;

procedure TFSelectorAnimales.CBOrigenCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelOrigen) then
  begin
    CBOrigen.Items.Delete(0);
    DelOrigen := true;
  end;
end;

procedure TFSelectorAnimales.CBCantPartosCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelCP) then
  begin
    CBCantPartos.Items.Delete(0);
    DelCP := true;
  end;
end;


procedure TFSelectorAnimales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //if FPrincipal._USO_DISP then
    //cerrarLector;
end;

procedure TFSelectorAnimales.crearLector;
begin
  FLectorElectronico:= TLectorAllFlexSerie.Create();//creo segun el que estamos usando
  FLectorElectronico.ConfigurarVaComm();
  FLectorElectronico.OpenVAComm; // abro la conexion  }
end;

procedure TFSelectorAnimales.cerrarLector;
begin
  if FLectorElectronico<>nil then
  begin
    FLectorElectronico.CloseVAComm;
    FLectorElectronico.Destroy;
    FLectorElectronico:=nil;
  end;
end;

procedure TFSelectorAnimales.TimerLectorTimer(Sender: TObject);
var rec:TRecordData;
    //info:trecinfo;
    id_aux : Integer;
    auxlectura,rpaux, auxie: String;
begin
  inherited;
  auxlectura := FLectorElectronico.Lectura;
  FLectorElectronico.Lectura := '';
  if(auxlectura<>'')then
  begin

    if Length(auxlectura) < 23 then
    begin
      if Length(auxlectura) = 22 then
        auxlectura := StringReplace(auxlectura,'A0','A00',[]);
      if Length(auxlectura) = 15 then
        auxlectura := 'A0000000'+auxlectura;
    end
    else
      if auxlectura[1] = '1' then
        auxlectura[1] := 'A';

    if DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal')<>null then
    begin
      DMSoftvet.IBQDatosAnimal.Close;
      DMSoftvet.IBQDatosAnimal.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQDatosAnimal.Open;
      id_aux := DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal');
      rpaux := DMSoftvet.IBQDatosAnimal.Lookup('id_animal',id_aux,'id_rp');


      if filtrado then
      begin
        if IBQListadoAux.Locate('id_animal',id_aux,[loCaseInsensitive]) then
        begin
          TimerLector.Enabled := false;
          //cerrarLector;

          if (FREPFichaAnimal = nil) then
            Application.CreateForm(TFREPFichaAnimal, FREPFichaAnimal);
          FREPFichaAnimal.animal := BDBGListado.DataSource.DataSet.FieldValues['id_animal'];
          FREPFichaAnimal.ShowModal;

          //crearLector;
          TimerLector.Enabled := true;
        end
        else
          MostrarMensaje(tmError,Traducir('El animal ')+rpaux+Traducir(' no se encuentra entre los animales seleccionados'));
      end
      else
      begin
        if FPrincipal.IBQListaAnimales.Locate('id_animal',id_aux,[loCaseInsensitive]) then
        begin
          TimerLector.Enabled := false;
          //cerrarLector;

          if (FREPFichaAnimal = nil) then
            Application.CreateForm(TFREPFichaAnimal, FREPFichaAnimal);
          FREPFichaAnimal.animal := BDBGListado.DataSource.DataSet.FieldValues['id_animal'];
          FREPFichaAnimal.ShowModal;

          //crearLector;
          TimerLector.Enabled := true;
        end
        else
          MostrarMensaje(tmError,Traducir('El animal ')+rpaux+Traducir(' no se encuentra entre los animales seleccionados'));
      end;
    end
    else
      MostrarMensaje(tmError,'El animal con I.E. '+auxlectura+' no existe en el establecimiento');
  end;
end;

procedure TFSelectorAnimales.LOrdenNumericoClick(Sender: TObject);
begin
  inherited;

  IOrdenNumericoOn.Visible := not(IOrdenNumericoOn.Visible);
  IOrdenNumericoOff.Visible := not(IOrdenNumericoOff.Visible);

  IOrdenAlfanumericoOn.Visible := false;
  IOrdenAlfanumericoOff.Visible := true;

  filtrado := true;

  tipoOrdenNumerico := not(tipoOrdenNumerico);
  tipoOrdenAlfanumerico := false;
  LVerAnimalesClick(self);

end;

procedure TFSelectorAnimales.LOrdenAlfanumericoClick(Sender: TObject);
begin
  inherited;

  IOrdenAlfanumericoOn.Visible := not(IOrdenAlfanumericoOn.Visible);
  IOrdenAlfanumericoOff.Visible := not(IOrdenAlfanumericoOff.Visible);

  IOrdenNumericoOn.Visible := false;
  IOrdenNumericoOff.Visible := true;

  filtrado := true;

  tipoOrdenAlfanumerico := not(tipoOrdenAlfanumerico);
  tipoOrdenNumerico := false;
  LVerAnimalesClick(self);

end;

procedure TFSelectorAnimales.Label3Click(Sender: TObject);
begin
  inherited;

  filtrado := true;
  IVerAnimalesInacOn.Visible := not(IVerAnimalesInacOn.Visible);
  IVerAnimalesInacOff.Visible := not(IVerAnimalesInacOff.Visible);
  
  CBAnimalesInactivos.Checked := not(CBAnimalesInactivos.Checked);
  CBAnimalesInactivosClick(self);
  
end;

procedure TFSelectorAnimales.LRepListadoCabBraClick(Sender: TObject);
var cont : integer;
    cartel: TCartel;
    msje, auxStr, consulta: String;
    Rect: TRect;
    F : TFRepListadoCabBraf;
begin
  inherited;

  MostrarMensajeImpresion();
  cartel:= TCartel.getInstance();
  msje:= 'Generando vista previa del listado de animales ...';
  cartel.abrircartel(msje);

  HabilitarDesabilitarControles();

  F := TFRepListadoCabBraf.Create(self);

  F.IBQListadoAnimales.Close;
  F.IBQListadoAnimales.SQL.Clear;

  cont := 0;

  if (CBAnimalesInactivos.Checked) then
  begin
    if (queryAgr = '') then
      auxStr := 'select * from rep_listado_cab_bra(:estable) ta '
    else
      auxStr := 'select * from rep_listado_cab_bra(:estable) ta where ';
  end
  else
    auxStr := 'select * from rep_listado_cab_bra(:estable) ta where (ta.activo = ''S'') ';

  consulta := auxStr + queryAgr;

  F.IBQListadoAnimales.SQL.Add(consulta);

  if (filtrado) then
  begin
    while (cont < IBQListadoAux.Params.Count) do
    begin
      F.IBQListadoAnimales.ParamByName(IBQListadoAux.Params.Items[cont].Name).Value := IBQListadoAux.Params.Items[cont].Value;
      inc(cont);
    end;
  end
  else
  begin
    while (cont < FPrincipal.IBQListaAnimales.Params.Count) do
    begin
      F.IBQListadoAnimales.ParamByName(FPrincipal.IBQListaAnimales.Params.Items[cont].Name).Value := FPrincipal.IBQListaAnimales.Params.Items[cont].Value;
      inc(cont);
    end;
  end;

  F.IBQListadoAnimales.Open;
  F.IBQListadoAnimales.Last;
  F.IBQListadoAnimales.First;

  cartel.cerrarcartel();
  cartel.FreeInstance();

  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();
    
end;

procedure TFSelectorAnimales.CBSexoChange(Sender: TObject);
var txt : string;
begin

    txt := CBSexo.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODOS)'))then
    begin
      id_sexo := -1;
      queryAgr := StringReplace(queryAgr,' and (ta.sexo in (select id_sexo from cod_sexos where tipo = :sexo))','',[rfReplaceAll]);
      CBSexo.Items.Insert(0,'SEXO');
      CBSexo.ItemIndex := 0;
      DelSexo := false;
    end
    else
    begin
      if (id_sexo = -1) then
        queryAgr := queryAgr + ' and (ta.sexo in (select id_sexo from cod_sexos where tipo = :sexo))';

      if (txt = 'MACHO') then
        id_sexo := 1
      else
          if (txt = 'HEMBRA') then
            id_sexo := 2;
    end;

    filtrado := true;
    LVerAnimalesClick(sender);
end;

procedure TFSelectorAnimales.CBSexoCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelSexo) then
  begin
       CBSexo.Items.Delete(0);
       DelSexo := true; 
  end;
end;

end.
