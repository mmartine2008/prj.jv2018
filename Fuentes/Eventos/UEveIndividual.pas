unit UEveIndividual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ComCtrls, ExtCtrls, ActnList, ExtActns, StdCtrls,
  Buttons, ActnMan, ActnColorMaps, DBCtrls, DB, IBCustomDataSet, UDBControl,
  IBStoredProc, IBQuery, Tabs,EditAuto,ComboBoxAuto,Qdialogs,DateTimePickerAuto,
  MemoAuto, UDBDateTimePickerAuto,UDBLookupComboBoxAuto, Grids, DBGrids,
  UBDBGrid, UDBEditAuto, EditAutoMinuscula, DBEditMinuscula, DataExport,
  DataToXLS, WinXP, JvGIF, PngImage, JvExExtCtrls, JvImage, jpeg, ImgList,
  PngImageList, JvExControls, JvLabel;

type

  TRegDatoAnimal = record
    Animal : integer;
    Fecha : TDate;
  end;

  TFEveIndividual = class(TFUniversal)
    BBSiguiente: TBitBtn;
    BBTerminar: TBitBtn;
    BBCancelar: TBitBtn;
    PDatos: TPanel;
    PBotones: TPanel;
    BBAnterior: TBitBtn;
    PCBasico: TPageControl;
    TSHDatos: TTabSheet;
    TSHObservacion: TTabSheet;
    ACancelar: TAction;
    AAnterior: TAction;
    ASiguiente: TAction;
    ATerminar: TAction;
    IBQSPRN: TIBQuery;
    PError: TPageControl;
    TSHError: TTabSheet;
    DSIBQ_SPRN: TDataSource;
    IBQSPEventoInd: TIBQuery;
    DSIBQ_SPEventoInd: TDataSource;
    MAObservacion: TMemoAuto;
    MAErrors: TMemoAuto;
    BBAyuda: TBitBtn;
    IBQRNHembras: TIBQuery;
    IBQRNToros: TIBQuery;
    IBQGetMinServicio: TIBQuery;
    IBSPActEventos: TIBStoredProc;
    PL: TPanel;
    Image6: TImage;
    LBBCancelar: TLabel;
    LBBAnterior: TLabel;
    LBBSiguiente: TLabel;
    LBBTerminar: TLabel;
    JvTerminar: TJvImage;
    JvSiguiente: TJvImage;
    JvAnteriror: TJvImage;
    JvCancelar: TJvImage;
    Image1: TImage;
    ILBotonoesArriba: TImageList;
    procedure AAnteriorExecute(Sender: TObject);
    procedure ASiguienteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IBQSPRNAfterOpen(DataSet: TDataSet);
    procedure IBQSPEventoAfterOpen(DataSet: TDataSet);
  private
    Animales : Array of TRegDatoAnimal;

    procedure ClearErrores;



  Protected
    CantidadErrores  : integer;
    CantidadWarnings : integer;
    PuedeTerminar : Boolean;
    CantAnimales, Indice : Integer;
    
    procedure ControlBounds;
    function Convertido(Control: TComponent;var IControl: IDBControl): boolean;
    procedure AsignarValoresDefecto(GB: TGroupBox);
    procedure NextPage;
    procedure GetErrors;
    function  PuedeGrabar: Boolean;
    procedure CargarParametrosSP;virtual;abstract;
    procedure CargarParametrosRN;virtual;abstract;
    procedure ControlEventoOnExit(Sender: TObject);virtual;
    procedure ControlEventOnCloseUp(Sender: TObject);
    procedure HabilitarPanel(Panel:TPanel;bool: boolean);
    procedure HabilitarGrupBox(GB:TgroupBox; bool: boolean);
    procedure PegarOnCloseUpEnComboBox (Sender :Tobject);
    procedure ClearListSource(Sender: TObject; DataSource: TDataSource);
    procedure EstablecerTamanioForm;
    procedure MostrarPageControlRepetidos(value: boolean);    

  public
    function controlNacimientoCategoria(meses,categoria:Integer):boolean;
    function controlCantidadPartosEdad(meses, cantpartos,categoria:Integer):boolean;
end;

var
  FEveIndividual: TFEveIndividual;
  Paso : Boolean = false; //para verificar si se cierra del formulario o del boton cancelar
implementation

{$R *.dfm}

