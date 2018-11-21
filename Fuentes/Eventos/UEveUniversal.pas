unit UEveUniversal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ComCtrls, ExtCtrls, ActnList, ExtActns, StdCtrls,
  Buttons, ActnMan, ActnColorMaps, DBCtrls, DB, IBCustomDataSet, UDBControl,
  IBStoredProc, IBQuery, Tabs,EditAuto,ComboBoxAuto,Qdialogs,DateTimePickerAuto,
  MemoAuto, UDBDateTimePickerAuto,UDBLookupComboBoxAuto, UDBEditAuto, EditAutoMinuscula, DBEditMinuscula,
  DataExport, DataToXLS, WinXP, JvExExtCtrls, JvImage, jpeg, PngImage,
  JvGIF, JvExControls, JvLabel, ImgList, PngImageList, JvComponentBase,
  JvBalloonHint;

type
  TFEveUniversal = class(TFUniversal)
    PDatos: TPanel;
    PBotones: TPanel;
    PCBasico: TPageControl;
    ACancelar: TAction;
    AAnterior: TAction;
    ASiguiente: TAction;
    ATerminar: TAction;
    IBQSPRN: TIBQuery;
    DSIBQ_SPRN: TDataSource;
    IBQSPEventoInd: TIBQuery;
    DSIBQ_SPEventoInd: TDataSource;
    PError: TPageControl;
    TSHError: TTabSheet;
    MAErrors: TMemoAuto;
    BBCancelar: TBitBtn;
    BBAnterior: TBitBtn;
    BBSiguiente: TBitBtn;
    BBTerminar: TBitBtn;
    BBAyuda: TBitBtn;
    IFondoB2: TImage;
    PL: TPanel;
    LBBCancelar: TLabel;
    LBBAnterior: TLabel;
    LBBSiguiente: TLabel;
    LBBTerminar: TLabel;
    JvTerminar: TJvImage;
    JvSiguiente: TJvImage;
    JvAnteriror: TJvImage;
    JvCancelar: TJvImage;
    IFondoB1: TImage;
    JvIAyuda: TJvImage;
    LAyuda: TLabel;
    JvBHint: TJvBalloonHint;
    procedure AAnteriorExecute(Sender: TObject);
    procedure ASiguienteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure Cancelar(var CanClose: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvCancelarMouseEnter(Sender: TObject);
    procedure JvCancelarMouseLeave(Sender: TObject);
    procedure JvAnterirorMouseEnter(Sender: TObject);
    procedure JvAnterirorMouseLeave(Sender: TObject);
    procedure JvSiguienteMouseEnter(Sender: TObject);
    procedure JvSiguienteMouseLeave(Sender: TObject);
    procedure JvTerminarMouseEnter(Sender: TObject);
    procedure JvTerminarMouseLeave(Sender: TObject);
  private
    function Convertido(Control: TComponent; var IControl: IDBControl): boolean;
    procedure AbrirListQueries;
  protected
    procedure ControlBounds; virtual;
    function  PuedeGrabar: Boolean; virtual;
    procedure GetErrors; virtual;
    procedure ControlEventoOnExit(Sender: TObject);virtual;
  public
end;

var
  FEveUniversal: TFEveUniversal;
  Paso : Boolean = false; //para verificar si se cierra del formulario o del boton cancelar

implementation

{$R *.dfm}
{TODO 1 -omartin: Poner un control con close para los errores}
{DONE 1 -omartin: Ver porque no funciona el resultado mrYes}

uses UPrincipal,uTiposGlobales, VarUtils, Contnrs, UMensajeHuella,UFrameMangazo;

(*
  Deshabilitamos los botones de wizard según la posición del PageControl
*)
procedure TFEveUniversal.ControlBounds;
var
  HayOtro : boolean;
  ind     : integer;
Begin
   HayOtro := false;
  for ind := PCBasico.ActivePageIndex + 1 to PCBasico.PageCount - 1 do
    HayOtro := (HayOtro or PCBasico.Pages[ind].TabVisible);
    //and PuedeGrabar;
  JvSiguiente.Visible := HayOtro;
  //LBBSiguiente.Visible := HayOtro;
  HayOtro := false;
  for ind :=  PCBasico.ActivePageIndex - 1  downto  0 do
    HayOtro := HayOtro or PCBasico.Pages[ind].TabVisible;
  JvAnteriror.Visible  := HayOtro;
  //LBBAnterior.Visible := HayOtro;
end;

(*
  Cuando el PageControl cambia, controlamos los botones de wizard
*)
procedure TFEveUniversal.PCBasicoChange(Sender: TObject);
begin
  inherited;
  ControlBounds;
end;

(*
  Al cancelar confirmamos con un mensaje al usuario
*)
procedure TFEveUniversal.ACancelarExecute(Sender: TObject);
var
  accion : TCloseAction;
begin
  accion := caHide;
  inherited;
  FormClose({BBCancelar}JvCancelar,accion);
  //if(MostrarMensaje(tmConsulta, 'Realmente desea Cancelar el Evento ?') = mrYes)then
    //close;
//    Cancelar(CanClose);
end;

(*
  Nos movemos hacia atras en el wizard
*)
procedure TFEveUniversal.AAnteriorExecute(Sender: TObject);
begin
  inherited;
  PCBasico.SelectNextPage(false);
end;

(*
  Nos movemos hacia adelante en el wizard
*)
procedure TFEveUniversal.ASiguienteExecute(Sender: TObject);
begin
  inherited;
  PCBasico.SelectNextPage(true);
end;

(*
  Aqui no hacemos nada, cada subclase "termina" de forma diferente
*)
procedure TFEveUniversal.ATerminarExecute(Sender: TObject);
begin
  // Completar en las sublcases
  Paso := true;
end;

(*
  Nos posicionamos al principio del wizard y abrimos los queries
*)
procedure TFEveUniversal.FormShow(Sender: TObject);
var
  pri : integer;
begin
  inherited;
  Paso := false;
  pri := 0;
  while (pri < PCBasico.PageCount) and (not PCBasico.Pages[pri].TabVisible) do
    inc(pri);
  PCBasico.ActivePage :=PCBasico.Pages[pri];
  ControlBounds;
  AbrirListQueries;
end;

(*
  Nos fijamos si todos los controles obligatorios están con datos
*)
function TFEveUniversal.PuedeGrabar: Boolean;
var
  ind : Integer;
  res : Boolean;
  aux : IDBControl;
begin
  res := True;
  for ind := 0 to ComponentCount - 1 do begin
    if Convertido(Components[ind], aux) and (aux.EsRequerido)then
      res := res and aux.PuedeGrabar;
  end;
  Result := res;
end;

(*
  Si el componente es TEditAuto o TComboBoxAuto ...., y ademas se usa como parametro del SP,
  lo cargamos en el parametro que le corresponde dentro del query
  ATENCION: Tener en cuenta que el Name del componente debe ser el mismo
  al parametro pasado en el query que llama al SP_evento)
*)
(*procedure TFEveUniversal.CargarParametrosSP;
var
  ind : Integer;
  aux : IDBControl;
begin
  for ind := 0 to ComponentCount - 1 do
    if Convertido(Components[ind], aux) and (aux.IsParam) then
      IBQSPEventoInd.ParamByName(Components[ind].Name).Value := aux.GetDato;
end;*)

