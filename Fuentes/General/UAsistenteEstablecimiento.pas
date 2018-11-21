unit UAsistenteEstablecimiento;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, ComCtrls, EditAuto, DBCtrls,
  UDBLookupComboBoxAuto, Buttons, Grids, DBGrids, UBDBGrid, Mask,
  UDBEditAuto, DB, IBCustomDataSet, IBUpdateSQL, IBQuery, UDBControl,
  IBStoredProc, dialogs, UUniversal, ImgList, ActnList, WinXP, DataExport,
  DataToXLS, Variants, JvGIF, JvExControls, JvLabel, jpeg, PngImage,
  JvExExtCtrls, JvImage, PngImageList, JvExStdCtrls, JvEdit,
  JvValidateEdit, JvExMask, JvToolEdit, JvMaskEdit;

type
  TFAsistenteEstablecimiento = class(TFUniversal)
    PCAsistente: TPageControl;
    TSEstablecimiento: TTabSheet;
    TSPotreros: TTabSheet;
    TSRodeos: TTabSheet;
    TSResponsables: TTabSheet;
    PNavegar: TPanel;
    Label5: TLabel;
    DBEANombreEstablecimiento: TDBEditAuto;
    Label6: TLabel;
    DBEAPropietario: TDBEditAuto;
    Label7: TLabel;
    DBEADireccion: TDBEditAuto;
    Label8: TLabel;
    DBEATelefono: TDBEditAuto;
    DBEAEmail: TDBEditAuto;
    Label9: TLabel;
    Label10: TLabel;
    DBEAPagWeb: TDBEditAuto;
    BBAgregarPotrero: TBitBtn;
    BBEliminarPotrero: TBitBtn;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    LNombre: TLabel;
    LHectareas: TLabel;
    BitDBGrid2: TBitDBGrid;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    BitDBGrid3: TBitDBGrid;
    BBAgregarRodeo: TBitBtn;
    BBEliminarRodeo: TBitBtn;
    GroupBox7: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    BBAgregarResponsable: TBitBtn;
    BBEliminarResponsable: TBitBtn;
    GroupBox8: TGroupBox;
    BitDBGrid4: TBitDBGrid;
    IBQEstablecimiento: TIBQuery;
    IBUSQLEstablecimiento: TIBUpdateSQL;
    DSEstablecimiento: TDataSource;
    IBQPotreros: TIBQuery;
    IBUSQLPotreros: TIBUpdateSQL;
    DSPotreros: TDataSource;
    PAviso: TPanel;
    IBQRodeos: TIBQuery;
    IBUSQLrRodeos: TIBUpdateSQL;
    DSRodeos: TDataSource;
    IBQResponsables: TIBQuery;
    IBUSQLResponsables: TIBUpdateSQL;
    DSResponsables: TDataSource;
    LRenspa: TLabel;
    IBSPCreaEstablecimiento: TIBStoredProc;
    PFondo: TPanel;
    Panel1: TPanel;
    SBEstablecimiento: TSpeedButton;
    SBPotreros: TSpeedButton;
    SBRodeos: TSpeedButton;
    SBResponsables: TSpeedButton;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    IBQEliminarEstablecimiento: TIBQuery;
    DataSource1: TDataSource;
    BtCancelar: TBitBtn;
    BTAnterior: TBitBtn;
    BTSiguiente: TBitBtn;
    BtTerminar: TBitBtn;
    Image1: TImage;
    BBayuda: TBitBtn;
    EANombre: TEditAuto;
    EANombreRodeo: TEditAuto;
    EADescripcionRodeo: TEditAuto;
    EANombreResponsable: TEditAuto;
    EAApellidoResponsable: TEditAuto;
    DBEARenspa: TMaskEdit;
    LCUIG: TLabel;
    IBQCUIG: TIBQuery;
    DSCUIG: TDataSource;
    IBQGenCUIG: TIBQuery;
    EACUIG: TMaskEdit;
    LPais: TLabel;
    DBLCBAPais: TDBLookupComboBoxAuto;
    IBQPais: TIBQuery;
    DSPais: TDataSource;
    Image5: TImage;
    ImageList: TImageList;
    DBLCBTipo: TDBLookupComboBoxAuto;
    Label1: TLabel;
    IBQTiposEmpleados: TIBQuery;
    DSTipoEmpleados: TDataSource;
    IBQSPEventosPotreros: TIBQuery;
    DSIBQSPEventosPotreros: TDataSource;
    LSuperficieGanadera: TLabel;
    EASuperficieGanadera: TEditAuto;
    Lha2: TLabel;
    LSuperficieAgricola: TLabel;
    EASuperficieAgricola: TEditAuto;
    Lha3: TLabel;
//    IBQPotrerossuperficieganadera: TFloatField;
//    IBQPotrerossuperficieagricola: TFloatField;
    IFondoB: TImage;
    JvTerminar: TJvImage;
    LBBTerminar: TLabel;
    LBBSiguiente: TLabel;
    JvSiguiente: TJvImage;
    JvAnteriror: TJvImage;
    LBBAnterior: TLabel;
    LBBCancelar: TLabel;
    JvCancelar: TJvImage;
    JvIAyuda: TJvImage;
    LAyuda: TLabel;
    IB1: TImage;
    IB2: TImage;
    PngIList: TPngImageList;
    IAgregarPot: TImage;
    IEliminarPot: TImage;
    LAgregarPot: TLabel;
    LSacarPot: TLabel;
    IAgregarRod: TImage;
    LAgregarRod: TLabel;
    ISacarRod: TImage;
    LSacarRod: TLabel;
    IAgregarResp: TImage;
    LAgregarResp: TLabel;
    ISacarResp: TImage;
    LSacarResp: TLabel;
    TSCriador: TTabSheet;
    LNombreCria: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    IBQCriados: TIBQuery;
    IBUCriador: TIBUpdateSQL;
    ENomCriador: TEdit;
    ENroCriador: TEdit;
    ERazoSocial: TEdit;
    EPrefijo: TEdit;
    DSRazaPredom: TDataSource;
    IBQRazaPredom: TIBQuery;
    IBQActualizarVisibilidad: TIBQuery;
    Label19: TLabel;
    DBLCBARazaPredom: TDBLookupComboBoxAuto;
    IBQInsertRazaByEstable: TIBQuery;
    LSeleccionRazaPredominante: TLabel;
    IBQElegioRazas: TIBQuery;
    IBQRazasElegidas: TIBQuery;
    IBQDeleteRazasPredom: TIBQuery;
    IBQInsertarRazaPredom: TIBQuery;
    IBQLimpiarAuxiliar: TIBQuery;
    LActividad: TLabel;
    DBLCBAActividad: TDBLookupComboBoxAuto;
    DSActividades: TDataSource;
    IBQActividades: TIBQuery;
