unit UEveMovimientoSemenExtraccion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSemenBasico, DB, IBCustomDataSet, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, IBStoredProc,
  IBQuery, WinXP, DataExport, DataToXLS, JvExControls, JvLabel, PngImage,
  jpeg, JvGIF, ImgList, PngImageList, EditAuto, JvExExtCtrls, JvImage;

type
  TFMovimientosdeSemenExtraccion = class(TFMovimientosdeSemen)
    IBSPTab_SemenID_SEMEN: TIntegerField;
    IBQEdadNecesaria: TIBQuery;
    IBQEdadNecesariaVALOR: TIBStringField;
    IBQEdadAnimal: TIBQuery;
    IBQEdadAnimalEDAD: TIntegerField;
    IBDSTorosID_RP: TIBStringField;
    IBDSTorosID_SENASA: TIBStringField;
    IBDSTorosID_ANIMAL: TIntegerField;
    IBDSTorosNOMBRE: TIBStringField;
    IBDSTorosAPODO: TIBStringField;
    IBDSTorosESTABLECIMIENTO: TIntegerField;
    IBDSTorosID_SEMEN: TIntegerField;
    IBDSTorosANIMAL: TIntegerField;
    IBDSTorosANIMAL_EXTERNO: TIntegerField;
    IBDSTorosCANTIDAD: TIntegerField;
    IBDSTorosCERTIFICADO: TIntegerField;
    PFiltros: TPanel;
    CBApodo: TCheckBox;
    CBNombre: TCheckBox;
    EANombre: TEditAuto;
    EAApodo: TEditAuto;
    EAHBA: TEditAuto;
    CBHBA: TCheckBox;
    CBRP: TCheckBox;
    EARP: TEditAuto;
    LVerAnimales: TLabel;
    IVerAnimales: TImage;
    LBuscarPor: TLabel;
    EBuscar: TEdit;
    RBUltimosDiezA: TRadioButton;
    RBTodos: TRadioButton;
    LCant: TLabel;
    IBDSTorosID_HBA: TIBStringField;
    IAdicionarSemental: TImage;
    IModifCant: TImage;
    Label1: TLabel;
    Label2: TLabel;
    RBTerceros: TRadioButton;
    IBQParametroDeTerceros: TIBQuery;
    procedure SBSementalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IVerAnimalesClick(Sender: TObject);
    procedure EBuscarChange(Sender: TObject);
    procedure EBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure IAdicionarSementalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IModifCantClick(Sender: TObject);
    procedure BDBGSemenDblClick(Sender: TObject);
    procedure RBUltimosDiezAClick(Sender: TObject);
    procedure RBTodosClick(Sender: TObject);
  private
    { Private declarations }
    SQLOriginal, SQlUltimosMov : String;
    ToroNuevo : Boolean;
    function PuedeSerSemental(animal:integer): Boolean;

    procedure AjustarColumnas;
  protected
    function ChequearCantidad(A:integer (*valor de la grilla*); B:integer(*nuevovalor*)):Boolean;override;
    procedure PasarParametro;override;{ Private declarations }public
    { Public declarations }
  end;

var
  FMovimientosdeSemenExtraccion: TFMovimientosdeSemenExtraccion;
  vFiltrar : boolean;
  animal : integer;

implementation

{$R *.dfm}

uses
  IBDButtonABM, UAbmAnimales, UABMSimple, UPrincipal, UMensajeHuella, UTraduccion, USelAnimalesSemenExtraccion, UModificacionDatosSemen, UEveExtraccionSemen;

procedure TFMovimientosdeSemenExtraccion.SBSementalClick(Sender: TObject);
var Iabm: IButtonABM;
    vent :TFABMAnimales;
    esSemental:Boolean;