uses UPrincipal,uTiposGlobales, VarUtils, Contnrs,UMensajeHuella, UFrameMangazo, UAvanceTerminar, UTraduccion;

procedure TFEveIndividual.FormShow(Sender: TObject);
begin
  inherited;

  Paso := false;
  PCBasico.ActivePage := PCBasico.Pages[0];
  ControlBounds;
  EstablecerTamanioForm;
  ControlEventoOnExit(self);
end;


(*
  Usar este metoso pegado en el OnExit del ultimo control de una pagina,
  para que cambie de tabsheet una vez que se sale del que se consideró como
  ultimo control.
*)
procedure TFEveIndividual.NextPage;
begin
  PCBasico.ActivePageIndex := PCBasico.ActivePage.TabIndex+1;
  ControlBounds;
end;

(*
 Maneja el tamanio del formulario segun tenga que mostrarse o no el panel de errores
*)
procedure TFEveIndividual.EstablecerTamanioForm;
begin
{  if(cantErr >0)or (cantWar>0)then
     self.Height :=self.Height + PError.Height
  else
     self.Height :=self.Height - PError.Height;}
end;


(*
  Recupera los errores que obtiene el Store Procedure de las Reglas de Negocio Asociadas a la info
  Si existen Errores o Warning  los agrega al Memo de errores
*)
procedure TFEveIndividual.GetErrors;
begin
  inherited;
  while not(IBQSPRN.Eof) do begin
    if (IBQSPRN.FieldValues['Result'] <> 'A') then
    begin
        MAErrors.Lines.Add(IBQSPRN.FieldValues['Result'] + ': '+ IBQSPRN.FieldValues['mensaje']);
        inc(CantidadWarnings);
      end;
    if (IBQSPRN.FieldValues['Result'] = 'E') then
        inc(CantidadErrores)
    else
        if (IBQSPRN.FieldValues['Result'] = 'W') then
            inc(CantidadWarnings);
    IBQSPRN.Next;
  end;
  PError.ActivePageIndex := 0;
  PError.Visible := CantidadErrores + CantidadWarnings > 0;
end;


procedure TFEveIndividual.AAnteriorExecute(Sender: TObject);
begin
  inherited;
  if(PCBasico.ActivePageIndex > 0)then
  begin
    while not PCBasico.Pages[PCBasico.ActivePageIndex-1].TabVisible do
      PCBasico.ActivePageIndex := PCBasico.ActivePageIndex-1;
    PCBasico.ActivePageIndex := PCBasico.ActivePageIndex-1;
    ControlBounds;
  end;
end;


procedure TFEveIndividual.ASiguienteExecute(Sender: TObject);
begin
  inherited;
  PCBasico.SelectNextPage(true);
end;

(*
  Habilita y deshabilita los botones segun corresponda.
*)
procedure TFEveIndividual.ControlBounds;
var
  HayOtro : boolean;
  ind     : integer;
Begin
  HayOtro := false;
  for ind := PCBasico.ActivePageIndex + 1 to PCBasico.PageCount - 1 do
    HayOtro := (HayOtro or PCBasico.Pages[ind].TabVisible);
    //and PuedeGrabar;
  //BBSiguiente.Enabled := HayOtro;
  JvSiguiente.Visible := HayOtro;
  LBBSiguiente.Visible := HayOtro;
  HayOtro := false;
  for ind :=  PCBasico.ActivePageIndex - 1  downto  0 do
    HayOtro := HayOtro or PCBasico.Pages[ind].TabVisible;
  //BBAnterior.Enabled  := HayOtro;
  JvAnteriror.Visible := HayOtro;
  LBBAnterior.Visible := HayOtro;
//Begin
//  BBAnterior.Enabled := PCBasico.ActivePageIndex <>0;
//  BBSiguiente.Enabled:= (PCBasico.ActivePageIndex <> PCBasico.PageCount - 1) and (PCBasico.ActivePageIndex < PCBasico.PageCount - 1);

end;

(*
  Se encarga de Habilitar y Deshabilitar el boton TERMINAR, chequeando
  que los datos requeridos esten presentes
*)
function TFEveIndividual.PuedeGrabar: Boolean;
var
  ind : Integer;
  res : Boolean;
  aux : IDBControl;
begin
  res := True;
  for ind := 0 to ComponentCount-1 do
  begin
    if Convertido(Components[ind], aux) and (aux.EsRequerido)then
      res := res and aux.PuedeGrabar;
  end;
  Result := res;
