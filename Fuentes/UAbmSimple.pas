unit UAbmSimple;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, Menus, DB, ImgList, ActnList, StdCtrls, Grids,
  DBGrids, UBDBGrid, ComCtrls, ExtCtrls, IBDatabase, IBCustomDataSet,UDBEditAuto,UDBLookUpComboBoxAuto,
  IBUpdateSQL, IBQuery,UDBControl, Buttons, UButtonABM, IBStoredProc, EditAuto, EditAutoMinuscula, DBEditMinuscula,
  DataExport, DataToXLS, WinXP, JvGIF, JvExControls, JvLabel, PngImage,
  jpeg, PngImageList, JvExExtCtrls, JvImage;

//
type
  TColumnWidthHelper = record   //autofit columns
   Index : integer;
   MaxWidth, MinWidth : integer;
  end;
//
                                                         
type
    TEstadoAbm = (eaInsertar, eaEditar, eaNavegar);
    TFormaAbm = (faAbm, faElegir, faFiltrado, faSeleccionado);
     TFABMSimple = class(TFUniversal)
    PNavegar: TPanel;
    GBBuscar: TGroupBox;
    LCriterioBuscar: TLabel;
    LValorBuscar: TLabel;
    CBCriterioBuscar: TComboBox;
    EValorBuscar: TEdit;
    GBFiltrar: TGroupBox;
    LCriterioFiltrar: TLabel;
    LValorFiltrar: TLabel;
    CBCriterioFiltrar: TComboBox;
    EValorFiltrar: TEdit;
    IlAbmSimple: TImageList;
    DSAbmSimple: TDataSource;
    PMGrilla: TPopupMenu;
    MIBuscar: TMenuItem;
    MIFiltrar: TMenuItem;
    PEditar: TPanel;
    PBotones: TPanel;
    BBInsertar: TBitBtn;
    BBEliminar: TBitBtn;
    BBEditar: TBitBtn;
    BBGuardar: TBitBtn;
    BBCancelar: TBitBtn;
    BBSalir: TBitBtn;
    BBElegir: TBitBtn;
    IBQAbmSimple: TIBQuery;
    IBUSQLAbmSimple: TIBUpdateSQL;
    SBFiltrar: TSpeedButton;
    SBBuscar: TSpeedButton;
    AcInsertar: TAction;
    AcEliminar: TAction;
    AcEditar: TAction;
    AcGuardar: TAction;
    AcCancelar: TAction;
    AcSalir: TAction;
    AcElegir: TAction;
    AcBuscar: TAction;
    AcFiltrar: TAction;
    BBAyuda: TBitBtn;
    GBCantidad: TGroupBox;
    BDBGAbm: TBitDBGrid;
    IFondo: TImage;
    IAyuda: TImage;
    LAyuda: TLabel;
    IInsertar: TImage;
    LInsertar: TLabel;
    IEliminar: TImage;
    LEliminar: TLabel;
    IElegir: TImage;
    LElegir: TLabel;
    ITerminar: TImage;
    LTerminar: TLabel;
    ISalir: TImage;
    LSalir: TLabel;
    ICancelar: TImage;
    LCancelar: TLabel;
    IEditar: TImage;
    LEditar: TLabel;
    IBuscar: TImage;
    LBuscar: TLabel;
    IFiltro: TImage;
    LFiltro: TLabel;

    procedure MIBuscarClick(Sender: TObject);
    procedure MIFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AcBuscarExecute(Sender: TObject);
    procedure AcFiltrarExecute(Sender: TObject);
    procedure EValorBuscarChange(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure AcEliminarExecute(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure AcCancelarExecute(Sender: TObject);
    procedure AcSalirExecute(Sender: TObject);
    procedure AcElegirExecute(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure IBQAbmSimpleUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TIBUpdateAction);
    procedure IBQAbmSimpleFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure BDBGAbmKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure EValorFiltrarExit(Sender: TObject);
    procedure BBAplicarFiltroClick(Sender: TObject);
    procedure EValorFiltrarChange(Sender: TObject);
    procedure BDBGAbmDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CBCriterioFiltrarChange(Sender: TObject);
    procedure CBCriterioBuscarChange(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure FormPaint(Sender: TObject);
    procedure IBQAbmSimpleAfterOpen(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);

  private
    FForma : TFormaAbm;
    FEstado: TEstadoAbm;
    FInvocante: TButtonABM;
    FValorRetorno: variant;
    FCampoRetorno: string;
    FPermiteCambio: Boolean;
    FPermiteInsertar: Boolean;
    FSelect : string;
    procedure PrepararBuscar;
    procedure PrepararFiltrar;
    function GetAlturaEditar: Integer;
    function GetAlturaNavegar: Integer;
    function GetAnchoEditar: Integer;
    function GetAnchoNavegar: Integer;
    procedure SetEstado(const Value: TEstadoAbm);
    procedure AbrirAbm;
    procedure AbrirElegir;
    procedure AbrirFiltrado;
    procedure AbrirSeleccionado;
    function PuedeGrabar: Boolean;
    function Convertido(Control: TControl; var IControl: IDBControl): boolean;
    procedure AsignarValoresDefecto;
    procedure EstablecerFoco;
    function GetValorSeleccionado: variant;
    function GetCampoRetorno: String;
    procedure SetPermiteCambio(const Value: Boolean);
    procedure HabilitarClaves(Modo: boolean);
    procedure SetPermiteInsertar(const Value: Boolean);
    procedure ActivarFiltro; virtual;
    function getIndex(campo:string): Integer;




  protected

    function OpcionesDeCambio : Boolean; virtual;
    procedure PasarAEditar; virtual;
    procedure ControlEventoChange(Sender: TObject);
    procedure ReabrirQuerys; virtual;
    procedure EliminarRegistro; virtual;
    procedure EditarRegistro; virtual;
    procedure GuardarRegistro; virtual;
    procedure CancelarRegistro; virtual;
    procedure CargarParametrosSimple; virtual;
    procedure ComponentesVisiblesPorPais(pais: Integer);override;
    function eliminarAcentos(texto:string):string;
    procedure AnchoAltoEstatico(); virtual;
    function OpcionesParaGrabar : Boolean; virtual;
    procedure ControlarBotonesNavegacion;
  public
    nom:string;
    desdeEvento:integer;
    procedure Abrir(Forma: TFormaAbm);
    procedure AutoFitColumns();
    procedure PasarANavegar;
    procedure PasarAInsertar;
    procedure InsertarRegistro; virtual;

    procedure AutoAjustarColumnas;

    property Invocante : TButtonAbm read FInvocante write FInvocante;
    property AlturaEditar: Integer read GetAlturaEditar;
    property AnchoEditar: Integer read GetAnchoEditar;
    property AlturaNavegar: Integer read GetAlturaNavegar;
    property AnchoNavegar: Integer read GetAnchoNavegar;
    property Estado: TEstadoAbm read FEstado write SetEstado default eaNavegar;
    property ValorRetorno:variant read GetValorSeleccionado;// (retorna el id de animal elegido en el abm de animalesexterno)
    property CampoRetorno:String read GetCampoRetorno write FCampoRetorno;// (retorna el id de animal elegido en el abm de animalesexterno)
    property PermiteCambio:Boolean read FPermiteCambio write SetPermiteCambio;// (para dejar o no eliminar y agregar).
    property PermiteInsertar:Boolean read FPermiteInsertar write SetPermiteInsertar;// (para permitir insertar, independiente se complementa con permite cambio).
  end;

var
  FABMSimple: TFABMSimple;
  ColumnWidthHelper : TColumnWidthHelper; //autofit columns
  tipoEvento : string;

implementation

uses UPrincipal, UMensajeHuella, Math,UDMSoftVet, DateTimePickerAuto, UImportacion,
    UEveSimple, UTraduccion, UCartel, UABMPadresExternos,  uTiposGlobales,
  StrUtils;

{$R *.dfm}

procedure TFABMSimple.MIBuscarClick(Sender: TObject);
begin
  inherited;
  MIBuscar.Checked := not MIBuscar.Checked;
  GBBuscar.Visible := MIBuscar.Checked;
end;

procedure TFABMSimple.MIFiltrarClick(Sender: TObject);
begin
  inherited;
  MIFiltrar.Checked := not MIFiltrar.Checked;
  GBFiltrar.Visible := MIFiltrar.Checked;
end;

procedure TFABMSimple.PrepararBuscar;
var
  ind : Integer;
begin
  CBCriterioBuscar.Clear;
  for ind := 0 to BDBGAbm.Columns.Count -1 do
    if(BDBGAbm.Columns[ind].Visible) then
      CBCriterioBuscar.Items.Add(Traducir(BDBGAbm.Columns[ind].Title.Caption));
  CBCriterioBuscar.ItemIndex := 0;
end;

procedure TFABMSimple.FormShow(Sender: TObject);
begin
  inherited;
  PEditar.Align  := alClient;
  PNavegar.Align := alClient;
  BDBGAbm.Align  := alClient;
  if not (Owner is TFABMSimple) then
  begin
    ReabrirQuerys;
    Estado := eaNavegar;
  end
  else
      if (self.Name = 'FABMPropietarioAnimal') then
      begin
        ReabrirQuerys;
        Estado := eaInsertar;
      end;

  PrepararBuscar;
  EValorBuscar.Width  := GBBuscar.Width  - EValorBuscar.Left  - 11;
  PrepararFiltrar;
  EValorFiltrar.Width := GBFiltrar.Width - EValorFiltrar.Left - 11;
  FSelect := IBQAbmSimple.SQL.GetText;
  ComponentesVisiblesPorPais(-1);

  if (desdeEvento > -1) and not cargaDeMovil then
  begin
    AcInsertarExecute(nil);
  end;

  LElegir.Visible := (desdeEvento>-1) and (Estado=eaNavegar) and not(IBQAbmSimple.IsEmpty);
  IElegir.Visible := (desdeEvento>-1) and (Estado=eaNavegar) and not(IBQAbmSimple.IsEmpty);
end;

procedure TFABMSimple.PrepararFiltrar;
var
  ind : Integer;
begin
  CBCriterioFiltrar.Clear;
  for ind := 0 to BDBGAbm.Columns.Count -1 do
    if(BDBGAbm.Columns[ind].Visible) then
      CBCriterioFiltrar.Items.Add(Traducir(BDBGAbm.Columns[ind].Title.Caption));
  CBCriterioFiltrar.ItemIndex := 0;
end;

procedure TFABMSimple.AcBuscarExecute(Sender: TObject);
begin
  inherited;
  MIBuscar.Checked := not MIBuscar.Checked;
  GBBuscar.Visible := MIBuscar.Checked;

end;

procedure TFABMSimple.AcFiltrarExecute(Sender: TObject);
begin
  inherited;
  MIFiltrar.Checked := not MIFiltrar.Checked;
  GBFiltrar.Visible := MIFiltrar.Checked;

end;

procedure TFABMSimple.PasarANavegar;
begin
  PEditar.Hide;
  PNavegar.Show;
  AcInsertar.Visible := True;
  AcEliminar.Visible := True;
  AcEditar.Visible   := True;
  SBBuscar.Visible   := True;
  SBFiltrar.Visible  := True;
  AcGuardar.Visible  := False;
  AcCancelar.Visible := False;
  AcSalir.Visible    := (FForma = faAbm) or (FForma =faElegir);
  AcElegir.Visible   := FForma = faElegir;

  LInsertar.Visible := True;
  IInsertar.Visible := True;
  LEliminar.Visible := True;
  IEliminar.Visible := True;
  LEditar.Visible   := True;
  IEditar.Visible   := True;
  LTerminar.Visible  := False;
  ITerminar.Visible  := False;
  LCancelar.Visible := False;
  ICancelar.Visible := False;
  LSalir.Visible    := (FForma = faAbm) or (FForma =faElegir);
  ISalir.Visible    := (FForma = faAbm) or (FForma =faElegir);
  LElegir.Visible   := FForma = faElegir;
  IElegir.Visible   := FForma = faElegir;
  LBuscar.Visible   := true;
  IBuscar.Visible   := true;
  LFiltro.Visible  := true;
  IFiltro.Visible  := true;

  ControlarBotonesNavegacion;

  BDBGAbm.SetFocus;
  Height := Height - PNavegar.Height + AlturaNavegar;
  Width  := Width  - BDBGAbm.Width   + AnchoNavegar;
  if Width < 650 then
    Width := 650
  else
    if (Width > Screen.Width) then
      Width := Screen.Width - 1;
  if Height < 450 then Height := 450;
  AnchoAltoEstatico;
  FormResize(self);
end;

procedure TFABMSimple.AnchoAltoEstatico;
begin
  //Este metodo es por si alguno de los hijos quiere definir
  //un alto y ancho del formulario de manera estatica
end;

function TFABMSimple.GetAlturaEditar: Integer;
var
  res : Integer;
  ind : Integer;
  aux : TWinControl;
begin
  res := 0;
  for ind := 0 to PEditar.ControlCount -1 do begin
    aux := TWinControl(PEditar.Controls[ind]);
    if (aux.Top + aux.Height > res) then
      res := aux.Top + aux.Height;
  end;
  Result := res + 290;

end;

function TFABMSimple.GetAlturaNavegar: Integer;
begin
  Result := 290;
end;

function TFABMSimple.GetAnchoEditar: Integer;
var
  res : Integer;
  ind : Integer;
  aux : TWinControl;
begin
  res := 0;
  for ind := 0 to PEditar.ControlCount -1 do begin
    aux := TWinControl(PEditar.Controls[ind]);
    if (aux.Left + aux.Width > res) then
      res := aux.Left + aux.Width;
  end;
  Result := res + 50;
end;

function TFABMSimple.GetAnchoNavegar: Integer;
var
  res : Integer;
  ind : Integer;
begin
  res := 0;

  for ind := 0 to BDBGAbm.Columns.Count -1 do
    res := res + BDBGAbm.Columns[ind].Width;
  Result := res + 50;
end;

procedure TFABMSimple.SetEstado(const Value: TEstadoAbm);
begin
  FEstado := Value;
  case FEstado of
    eaNavegar  : PasarANavegar;
    eaInsertar : PasarAInsertar;
    eaEditar   : PasarAEditar;
  end;

end;

procedure TFABMSimple.PasarAEditar;
begin
  PNavegar.Hide;
  PEditar.Show;
  AcInsertar.Visible := False;
  AcEliminar.Visible := False;
  AcEditar.Visible   := False;
  SBBuscar.Visible   := False;
  SBFiltrar.Visible  := False;
  AcGuardar.Visible  := True;
  AcCancelar.Visible := True;
  AcSalir.Visible    := False;
  AcElegir.Visible   := False;

  LInsertar.Visible := False;
  IInsertar.Visible := False;
  LEliminar.Visible := False;
  IEliminar.Visible := False;
  LEditar.Visible   := False;
  IEditar.Visible   := False;
  ITerminar.Visible  := True;
  LTerminar.Visible  := True;
  LCancelar.Visible := True;
  ICancelar.Visible := True;

  LSalir.Visible    := False;
  ISalir.Visible    := False;
  LElegir.Visible   := False;
  IElegir.Visible   := False;
  LBuscar.Visible   := False;
  IBuscar.Visible   := False;
  LFiltro.Visible  := False;
  IFiltro.Visible  := False;

  HabilitarClaves(False);
  if not (Owner is TFABMSimple) then
    EstablecerFoco;
  FormResize(self);
end;

procedure TFABMSimple.PasarAInsertar;
begin
  PNavegar.Hide;
  PEditar.Show;
  AcInsertar.Visible := False;
  AcEliminar.Visible := False;
  AcEditar.Visible   := False;
  SBBuscar.Visible   := False;
  SBFiltrar.Visible  := False;
  AcGuardar.Visible  := True;
  AcCancelar.Visible := True;
  AcSalir.Visible    := False;
  AcElegir.Visible   := False;

  LInsertar.Visible := False;
  IInsertar.Visible := False;
  LEliminar.Visible := False;
  IEliminar.Visible := False;
  LEditar.Visible   := False;
  IEditar.Visible   := False;
  ITerminar.Visible  := false;
  LTerminar.Visible  := false;
  LCancelar.Visible := True;
  ICancelar.Visible := True;

  LSalir.Visible    := False;
  ISalir.Visible    := False;
  LElegir.Visible   := False;
  IElegir.Visible   := False;
  LBuscar.Visible   := False;
  IBuscar.Visible   := False;
  LFiltro.Visible  := False;
  IFiltro.Visible  := False;

  HabilitarClaves(True);
  if not (Owner is TFABMSimple) then

  EstablecerFoco;
  FormResize(self);
end;

procedure TFABMSimple.Abrir(Forma: TFormaAbm);
begin
 FForma := Forma;
  case FForma of
    faAbm      : AbrirAbm;
    faElegir   : AbrirElegir;
    faSeleccionado : AbrirSeleccionado;
    faFiltrado : AbrirFiltrado;
  end;
end;

procedure TFABMSimple.AbrirSeleccionado;
begin
  ShowModal;
end;

procedure TFABMSimple.AbrirAbm;
begin
  ShowModal;
end;

procedure TFABMSimple.AbrirElegir;
begin
  ShowModal;
end;

procedure TFABMSimple.AbrirFiltrado;
begin

  MIFiltrar.Checked := False;
  MIFiltrarClick(self);

end;

procedure TFABMSimple.EValorBuscarChange(Sender: TObject);
begin
 inherited;
  try
    IBQAbmSimple.Locate(BDBGAbm.Columns[getIndex(CBCriterioBuscar.Text)].FieldName, EValorBuscar.Text, [loPartialKey]);
  except on e:exception do
    Abort;
  end;
end;

function TFABMSimple.getIndex(campo:string):Integer; //Obtiene el numero de columna del campo deseado en la tabla
var ind : integer;
    nombre, columna : string;
begin
  nombre:=eliminarAcentos(campo);
  nombre:=UpperCase(nombre);
  for ind := 0 to BDBGAbm.Columns.Count -1 do
  begin
    columna:=UpperCase(eliminarAcentos(StringReplace(BDBGAbm.Columns[ind].Title.Caption,'_',' ',[rfReplaceAll])));
    if(columna=nombre) then
    begin
        getIndex:=ind;
        break;
    end
  end;
end;

function TFABMSimple.eliminarAcentos(texto:string):string;
begin
  texto:=StringReplace(texto,'á','a',[rfReplaceAll, rfIgnoreCase]);
  texto:=StringReplace(texto,'é','e',[rfReplaceAll, rfIgnoreCase]);
  texto:=StringReplace(texto,'í','i',[rfReplaceAll, rfIgnoreCase]);
  texto:=StringReplace(texto,'ó','o',[rfReplaceAll, rfIgnoreCase]);
  texto:=StringReplace(texto,'ú','u',[rfReplaceAll, rfIgnoreCase]);
  eliminarAcentos:=texto;
end;

procedure TFABMSimple.CancelarRegistro;
begin
   IBQAbmSimple.CancelUpdates;
end;

procedure TFABMSimple.EditarRegistro;
begin
   IBQAbmSimple.Edit;
end;

procedure TFABMSimple.EliminarRegistro;
begin
  try
    IBQAbmSimple.Delete;
    FPrincipal.IBDPrincipal.ApplyUpdates([IBQAbmSimple]);
  except on e:exception do
    IBQAbmSimple.CancelUpdates;
  end;
end;

procedure TFABMSimple.GuardarRegistro;
begin
  try
    CargarParametrosSimple();
    FPrincipal.IBDPrincipal.ApplyUpdates([IBQAbmSimple]);
  except
    IBQAbmSimple.CancelUpdates;
  end;
end;

procedure TFABMSimple.InsertarRegistro;
begin
  IBQAbmSimple.Insert;
end;

procedure TFABMSimple.ReabrirQuerys;
begin
  IBQAbmSimple.Close;
  CargarParametrosSimple;
  IBQAbmSimple.Open;
end;

procedure TFABMSimple.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  LElegir.Visible := false;
  IElegir.Visible := false;
  Estado := eaInsertar;
  InsertarRegistro;
  AsignarValoresDefecto;
end;

procedure TFABMSimple.AcEliminarExecute(Sender: TObject);
begin
  inherited;

  If (MostrarMensaje(tmConsulta, 'Eliminar el registro seleccionado ?') = mrYes) then
    EliminarRegistro;
  Estado := eaNavegar;
end;

procedure TFABMSimple.AcEditarExecute(Sender: TObject);
begin
  inherited;

    IElegir.Visible := false;
    LElegir.Visible := false;
    if not(IBQAbmSimple.IsEmpty) and AcEditar.Enabled then
    begin
      EditarRegistro;
      Estado := eaEditar;
    end;

    AnchoAltoEstatico;
    
    FormResize(self);

end;

procedure TFABMSimple.AcGuardarExecute(Sender: TObject);
 begin
  inherited;

  if PuedeGrabar then
  begin
    GuardarRegistro;
    Estado := eaNavegar;
    if desdeEvento>-1 then
    begin
      BDBGAbmCellClick(nil);
      nroID:=desdeEvento;
      LElegir.Visible := true;
      IElegir.Visible := true;
      AcElegirExecute(nil);
    end;

    if cargaDeMovil then
    begin
      AcSalirExecute(self);
    end;

    if (Owner is TFABMSimple) then
      AcSalirExecute(self);
  end
  else
    MostrarMensaje(tmError, 'Hay datos requeridos sin ingresar');
end;

procedure TFABMSimple.AcCancelarExecute(Sender: TObject);
begin
  inherited;

  If not (IBQAbmSimple.Modified and (MostrarMensaje(tmConsulta, 'No guardó los cambios, desea Salir ?') = mrNo)) then begin
    CancelarRegistro;
    Estado := eaNavegar;
    if cargaDeMovil then
      AcSalirExecute(self);
  end;
end;

procedure TFABMSimple.AcSalirExecute(Sender: TObject);
begin
  inherited;
  if desdeEvento>-1 then
    nroID:=-1;

  Close;
end;

procedure TFABMSimple.AcElegirExecute(Sender: TObject);
begin
  inherited;

  if (desdeEvento <= 0) then
   begin
     if (not IBQAbmSimple.IsEmpty) then
        FValorRetorno := IBQAbmSimple.FieldByName(FCampoRetorno).AsVariant;
   end
  else
    if desdeEvento>0 then
      begin
        nroID:=desdeEvento;
        FValorRetorno:= nroID;
      end;
  Close;
end;

function TFABMSimple.PuedeGrabar: Boolean;
var
  ind : Integer;
  res : Boolean;
  aux : IDBControl;
begin
  res := True;
  for ind := 0 to PEditar.ControlCount - 1 do
    if Convertido(PEditar.Controls[ind], aux) then
      res := res and aux.PuedeGrabar;
  Result := res AND OpcionesParaGrabar;
  if (self is TFABMPadresExternos) then
    Result := OpcionesParaGrabar;
end;

function TFABMSimple.OpcionesParaGrabar : Boolean;
begin
  //este metodo es para que cada hijo redefina las opciones
  //que se deben cumplir para poder guardar
  Result := true;
end;

procedure TFABMSimple.SBBuscarClick(Sender: TObject);
begin
  inherited;
  MIBuscar.Checked := not MIBuscar.Checked;
  GBBuscar.Visible := MIBuscar.Checked;
  if (SBBuscar.Down) then
    begin
      EValorBuscar.SetFocus;
      EValorBuscar.Text:='';
    end;
end;

procedure TFABMSimple.SBFiltrarClick(Sender: TObject);
begin
  inherited;
  MIFiltrar.Checked := not MIFiltrar.Checked;
  GBFiltrar.Visible := MIFiltrar.Checked;
  EValorFiltrar.Text:='';
  if (SBFiltrar.Down) then
    begin
      EValorFiltrar.SetFocus;
    end
  else
    begin
      EValorFiltrarChange(nil);
    end;
end;



procedure TFABMSimple.IBQAbmSimpleUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TIBUpdateAction);
begin
  inherited;
  if (pos('PK_', E.Message) > 0) then begin
    MostrarMensaje(tmError, 'Ya existe un registro con esta clave');
    Abort;
  end;
  if (pos('FOREIGN', E.Message) > 0) then
    MostrarMensaje(tmError, 'Hay datos relacionados con este registro');
end;

procedure TFABMSimple.IBQAbmSimpleFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
//  Accept := DataSet['AmountOfPurchase'] > StrToInt(Edit1.Text);
end;

function TFABMSimple.Convertido(Control: TControl;
  var IControl: IDBControl): boolean;
begin
  Convertido := True;
  IControl   := nil;
  if Control is TDBEditAuto then
    IControl := IDBControl(TDBEditAuto(Control))
  else
    if Control is TDBLookUpComboBoxAuto then
      IControl := IDBControl(TDBLookUpComboBoxAuto(Control))
    else
      if Control is TEditAuto then
        IControl := IDBControl(TEditAuto(Control))
      else
        if Control is TEditAutoMinuscula then
          IControl := IDBControl(TEditAutoMinuscula(Control))
        else
          if Control is TDBEditMinuscula then
            IControl := IDBControl(TDBEditMinuscula(Control))
          else
            if Control is TEditAutoMinuscula then
              IControl := IDBControl(TEditAutoMinuscula(Control))
            else
                Convertido := False;
end;

procedure TFABMSimple.AsignarValoresDefecto;
var
  ind : Integer;
  aux : IDBControl;
begin
  for ind := 0 to PEditar.ControlCount - 1 do
    if Convertido(PEditar.Controls[ind], aux) then
      aux.AsignarValorDefecto;
end;

procedure TFABMSimple.EstablecerFoco;
var
  i   : Integer;
  aux : TList;
begin
  aux := TList.Create;
  PEditar.GetTabOrderList(aux);
  i := 0;
  while (i < aux.Count) and (not TWinControl(aux[i]).CanFocus) do
    inc(i);
  if (i < aux.Count) then
    TWinControl(aux[i]).SetFocus;
  aux.Destroy;

end;

procedure TFABMSimple.BDBGAbmKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  // presión de una tecla sobre la grilla.
{  if (key = #13) then
      ShowMessage('enter');}
end;

procedure TFABMSimple.ControlEventoChange(Sender: TObject);
begin
  
  LTerminar.Visible := PuedeGrabar;
  ITerminar.Visible := PuedeGrabar;
  FormResize(self);
end;

procedure TFABMSimple.FormCreate(Sender: TObject);
var
  ind : integer;
  aux : IDBControl;
begin
  inherited;
  for ind := 0 to PEditar.ControlCount - 1 do begin
    if Convertido(PEditar.Controls[ind],aux) then
      begin
        aux.SetOnSaveChange(ControlEventoChange);
      end;
  end;
  (* Por defecto no permitimos cambios, ya que es el caso mas comun.
     Los hijos que si lo permitan, deben sobreescribir el FormCreate
     para cambiar esta variable
  *)
  PermiteCambio := False;
  (* Por defecto permitimos insertar, ya que es el caso mas comun.
     Los hijos que no lo permitan, deben sobreescribir el FormCreate
     para cambiar esta variable.
     Este valor queda restringido a PermiteCambio, NO es independiente.
  *)
  PermiteInsertar := True;
  if (Owner is TFPrincipal) then
    desdeEvento:=-1
  else
    desdeEvento:=0;
  
end;

procedure TFABMSimple.EValorFiltrarExit(Sender: TObject);
begin
  inherited;
  ActivarFiltro;
end;

procedure TFABMSimple.ActivarFiltro;
var
  aux, nuevoSQL : string;
begin
  inherited;
  aux := '';
  aux := BDBGAbm.Columns[getIndex(CBCriterioFiltrar.Text)].fieldname;
  aux:=UpperCase(StringReplace(aux,' ','_',[rfReplaceAll]));

//***********\\\ esto es un parche para que ande bien el filtro padres externos y potreros  ABMANIMALES
  if (StrComp(PChar(aux), PChar('nomsex')) = 0) OR (StrComp(PChar(aux), PChar('NOMSEX')) = 0) then
    aux:= 'C.Nombre'
   else
    if (StrComp(PChar(aux), PChar('nomraz')) = 0) OR (StrComp(PChar(aux), PChar('NOMRAZ')) = 0) then
      aux:= 'r.nombre'
     else
      if (StrComp(PChar(aux), PChar('nombreraza')) = 0) OR (StrComp(PChar(aux), PChar('NOMBRERAZA')) = 0) then
        aux:= 'CR.nombre'
       else
        if (StrComp(PChar(aux), PChar('nomest')) = 0) OR (StrComp(PChar(aux), PChar('NOMEST')) = 0) then
          aux:= 'a.nombre'
         else
          if (StrComp(PChar(aux), PChar('nombre')) = 0) OR (StrComp(PChar(aux), PChar('NOMBRE')) = 0) then
            if (AnsiPos('TAB_GRUPOS',IBQAbmSimple.SQL.GetText) <> 0) then  //esta usando el filtro de grupos
              aux:='NOMBRE'
            else
              aux:= 'tp.NOMBRE'
            else
                if (StrComp(PChar(aux), PChar('nomani')) = 0) OR (StrComp(PChar(aux), PChar('NOMANI')) = 0) then
                  aux:= 'A.NOMBRE'
                else
                    if (StrComp(PChar(aux), PChar('nombre_animal')) = 0) OR (StrComp(PChar(aux), PChar('NOMBRE_ANIMAL')) = 0) then
                      aux:= 'A.NOMBRE'
                    else
                      if (StrComp(PChar(aux), PChar('nombrerol')) = 0) OR (StrComp(PChar(aux), PChar('NOMBREROL')) = 0) then
                        aux := 'R.NOMBRE'
                      else
                        if (StrComp(PChar(aux), PChar('nomusr')) = 0) OR (StrComp(PChar(aux), PChar('NOMUSR')) = 0) then
                          aux := 'U.NOMBRE'
                        else
                          if (StrComp(PChar(aux), PChar('codigo')) = 0) OR (StrComp(PChar(aux), PChar('CODIGO')) = 0) then
                            aux := 'tp.codigo'
                          else
                            if (StrComp(PChar(aux), PChar('sinonimo')) = 0) OR (StrComp(PChar(aux), PChar('SINONIMO')) = 0) then
                              aux := 'tp.sinonimo'
                            else
                              if (StrComp(PChar(aux), PChar('descripciontratamiento')) = 0) OR (StrComp(PChar(aux), PChar('DESCRIPCIONTRATAMIENTO')) = 0) then
                                aux := 'ctt.sinonimo'
                              else
                                if (StrComp(PChar(aux), PChar('crfSinonimo')) = 0) OR (StrComp(PChar(aux), PChar('CRFSINONIMO')) = 0) then
                                  aux := 'crf.sinonimo'
                                else
                                  if (StrComp(PChar(aux), PChar('nombrepais')) = 0) OR (StrComp(PChar(aux), PChar('NOMBREPAIS')) = 0) then
                                    aux := 'tpa.nombre'
                                   else
                                     if (StrComp(PChar(aux), PChar('TIPO')) = 0) OR (StrComp(PChar(aux), PChar('tipo')) = 0) then
                                       aux := 'cte.SINONIMO';

//***********\\\   }


  if (StrComp(PChar(EValorFiltrar.Text), PChar('')) <> 0) then
   if (AnsiPos('where',IBQAbmSimple.SQL.GetText) = 0) then // no tiene where
      aux := ' WHERE ' + aux + ' like ''' + EValorFiltrar.Text + '%'''
    else
      aux := ' AND ' + aux + ' like ''' + EValorFiltrar.Text + '%'''
  else
    aux:='';

  nuevoSQL := '';
  nuevoSQL := StringReplace(FSelect,#$D#$A, ' ',[rfReplaceAll]) + aux;
  IBQAbmSimple.Close;
  IBQAbmSimple.SQL.Clear;
  IBQAbmSimple.SQL.Add(nuevoSQL);
  CargarParametrosSimple;
  IBQAbmSimple.Open

end;

procedure TFABMSimple.BBAplicarFiltroClick(Sender: TObject);
begin
  inherited;
  ActivarFiltro;
end;

procedure TFABMSimple.EValorFiltrarChange(Sender: TObject);
begin
  inherited;
  ActivarFiltro;
end;

function TFABMSimple.GetValorSeleccionado: variant;
begin
  result := FValorRetorno;
end;

function TFABMSimple.GetCampoRetorno: String;
begin
 Result := FCampoRetorno;
end;

procedure TFAbmSimple.HabilitarClaves(Modo: boolean);
var
  ind : Integer;
  aux : IDBControl;
begin
  for ind := 0 to PEditar.ControlCount - 1 do
    if Convertido(PEditar.Controls[ind], aux) and  aux.EsClave then
      PEditar.Controls[ind].Enabled := Modo
end;

(*Permite q cada uno de los hijos redefina las opciones para cambiar*)
function TFABMSimple.OpcionesDeCambio : Boolean;
begin
  Result := true;
end;

(*
  Se llama al reabrir el query, los hijos lo deben sobreescribir si
  el IBQSimple tiene parametros
*)
procedure TFABMSimple.CargarParametrosSimple;
begin
end;

(*
  A la hora de habilitar los botones que se muestran en modo navegacion
  tenemos en cuenta si el formulario permite cambios y/o inserciones,
  ademas de controlar que haya registros en el query
*)
procedure TFABMSimple.ControlarBotonesNavegacion;
begin
  AcEliminar.Enabled := (not IBQAbmSimple.IsEmpty) and FPermiteCambio;
  LEliminar.Enabled := (not IBQAbmSimple.IsEmpty) and FPermiteCambio;
  IEliminar.Enabled := (not IBQAbmSimple.IsEmpty) and FPermiteCambio;
  AcEditar.Enabled   := (not IBQAbmSimple.IsEmpty);
  LEditar.Enabled   := (not IBQAbmSimple.IsEmpty);
  IEditar.Enabled   := (not IBQAbmSimple.IsEmpty);
  AcInsertar.Enabled := FPermiteCambio and FPErmiteInsertar;
  LInsertar.Enabled := FPermiteCambio and FPErmiteInsertar;
  IInsertar.Enabled := FPermiteCambio and FPErmiteInsertar;
end;

procedure TFABMSimple.SetPermiteInsertar(const Value: Boolean);
begin
  FPermiteInsertar := Value;
  ControlarBotonesNavegacion;
end;

procedure TFABMSimple.SetPermiteCambio(const Value: Boolean);
begin
  FPermiteCambio := Value;
  ControlarBotonesNavegacion;
end;

procedure TFABMSimple.BDBGAbmDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  //pruebas auto fit

  //is this is the column we want to auto-size?
{  if DataCol = ColumnWidthHelper.Index then
  begin
    //Column has field?
    if Assigned(Column.Field) then
    begin}
      //find the widest string
//      ColumnWidthHelper.MaxWidth := Max(ColumnWidthHelper.MaxWidth, BDBGAbm.Canvas.TextWidth(Column.Field.DisplayText));
      //ColumnWidthHelper.MaxWidth :=  Max(ColumnWidthHelper.MaxWidth, BDBGSimple.Canvas.TextWidth(Column.FieldName));
//      ColumnWidthHelper.MaxWidth :=  Max(ColumnWidthHelper.MaxWidth, Length(column.FieldName)*(column.Font.Size - 1));
 {   end;
  end;}
end;

procedure TFABMSimple.AutoFitColumns;
var i: Integer;
begin
  {
  for i:= 0 to BDBGAbm.Columns.Count - 1 do
   begin

      //if not (dgTitles in BDBGSimple.Options) then Exit;
      //find Column index
      {if dgIndicator in BDBGSimple.Options then
        ColumnWidthHelper.Index :=  -1 + i
      else }
 {       ColumnWidthHelper.Index:= i;

      //if ColumnWidthHelper.Index < 0 then Exit;

      //main calc...

      //reset
      ColumnWidthHelper.MaxWidth := -1;

      //"recalculate" ColumnWidthHelper.MaxWidth
      BDBGAbm.Repaint;

      //"auto size" Column width
      BDBGAbm.Columns[ColumnWidthHelper.Index].Width := 4 + ColumnWidthHelper.MaxWidth;

   end;
          }

  autoajustarcolumnas;

end;

procedure TFABMSimple.CBCriterioFiltrarChange(Sender: TObject);
begin
  inherited;
  ActivarFiltro;
  EValorFiltrar.SetFocus;
  EValorFiltrar.SelectAll;
end;

procedure TFABMSimple.CBCriterioBuscarChange(Sender: TObject);
begin
  inherited;
  EValorBuscar.SetFocus;
  EValorBuscar.SelectAll;
end;

procedure TFABMSimple.ComponentesVisiblesPorPais(pais: Integer);
var i:Integer;
begin
  inherited;
  i:= 0;
  while (i < BDBGAbm.Columns.Count) do
    begin
      if (BDBGAbm.Columns[i].FieldName = 'ID_SENASA') then
        begin
          BDBGAbm.ColumnByField('id_senasa').Title.Caption:= FPrincipal.PaisNombreCaravana;
          i:= BDBGAbm.Columns.Count;
        end;

      inc(i);
    end;
end;

procedure TFABMSimple.BDBGAbmCellClick(Column: TColumn);
var i : Integer;

begin
  inherited;
  //para que hereden
  if desdeEvento > -1 then
  begin
    for i := 0 to IBQAbmSimple.FieldCount -1 do
      if AnsiContainsStr(IBQAbmSimple.Fields[I].Name,'ID_') then
      begin
        desdeEvento := IBQAbmSimple.Fields[I].AsInteger;
        break;
      end;
  end;
end;

procedure TFABMSimple.FormPaint(Sender: TObject);
begin
  inherited;
  //BBElegir.Visible:= (desdeEvento>-1) and (Estado=eaNavegar) and not(IBQAbmSimple.IsEmpty);
  LElegir.Visible := (desdeEvento>-1) and (Estado=eaNavegar) and not(IBQAbmSimple.IsEmpty);
  IElegir.Visible := (desdeEvento>-1) and (Estado=eaNavegar) and not(IBQAbmSimple.IsEmpty);

 // FormResize(self);

end;

procedure TFABMSimple.IBQAbmSimpleAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
  GBCantidad.Caption := Traducir('Cantidad [')+IntToStr(DataSet.RecordCount)+']';
end;



procedure TFABMSimple.FormResize(Sender: TObject);
var
    anchoFondo, margenIzq, i, j, fact, cant_iconos : integer;
begin
  inherited;

  cant_iconos := 0;

  for j:= 0 to PBotones.ControlCount - 1 do
    if (PBotones.Controls[j].Visible) then
        if (PBotones.Controls[j] is TImage) then
            Inc(cant_iconos);

  cant_iconos := cant_iconos - 1;

  anchoFondo := IFondo.Width div cant_iconos;
  margenIzq := anchoFondo div 2;
  fact := 1;

  for i:= 0 to PBotones.ControlCount - 1 do
  begin
    if (PBotones.Controls[i].Visible) then
        if (PBotones.Controls[i].Name <> 'IFondo') then
            if (PBotones.Controls[i] is TImage) and (PBotones.Controls[i].Tag <> 20) and (PBotones.Controls[i].Tag <> 19) then
            begin
                PBotones.Controls[i].Left := (((anchoFondo*fact) - margenIzq) - (PBotones.Controls[i].Width div 2));
                inc(fact);
            end
            else
                if (PBotones.Controls[i].Tag = 20) then
                    PBotones.Controls[i].Left := (((anchoFondo*(cant_iconos)) - margenIzq) - (PBotones.Controls[i].Width div 2))
                else
                    if (PBotones.Controls[i].Tag = 19) then
                        PBotones.Controls[i].Left := (((anchoFondo*(cant_iconos-1)) - margenIzq) - (PBotones.Controls[i].Width div 2));
  end;



  fact := 1;

  for i:= 0 to PBotones.ControlCount - 1 do
  begin
    if (PBotones.Controls[i].Visible) then
        if (PBotones.Controls[i].Name <> 'IFondo') then
            if (PBotones.Controls[i] is TLabel) and (PBotones.Controls[i].Tag <> 20) and (PBotones.Controls[i].Tag <> 19) then
            begin
                PBotones.Controls[i].Left := (((anchoFondo*fact) - margenIzq) - (PBotones.Controls[i].Width div 2));
                inc(fact);
            end
            else
                if (PBotones.Controls[i].Tag = 20) then
                    PBotones.Controls[i].Left := (((anchoFondo*(cant_iconos)) - margenIzq) - (PBotones.Controls[i].Width div 2))
                else
                    if (PBotones.Controls[i].Tag = 19) then
                        PBotones.Controls[i].Left := (((anchoFondo*(cant_iconos-1)) - margenIzq) - (PBotones.Controls[i].Width div 2));
  end;
end;


procedure TFABMSimple.AutoAjustarColumnas;
var cartel : TCartel;
    ind_col, LONG_MAX, LONG_COL, LONG_TITLE, porcent: integer;
begin

    porcent := 0;

    cartel := TCartel.getInstance;
    cartel.abrirCartelProgressBar('Buscando datos...');

       for ind_col := 0 to BDBGAbm.Columns.Count - 1 do
       begin
          if BDBGAbm.Columns[ind_col].Visible then
          begin
           LONG_MAX := 0;
           BDBGAbm.DataSource.DataSet.First;
           while not BDBGAbm.DataSource.DataSet.Eof do
           begin
                 if BDBGAbm.Columns[ind_col].Field.Value <> null then
                  LONG_COL := length(BDBGAbm.Columns[ind_col].Field.AsString)
                 else
                  LONG_COL := length(BDBGAbm.Columns[ind_col].Title.Caption);

                 if (LONG_COL > LONG_MAX) then
                      LONG_MAX := LONG_COL;

                 BDBGAbm.DataSource.DataSet.Next;
           end;

           LONG_TITLE := length(BDBGAbm.Columns[ind_col].Title.Caption);

           if (LONG_MAX >= LONG_TITLE) then
               BDBGAbm.Columns[ind_col].Width := (7*LONG_MAX)+5
           else
               BDBGAbm.Columns[ind_col].Width := (8*LONG_TITLE)+8;

           porcent := porcent + (ind_col);
           cartel.setCartelProgressBar('Armando listado. Completado '+IntToStr(porcent)+'%',1);
          end;
       end;

    cartel.cerrarCartelProgressBar;
    cartel.FreeInstance;
end;



end.