(*
  Retorna True si el componente que se esta usando es alguno de los que implementa
  la interfaz UDBControl, ... y en ese caso, hacemos el casting.
*)
function TFEveUniversal.Convertido(Control: TComponent; var IControl: IDBControl): boolean;
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

(*
  Armamos un handler para el OnChange de los controles
*)
procedure TFEveUniversal.ControlEventoOnExit(Sender: TObject);
begin
  inherited;
  JvTerminar.Visible := PuedeGrabar;
  //LBBTerminar.Visible := PuedeGrabar;
end;

(*
  Le pegamos el handler para el OnChange a todos los controles
*)
procedure TFEveUniversal.FormCreate(Sender: TObject);
var
  ind : integer;
  aux : IDBControl;
begin
  inherited;
  for ind := 0 to ComponentCount-1 do
    if Convertido(Components[ind], aux) then
      aux.SetOnSaveChange(ControlEventoOnExit)
    else
      if Components[ind] is TMangazo then
          TMangazo(Components[ind]).SetOnSaveChange(ControlEventoOnExit);
end;

(*
  Abrimos los queries asociados a los Combos
  ... y hacemos que los PopUpList asociados se abran con 5 lineas (hhhmmmmm)
*)
procedure TFEveUniversal.AbrirListQueries;
var
  ind : integer;
begin
  for ind := 0 to ComponentCount - 1 do begin
    if (Components[ind] is TDBLookupComboBoxAuto) then
      TDBLookupComboBoxAuto(Components[ind]).ListSource.DataSet.Open;
    if Components[ind] is TPopupDataList then
      TPopupDataList(Components[ind]).RowCount := 5;
  end;
end;

(*
  Los errores se obtienen de forma diferente en cada subclase
*)
procedure TFEveUniversal.GetErrors;
begin
  // Completar en las sublcases
end;

procedure TFEveUniversal.Cancelar(var CanClose: Boolean);
begin
  {CanClose:= false;
  if(MostrarMensaje(tmConsulta, 'Realmente desea Cancelar el Evento ?') = mrYes)then
    begin
      CanClose:= true;
      close;
    end;}
  if(MostrarMensaje(tmConsulta, 'Realmente desea Cancelar el Evento ?') = mrYes) then
    Close();
end;

procedure TFEveUniversal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  accion : TCloseAction;
begin
  inherited;
  if (not paso) then
  begin
    if(MostrarMensaje(tmConsulta, 'Realmente desea Cancelar el Evento ?') = mrYes) then
    begin
      Paso := true;
      CanClose := true;
    end
    else CanClose := false;
  end;
end;

procedure TFEveUniversal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (Sender is TBitBtn) then
  begin
    if ((Sender as TBitBtn).Tag = 1) then
    begin
        Paso := true;
        Close();
    end
    else
      if(MostrarMensaje(tmConsulta, 'Realmente desea Cancelar el Evento ?') = mrYes) then
      begin
        Paso := true;
        Close();
      end;
  end;
end;

procedure TFEveUniversal.JvCancelarMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(JvCancelar,#13+'Cancelar el evento, los datos no se'+#13+'cargarán a ningún animal'+#13);
end;

procedure TFEveUniversal.JvCancelarMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFEveUniversal.JvAnterirorMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(JvAnteriror,#13+'Ir al paso anterior'+#13);
end;

procedure TFEveUniversal.JvAnterirorMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFEveUniversal.JvSiguienteMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(JvSiguiente,#13+'Ir al siguiente paso'+#13);
end;

procedure TFEveUniversal.JvSiguienteMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFEveUniversal.JvTerminarMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(JvTerminar,#13+'Aplicar el evento'+#13+'el mismo será aplicado a todos'+#13+'los animales seleccionados'+#13);
end;

procedure TFEveUniversal.JvTerminarMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

end.
