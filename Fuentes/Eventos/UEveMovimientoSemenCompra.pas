unit UEveMovimientoSemenCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSemenBasico, DB, IBCustomDataSet, IBQuery, ActnList,
  StdCtrls, Buttons, UButtonABM, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, IBStoredProc, WinXP, DataExport, DataToXLS, JvExControls,
  JvLabel, PngImage, jpeg, JvGIF, ImgList, PngImageList, EditAuto, DBCtrls,
  UDBLookupComboBoxAuto, DateTimePickerAuto, MemoAuto, UEveInseminacionArtificial,
  JvExExtCtrls, JvImage, DBClient, TConnect;

type
  TFMovimientosdeSemenCompra = class(TFMovimientosdeSemen)
    PCDatosCompra: TPageControl;
    TSAnimales: TTabSheet;
    TSDatos: TTabSheet;
    ILVets: TPngImageList;
    LVerAnimales: TLabel;
    IVerAnimales: TImage;
    EARP: TEditAuto;
    EANombre: TEditAuto;
    EAHBA: TEditAuto;
    EAApodo: TEditAuto;
    CBRP: TCheckBox;
    CBNombre: TCheckBox;
    CBHBA: TCheckBox;
    CBApodo: TCheckBox;
    PEncabezado: TPanel;
    LAnimal: TLabel;
    LSigno: TLabel;
    LPrecio: TLabel;
    LFecha: TLabel;
    LCertificado: TLabel;
    LCentros: TLabel;
    LCantidad: TLabel;
    GroupBox1: TGroupBox;
    MAObservacion: TMemoAuto;
    EAPrecio: TEditAuto;
    EACERTIFICADOS: TEditAuto;
    EACANTIDAD: TEditAuto;
    DTPAFecha: TDateTimePickerAuto;
    DBLCBACentros: TDBLookupComboBoxAuto;
    IAgregarSemental: TImage;
    LAgregarSemental: TLabel;
    ITerminar: TImage;
    LTerminar: TLabel;
    IBSPSemen: TIBStoredProc;
    IBDSTorosID_RP: TIBStringField;
    IBDSTorosID_SENASA: TIBStringField;
    IBDSTorosNOMBRE: TIBStringField;
    IBDSTorosAPODO: TIBStringField;
    IBDSTorosID_HBA: TIBStringField;
    IBDSTorosID_SEMEN: TIntegerField;
    IBDSTorosANIMAL: TIntegerField;
    IBDSTorosCANTIDAD: TIntegerField;
    IBDSTorosCERTIFICADO: TIntegerField;
    IBDSTorosID_ANIMAL_EXTERNO: TIntegerField;
    IBDSTorosESTABLECIMIENTO: TIntegerField;
    LCant: TLabel;
    IAgregarDosis: TImage;
    LAgregarDosis: TLabel;
    RBUltimosDiezA: TRadioButton;
    RBTodos: TRadioButton;
    LBuscarPor: TLabel;
    EBuscar: TEdit;
    LCancelar: TLabel;
    LocalConnection1: TLocalConnection;
    IBQExisteTabSemen: TIBQuery;
    IBQSemenCompra: TIBQuery;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IVerAnimalesClick(Sender: TObject);
    procedure CBRPClick(Sender: TObject);
    procedure CBHBAClick(Sender: TObject);
    procedure CBNombreClick(Sender: TObject);
    procedure CBApodoClick(Sender: TObject);
    procedure BDBGSemenDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PCDatosCompraChange(Sender: TObject);
    procedure EACANTIDADKeyPress(Sender: TObject; var Key: Char);
    procedure EACANTIDADExit(Sender: TObject);
    procedure EAPrecioKeyPress(Sender: TObject; var Key: Char);
    procedure EAPrecioExit(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LCentrosClick(Sender: TObject);
    procedure LCentrosMouseEnter(Sender: TObject);
    procedure LCentrosMouseLeave(Sender: TObject);
    procedure ITerminarClick(Sender: TObject);
    procedure BDBGSemenDblClick(Sender: TObject);
    procedure IBDSTorosAfterOpen(DataSet: TDataSet);
    procedure EBuscarChange(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure EBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure EACERTIFICADOSKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    I : Integer;
    ID_Semen_Compra : integer;
    SQLOriginal, SQLTodos : string;
    procedure CargarParametrosSP;

    function existe(animal : Integer):Boolean;

    procedure AjustarColumnas;

  protected
    function ChequearCantidad(A:integer; B:integer(*sale*)):Boolean;override;
    procedure PasarParametro;override;
  public
    { Public declarations }
    tipoEvento : string;
    desdeXml: boolean;
    idXml: integer;
    caravanaXml: string;
    procedure ActDosisSemen(L : ListaToros);
  end;

var
  FMovimientosdeSemenCompra: TFMovimientosdeSemenCompra;
  vFiltrar : boolean;

implementation

{$R *.dfm}

uses IBDButtonABM,UAbmPadresExternos,UAbmsimple,UModificacionSemen, UPrincipal,
     UMensajeHuella, UDMSoftvet, UABMCentrosInseminacion;

procedure TFMovimientosdeSemenCompra.SpeedButton1Click(Sender: TObject);
var
  Iabm: IButtonABM;
  noExiste:Boolean;
  frmABM : TFABMPadresExternos;
begin
  inherited;
  frmABM :=TFABMPadresExternos.Create(self);
  Iabm := IButtonABM(frmABM);
  Iabm.ISetCampoRetorno('id_animal_externo');
  Iabm.IFitrate(1,FPrincipal.EstablecimientoActual);
  Iabm.IAbrir(faAbm); (*tambien llama al ShowModal*)
  // BUG : Muestra los datos de la carga  anterior
  if (Iabm.IModalResult = 1) and (frmABM.ID_Animal > 0) then
  begin
    FPrincipal.IBTPrincipal.CommitRetaining;

    IBSPTab_Semen.Close;
    IBSPTab_Semen.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
    IBSPTab_Semen.ParamByName('ANIMAL').Value := frmABM.ID_Animal;
    IBSPTab_Semen.ParamByName('CANTIDAD').Value := 0;
    IBSPTab_Semen.ParamByName('CERTIFICADO').Value := 0;
    IBSPTab_Semen.ParamByName('ESTAB_ANIM_EXT').Value := FPrincipal.EstabAnimalExterno(frmABM.ID_Animal);
    IBSPTab_Semen.ExecProc;

    ID_Semen_Compra := IBSPTab_Semen.ParamByName('ID_SEMEN').Value;

    ActivarQueries;
  {
    TSDatos.TabVisible := true;
    PCDatosCompra.ActivePage := TSDatos;
    PGrilla.Visible := false;

    ITerminar.Visible := true;
    LTerminar.Visible := true;

    LAgregarSemental.Visible := false;
    IAgregarSemental.Visible := false;
    LAgregarDosis.Visible := false;
    IAgregarDosis.Visible := false;
   }
  end;
   

  {noExiste := false;
  if( Iabm.IModalResult = 1 )then
  begin
    noExiste := not existe(Iabm.IValorRetorno);
    if(noExiste) then
    begin
      IBSPTab_Semen.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      IBSPTab_Semen.ParamByName('ANIMAL').Value := Iabm.IValorRetorno;
      IBSPTab_Semen.ParamByName('CANTIDAD').Value := 0;
      IBSPTab_Semen.ParamByName('CERTIFICADO').Value := 0;
      IBSPTab_Semen.ExecProc;

      ID_Semen_Compra := IBSPTab_Semen.ParamByName('ID_SEMEN').Value;
    end
    else
    begin
      ActivarQueries;
      if (MostrarMensaje(tmConsulta,'¿Desea ingresar los datos de la compra?') = mrYes ) then
      begin
          ID_Semen_Compra :=  IBDSToros.Lookup('ID_ANIMAL_EXTERNO',Iabm.IValorRetorno,'id_semen');
          TSDatos.TabVisible := true;
          PCDatosCompra.ActivePage := TSDatos;
          PGrilla.Visible := false;
      end;

      ITerminar.Enabled := true;
      LTerminar.Enabled := true;
    end;
     // MostrarMensaje(tmError,'El animal ya pertenece al stock de semen actual.');
  end;

  ActivarQueries;
  if(noExiste) then
  begin
    IBDSToros.Locate('ID_ANIMAL_EXTERNO',Iabm.IValorRetorno,[loCaseInsensitive]);

    if (MostrarMensaje(tmConsulta,'¿Desea ingresar los datos de la compra?') = mrYes ) then
    begin
        TSDatos.TabVisible := true;
        PCDatosCompra.ActivePage := TSDatos;
        PGrilla.Visible := false;
    end;

    ITerminar.Enabled := true;
    LTerminar.Enabled := true;

  end;   }
end;

procedure TFMovimientosdeSemenCompra.FormCreate(Sender: TObject);
begin
  inherited;
  FTipoModificacionSemen := 1;// Tipo Movimiento = Alta
  FEsCompra := true;

  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;

  DMSoftvet.IBQCentrosInsem.Close;
  DMSoftvet.IBQCentrosInsem.Open;
  
  EAPrecio.Text := FormatFloat('###0.00',0);
  DTPAFecha.DateTime := now;
  DBLCBACentros.KeyValue:= 0;

  desdeXml := false;


end;

function TFMovimientosdeSemenCompra.ChequearCantidad(A:integer (*valor de la grilla*); B:integer(*nuevovalor*)):Boolean;
begin
  Result := (B > 0);
end;


procedure TFMovimientosdeSemenCompra.PasarParametro;
begin
  IBDSToros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
//  IBDSToros.ParamByName('tipo').AsInteger := 1;
end;

function TFMovimientosdeSemenCompra.existe(animal: Integer): Boolean;
begin

  if (BDBGSemen.DataSource.DataSet.Locate('ID_ANIMAL_EXTERNO',animal,[]) <> null) then
    result := true
  else
    result := false;
end;

procedure TFMovimientosdeSemenCompra.FormShow(Sender: TObject);
begin
  inherited;

  vFiltrar := false;

  I := 1;
  
  PCDatosCompra.ActivePage := TSAnimales;
  EBuscar.SetFocus;

  TSDatos.TabVisible := false;
  ITerminar.Visible := false;
  LTerminar.Visible := false;
  LCancelar.Visible := false;

  SQLOriginal := IBDSToros.SelectSQL.Text;

  SQLTodos := 'select a.id_animal_externo, a.establecimiento, a.id_rp, a.id_senasa, a.nombre, a.apodo, a.id_hba, ts.id_semen, ts.animal, ts.animal_externo, CASE ts.establecimiento WHEN :esta THEN ts.cantidad ELSE 0 END AS cantidad, ts.certificado';
  SQLTodos := SQLTodos + ' from  tab_animales_externos a join cod_sexos c on (a.sexo = c.id_sexo) left join tab_semen ts on (a.id_animal_externo = ts.animal_externo)';
  SQLTodos := SQLTodos + ' where (c.tipo = 1) and (ts.establecimiento is null or ts.establecimiento = :esta)';

  IVerAnimalesClick(sender);

  AjustarColumnas;

  if (desdeXml) then
  begin
    IBDSToros.Locate('ID_ANIMAL_EXTERNO',idXml, []);
    BDBGSemenDblClick(self);
  end;


end;

procedure TFMovimientosdeSemenCompra.IVerAnimalesClick(Sender: TObject);
var SQLStr : string;
begin


  if (RBUltimosDiezA.Checked) then
    SQLStr := SQLOriginal
  else
    SQLStr := SQLTodos;

  if (vFiltrar) then
    SQLStr := SQLStr + ' and ((a.id_rp like ''%' +EBuscar.Text+ '%'') or (a.id_hba like ''%' +EBuscar.Text+ '%'') or (a.nombre like ''%' +EBuscar.Text+ '%'') or (a.apodo like ''%' +EBuscar.Text+ '%''))';

  SQLStr := SQLStr + ' order by a.id_rp'; 

  IBDSToros.Close;
  IBDSToros.SelectSQL.Clear;
  IBDSToros.SelectSQL.Add(SQLStr);

  PasarParametro;
  IBDSToros.Open;
  IBDSToros.Last;
  IBDSToros.First;

  EBuscar.Text := '';
  vFiltrar := false;
end;

procedure TFMovimientosdeSemenCompra.CBRPClick(Sender: TObject);
begin
  EARP.Enabled := CBRP.Checked;
  EARP.Clear;
end;

procedure TFMovimientosdeSemenCompra.CBHBAClick(Sender: TObject);
begin

  EAHBA.Enabled := CBHBA.Checked;
  EAHBA.Clear;
end;

procedure TFMovimientosdeSemenCompra.CBNombreClick(Sender: TObject);
begin

  EANombre.Enabled := CBNombre.Enabled;
  EANombre.Clear;
end;

procedure TFMovimientosdeSemenCompra.CBApodoClick(Sender: TObject);
begin

  EAApodo.Enabled := CBApodo.Checked;
  EAApodo.Clear;
end;

procedure TFMovimientosdeSemenCompra.AjustarColumnas;
begin
  BDBGSemen.Columns[0].Width := 80;
  BDBGSemen.Columns[1].Width := 80;
  BDBGSemen.Columns[2].Width := 80;
  BDBGSemen.Columns[3].Width := 265;
  BDBGSemen.Columns[4].Width := 265;
  BDBGSemen.Columns[5].Width := 75;
  BDBGSemen.Columns[6].Width := 75;
end;

procedure TFMovimientosdeSemenCompra.BDBGSemenDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var Num: Integer;
    R: TRect;
begin

  Num := TStringGrid(BDBGSemen).Row;
  R := TStringGrid(BDBGSemen).CellRect(DataCol,Num);

  if R.Top=Rect.Top then
    with BDBGSemen do
    begin
      if (gdFocused in State) then
      begin
        Canvas.Font.Color := clWhite;
      end
      else
      begin
        Canvas.Font.Color := clWhite;
      end;

      Canvas.Font.Style := [fsBold];
      
      DefaultDrawColumnCell(Rect,DataCol,Column,State);
    end;
end;

procedure TFMovimientosdeSemenCompra.PCDatosCompraChange(Sender: TObject);
begin 

  if (PCDatosCompra.ActivePage = TSDatos) then
  begin
    PGrilla.Visible := false;
    IAgregarSemental.Visible := false;
    LAgregarSemental.Visible := false;
    IAgregarDosis.Visible := false;
    LAgregarDosis.Visible := false;
    LSalir.Visible := false;
    LCancelar.Visible := true;
    ITerminar.Visible := true;
    LTerminar.Visible := true;
    EACANTIDAD.SetFocus;
    EAPrecio.Text := '';
  end
  else
  begin
    PGrilla.Visible := true;
    IAgregarSemental.Visible := true;
    LAgregarSemental.Visible := true;
    IAgregarDosis.Visible := true;
    LAgregarDosis.Visible := true;
    LSalir.Visible := true;
    LCancelar.Visible := false;
    ITerminar.Visible := false;
    LTerminar.Visible := false;
  end;

  if ((IBDSToros.FieldValues['id_rp'] <> null) and (IBDSToros.FieldValues['id_rp'] <> '')) then
    LAnimal.Caption := 'Animal - RP: ' +IBDSToros.FieldValues['id_rp'];

  if ((IBDSToros.FieldValues['id_hba'] <> null) and (IBDSToros.FieldValues['id_hba'] <> '')) then
    LAnimal.Caption := LAnimal.Caption + ' - HBA: ' +IBDSToros.FieldValues['id_hba'];

  if ((IBDSToros.FieldValues['nombre'] <> null) and (IBDSToros.FieldValues['nombre'] <> '')) then
    LAnimal.Caption := LAnimal.Caption + ' - Nombre: ' +IBDSToros.FieldValues['nombre'];

  if ((IBDSToros.FieldValues['apodo'] <> null) and (IBDSToros.FieldValues['apodo'] <> '')) then
    LAnimal.Caption := LAnimal.Caption + ' - Apodo: ' +IBDSToros.FieldValues['apodo'];

end;

procedure TFMovimientosdeSemenCompra.CargarParametrosSP;
begin

  IBSPSemen.ParamByName('SEMEN').Value := ID_Semen_Compra;

  if(EACANTIDAD.Text = '')then
      IBSPSemen.ParamByName('NUEVACANTIDAD').AsInteger := 0
  else
      IBSPSemen.ParamByName('NUEVACANTIDAD').AsInteger := StrToInt(EACANTIDAD.Text);

  IBSPSemen.ParamByName('FECHA').Value := DTPAFecha.Date;

  if(EAPrecio.Text = '')then
      IBSPSemen.ParamByName('PRECIO').Value := 0
  else
      IBSPSemen.ParamByName('PRECIO').Value := StrToFloat(EAPrecio.Text);

  IBSPSemen.ParamByName('TIPO').Value := 3;

  if(DBLCBACentros.Visible)then
    IBSPSemen.ParamByName('CENTRO_INSEMINACION').Value := DBLCBACentros.KeyValue
  else
    IBSPSemen.ParamByName('CENTRO_INSEMINACION').Value := Null;

  IBSPSemen.ParamByName('OBSERVACION').AsString := MAObservacion.GetDato;

  if(EACERTIFICADOS.Text = '')then
      IBSPSemen.ParamByName('NUEVOCERTIFICADO').AsInteger := 0
  else
      IBSPSemen.ParamByName('NUEVOCERTIFICADO').AsInteger := StrToInt(EACERTIFICADOS.Text);

  IBSPSemen.ParamByName('TIPO_BAJA').Value := null;
  IBSPSemen.ParamByName('CLIENTE').Value := null;
  IBSPSemen.ParamByName('CONGELO').Value := 'S';

  IBSPSemen.ExecProc;
end;


procedure TFMovimientosdeSemenCompra.EACANTIDADKeyPress(Sender: TObject;
  var Key: Char);
begin

{  if (not (key in (['0'..'9']))  and (key <> #8) and (key <> #13)) then
    key:=#0;

  if (key = #13) then
    EAPrecio.SetFocus; }
end;

procedure TFMovimientosdeSemenCompra.EACANTIDADExit(Sender: TObject);
begin

//  if (TEditAuto(Sender).Text = '') then  TEditAuto(Sender).Text := '0';
end;

procedure TFMovimientosdeSemenCompra.EAPrecioKeyPress(Sender: TObject;
  var Key: Char);
begin

  if (Key = '.') then
    Key := ',';

  if (key = #13) then
    EACERTIFICADOS.SetFocus;

  if (pos(',',TEditAuto(Sender).Text)=0) then
    begin
      if not (key in ['0'..'9',',',#8,#13]) then key:=#0;
    end
  else if not (key in ['0'..'9',#8,#13]) then key:=#0;

end;

procedure TFMovimientosdeSemenCompra.EAPrecioExit(Sender: TObject);
begin

  if (EAPrecio.Text = '') then  EAPrecio.Text := FormatFloat('###0.00',0);
end;

procedure TFMovimientosdeSemenCompra.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin

  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;
end;

procedure TFMovimientosdeSemenCompra.LCentrosClick(Sender: TObject);
begin

  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMCentrosInseminacion.Create(self));
      DMSoftvet.IBQCentrosInsem.Close;
      DMSoftvet.IBQCentrosInsem.Open;
    end;
  if nroID > -1 then
  begin
    DBLCBACentros.KeyValue := nroID;
    nroID := -1;
  end;
end;

procedure TFMovimientosdeSemenCompra.LCentrosMouseEnter(Sender: TObject);
begin

  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCentros.Font.Color:= $00606C02;
      LCentros.Font.Style:= [fsBold,fsUnderline];
    end;

end;

procedure TFMovimientosdeSemenCompra.LCentrosMouseLeave(Sender: TObject);
begin

  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCentros.Font.Color:= clWindowText;
      LCentros.Font.Style:= [fsUnderline];
    end;
end;

procedure TFMovimientosdeSemenCompra.ITerminarClick(Sender: TObject);
begin

  if (TSDatos.TabVisible) then
    try
       CargarParametrosSP;
       FPrincipal.IBTPrincipal.CommitRetaining;
       MostrarMensaje(tmInformacion,'Los datos han sido guardados correctamente.');
    except
       FPrincipal.IBTPrincipal.RollbackRetaining;
       MostrarMensaje(tmInformacion,'Se ha generado un error interno y el proceso no ha podido terminar.');
    end;

  if (PCDatosCompra.ActivePage = TSDatos) then
  begin
    TSAnimales.TabVisible := true;
    TSDatos.TabVisible := false;
    PCDatosCompra.ActivePage := TSAnimales;
    PCDatosCompraChange(sender);
    IVerAnimalesClick(sender);
    EBuscar.SetFocus;
    LAgregarSemental.Visible := true;
    IAgregarSemental.Visible := true;
    LAgregarDosis.Visible := true;
    IAgregarDosis.Visible := true;
  end;

   if (desdeXml) then
        close();


end;

procedure TFMovimientosdeSemenCompra.BDBGSemenDblClick(Sender: TObject);
begin
  inherited;
  DTPAFecha.DateTime := now;

  IBQExisteTabSemen.Close;
  IBQExisteTabSemen.ParamByName('ACTUAL').Value := FPrincipal.EstablecimientoActual;
  IBQExisteTabSemen.ParamByName('ANIMAL').Value := IBDSToros.FieldValues['id_animal_externo'];
  IBQExisteTabSemen.Open;

 // if IBQExisteTabSemen.FieldValues['id_semen'] = null then

  if (IBQExisteTabSemen.RecordCount = 0) then
  begin
     IBSPTab_Semen.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      IBSPTab_Semen.ParamByName('ANIMAL').Value := IBDSToros.FieldValues['id_animal_externo'];
      IBSPTab_Semen.ParamByName('CANTIDAD').Value := 0;
      IBSPTab_Semen.ParamByName('CERTIFICADO').Value := 0;
      IBSPTab_Semen.ParamByName('ESTAB_ANIM_EXT').Value := FPrincipal.EstabAnimalExterno(IBDSToros.FieldValues['id_animal_externo']);
      IBSPTab_Semen.ExecProc;
       ID_Semen_Compra := IBSPTab_Semen.ParamByName('ID_SEMEN').Value;
   {   IBQSemenCompra.Close;

      IBQSemenCompra.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      IBQSemenCompra.ParamByName('ANIMAL').Value := IBDSToros.FieldValues['id_animal_externo'];
      IBQSemenCompra.ParamByName('CANTIDAD').Value := 0;
      IBQSemenCompra.ParamByName('CERTIFICADO').Value := 0;
      IBQSemenCompra.ParamByName('ESTAB_ANIM_EXT').Value := IBDSToros.FieldValues['establecimiento'];

      IBQSemenCompra.Open;
      
      ID_Semen_Compra := IBQSemenCompra.ParamByName('ID_SEMEN').Value;   }
  end
  else
      ID_Semen_Compra :=  IBDSToros.FieldValues['id_semen'];

  EACANTIDAD.Text := '0';
  TSDatos.TabVisible := true;
  ITerminar.Visible := true;
  LTerminar.Visible := true;

  PGrilla.Visible := false;
  TSAnimales.TabVisible := false;

  PCDatosCompra.ActivePage := TSDatos;

  PCDatosCompraChange(sender);
end;

procedure TFMovimientosdeSemenCompra.IBDSTorosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBDSToros.Last;
  IBDSToros.First;
  LCant.Caption := 'Cantidad de Animales ['+IntToStr(IBDSToros.RecordCount)+']';
end;

procedure TFMovimientosdeSemenCompra.ActDosisSemen(L : ListaToros);
var
  I, S : Integer;
begin
  for I := 0 to Length(L)-1 do
  begin
    if L[I].externo = 'S' then
    begin
      IBSPSemen.ParamByName('SEMEN').Value := L[I].id_toro;
      IBSPSemen.ParamByName('NUEVACANTIDAD').AsInteger := L[I].dosis_requeridas - L[I].dosis_disponibles;
      IBSPSemen.ParamByName('FECHA').Value := DTPAFecha.Date;
      IBSPSemen.ParamByName('PRECIO').Value := 0;
      IBSPSemen.ParamByName('TIPO').Value := 3;
      IBSPSemen.ParamByName('CENTRO_INSEMINACION').Value := Null;
      IBSPSemen.ParamByName('OBSERVACION').AsString := '';
      IBSPSemen.ParamByName('NUEVOCERTIFICADO').AsInteger := 0;
      IBSPSemen.ExecProc;
    end;
  end;
end;

procedure TFMovimientosdeSemenCompra.EBuscarChange(Sender: TObject);
begin

     vFiltrar := true; 

end;

procedure TFMovimientosdeSemenCompra.ISalirClick(Sender: TObject);
begin
  if (LCancelar.Visible) then
  begin
    if (PCDatosCompra.ActivePage = TSDatos) then
    begin
      TSAnimales.TabVisible := true;
      TSDatos.TabVisible := false;
      PCDatosCompra.ActivePage := TSAnimales;
      PCDatosCompraChange(sender);
      EBuscar.SetFocus;
    end;
  end
  else
    Close();
end;

procedure TFMovimientosdeSemenCompra.EBuscarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if (key = #13) then
  begin
       vFiltrar := true;
       IVerAnimalesClick(sender);
       key := #0; 
  end;
end;

procedure TFMovimientosdeSemenCompra.EACERTIFICADOSKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;

  if (key = #13) then
    DBLCBACentros.SetFocus;
    
end;

end.
