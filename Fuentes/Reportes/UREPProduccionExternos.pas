unit UREPProduccionExternos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, UREPProduccionExternosPreview,
  UPrincipal, IBQuery, Grids, DBGrids, UBDBGrid, Buttons, UCartel,
  UMensajeImpresora, EditAuto, StrUtils, PngImage, jpeg, JvGIF,
  JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFREPProduccionExternos = class(TFUniversal)
    GBAnimalesExt: TGroupBox;                                                                                          
    BDBGAnimalesExt: TBitDBGrid;
    IBQAnimalesExt: TIBQuery;
    DSAnimalesExt: TDataSource;
    IBQAnimalesExtID_RP: TIBStringField;
    IBQAnimalesExtID: TIntegerField;
    IBQAnimalesExtID_SENASA: TIBStringField;
    IBQAnimalesExtID_PC: TIBStringField;
    IBQAnimalesExtID_HBA: TIBStringField;
    IBQAnimalesExtID_RA: TIBStringField;
    IBQAnimalesExtID_OTRO: TIBStringField;
    IBQAnimalesExtNOMBRE: TIBStringField;
    IBQAnimalesExtAPODO: TIBStringField;
    IBQAnimalesExtRAZA: TIntegerField;
    IBQAnimalesExtSEXO: TIntegerField;
    IBQAnimalesExtNOM_RAZA: TIBStringField;
    IBQAnimalesExtEXT: TIBStringField;
    IBQRegDep: TIBQuery;
    DSRegDep: TDataSource;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    LExpExcel: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    GBFiltros: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EARP: TEditAuto;
    EANombre: TEditAuto;
    EAApodo: TEditAuto;
    GroupBox1: TGroupBox;
    JvIBotonBuscar: TJvImage;
    eClaveBusqueda: TEditAuto;
    CBGenealogia: TCheckBox;
    Label4: TLabel;
    cbListaEstablecimientos: TComboBox;
    IBQListaEstablecimientos: TIBQuery;
    IBQEstabAnimal: TIBQuery;
    IBQNombreEstab: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure IBQAnimalesExtAfterOpen(DataSet: TDataSet);
    procedure BBSalirClick(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure BDBGAnimalesExtCellClick(Column: TColumn);
    procedure BBXlsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EARPChange(Sender: TObject);
    procedure EANombreChange(Sender: TObject);
    procedure EAApodoChange(Sender: TObject);
    procedure IBQAnimalesExtFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure eClaveBusquedaChange(Sender: TObject);
    procedure cbListaEstablecimientosChange(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);

  private
    ID_Animal, establecimiento : integer;
    Externo : Boolean;
    Nombre, RP, Apodo : String;
    procedure ActualizarConsulta;
  protected
   procedure ComponentesVisiblesPorPais(pais: Integer);override;
   function  getIDEstablecimiento() : integer;
  public
    { Public declarations }
  end;

var
  FREPProduccionExternos: TFREPProduccionExternos;

implementation

uses
  UTraduccion, UDMSoftvet, MaskUtils;

{$R *.dfm}

function  TFREPProduccionExternos.getIDEstablecimiento() : integer;
begin
 IBQListaEstablecimientos.Active := false;
 IBQListaEstablecimientos.Active := true;
 IBQListaEstablecimientos.First();
 result := -1;
 while (not   IBQListaEstablecimientos.Eof) do
 begin
   if ( IBQListaEstablecimientos.FieldValues['Nombre'] = cbListaEstablecimientos.Text) then
   begin
     result :=IBQListaEstablecimientos.FieldValues['ID_ESTABLECIMIENTO'] ;

   end;
   IBQListaEstablecimientos.next();
 end;

end;

procedure TFREPProduccionExternos.FormCreate(Sender: TObject);
var   cartel : TCartel;
begin
  inherited;
  cartel := TCartel.getInstance;
  cartel.abrircartel('Generando Listado de Performance de Semen Utilizado');

  Nombre := '';
  RP := '%';

  ActualizarConsulta();

  cartel.cerrarcartel;
  cartel.FreeInstance;
end;

procedure TFREPProduccionExternos.ActualizarConsulta;
var sql : String;
begin
  IBQAnimalesExt.Close;
  IBQAnimalesExt.SQL.Clear;
  establecimiento:= getIDEstablecimiento();

  if (eClaveBusqueda.Text = '') then
  begin
     sql := 'select tae.id_rp, tae.id_animal_externo as id, tae.id_senasa, tae.id_pc, tae.id_hba, tae.id_ra, ';
     sql := sql + 'tae.id_otro, tae.nombre, tae.apodo as apodo, tae.raza, tae.sexo, cr.nombre as nom_raza, ''E'' as ext ';
     sql := sql + 'from tab_animales_externos tae join cod_razas cr on (tae.raza=cr.id_raza) ';
     sql := sql + 'where tae.sexo=1 ';
     sql := sql + 'and (exists (select padre_externo from rel_padres_externos where padre_externo = tae.id_animal_externo and (establecimiento = :esta or :esta = -1))) ';
     sql := sql + 'union ';
     sql := sql + 'select ta.id_rp, ta.id_animal as id, ta.id_senasa, ta.id_pc, ta.id_hba, ta.id_ra, ta.id_otro, ';
     sql := sql + 'ta.nombre, ta.apodo as apodo, ta.raza, ta.sexo, cr.nombre as nom_raza, ''I'' as ext ';
     sql := sql + 'from tab_animales ta join cod_razas cr on ta.raza=cr.id_raza ';
     sql := sql + 'where ta.sexo=1 ';
     sql := sql + 'and (exists (select padre_interno from rel_padres_internos where padre_interno = ta.id_animal and (establecimiento = :esta or :esta = -1))) ';

     IBQAnimalesExt.SQL.Add(sql);
  end
  else
  begin
     sql := 'select tae.id_rp, tae.id_animal_externo as id, tae.id_senasa, tae.id_pc, tae.id_hba, tae.id_ra, ';
     sql := sql + 'tae.id_otro, tae.nombre, tae.apodo as apodo, tae.raza, tae.sexo, cr.nombre as nom_raza, ''E'' as ext ';
     sql := sql + 'from tab_animales_externos tae join cod_razas cr on (tae.raza=cr.id_raza) ';
     sql := sql + 'where tae.sexo=1 ';
     sql := sql + 'and (tae.id_rp like :NOMBRE_ANIM or tae.nombre like :NOMBRE_ANIM or tae.apodo like :NOMBRE_ANIM) ';
     sql := sql + 'and (exists (select padre_externo from rel_padres_externos where padre_externo = tae.id_animal_externo and (establecimiento = :esta or :esta = -1))) ';
     sql := sql + 'union ';
     sql := sql + 'select ta.id_rp, ta.id_animal as id, ta.id_senasa, ta.id_pc, ta.id_hba, ta.id_ra, ta.id_otro, ';
     sql := sql + 'ta.nombre, ta.apodo as apodo, ta.raza, ta.sexo, cr.nombre as nom_raza, ''I'' as ext ';
     sql := sql + 'from tab_animales ta join cod_razas cr on ta.raza=cr.id_raza ';
     sql := sql + 'where establecimiento=:esta and ta.sexo=1 ';
     sql := sql + 'and (ta.id_rp like :NOMBRE_ANIM or ta.nombre like :NOMBRE_ANIM or ta.apodo like :NOMBRE_ANIM) ';
     sql := sql + 'and (exists (select padre_interno from rel_padres_internos where padre_interno = ta.id_animal and (establecimiento = :esta or :esta = -1))) ';
     IBQAnimalesExt.SQL.Add(sql);

     IBQAnimalesExt.ParamByName('nombre_anim').AsString := Nombre;

  end;

  IBQAnimalesExt.ParamByName('esta').AsInteger := establecimiento;


  IBQAnimalesExt.Open;
end;


procedure TFREPProduccionExternos.IBQAnimalesExtAfterOpen(DataSet: TDataSet);

begin
  inherited;

  IBQAnimalesExt.Last;
  IBQAnimalesExt.First;
  BDBGAnimalesExt.DataSource := DSAnimalesExt;
  GBAnimalesExt.Caption := Traducir('Animales [')+IntToStr(IBQAnimalesExt.RecordCount)+']';
  {BBImprimirReporte.Enabled := not(IBQAnimalesExt.IsEmpty);
  BBXls.Enabled := not(IBQAnimalesExt.IsEmpty);}
  IPreview.Enabled := not(IBQAnimalesExt.IsEmpty);
  LPreview.Enabled := not(IBQAnimalesExt.IsEmpty);
  LExpExcel.Enabled := not(IBQAnimalesExt.IsEmpty);
  IExpExcel.Enabled := not(IBQAnimalesExt.IsEmpty);
end;

procedure TFREPProduccionExternos.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFREPProduccionExternos.BBImprimirReporteClick(Sender: TObject);
var
  F : TFREPProduccionExternosPreview;
  cartel : TCartel;
  establecimientoAnimal : integer;
  nombreEstablecimiento, nroRenspa : String;
begin
try
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  cartel := TCartel.getInstance;
  cartel.abrircartel('Generando Reporte de Performance de Semen Utilizado');

  F := TFREPProduccionExternosPreview.Create(self);
  F.IBQREPProdAnimalExterno.Close;
  F.IBQREPProdAnimalExterno.ParamByName('animal').AsInteger := ID_ANIMAL;

  if (establecimiento = -1) then //Si esta seleccionado 'TODOS'
  begin
    IBQEstabAnimal.Close; //Debo obtener establecimiento del animal
    IBQEstabAnimal.SQL.Clear;
    if (Externo) then
      IBQEstabAnimal.SQL.Add('select establecimiento from tab_animales_externos where id_animal_externo = :id')
    else
      IBQEstabAnimal.SQL.Add('select establecimiento from tab_animales where id_animal = :id');
    IBQEstabAnimal.ParamByName('id').AsInteger := ID_ANIMAL;
    IBQEstabAnimal.Open;
    establecimientoAnimal := IBQEstabAnimal.FieldValues['establecimiento'];
    IBQNombreEstab.Close;
    IBQNombreEstab.ParamByName('id').AsInteger := establecimientoAnimal;
    IBQNombreEstab.Open;
    nombreEstablecimiento := IBQNombreEstab.FieldValues['nombre'];
  end
  else
  begin
    establecimientoAnimal := establecimiento;
    nombreEstablecimiento := cbListaEstablecimientos.Text;
  end;

  F.IBQREPProdAnimalExterno.ParamByName('esta').AsInteger := establecimientoAnimal;
  F.IBQREPProdAnimalExterno.Open;

  F.ID_Animal := ID_ANIMAL;
  F._Externo := Externo;

  F.QRLEstablecimientos.Caption := nombreEstablecimiento;
  F.QRLEstablecimientos1.Caption := nombreEstablecimiento;
  F.QRLEstablecimientos2.Caption := nombreEstablecimiento;

  DMSoftvet.IBQEstablecimiento.Open;
  DMSoftvet.IBQEstablecimiento.Locate('id_establecimiento',VarArrayOf([establecimientoAnimal]), [] );
  nroRenspa := DMSoftvet.IBQEstablecimiento.FieldByName('renspa').AsString;
  nroRenspa := FormatMaskText('CC.CCC.C.CCCCC.CC;0;_',nroRenspa);

  F.QRLRenglon2.Caption := nroRenspa;
  F.QRLRenglon4.Caption := nroRenspa;
  F.QRLRenglon6.Caption := nroRenspa;

  IBQRegDep.Close;
  IBQRegDep.SQL.Clear;
  IBQRegDep.SQL.Add('select first 1 * from REP_REGISTRO_DEPS(:esta,:animal,:tipo_animal)');
  IBQRegDep.ParamByName('esta').AsInteger:= establecimientoAnimal;
  IBQRegDep.ParamByName('animal').AsInteger:= id_animal;
  IBQRegDep.ParamByName('tipo_animal').AsString:= 'E';  
  IBQRegDep.Open;


  if (FPrincipal.Pais = 1) then // Argentina
    begin
      F.QRBand11.Enabled:= false;
    end
   else
    if (FPrincipal.Pais = 2) then // Uruguay
      begin
        F.QRBand10.Enabled:= false;
      end
     else
      begin
        F.QRBand10.Enabled:= false;
      end;

  F.tiene_deps:= not IBQRegDep.IsEmpty;

  if CBGenealogia.Checked then
    F.armarArbol()
  else
    F.banda.Enabled := false;
finally
  cartel.cerrarcartel;
  cartel.FreeInstance;

  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();
end;
end;

procedure TFREPProduccionExternos.BDBGAnimalesExtCellClick(
  Column: TColumn);
begin
  inherited;
  if not(IBQAnimalesExt.IsEmpty) then
  begin
    ID_Animal := IBQAnimalesExt.FieldValues['id'];
    Externo := IBQAnimalesExt.FieldValues['ext'] = 'E';
  end;
end;

procedure TFREPProduccionExternos.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXlS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPProduccionExternos.ComponentesVisiblesPorPais(
  pais: Integer);
begin
  inherited;
  BDBGAnimalesExt.ColumnByField('id_senasa').Title.Caption:= FPrincipal.PaisNombreCaravana;
  BDBGAnimalesExt.ColumnByField('id_hba').Title.Caption:= FPrincipal.PaisHerdBook;
end;

procedure TFREPProduccionExternos.FormShow(Sender: TObject);
begin
  inherited;
  ComponentesVisiblesPorPais(-1);

  try
    IBQListaEstablecimientos.Close();
    IBQListaEstablecimientos.Open();
    cbListaEstablecimientos.Clear();
    IBQListaEstablecimientos.First();
    cbListaEstablecimientos.Items.add('Todos');
    while (not  IBQListaEstablecimientos.Eof) do
    begin
       cbListaEstablecimientos.Items.add(IBQListaEstablecimientos.FieldValues['Nombre']);
       IBQListaEstablecimientos.Next();
    end;
    cbListaEstablecimientos.ItemIndex := 0;
  except
  end;

end;

procedure TFREPProduccionExternos.EARPChange(Sender: TObject);
begin
  inherited;
  RP := EARP.Text+'%';
 // ActualizarConsulta;
end;

procedure TFREPProduccionExternos.EANombreChange(Sender: TObject);
begin
  inherited;
  if (EANombre.Text = '') then
        Nombre := ''
  else
        Nombre := '%'+EANombre.Text+'%';
//  ActualizarConsulta();
end;

procedure TFREPProduccionExternos.EAApodoChange(Sender: TObject);
begin
  inherited;
//  ActualizarConsulta();
end;

procedure TFREPProduccionExternos.IBQAnimalesExtFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
var
  aux : string;
begin
  inherited;
  if EAApodo.Text <> '' then
  begin
    if DataSet.FieldValues['apodo'] <> null then
    begin
      aux := LeftStr(DataSet.FieldValues['apodo'],Length(EAApodo.Text));
      Accept := StrComp(PAnsiChar(aux),PAnsiChar(EAApodo.Text)) = 0;
    end
    else
      Accept := false;
  end
end;

procedure TFREPProduccionExternos.eClaveBusquedaChange(Sender: TObject);
begin
  inherited;
  Nombre := '%'+eClaveBusqueda.Text+'%';
 // ActualizarConsulta();

end;

procedure TFREPProduccionExternos.cbListaEstablecimientosChange(
  Sender: TObject);
begin
  inherited;
 // ActualizarConsulta();
end;



procedure TFREPProduccionExternos.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  ActualizarConsulta();
end;

end.