end;

(*
  Retorna True si el componente que se esta usando es alguno d elos que implementa la interfaz UDBControl
*)
function TFEveIndividual.Convertido(Control: TComponent;
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



(*
  Limpio todos los errores
*)
procedure TFEveIndividual.ClearErrores;
begin
  MAErrors.Clear;
  CantidadErrores  := 0;
  CantidadWarnings := 0;
end;


(*
  Detecta errores y warnings a partir de las reglas del negocio,llama a los metodos que cargan los parametros de los Stored Procedures
  involucrados, y ejecuta los queries que llaman a los SP de carga del evento
*)
procedure TFEveIndividual.ATerminarExecute(Sender: TObject);
var
  ejecutar : boolean;
begin
  inherited;

  {TODO 1 -omartin: Meter esto en un try catch cuando veamos el teme errores con Cartu}

  CantAnimales := 0;
  Indice := 0;

  Paso := true;
  ATerminar.Enabled := false;

  ejecutar := False;
  IBQSPRN.Close;
  CargarParametrosRN;
  IBQSPRN.Open;
  ClearErrores;
  GetErrors;
  if (CantidadErrores > 0) then
    MostrarMensaje(tmError, 'Hay algunas condiciones que impiden registrar el evento')
  else if (CantidadWarnings > 0) then begin
    if (MostrarMensaje(tmConsulta,'Hay algunas condiciones que transgreden los parámetros del establecimiento.' + #13 +
                                  'Desea registrar los eventos de todas formas?') = mrYes) then
      ejecutar := true;
  end else begin
    ejecutar := True;
  end;
  PuedeTerminar := ejecutar;
  if ejecutar then begin
    IBQSPEventoInd.Close;
    CargarParametrosSP;
    IBQSPEventoInd.Open;
    if (MostrarMensaje(tmInformacion, 'El Evento fue Registrado con Exito') = mrCancel)then
       Close();
  end;
  ATerminar.Enabled := true;
end;

(*
  Habilita o Deshabilita los componentes contenidos en un GroupBox
  segun el valor Booleano que se pase como Parametro
*)
procedure TFEveIndividual.HabilitarGrupBox(GB:TgroupBox; bool: boolean);
var i: integer;
begin
  GB.Visible := bool;
  GB.Align := alTop;
  for i := 0 to GB.ControlCount -1 do
    GB.Controls[i].Enabled := bool;
end;


(*
  Habilita o Deshabilita los componentes contenidos en un Panel
  segun el valor Booleano que se pase como Parametro
*)
procedure TFEveIndividual.HabilitarPanel(Panel:TPanel;Bool: boolean);
var i: integer;
begin
  for i := 0 to  Panel.ControlCount-1 do
    if(Panel.Controls[i].ClassName = 'TGroupBox')then
      HabilitarGrupBox(TGroupBox(Panel.Controls[i]),Bool)
    else
       Panel.Controls[i].Enabled := Bool;
end;

(*
  Habilita el Boton Terminar segun se pueda o no guardar los datos ingresados
*)
procedure TFEveIndividual.ControlEventoOnExit(Sender: TObject);
begin
  inherited;
  //BBTerminar.Enabled := PuedeGrabar;
  JvTerminar.Visible := PuedeGrabar;
  LBBTerminar.Visible := PuedeGrabar;
end;

(*
  Al Crearce en Formulario Pega el metodo "ControlEventoExit" en el
  evento OnExit de los coponetes pertenecientes a softvet.dpk(ComponetesAuto)
*)
procedure TFEveIndividual.FormCreate(Sender: TObject);
var
  ind : integer;
  aux : IDBControl;
begin
  inherited;

//  FAvanceTerminar := TFAvanceTerminar.Create(self);
  for ind := 0 to ComponentCount-1 do
    if Convertido(Components[ind], aux)then
    begin
      if (aux.EsRequerido) then
        aux.SetOnSaveChange(ControlEventoOnExit) ;
    end
    else
      if Components[ind] is TMangazo then
          TMangazo(Components[ind]).SetOnSaveChange(ControlEventoOnExit);

end;


(*
  Evento que se asocia y se pega en tiempo de ejecucion a los componetes TDBLookupComboBox
  para que se sincronicen con los datos de un detrminado dataSource al producirse un seleccion
*)
procedure TFEveIndividual.ControlEventOnCloseUp(Sender :Tobject);
var ind:Integer;
    i:string;
    DS: TDataSource;
begin
  if(TDBLookupComboBoxAuto(Sender).KeyValue <> null)then
  begin
    i  := TDBLookupComboBoxAuto(Sender).KeyValue;
    DS := TDBLookupComboBoxAuto(Sender).ListSource;
    for ind:=0 to TDBLookupComboBoxAuto(Sender).Parent.ControlCount-1 do
    begin
     if (TDBLookupComboBoxAuto(Sender).Parent).Controls[ind] is TDBLookupComboBoxAuto then
      begin
        TDBLookupComboBoxAuto((TDBLookupComboBoxAuto(Sender).Parent).Controls[ind]).ListSource:= NIL;
        TDBLookupComboBoxAuto((TDBLookupComboBoxAuto(Sender).Parent).Controls[ind]).ListSource := DS;
        TDBLookupComboBoxAuto((TDBLookupComboBoxAuto(Sender).Parent).Controls[ind]).KeyValue :=i;
      end;
    end;
  end;
end;


(*
  Pega el evneto "ControlEventOnCloseUp" en tiempo de ejecucion a los TDBLookupComboBox de un GroupBox determinando
  Sender es uno de los TDBLookupComboBox dentro del TGroupBox
*)
procedure TFEveIndividual.PegarOnCloseUpEnComboBox(Sender :Tobject);
var
  ind : integer;
begin
  for ind := 0 to TGroupBox(Sender).ControlCount - 1 do
  begin
    if TGroupBox(Sender).Controls[ind] is TDBLookupComboBoxAuto then
      TDBLookupComboBoxAuto(TGroupBox(Sender).Controls[ind]).OnCloseUp := ControlEventOnCloseUp;
  end;
end;

(*
  Hace el link de todos los TDBLockupComboBox existentes en un GroupBox a un DataSource
  determinado por un parametro de entrada
*)
procedure TFEveIndividual.ClearListSource(Sender: TObject; DataSource: TDataSource);
var ind:integer;
begin
 for ind := 0 to TGroupBox(Sender).ControlCount - 1 do
  begin
    if (TGroupBox(Sender).Controls[ind] is TDBLookupComboBox) then
      begin
      TDBLookupComboBox(TGroupBox(Sender).Controls[ind]).ListSource := DataSource;
      TDBLookupComboBox(TGroupBox(Sender).Controls[ind]).KeyValue:=Null;
      end
    else
      if (TGroupBox(Sender).Controls[ind] is TDBLookupComboBoxAuto) then
        begin
        TDBLookupComboBoxAuto(TGroupBox(Sender).Controls[ind]).ListSource := DataSource;
        TDBLookupComboBoxAuto(TGroupBox(Sender).Controls[ind]).KeyValue:=Null;
        end;
  end;
end;


procedure TFEveIndividual.ACancelarExecute(Sender: TObject);
var accion : TCloseAction;
begin
  accion := caHide;
  inherited;

  FormClose(BBCancelar,accion);
end;

procedure TFEveIndividual.PCBasicoChange(Sender: TObject);
begin
  inherited;  ControlBounds;
  ControlEventoOnExit(self);
end;

(* Asigna  a los combos El Valor por defecto *)
procedure TFEveIndividual.AsignarValoresDefecto(GB: TGroupBox);
var
  ind : Integer;
  aux : IDBControl;
begin
  for ind := 0 to GB.ControlCount - 1 do
    if Convertido(GB.Controls[ind], aux) then
      aux.AsignarValorDefecto;
end;

procedure TFEveIndividual.FormClose(Sender: TObject;
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
      if(MostrarMensaje(tmConsulta, 'Realmente desea Cancelar el Evento?') = mrYes) then
      begin
        Paso := true;
        Close();
      end;
  end;
end;

procedure TFEveIndividual.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if (not paso) then
  begin
    if(MostrarMensaje(tmConsulta, 'Realmente desea Cancelar el Evento?') = mrYes) then
    begin
      Paso := true;
      CanClose := true;
    end
    else CanClose := false;
  end;
end;

function TFEveIndividual.controlNacimientoCategoria(meses,
  categoria: Integer): boolean;
var
  resultado: boolean;
  limite : integer;
begin
   IBQGetMinServicio.Close;
   IBQGetMinServicio.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
   IBQGetMinServicio.Open;
   limite := IBQGetMinServicio.fieldByName('valor').AsInteger + 8;

   resultado := false;
   if ((categoria = 1) or (categoria = 4)) then
     begin
      if (meses <= 9) then
        resultado:= true
       else
         MostrarMensaje(tmError, 'La edad de un TERNERO o TERNERA tiene que estar entre 0 y 9 meses. Verifique la edad o fecha de nacimiento del animal. ');
     end
    else
      if (categoria = 2) then
       begin
        if (meses > 7) then
          resultado:= true
         else
           MostrarMensaje(tmError, 'La edad de un NOVILLO tiene que ser mayor a 7 meses. Verifique la edad o fecha de nacimiento del animal. ');
       end
    else
      if (categoria = 3) then
        begin
        if (meses > 9) then
            resultado:= true
         else
           MostrarMensaje(tmError, 'La edad de un TORO tiene que ser mayor a 9 meses. Verifique la edad o fecha de nacimiento del animal. ');
        end
       else
         if (categoria = 5) then
           begin
            if ((meses >= 9)) then
              resultado:= true
             else
               MostrarMensaje(tmError, 'La edad de una VAQUILLONA tiene que ser mayor a 9 meses. Verifique la edad o fecha de nacimiento del animal. ');
           end
          else
           if (categoria = 6) then
            begin
              if (limite >= 24) then
              begin
                if ((meses >= 24)) then
                  resultado:= true
                else
                  MostrarMensaje(tmError, 'La edad de una VACA tiene que ser mayor a 24 meses. Verifique la edad o fecha de nacimiento del animal. ');
              end
              else
              begin
                if (meses >= limite) then
                  resultado:= true
                else
                  MostrarMensaje(tmError, Traducir('La edad de una VACA tiene que ser mayor a ')+ IntToStr(limite) +Traducir(' meses. Verifique la edad o fecha de nacimiento del animal. '));
              end;
            end;
  Result:= resultado;
end;

function TFEveIndividual.controlCantidadPartosEdad(meses,
  cantpartos, categoria: Integer): boolean;
var anios: Integer;
    resultado: boolean;
begin
  resultado:= true;
  if (categoria = 6) then
    begin
      anios:= trunc(meses / 12);
      if (anios > cantPartos) then
          resultado:= true
       else
         begin
           resultado:= false;
           MostrarMensaje(tmError, 'La cantidad de partos ingresados no respeta la edad del animal. Verifique la cantidad de partos ingresados del animal. ');
         end;
    end;
  result:= resultado;  
end;

procedure TFEveIndividual.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
{  if (ssCtrl in Shift) and (chr(Key) in ['S', 's']) then
    begin
       If (BBSiguiente.Enabled) then
         ASiguienteExecute(Sender);
    end;

  if (ssCtrl in Shift) and (chr(Key) in ['A', 'a']) then
    begin
       If (BBAnterior.Enabled) then
         AAnteriorExecute(Sender);
    end; }
end;

procedure TFEveIndividual.IBQSPRNAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if IBQSPRN.Params.FindParam('ANIMAL') <> nil then
    if IBQSPRN.Params.FindParam('FECHA') <> nil then
    begin
      Inc(CantAnimales);
      SetLength(Animales,CantAnimales);
      Animales[CantAnimales-1].Animal := VarAsType(IBQSPRN.Params.ParamValues['ANIMAL'],VarInteger);
      Animales[CantAnimales-1].Fecha := VarAsType(IBQSPRN.Params.ParamValues['FECHA'],VarDate);
    end;
end;

procedure TFEveIndividual.IBQSPEventoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if Length(Animales) > 0 then
  begin
    IBSPActEventos.Close;
    IBSPActEventos.ParamByName('ANIMAL').Value := Animales[Indice].Animal;
    IBSPActEventos.ParamByName('FECHA').Value := Animales[Indice].Fecha;
    IBSPActEventos.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
    IBSPActEventos.ExecProc;
    Inc(Indice);
  end;
end;

procedure TFEveIndividual.MostrarPageControlRepetidos(value: boolean);
begin
   PError.ActivePage := TSHError;
   PError.ActivePage.Visible := value;
   PError.Visible := value;
end;
end.