begin
  inherited;
{  vent :=TFABMAnimales.Create(self);
  Iabm := IButtonABM(vent);
  vent.PTitulo.Caption:= Traducir('Animales');

  Iabm.IFitrate(1,FPrincipal.EstablecimientoActual);
  Iabm.ISetCampoRetorno('id_animal');
  Iabm.IAbrir(faElegir);

  esSemental:=false;
  if( Iabm.IModalResult = 1 )then
  begin
    esSemental:=PuedeSerSemental(Iabm.IValorRetorno);
    if(esSemental)then
    begin
      IBSPTab_Semen.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      IBSPTab_Semen.ParamByName('ANIMAL').Value :=Iabm.IValorRetorno;
      IBSPTab_Semen.ParamByName('CANTIDAD').Value :=0;
      IBSPTab_Semen.ParamByName('CERTIFICADO').Value :=0;
      IBSPTab_Semen.ExecProc;
    end
    else
   { begin
      IBDSToros.Locate('ID_ANIMAL',Iabm.IValorRetorno,[loCaseInsensitive]);
      If (MostrarMensaje(tmConsulta, 'Desea cargar los datos de extracción de semen?') = mrYes) then
         BDBGSemenDblClick(sender);
      end     }
 {     MostrarMensaje(tmError, 'El Animal es muy joven para ser Semental');
  end;
  ActivarQueries;

 if(esSemental) then
  begin
    IBDSToros.Locate('ID_ANIMAL',Iabm.IValorRetorno,[loCaseInsensitive]);
    If (MostrarMensaje(tmConsulta, 'Desea cargar los datos de extracción de semen?') = mrYes) then
       BDBGSemenDblClick(sender);
  end;        }

end;

procedure TFMovimientosdeSemenExtraccion.FormCreate(Sender: TObject);
begin

  IBQParametroDeTerceros.Close;
  IBQParametroDeTerceros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQParametroDeTerceros.Open;
  RBTerceros.Visible := false;
  if IBQParametroDeTerceros.FieldValues['valor'] <> null then
    RBTerceros.Visible := IBQParametroDeTerceros.FieldByName('valor').AsString = 'S';

  FTipoModificacionSemen := 1; //Tipo Movimiento = Alta
  FEsCompra := false;
  vFiltrar := false;
  SQLOriginal := 'select A.ID_RP, A.ID_SENASA, A.ID_ANIMAL, A.ID_HBA, A.NOMBRE, A.APODO, TS.* from  TAB_ANIMALES A,  COD_SEXOS COD, TAB_SEMEN TS where (COD.TIPO = 1) and (A.SEXO = COD.ID_SEXO)';
  SQLOriginal := SQLOriginal + ' and (A.ID_ANIMAL = TS.ANIMAL) and (A.Establecimiento = :ESTABLECIMIENTO) and ((CURRENT_DATE - A.FECHA_NACIMIENTO) > :ParamEdad)';

  SQlUltimosMov := 'select a.id_rp, a.id_senasa, a.id_animal, a.id_hba, a.nombre, a.apodo, ts.* from rep_animales_int_semen(:fecha) a join tab_semen ts on (a.id_animal = ts.animal)';

  ToroNuevo := false;
  inherited;
end;

function TFMovimientosdeSemenExtraccion.ChequearCantidad(A:integer (*valor de la grilla*); B:integer(*nuevovalor*)):Boolean;
begin
  Result := (B > 0);
end;

procedure TFMovimientosdeSemenExtraccion.PasarParametro;
begin
  inherited;
  IBDSToros.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
end;

function TFMovimientosdeSemenExtraccion.PuedeSerSemental(animal:integer):Boolean;
begin
  IBQEdadAnimal.Close;
  IBQEdadAnimal.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQEdadAnimal.ParamByName('animal').AsInteger := animal;
  IBQEdadAnimal.Open;
  IBQEdadNecesaria.Close;
  IBQEdadNecesaria.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQEdadNecesaria.ParamByName('parametro').AsString := 'MGEXTSEM1';
  IBQEdadNecesaria.Open;
  Result:= (IBQEdadAnimalEDAD.AsInteger >= IBQEdadNecesariaVALOR.AsInteger*30 );
end;

procedure TFMovimientosdeSemenExtraccion.IVerAnimalesClick(Sender: TObject);
var SQLStr, SQL : String;
begin
  inherited;
  SQLStr := '';
  SQL := '';


  if (vFiltrar) then
  begin
    SQLStr := ' and ((a.id_rp like ''%' +EBuscar.Text+ '%'') or (a.id_hba like ''%' +EBuscar.Text+ '%'') or (a.nombre like ''%' +EBuscar.Text+ '%'') or (a.apodo like ''%' +EBuscar.Text+ '%''))';
  end;

  IBDSToros.Close;
  IBDSToros.SelectSQL.Clear;

  if ((RBUltimosDiezA.Checked)and (not ToroNuevo)) then
  begin
    SQL := SQlUltimosMov;
    if (SQLStr <> '')  then
      SQL := SQL + SQLStr;

    IBDSToros.SelectSQL.Add(SQL);
//    IBDSToros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBDSToros.ParamByName('fecha').AsDate := Now();
  end;

  if ((RBTerceros.Checked)) then
  begin
    SQL := SQLOriginal;
    SQLStr := SQLStr + 'and a.id_animal in (select ee.animal from eve_eventos ee join eve_alta_directa ead on ee.id_evento = ead.id_evento where ead.tipo = 4)';
    if (SQLStr <> '')  then
      SQL := SQL + SQLStr;

    IBDSToros.SelectSQL.Add(SQL);
    IBDSToros.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBDSToros.ParamByName('ParamEdad').AsInteger := 270;
  end;

  if ((RBTodos.Checked)) then
  begin
    SQL := SQLOriginal;
    if (SQLStr <> '')  then
      SQL := SQL + SQLStr;

    IBDSToros.SelectSQL.Add(SQL);
    IBDSToros.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    // Tiene que ser un valor muy chico
    IBDSToros.ParamByName('ParamEdad').AsInteger := 270;
  end;



//  IBDSToros.SelectSQL.Add(SQL);

  IBDSToros.Open;
  IBDSToros.Last;
  IBDSToros.First;

  LCant.Caption := 'Cantidad de Animales: ' + IntToStr(IBDSToros.RecordCount);

  EBuscar.Text := '';

  vFiltrar := false;

//  BDBGSemen.SetFocus;
end;

procedure TFMovimientosdeSemenExtraccion.EBuscarChange(Sender: TObject);
begin
  inherited;

  if (EBuscar.Text <> '') then
    vFiltrar := true
  else
    vFiltrar := false;
    
end;

procedure TFMovimientosdeSemenExtraccion.EBuscarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if (key = #13) then
  begin
       IVerAnimalesClick(sender);
       key := #0; 
  end;
end;

procedure TFMovimientosdeSemenExtraccion.IAdicionarSementalClick(Sender: TObject);
var Iabm: IButtonABM;
    vent :TFABMAnimales;
    esSemental:Boolean;
    F : TFSelAnimalesSemenExtraccion;
begin
  inherited;
{  vent :=TFABMAnimales.Create(self);
  Iabm := IButtonABM(vent);
//  vent.PTitulo.Caption:= Traducir('Animales');

  Iabm.IFitrate(1,FPrincipal.EstablecimientoActual);
  Iabm.ISetCampoRetorno('id_animal');
  Iabm.IAbrir(faElegir);}


  F := TFSelAnimalesSemenExtraccion.Create(self);
  F.ShowModal;

  animal := F.id_animal;

  esSemental := false;

  if( animal <> -1 )then
  begin
    esSemental := PuedeSerSemental(animal);
    if(esSemental)then
    begin
      IBSPTab_Semen.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      IBSPTab_Semen.ParamByName('ANIMAL').Value := animal;
      IBSPTab_Semen.ParamByName('CANTIDAD').Value :=0;
      IBSPTab_Semen.ParamByName('CERTIFICADO').Value :=0;
      IBSPTab_Semen.ExecProc;

      FPrincipal.IBTPrincipal.CommitRetaining;

      ToroNuevo := true;
    end
    else
      MostrarMensaje(tmError, 'El Animal es muy joven para ser Semental');
  end;
//  ActivarQueries;

  IVerAnimalesClick(Sender);

  if(esSemental) then
  begin
    IBDSToros.Locate('ID_ANIMAL',animal,[loCaseInsensitive]);
    If (MostrarMensaje(tmConsulta, '¿Desea cargar los datos de extracción de semen?') = mrYes) then
       BDBGSemenDblClick(sender);
  end;

{  if( Iabm.IModalResult = 1 )then
  begin
    esSemental:=PuedeSerSemental(Iabm.IValorRetorno);
    if(esSemental)then
    begin
      IBSPTab_Semen.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      IBSPTab_Semen.ParamByName('ANIMAL').Value :=Iabm.IValorRetorno;
      IBSPTab_Semen.ParamByName('CANTIDAD').Value :=0;
      IBSPTab_Semen.ParamByName('CERTIFICADO').Value :=0;
      IBSPTab_Semen.ExecProc;
    end
    else
   { begin
      IBDSToros.Locate('ID_ANIMAL',Iabm.IValorRetorno,[loCaseInsensitive]);
      If (MostrarMensaje(tmConsulta, 'Desea cargar los datos de extracción de semen?') = mrYes) then
         BDBGSemenDblClick(sender);
      end     }
{      MostrarMensaje(tmError, 'El Animal es muy joven para ser Semental');
  end;
  ActivarQueries;

  if(esSemental) then
  begin
    IBDSToros.Locate('ID_ANIMAL',Iabm.IValorRetorno,[loCaseInsensitive]);
    If (MostrarMensaje(tmConsulta, '¿Desea cargar los datos de extracción de semen?') = mrYes) then
       BDBGSemenDblClick(sender);
  end;
}
  ToroNuevo := false;
  F.Destroy;
end;

procedure TFMovimientosdeSemenExtraccion.FormShow(Sender: TObject);
begin
  inherited;

  RBUltimosDiezA.Checked := true;

  IVerAnimalesClick(sender);

  AjustarColumnas;

end;

procedure TFMovimientosdeSemenExtraccion.AjustarColumnas;
begin
  BDBGSemen.Columns[0].Width := 80;
  BDBGSemen.Columns[1].Width := 80;
  BDBGSemen.Columns[2].Width := 80;
  BDBGSemen.Columns[3].Width := 265;
  BDBGSemen.Columns[4].Width := 265;
  BDBGSemen.Columns[5].Width := 75;
  BDBGSemen.Columns[6].Width := 75;
end;

procedure TFMovimientosdeSemenExtraccion.IModifCantClick(Sender: TObject);
var F : TFModificacionDatosSemen;
begin
  inherited;

  F := TFModificacionDatosSemen.Create(self);
  F.LAnimal.Caption := 'RP: ' + IBDSToros.FieldbyName('id_rp').AsString + ' - H.B.A: ' + IBDSToros.FieldbyName('id_hba').AsString + ' - ' + Traducir('Nombre: ') + IBDSToros.FieldbyName('Nombre').AsString + ' - Apodo: ' + IBDSToros.FieldbyName('Apodo').AsString;
  F.Fsemen  := IBDSToros.FieldValues['id_semen'];
  F.FCantidad := IBDSToros.FieldValues['Cantidad'];
  F.FTipo := FTipoModificacionSemen;
  F.ShowModal;
  F.Destroy;

  IVerAnimalesClick(sender);
end;

procedure TFMovimientosdeSemenExtraccion.BDBGSemenDblClick(Sender: TObject);
//var F : TFModificacionDatosSemen;
var Eve : TFEveExtraccionSemen;
begin

  Eve := TFEveExtraccionSemen.Create(self);
  Eve.IDAnimal := IBDSToros.FieldValues['id_animal'];
  Eve.ConManga := false;
  Eve.esMasivo := false;
  Eve.ShowModal;
  Eve.Destroy;

  IVerAnimalesClick(sender);


//  IVerAnimalesClick(sender);
{
  F := TFModificacionDatosSemen.Create(self);
  F.LAnimal.Caption := 'RP: ' + IBDSToros.FieldbyName('id_rp').AsString + ' - H.B.A: ' + IBDSToros.FieldbyName('id_hba').AsString + ' - ' + Traducir('Nombre: ') + IBDSToros.FieldbyName('Nombre').AsString + ' - Apodo: ' + IBDSToros.FieldbyName('Apodo').AsString;
  F.Fsemen  := IBDSToros.FieldValues['id_semen'];
  F.FTipo := FTipoModificacionSemen;
  F.ShowModal;
  F.Destroy;

  IVerAnimalesClick(sender);
}
end;

procedure TFMovimientosdeSemenExtraccion.RBUltimosDiezAClick(
  Sender: TObject);
begin
  inherited;
  IVerAnimalesClick(sender); 
end;

procedure TFMovimientosdeSemenExtraccion.RBTodosClick(Sender: TObject);
begin
  inherited;
  IVerAnimalesClick(sender);
end;

end.