//    IBQPotrerosHECTAREAS: TFloatField;
    JvHas: TJvEdit;
    procedure FormShow(Sender: TObject);
    procedure BTSiguienteClick(Sender: TObject);
    procedure BTAnteriorClick(Sender: TObject);
    procedure BBAgregarPotreroClick(Sender: TObject);
    procedure BBEliminarPotreroClick(Sender: TObject);
    procedure DBEANombreEstablecimientoExit(Sender: TObject);
    procedure DBEHectareasPotreroExit(Sender: TObject);
    procedure PCAsistenteChange(Sender: TObject);
    procedure DBEADescripcionRodeoExit(Sender: TObject);
    procedure BBAgregarRodeoClick(Sender: TObject);
    procedure BBEliminarRodeoClick(Sender: TObject);
    procedure BBAgregarResponsableClick(Sender: TObject);
    procedure BBEliminarResponsableClick(Sender: TObject);
    procedure BtTerminarClick(Sender: TObject);
    procedure SBPotrerosClick(Sender: TObject);
    procedure SBEstablecimientoClick(Sender: TObject);
    procedure SBRodeosClick(Sender: TObject);
    procedure SBResponsablesClick(Sender: TObject);
    procedure DBEAPropietarioExit(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure DBEANombreRodeoExit(Sender: TObject);
    procedure DBEANombreResponsableExit(Sender: TObject);
    procedure DBEANombrePotreroExit(Sender: TObject);
    procedure BBayudaClick(Sender: TObject);
    procedure DBEANombreEstablecimientoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DBEAPropietarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EAHectareasExit(Sender: TObject);
    procedure EADescripcionRodeoExit(Sender: TObject);
    procedure EAHectareasKeyPress(Sender: TObject; var Key: Char);
    procedure DBEAPropietarioChange(Sender: TObject);
    procedure DBEANombreEstablecimientoChange(Sender: TObject);
    procedure DBEANombreEstablecimientoKeyPress(Sender: TObject;
      var Key: Char);
    procedure DBEAPropietarioKeyPress(Sender: TObject; var Key: Char);
    procedure DBEADireccionKeyPress(Sender: TObject; var Key: Char);
    procedure DBEATelefonoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEAEmailKeyPress(Sender: TObject; var Key: Char);
    procedure DBEAPagWebKeyPress(Sender: TObject; var Key: Char);
    procedure DBEARenspaKeyPress(Sender: TObject; var Key: Char);
    procedure EANombreKeyPress(Sender: TObject; var Key: Char);
    procedure EANombreRodeoKeyPress(Sender: TObject; var Key: Char);
    procedure EADescripcionRodeoKeyPress(Sender: TObject; var Key: Char);
    procedure EANombreResponsableKeyPress(Sender: TObject; var Key: Char);
    procedure EAApellidoResponsableKeyPress(Sender: TObject;
      var Key: Char);
    procedure DBEARenspaChange(Sender: TObject);
    procedure DBEARenspaExit(Sender: TObject);
    procedure EACUIGExit(Sender: TObject);
    procedure EACUIGKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IBQPotrerosAfterOpen(DataSet: TDataSet);
    procedure IBQPotrerosAfterPost(DataSet: TDataSet);
    procedure IBQPotrerosAfterDelete(DataSet: TDataSet);
    procedure IBQRodeosAfterOpen(DataSet: TDataSet);
    procedure IBQRodeosAfterDelete(DataSet: TDataSet);
    procedure IBQRodeosAfterPost(DataSet: TDataSet);
    procedure IBQResponsablesAfterOpen(DataSet: TDataSet);
    procedure IBQResponsablesAfterPost(DataSet: TDataSet);
    procedure IBQResponsablesAfterDelete(DataSet: TDataSet);
    procedure IBQPaisAfterOpen(DataSet: TDataSet);
    procedure DBLCBAPaisCloseUp(Sender: TObject);
    procedure DBLCBAPaisExit(Sender: TObject);
    procedure DBLCBAPaisKeyPress(Sender: TObject; var Key: Char);
    procedure IBQTiposEmpleadosAfterOpen(DataSet: TDataSet);
    procedure DBLCBTipoKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAPaisKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IBQPotrerosCalcFields(DataSet: TDataSet);
    procedure ENroCriadorChange(Sender: TObject);
    procedure DBLCBARazaPredomCloseUp(Sender: TObject);
    procedure LSeleccionRazaPredominanteClick(Sender: TObject);
    procedure JvHasChange(Sender: TObject);
  


 private
    ID_ESTABLECIMIENTO:integer;
    ID_CUIG : Integer;
    ESTABLECIMIENTOS_VACIOS : Boolean;
    tipo_empleado : integer;
    //auxPais : integer;
    function Convertido(Control: TControl; var IControl: IDBControl): boolean;
    procedure CargarParametrosSpEventosPotreros();
    procedure CargaRazasPredom;  
 protected
    function Generar_NuevoEstablecimiento:Boolean;
    function Puede_grabar:Boolean;
    procedure AvisoDeCambio;
    procedure ControlarSpeed;
    procedure EliminarEstablecimiento;
    procedure ComponentesVisiblesPorPais(pais: Integer);override;      
 end;
var
  FAsistenteEstablecimiento: TFAsistenteEstablecimiento;

implementation

uses UDMSoftvet, UPrincipal, UEveAltaMasiva, UModificacionParametros, ShellApi, HtmlHlp,
     UMensajeHuella, MaskUtils, UFunctions, UTraduccion, StrUtils, USelectorRazasPredom;

{$R *.DFM}

procedure TFAsistenteEstablecimiento.FormShow(Sender: TObject);
begin
     inherited;
     PCAsistente.ActivePageIndex := 0;
     //BTAnterior.Enabled := false;
     JvAnteriror.Enabled := false;
     LBBAnterior.Enabled := false;

     IBQEstablecimiento.Close;
     IBQEstablecimiento.Open;
     IBQEstablecimiento.Insert;
     IBQPotreros.Close;
     IBQPotreros.Open;
     IBQRodeos.Close;
     IBQRodeos.Open;
     IBQActividades.Close;
     IBQActividades.Open;
     IBQActividades.Last;
     IBQActividades.First;
     IBQResponsables.Close;
     IBQResponsables.ParamByName('esta').AsInteger:= ID_ESTABLECIMIENTO;
     IBQResponsables.Open;
     SBEstablecimiento.Down := True;
     //BtTerminar.Enabled := false;
     JvTerminar.Enabled := false;
     LBBTerminar.Enabled := false;

     DBEANombreEstablecimiento.SetFocus;
     IBQPais.Close;
     IBQPais.Open;
     LRenspa.Visible:= false;
     DBEARenspa.Visible:= false;
     LCUIG.Visible:= false;
     EACUIG.Visible:= false;

     IBQRazaPredom.Close;
     IBQRazaPredom.Open;
     IBQRazaPredom.Last;
     IBQRazaPredom.First;
end;

procedure TFAsistenteEstablecimiento.BTSiguienteClick(Sender: TObject);
begin
    PCAsistente.ActivePageIndex := PCAsistente.ActivePageIndex + 1;
    JvAnteriror.Enabled := true;
    LBBAnterior.Enabled := true;
    if PCAsistente.ActivePageIndex > 3 then
    begin
       JvSiguiente.Enabled := false;
       LBBSiguiente.Enabled := false;
    end;
    ControlarSpeed;

end;

procedure TFAsistenteEstablecimiento.BTAnteriorClick(Sender: TObject);
begin
    PCAsistente.ActivePageIndex := PCAsistente.ActivePageIndex - 1;
    JvSiguiente.Enabled := true;
    LBBSiguiente.Enabled := true;
    if PCAsistente.ActivePageIndex < 1 then
    begin
      JvAnteriror.Enabled := false;
      LBBAnterior.Enabled := false;
    end;
    ControlarSpeed;
end;


procedure TFAsistenteEstablecimiento.BBAgregarPotreroClick(
  Sender: TObject);
begin
   if EANombre.Text = '' then
      begin
        MostrarMensaje(tmAdvertencia, 'Debe Ingresar un nombre de potrero');
        EANombre.SetFocus;
      end
     else
     if JvHas.IsEmpty then
      begin
        MostrarMensaje(tmAdvertencia, 'Debe Ingresar una cantidad de Hectareas');
        JvHas.SetFocus;
      end
     else
       begin
        IBQPotreros.Insert;
        IBQPotreros.FieldByName('ESTABLECIMIENTO').AsInteger := ID_ESTABLECIMIENTO;
        IBQPotreros.FieldByName('NOMBRE').AsString := EANombre.Text;
        IBQPotreros.FieldByName('HECTAREAS').AsFloat := StrToFloat(JvHas.Text);
        IBQPotreros.FieldByName('recurso_forrajero').AsInteger := 0;

        IBQPotreros.Post;

        EANombre.Text := '';
        JvHas.Text := '1';
        EANombre.SetFocus;
       end
end;

procedure TFAsistenteEstablecimiento.BBEliminarPotreroClick(
  Sender: TObject);
begin
  try
    IBQPotreros.Delete;
  except on e:exception do
    IBQPotreros.CancelUpdates;
  end;

end;

procedure TFAsistenteEstablecimiento.DBEANombreEstablecimientoExit(
  Sender: TObject);
begin
    FAsistenteEstablecimiento.Caption := Traducir('Asistente para la creación de Establecimientos. Creando: ') + DBEANombreEstablecimiento.Text;
    //BtTerminar.Enabled := Puede_grabar;
    JvTerminar.Enabled := Puede_grabar;
    LBBTerminar.Enabled := Puede_grabar;
end;

procedure TFAsistenteEstablecimiento.DBEHectareasPotreroExit(
  Sender: TObject);
begin
    BBAgregarPotrero.SetFocus;
end;


procedure TFAsistenteEstablecimiento.PCAsistenteChange(Sender: TObject);
begin
    if PCAsistente.ActivePageIndex = 0 then
     begin
      //BTAnterior.Enabled := False;
      JvAnteriror.Enabled := false;
      LBBAnterior.Enabled := false;
      //BTSiguiente.Enabled := True;
      JvSiguiente.Enabled := true;
      LBBSiguiente.Enabled := true;
     end
     else
      if PCAsistente.ActivePageIndex = 4 then
       begin
        //BTSiguiente.Enabled := False;
        JvSiguiente.Enabled := false;
        LBBSiguiente.Enabled := false;
        //BTAnterior.Enabled := True;
        JvAnteriror.Enabled := true;
        LBBSiguiente.Enabled := true;
       end
       else
        begin
         //BTSiguiente.Enabled := True;
         JvSiguiente.Enabled := true;
         LBBSiguiente.Enabled := true;
         //BTAnterior.Enabled := True;
         JvAnteriror.Enabled := true;
         LBBAnterior.Enabled := true;
        end;
    ControlarSpeed;
end;

procedure TFAsistenteEstablecimiento.DBEADescripcionRodeoExit(
  Sender: TObject);
begin
    BBAgregarRodeo.SetFocus;
end;

procedure TFAsistenteEstablecimiento.BBAgregarRodeoClick(Sender: TObject);
begin
     if EANombreRodeo.Text = '' then
      begin
        MostrarMensaje(tmAdvertencia, 'Debe Ingresar un nombre de Rodeo');
        EANombreRodeo.SetFocus;
      end
     else
       begin
        IBQRodeos.Insert;
        IBQRodeos.FieldByName('ESTABLECIMIENTO').AsInteger := ID_ESTABLECIMIENTO;
        IBQRodeos.FieldByName('NOMBRE').AsString := EANombreRodeo.Text;
        IBQRodeos.FieldByName('DESCRIPCION').AsString := EADescripcionRodeo.Text;
        IBQRodeos.FieldByName('visible').AsInteger := 1;
        IBQRodeos.Post;
        EANombreRodeo.Text := '';
        EADescripcionRodeo.Text := '';
        EANombreRodeo.SetFocus;
       end

end;

procedure TFAsistenteEstablecimiento.BBEliminarRodeoClick(Sender: TObject);
begin
  try
    IBQRodeos.Delete;
  except on e:exception do
    IBQRodeos.CancelUpdates;
  end;
end;

procedure TFAsistenteEstablecimiento.BBAgregarResponsableClick(Sender: TObject);
begin
     if EANombreResponsable.Text = '' then
      begin
        MostrarMensaje(tmAdvertencia, 'Debe Ingresar un nombre de Responsable');
        EANombreResponsable.SetFocus;
      end
     else
     if EAApellidoResponsable.Text = '' then
      begin
        MostrarMensaje(tmAdvertencia, 'Debe Ingresar un Apellido de Responsable');
        EAApellidoResponsable.SetFocus;
      end
      else
       begin  
        IBQResponsables.Insert;
        //IBQAbmSimple.FieldByName('ID_TIPOS_EMPLEADOS').Value := tipo_empleado;
        IBQResponsables.FieldByName('ESTABLECIMIENTO').AsInteger := ID_ESTABLECIMIENTO;
        IBQResponsables.FieldByName('NOMBRE').AsString := EANombreResponsable.Text;
        IBQResponsables.FieldByName('APELLIDO').AsString := EAApellidoResponsable.Text;
        IBQResponsables.FieldByName('ID_TIPOS_EMPLEADOS').Value := DBLCBTipo.GetDato;

        IBQResponsables.Post;
        EANombreResponsable.Text := '';
        EAApellidoResponsable.Text := '';
        EANombreResponsable.SetFocus;
       end
end;

procedure TFAsistenteEstablecimiento.BBEliminarResponsableClick(
  Sender: TObject);
begin
  try
    IBQResponsables.Delete;
  except on e:exception do
    IBQResponsables.CancelUpdates;
  end;
end;

function TFAsistenteEstablecimiento.Puede_grabar: Boolean;
var
  ind : Integer;
  res, mailValido : Boolean;
  aux : IDBControl;
begin
  res := True;
  for ind := 0 to TSEstablecimiento.ControlCount - 1 do
    if Convertido(TSEstablecimiento.Controls[ind], aux) then
      res := res and aux.PuedeGrabar;

  mailValido:= true;
  if (length(DBEAEmail.Text)> 0) then
     mailValido:= EsUnEmailValido(DBEAEmail.Text);

  if not(mailValido) then
    begin
       MostrarMensaje(tmError, 'Dirección de mail inválida. Debe ingresar un mail válido o dejarlo vacío.');
       PCAsistente.ActivePage:= TSEstablecimiento;
       DBEAEmail.SetFocus;
       DBEAEmail.SelectAll;
    end;

  res:= res and VerificarRenspa(DBEARenspa.Text) and mailValido;
  Result := res;
end;

function TFAsistenteEstablecimiento.Convertido(Control: TControl;
  var IControl: IDBControl): boolean;
begin
  Convertido := True;
  IControl   := nil;
  if Control is TDBEditAuto then
    IControl := IDBControl(TDBEditAuto(Control))
  else if Control is TDBLookUpComboBoxAuto then
    IControl := IDBControl(TDBLookUpComboBoxAuto(Control))
  else
    Convertido := False;

end;

procedure TFAsistenteEstablecimiento.BtTerminarClick(Sender: TObject);
begin
  if Puede_grabar then
    if Generar_NuevoEstablecimiento then
    begin
       AvisoDeCambio;

       CargaRazasPredom;
    end
    else
       EliminarEstablecimiento
  else
    MostrarMensaje(tmError, 'Hay datos requeridos sin ingresar');
end;

procedure TFAsistenteEstablecimiento.AvisoDeCambio;
var
   altaMasiva : TFEveAltaMasiva;
   parametros : TFModificacionParametros;
begin
      DMSoftvet.IBQEstablecimiento.Close;
      DMSoftvet.IBQEstablecimiento.Open;
      DMSoftvet.IBQEstablecimiento.First;
      FPrincipal.EstablecimientoActual := ID_ESTABLECIMIENTO;
      MostrarMensaje(tmInformacion, 'Usted ahora esta trabajando con el establecimiento : ' + DBEANombreEstablecimiento.Text);
      parametros :=  TFModificacionParametros.Create(self);
      parametros.ShowModal;
      FPrincipal.IBTPrincipal.CommitRetaining;

//      altaMasiva := TFEveAltaMasiva.Create(self);
//      altaMasiva.ShowModal;

      {FPrincipal.NumeroDeCUIGActual :=  ID_CUIG;
      FPrincipal.CUIG := EACUIG.Text;
      FPrincipal.UltimoIdentificador := 'A000';}
end;

procedure TFAsistenteEstablecimiento.SBPotrerosClick(Sender: TObject);
begin
    PCAsistente.ActivePageIndex := 1;
    PCAsistenteChange(Self);
end;

procedure TFAsistenteEstablecimiento.SBEstablecimientoClick(
  Sender: TObject);
begin
    PCAsistente.ActivePageIndex := 0;
    PCAsistenteChange(Self);
end;

procedure TFAsistenteEstablecimiento.SBRodeosClick(Sender: TObject);
begin
    PCAsistente.ActivePageIndex := 2;
    PCAsistenteChange(Self);
end;

procedure TFAsistenteEstablecimiento.SBResponsablesClick(Sender: TObject);
begin
    PCAsistente.ActivePageIndex := 3;
    PCAsistenteChange(Self);
end;

procedure TFAsistenteEstablecimiento.ControlarSpeed;
begin
    if PCAsistente.ActivePageIndex = 0 then SBEstablecimiento.Down := true;
    if PCAsistente.ActivePageIndex = 1 then
       begin
         SBPotreros.Down := true;
         EANombre.SetFocus;
       end;
    if PCAsistente.ActivePageIndex = 2 then
       begin
         SBRodeos.Down := true;
         EANombreRodeo.SetFocus;
       end;
    if PCAsistente.ActivePageIndex = 3 then
       begin
         SBResponsables.Down := true;
         EANombreResponsable.SetFocus;
       end
end;

procedure TFAsistenteEstablecimiento.DBEAPropietarioExit(Sender: TObject);
begin
    //BtTerminar.Enabled := Puede_grabar;
    JvTerminar.Enabled := Puede_grabar;
    LBBTerminar.Enabled := Puede_grabar;
end;

procedure TFAsistenteEstablecimiento.BtCancelarClick(Sender: TObject);
begin
    IBQEstablecimiento.CancelUpdates;
    if ESTABLECIMIENTOS_VACIOS then
      begin
        FPrincipal.Close;
        Application.Terminate;
      end;
    close;
end;

procedure TFAsistenteEstablecimiento.DBEANombreRodeoExit(Sender: TObject);
begin
    IBQRodeos.Edit;
    IBQRodeos.FieldByName('ESTABLECIMIENTO').AsInteger := ID_ESTABLECIMIENTO;
end;

procedure TFAsistenteEstablecimiento.DBEANombreResponsableExit(
  Sender: TObject);
begin
    IBQResponsables.Edit;
    IBQResponsables.FieldByName('ESTABLECIMIENTO').AsInteger := ID_ESTABLECIMIENTO;
end;

function TFAsistenteEstablecimiento.Generar_NuevoEstablecimiento: Boolean;
var LResult: Boolean;
begin
      try
            // Creo el Nuevo Establecimiento.
            with IBSPCreaEstablecimiento do
                    Begin
                       ParamByName('NOMBRE').AsString := Trim(DBEANombreEstablecimiento.Text);
                       ParamByName('DIRECCION').AsString := Trim(DBEADireccion.Text);
                       ParamByName('TELEFONO').AsString := Trim(DBEATelefono.Text);
                       ParamByName('EMAIL').AsString := Trim(DBEAEmail.Text);
                       ParamByName('URL').AsString := Trim(DBEAPagWeb.Text);
                       ParamByName('PROPIETARIO').AsString := Trim(DBEAPropietario.Text);
                       ParamByName('RENSPA').AsString := Trim(DBEARenspa.Text);
                       ParamByName('PAIS').AsInteger:= DBLCBAPais.KeyValue;
                       ParamByName('ACTIVIDAD').AsInteger:= DBLCBAActividad.KeyValue;
                       ExecProc;
                       ID_ESTABLECIMIENTO := ParamByName('IDESTABLECIMIENTO').asInteger;
                       LResult:= true;
                       close;
                     end;

           FPrincipal.IBTPrincipal.CommitRetaining;
           // GRABO EL CUIG

           if (EACUIG.EditText <> '_____') then
             begin
               IBQCUIG.Close;
               IBQCUIG.ParamByName('id_cuig').AsInteger := ID_CUIG;
               IBQCUIG.ParamByName('esta').AsInteger := ID_ESTABLECIMIENTO;
               IBQCUIG.ParamByName('encabezado').AsString := Trim(EACUIG.Text);
               IBQCUIG.ParamByName('ultimo_ident').AsString := 'A000';
               IBQCUIG.ParamByName('activo').AsInteger := 1;
               IBQCUIG.Open;
             end;

          // GRABO LOS POTREROS
          if not IBQPotreros.IsEmpty then
          begin
            IBQPotreros.First;
            while not IBQPotreros.Eof do
            begin
              IBQPotreros.Edit;
              IBQPotreros.FieldByName('Establecimiento').AsInteger := ID_ESTABLECIMIENTO;
              IBQPotreros.Post;
              IBQPotreros.Next;
            end;
          end;

          // GRABO LOS RODEOS
          if not IBQRodeos.IsEmpty then
          begin
            IBQRodeos.First;
            while not IBQRodeos.Eof do
            begin
              IBQRodeos.Edit;
              IBQRodeos.FieldByName('Establecimiento').AsInteger := ID_ESTABLECIMIENTO;
              IBQRodeos.Post;
              IBQRodeos.Next;
            end;
          end;

           // GRABO LOS RESPONSABLES
          if not IBQResponsables.IsEmpty then
          begin
            IBQResponsables.First;
            while not IBQResponsables.Eof do
            begin
              IBQResponsables.Edit;
              IBQResponsables.FieldByName('Establecimiento').AsInteger := ID_ESTABLECIMIENTO;
              IBQResponsables.Post;
              IBQResponsables.Next;
            end;
          end;
          IBQResponsables.Database.ApplyUpdates([IBQPotreros,IBQRodeos,IBQResponsables]);

     except
      LResult:= false;
     end;
           if LResult then
              begin
               FPrincipal.IBTPrincipal.CommitRetaining;
               Generar_NuevoEstablecimiento := True;

               ///  borrar si no anda
                  if not IBQPotreros.IsEmpty then
                  begin
                    IBQPotreros.First;
                    while not IBQPotreros.Eof do
                    begin
                      IBQSPEventosPotreros.Close;
                      CargarParametrosSpEventosPotreros;
                      IBQSPEventosPotreros.Open;

                      IBQPotreros.Next;
                    end;
                  end;
               ///   hasta aca
               close;
              end
             else
              begin
               MostrarMensaje(tmError, 'No se pudo crear el Establecimiento');
               Generar_NuevoEstablecimiento := False;
               FPrincipal.IBTPrincipal.RollbackRetaining;
              end;


   if FPrincipal.FuncDEPs then
   begin
  /// Guardo los datos del Criador
    if ENomCriador.Text <> '' then
    begin
      try
        IBQCriados.Close;
        IBQCriados.Open;
        IBQCriados.Insert;
        IBQCriados.FieldByName('nombre').AsString := ENomCriador.Text;
        if ENroCriador.Text <> '' then
          IBQCriados.FieldByName('numerocriador').AsInteger := StrToInt(ENroCriador.Text)
        else
          IBQCriados.FieldByName('numerocriador').Value := null;
        IBQCriados.FieldByName('sinonimo').AsString := ENomCriador.Text;
        IBQCriados.FieldByName('codigo').AsString := LeftStr(ENomCriador.Text,2);
        IBQCriados.FieldByName('prefijo').AsString := EPrefijo.Text;
        IBQCriados.FieldByName('razon_social').AsString := ERazoSocial.Text;
        IBQCriados.FieldByName('establecimiento').AsInteger := ID_ESTABLECIMIENTO;
        IBQCriados.Post;
        FPrincipal.IBDPrincipal.ApplyUpdates([IBQCriados]);
      except
        IBQCriados.CancelUpdates;
      end;
    end;
  end;

end;

procedure TFAsistenteEstablecimiento.EliminarEstablecimiento;
begin
      IBQEliminarEstablecimiento.Close;
      IBQEliminarEstablecimiento.ParamByName('ID_NUEVO').AsInteger := ID_ESTABLECIMIENTO;
      IBQEliminarEstablecimiento.Open;
end;


procedure TFAsistenteEstablecimiento.DBEANombrePotreroExit(
  Sender: TObject);
begin
  inherited;
  IBQPotreros.FieldByName('ESTABLECIMIENTO').AsInteger := ID_ESTABLECIMIENTO;
end;

procedure TFAsistenteEstablecimiento.BBayudaClick(Sender: TObject);
begin
  inherited;
  HH(0, 0, dummy);
end;

procedure TFAsistenteEstablecimiento.DBEANombreEstablecimientoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 112 then //codigo F1
     ShellExecute(Handle,'open',pChar('Ayuda01.chm'),nil,'C:\Usuarios\Andres\softvet\Sistema\Help\',SW_SHOW);

end;

procedure TFAsistenteEstablecimiento.DBEAPropietarioKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 112 then
    HtmlHelp(0,'C:\Usuarios\Andres\softvet\Sistema\Help\Ayuda01.Chm', HH_HELP_CONTEXT, FAsistenteEstablecimiento.HelpContext);

end;

procedure TFAsistenteEstablecimiento.Button1Click(Sender: TObject);
begin
  inherited;
  HtmlHelp(0,'C:\Usuarios\Andres\softvet\Sistema\Help\Ayuda01.Chm', HH_HELP_CONTEXT, 1000);
end;

procedure TFAsistenteEstablecimiento.FormCreate(Sender: TObject);
var
  B : TBitmap;
  SQL : String;
begin
  inherited;
  if (DMSoftvet.IBQEstablecimiento.IsEmpty) then
    ESTABLECIMIENTOS_VACIOS := True
  else
    ESTABLECIMIENTOS_VACIOS := False;
  IBQGenCUIG.Close;
  IBQGenCUIG.Open;
  ID_CUIG := IBQGenCUIG.FieldValues['IDCUIG'];


  IBQActividades.Close;
  IBQActividades.SQL.Clear;
  case FPrincipal.OpcionDeEstablecimiento of
    1 : SQL := 'select * from cod_actividad_establecimiento where (id_actividad_establecimiento = 1) or (id_actividad_establecimiento = 2)';
    2 : SQL := 'select * from cod_actividad_establecimiento where (id_actividad_establecimiento = 1) or (id_actividad_establecimiento = 2) or (id_actividad_establecimiento = 4)';
    3 : SQL := 'select * from cod_actividad_establecimiento';
  end;
  IBQActividades.SQL.Add(SQL);
  IBQActividades.Open;


  IB1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\borde.jpg');
  IB2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\borde.jpg');
  if ESTABLECIMIENTOS_VACIOS then
    Image5.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\bienvenido.jpg')
  else
    Image5.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\Creacion.jpg');

  DBLCBAActividad.EsRequerido := FPrincipal.FuncCambioActividad;
  DBLCBAActividad.Visible := FPrincipal.FuncCambioActividad;
  LActividad.Visible := FPrincipal.FuncCambioActividad;

  //auxPais := 1;
  IBQTiposEmpleados.Close;
  IBQTiposEmpleados.Open;
  tipo_empleado := 0;
  DBLCBTipo.KeyValue := tipo_empleado;

  TSCriador.TabVisible := FPrincipal.FuncDEPs;

end;

procedure TFAsistenteEstablecimiento.EAHectareasExit(Sender: TObject);
begin
  inherited;
  BBAgregarPotrero.SetFocus;
end;

procedure TFAsistenteEstablecimiento.EADescripcionRodeoExit(
  Sender: TObject);
begin
  inherited;
  //BBAgregarRodeo.SetFocus;
end;

procedure TFAsistenteEstablecimiento.EAHectareasKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
     BBAgregarPotreroClick(Sender);
     key:= #0;
     EANombre.SetFocus;
   end;

  if (not (key in (['0'..'9'])) and (key <> #8)) then key:=#0;

end;

procedure TFAsistenteEstablecimiento.DBEAPropietarioChange(
  Sender: TObject);
begin
  inherited;
  //BtTerminar.Enabled := Puede_grabar;
  JvTerminar.Enabled := Puede_grabar;
  LBBTerminar.Enabled := Puede_grabar;
end;

procedure TFAsistenteEstablecimiento.DBEANombreEstablecimientoChange(
  Sender: TObject);
begin
  inherited;
  //BtTerminar.Enabled := Puede_grabar;
  JvTerminar.Enabled := Puede_grabar;
  LBBTerminar.Enabled := Puede_grabar;
end;

procedure TFAsistenteEstablecimiento.DBEANombreEstablecimientoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
     DBEAPropietario.SetFocus; 
     key:= #0;
   end;

   if(key= #42) or (key= #47) or (key= #92) or
     (key= #58) or (key= #63) or (key= #34) or
     (key= #62) or (key= #60) or (key= #124) then key:= #0;
end;

procedure TFAsistenteEstablecimiento.DBEAPropietarioKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
     DBEADireccion.SetFocus; 
     key:= #0;
   end;
end;

procedure TFAsistenteEstablecimiento.DBEADireccionKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
     DBLCBAPais.SetFocus;
     key:= #0;
   end;
end;

procedure TFAsistenteEstablecimiento.DBEATelefonoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
     DBEAEmail.SetFocus; 
     key:= #0;
   end;
end;

procedure TFAsistenteEstablecimiento.DBEAEmailKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
     DBEAPagWeb.SetFocus; 
     key:= #0;
   end;
end;

procedure TFAsistenteEstablecimiento.DBEAPagWebKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBEARenspa.Visible) then
     begin
       DBEARenspa.SetFocus;
       key:= #0;
     end;
end;

procedure TFAsistenteEstablecimiento.DBEARenspaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   if (DBEARenspa.Visible) then
     begin
       EACUIG.SetFocus;
       key:= #0;
     end;
end;

procedure TFAsistenteEstablecimiento.EANombreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
     JvHas.SetFocus;
     key:= #0;
   end;
end;

procedure TFAsistenteEstablecimiento.EANombreRodeoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
     EADescripcionRodeo.SetFocus;
     key:= #0;
   end;
end;

procedure TFAsistenteEstablecimiento.EADescripcionRodeoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
     BBAgregarRodeoClick(Sender);
     key:= #0;
     EANombreRodeo.SetFocus;
   end;
end;

procedure TFAsistenteEstablecimiento.EANombreResponsableKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
     EAApellidoResponsable.SetFocus;
     key:= #0;
   end;
end;

procedure TFAsistenteEstablecimiento.EAApellidoResponsableKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
     DBLCBTipo.SetFocus;
     key:= #0;
   end;
end;

procedure TFAsistenteEstablecimiento.DBEARenspaChange(Sender: TObject);
begin
  inherited;
  //BtTerminar.Enabled := Puede_grabar;
  JvTerminar.Enabled := Puede_grabar;
  LBBTerminar.Enabled := Puede_grabar;
end;

procedure TFAsistenteEstablecimiento.DBEARenspaExit(Sender: TObject);
begin
  inherited;
  //BtTerminar.Enabled := Puede_grabar;
  JvTerminar.Enabled := Puede_grabar;
  LBBTerminar.Enabled := Puede_grabar;
  if not(VerificarRenspa(DBEARenspa.Text)) then
   begin
     DBEARenspa.Clear;
     MostrarMensaje(tmError, 'Renspa inválido. Debe completar todo el Respa o dejarlo vacío.');
     DBEARenspa.SetFocus;
   end;  
end;

procedure TFAsistenteEstablecimiento.EACUIGExit(Sender: TObject);
begin
  //inherited;
 if (EACUIG.EditText <> '_____') then
  if not(CheckFormatoCUIGEncabezado(EACUIG.Text)) then
    begin
     EACUIG.Clear;
     MostrarMensaje(tmError, 'CUIG Inválido. El campo CUIG debe ser ingresado completo o déjelo vacío. Si lo quiere ingresar más adelante, acceda desde Configuración --> Establecimiento --> CUIG');
     EACUIG.SetFocus;
    end;
end;

procedure TFAsistenteEstablecimiento.EACUIGKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
     if {(BTSiguiente.Enabled)} LBBSiguiente.Enabled then
      begin
       BTSiguienteClick(Sender);
       key:= #0;
      end; 
   end;
end;

procedure TFAsistenteEstablecimiento.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
{  if (ssCtrl in Shift) and (chr(Key) in ['S', 's']) then
    begin
       If (BTSiguiente.Enabled) then
         BTSiguienteClick(Sender);
    end;

  if (ssCtrl in Shift) and (chr(Key) in ['A', 'a']) then
    begin
       If (BTAnterior.Enabled) then
         BTAnteriorClick(Sender);
    end;  }
end;

procedure TFAsistenteEstablecimiento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //BtCancelarClick(nil);
end;

procedure TFAsistenteEstablecimiento.IBQPotrerosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
 BBEliminarPotrero.Enabled := not(DataSet.IsEmpty);
end;

procedure TFAsistenteEstablecimiento.IBQPotrerosAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  IBQPotrerosAfterOpen(DataSet);
end;

procedure TFAsistenteEstablecimiento.IBQPotrerosAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  IBQPotrerosAfterOpen(DataSet);
end;

procedure TFAsistenteEstablecimiento.IBQRodeosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  BBEliminarRodeo.Enabled := not(DataSet.IsEmpty);
end;

procedure TFAsistenteEstablecimiento.IBQRodeosAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  IBQRodeosAfterOpen(DataSet);
end;

procedure TFAsistenteEstablecimiento.IBQRodeosAfterPost(DataSet: TDataSet);
begin
  inherited;
  IBQRodeosAfterOpen(DataSet);
end;

procedure TFAsistenteEstablecimiento.IBQResponsablesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  BBEliminarResponsable.Enabled := not(DataSet.IsEmpty);
end;

procedure TFAsistenteEstablecimiento.IBQResponsablesAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  IBQResponsablesAfterOpen(DataSet);
end;

procedure TFAsistenteEstablecimiento.IBQResponsablesAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  IBQResponsablesAfterOpen(DataSet);
end;

procedure TFAsistenteEstablecimiento.IBQPaisAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQPais.Last;
  IBQPais.First;
end;

procedure TFAsistenteEstablecimiento.DBLCBAPaisCloseUp(Sender: TObject);
begin
  inherited;
  //BtTerminar.Enabled := Puede_grabar;
  JvTerminar.Enabled := Puede_grabar;
  LBBTerminar.Enabled := Puede_grabar;
  ComponentesVisiblesPorPais(-1);
  if DBLCBTipo.KeyValue <> null then
    tipo_empleado := DBLCBTipo.KeyValue;  
end;

procedure TFAsistenteEstablecimiento.DBLCBAPaisExit(Sender: TObject);
begin
  inherited;
  //BtTerminar.Enabled := Puede_grabar;
  JvTerminar.Enabled := Puede_grabar;
  LBBTerminar.Enabled := Puede_grabar;
{  if DBLCBAPais.KeyValue <> null then
    begin
      auxPais := DBLCBAPais.KeyValue;
      if IBQEstablecimiento.State = dsInsert then
        IBQEstablecimiento.FieldByName('PAIS').Value := auxPais;
    end;     }
end;

procedure TFAsistenteEstablecimiento.ComponentesVisiblesPorPais(
  pais: Integer);
begin
  inherited;
  if (DBLCBAPais.KeyValue <> null) then
    begin
      DMSoftvet.IBQPais.Close;
      DMSoftvet.IBQPais.ParamByName('pais').AsInteger:= DBLCBAPais.KeyValue;
      DMSoftvet.IBQPais.Open;
      LRenspa.Visible:= True;
      DBEARenspa.Visible:= True;      
      LRenspa.Caption:= DMSoftvet.IBQPais.FieldByName('registro').AsString;
      if (DBLCBAPais.KeyValue = 1) then //Argentina
       begin
        LCUIG.Visible:= True;
        EACUIG.Visible:= True;
       end
      else
        if (DBLCBAPais.KeyValue = 2) then //Uruguay
         begin
          LCUIG.Visible:= False;
          EACUIG.Visible:= False;
          EACUIG.Text:= '';
         end
        else
           begin
            LCUIG.Visible:= False;
            EACUIG.Visible:= False;
            EACUIG.Text:= '';
           end;
    end;
end;

procedure TFAsistenteEstablecimiento.DBLCBAPaisKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
     DBEATelefono.SetFocus;
     key:= #0;
   end;
end;

procedure TFAsistenteEstablecimiento.IBQTiposEmpleadosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  IBQTiposEmpleados.Last;
  IBQTiposEmpleados.First;
end;

procedure TFAsistenteEstablecimiento.DBLCBTipoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
     BBAgregarResponsableClick(Sender);
     key:= #0;
   end;
end;

procedure TFAsistenteEstablecimiento.DBLCBAPaisKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  DBLCBAPaisCloseUp(nil);
end;

procedure TFAsistenteEstablecimiento.CargarParametrosSpEventosPotreros;
begin
 IBQSPEventosPotreros.ParamByName('FECHA').AsDate  := now();
 IBQSPEventosPotreros.ParamByName('OBSERVACION').Value  := null;
 IBQSPEventosPotreros.ParamByName('ESTABLECIMIENTO').AsInteger := ID_ESTABLECIMIENTO;
 IBQSPEventosPotreros.ParamByName('RESPONSABLE').AsInteger  := 0;


 IBQSPEventosPotreros.ParamByName('POTRERO').AsInteger  := IBQPotreros.FieldByName('id_potrero').AsInteger;

 IBQSPEventosPotreros.ParamByName('SUPERFICIETOTAL').AsFloat  := IBQPotreros.FieldByName('hectareas').AsFloat;
 IBQSPEventosPotreros.ParamByName('SUPERFICIEGANADERA').AsFloat  := IBQPotreros.FieldByName('hectareas').AsFloat;//IBQPotreros.FieldByName('superficieganadera').AsFloat;
 IBQSPEventosPotreros.ParamByName('SUPERFICIEAGRICOLA').AsFloat  := 0;

 IBQSPEventosPotreros.ParamByName('RECURSO').Value  := null;

 IBQSPEventosPotreros.ParamByName('TRATAMIENTO').Value  := null;

 IBQSPEventosPotreros.ParamByName('MATERIASECA').Value  := null;

 IBQSPEventosPotreros.ParamByName('OBSERVACIOANALISISSUELO').Value  := null;

 IBQSPEventosPotreros.ParamByName('RESERVAFORRAJERAS').Value:= null;
 IBQSPEventosPotreros.ParamByName('CANTIDADRESERVA').Value:= null;
 IBQSPEventosPotreros.ParamByName('UNIDADRESERVA').Value:= null;

 IBQSPEventosPotreros.ParamByName('VISIBLE').Value:= 1
end;

procedure TFAsistenteEstablecimiento.IBQPotrerosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
{
  IBQPotreros.FieldByName('superficieganadera').AsFloat := StrToFloat(EASuperficieGanadera.Text);
  IBQPotreros.FieldByName('superficieagricola').AsFloat := StrToFloat(EASuperficieAgricola.Text);
}
end;

procedure TFAsistenteEstablecimiento.ENroCriadorChange(Sender: TObject);
var
  d : Integer;
begin
  inherited;
  if not TryStrToInt(ENroCriador.Text,d) then
    ENroCriador.Text := '';
end;

procedure TFAsistenteEstablecimiento.DBLCBARazaPredomCloseUp(Sender: TObject);
begin
  inherited;
{
  if (DBLCBARazaPredom.KeyValue <> null) then
  begin
     if (DBLCBARazaPredom.KeyValue <> 0) then
     begin

       try
           FPrincipal.RazaPredom := DBLCBARazaPredom.KeyValue;

           IBQActualizarVisibilidad.Close;
           IBQActualizarVisibilidad.ParamByName('raza').AsInteger := IBQRazaPredom.Lookup('descripcion',DBLCBARazaPredom.Text,'id_raza');
           IBQActualizarVisibilidad.Open;
       except
       end;
     end
     else
       FPrincipal.RazaPredom := -1;
  end;
}
end;

procedure TFAsistenteEstablecimiento.LSeleccionRazaPredominanteClick(Sender: TObject);
var F : TFSelectorRazasPredom;
begin
  inherited;

  F := TFSelectorRazasPredom.Create(self);
  F.TipoCarga := 0;
  F.ShowModal;
  F.Destroy;

  FPrincipal.SeleccionarRazaPredom;
end;

procedure TFAsistenteEstablecimiento.CargaRazasPredom;
begin

   IBQElegioRazas.Close;
   IBQElegioRazas.Open;

   if not(IBQElegioRazas.IsEmpty) then
   begin
        IBQRazasElegidas.Close;
        IBQRazasElegidas.Open;

        if (IBQRazasElegidas.RecordCount > 0) then
        begin

            try
               IBQDeleteRazasPredom.Close;
               IBQDeleteRazasPredom.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
               IBQDeleteRazasPredom.Open;

               FPrincipal.IBTPrincipal.CommitRetaining;

               IBQRazasElegidas.First;
               while not(IBQRazasElegidas.Eof) do
               begin
                   try
                      IBQInsertarRazaPredom.Close;
                      IBQInsertarRazaPredom.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
                      IBQInsertarRazaPredom.ParamByName('raza_predom').AsInteger := 0;
                      IBQInsertarRazaPredom.ParamByName('raza_elegida').AsInteger := IBQRazasElegidas.FieldValues['raza'];
                      IBQInsertarRazaPredom.Open;

                      FPrincipal.IBTPrincipal.CommitRetaining;
                   except
                      FPrincipal.IBTPrincipal.RollbackRetaining;
                   end;
                   IBQRazasElegidas.Next;
               end;

            except
               FPrincipal.IBTPrincipal.RollbackRetaining;
            end;
        end;

        try
           IBQLimpiarAuxiliar.Close;
           IBQLimpiarAuxiliar.Open;

           FPrincipal.IBTPrincipal.CommitRetaining;
        except
           FPrincipal.IBTPrincipal.RollbackRetaining;
        end;


        FPrincipal.SeleccionarRazaPredom;
   end;

end;






procedure TFAsistenteEstablecimiento.JvHasChange(Sender: TObject);
var
  hectareas : Double;

begin
  inherited;
  try
      hectareas := StrToFloat((Sender as TJVEdit).text);
  except
    MostrarMensaje(tmInformacion, 'El formato de hectáreas no es correcto');
  end;
end;

end.
