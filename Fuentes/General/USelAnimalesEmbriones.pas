unit USelAnimalesEmbriones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, PngImage, jpeg, ExtCtrls, Grids, DBGrids, UBDBGrid, UPrincipal,
  Buttons, DateTimePickerAuto, DBCtrls, UDBLookupComboBoxAuto, Mask,
  UDBEditAuto, IBUpdateSQL, EditAuto, ImgList, PngImageList, JvGIF,
  JvExExtCtrls, JvImage;

type
  TFSelAnimalesEmbriones = class(TFUniversal)
    Ptop: TPanel;
    LSeleccion: TLabel;
    Label4: TLabel;
    IBuscar: TImage;
    LBuscar: TLabel;
    EBuscar: TEdit;
    PCli: TPanel;
    LCantidad: TLabel;
    BDBGAnimales: TBitDBGrid;
    PBottom: TPanel;
    IFondoB: TImage;
    IElegir: TImage;
    ICancelar: TImage;
    LCancelar: TLabel;
    LElegir: TLabel;
    IBQAnimales: TIBQuery;
    DSAnimales: TDataSource;
    IAgregarAnimal: TImage;
    LAgregarAnimal: TLabel;
    PDatosMadre: TPanel;
    PDatos: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label41: TLabel;
    DBEASenasaAnimal: TDBEditAuto;
    RBSenasaMadre: TRadioButton;
    RBCuigMadre: TRadioButton;
    DBEARPAnimal: TDBEditAuto;
    DBLCBAPropietarioAnimal: TDBLookupComboBoxAuto;
    DBEACriadorAnimal: TDBEditAuto;
    DBEAApodoAnimal: TDBEditAuto;
    DBEANombreAnimal: TDBEditAuto;
    DBLCBARazaAnimal: TDBLookupComboBoxAuto;
    DBLCBASexoMadre: TDBLookupComboBoxAuto;
    DBEAPCAnimal: TDBEditAuto;
    DBEAOtroAnimal: TDBEditAuto;
    DBEARAAnimal: TDBEditAuto;
    DBEAHBAAnimal: TDBEditAuto;
    DTPAFechaNacAnimal: TDateTimePickerAuto;
    PBotonesMadres: TPanel;
    BBAceptarM: TBitBtn;
    BBCancelarM: TBitBtn;
    IBQMadres: TIBQuery;
    IBQPadres1: TIBQuery;
    IBQPadres1ID_RP: TIBStringField;
    IBQPadres1ESTABLECIMIENTO: TIntegerField;
    IBQPadres1ID_ANIMAL_EXTERNO: TIntegerField;
    IBQPadres1ID_SENASA: TIBStringField;
    IBQPadres1ID_PC: TIBStringField;
    IBQPadres1ID_HBA: TIBStringField;
    IBQPadres1ID_RA: TIBStringField;
    IBQPadres1ID_OTRO: TIBStringField;
    IBQPadres1NOMBRE: TIBStringField;
    IBQPadres1APODO: TIBStringField;
    IBQPadres1RAZA: TIntegerField;
    IBQPadres1SEXO: TIntegerField;
    IBQPadres1CRIADOR: TIBStringField;
    IBQPadres1PROPIETARIO: TIntegerField;
    IBQPadres1FECHA_NACIMIENTO: TDateField;
    IBQRNIdentificacion: TIBQuery;
    IBQSexoAnimal: TIBQuery;
    IBQSexoPadre: TIBQuery;
    IBUMadres: TIBUpdateSQL;
    IBUPadres1: TIBUpdateSQL;
    DSAltaAnimales: TDataSource;
    DSSexoAnimal: TDataSource;
    IAceptarAnimal: TImage;
    ICancelarAnimal: TImage;
    LGuardar: TLabel;
    LCancelarAnimal: TLabel;
    EARPAnimal: TEditAuto;
    EAApodoAnimal: TEditAuto;
    EACriador: TEditAuto;
    EASenasa: TEditAuto;
    EAHBA: TEditAuto;
    EARAAnimal: TEditAuto;
    EAOtroAnimal: TEditAuto;
    EAPCAnimal: TEditAuto;
    EANombreAnimal: TEditAuto;
    IBQCargarAnimalExt: TIBQuery;
    DBLCBColor: TDBLookupComboBox;
    IBQColor: TIBQuery;
    DSColor: TDataSource;
    IBQTipoRegistro: TIBQuery;
    DBLCBTipoRegistro: TDBLookupComboBox;
    DSTipoRegistro: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    IBQGenIDExterno: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure IBuscarClick(Sender: TObject);
    procedure BDBGAnimalesCellClick(Column: TColumn);
    procedure ICancelarClick(Sender: TObject);
    procedure IElegirClick(Sender: TObject);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBAceptarMClick(Sender: TObject);
    procedure BBCancelarMClick(Sender: TObject);
    procedure IAgregarAnimalClick(Sender: TObject);
    procedure EARPAnimalChange(Sender: TObject);
    procedure EAApodoAnimalChange(Sender: TObject);
    procedure DBLCBARazaAnimalCloseUp(Sender: TObject);
    procedure EBuscarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure ActivarQuery(query : string);
    function Validar(animal : Integer; RP,SENASA,HBA,RA,OTRO,PC : String) : Boolean;
    procedure ActMadre;

    function AgregarAnimalExterno(sexo : integer) : integer;
  public
    { Public declarations }
    SQLconsulta : string;
    sexo, id_animal : integer;
    RP, HBA, NOMBRE, APODO : string;

    procedure AjustarColumnas;
  end;

var
  FSelAnimalesEmbriones: TFSelAnimalesEmbriones;
  consulta : string;

implementation

uses UMensajesNacimientos, UMensajeHuella, UAbmPadresExternos, IBDButtonABM, UAbmSimple, UDMSoftvet, UEveInseminacionArtificial, UArbolGeneaExterno;

{$R *.dfm}

procedure TFSelAnimalesEmbriones.FormShow(Sender: TObject);
begin
  inherited;

  consulta := SQLconsulta;

  DBLCBASexoMadre.KeyValue := sexo;

  RP := '';
  HBA := '';
  NOMBRE := '';
  APODO := '';

  IBQSexoAnimal.Close;
  IBQSexoAnimal.Open;

  ActivarQuery(consulta);

end;

procedure TFSelAnimalesEmbriones.IBuscarClick(Sender: TObject);
var sql2, sql1 : string;
begin
  inherited;

  if (EBuscar.Text <> '') then
  begin
    if ((owner is TFEveInseminacionArtificial) or (owner is TFArbolGeneaExterno)) then
      sql2 := ' where ((ID_RP LIKE ''%' +EBuscar.Text+ '%'') OR (NOMBRE LIKE ''%' +EBuscar.Text+ '%'') OR (APODO LIKE ''%' +EBuscar.Text+ '%'') OR (ID_HBA LIKE ''%' +EBuscar.Text+ '%''))'
    else
      sql2 := ' and ((ID_RP LIKE ''%' +EBuscar.Text+ '%'') OR (NOMBRE LIKE ''%' +EBuscar.Text+ '%'') OR (APODO LIKE ''%' +EBuscar.Text+ '%'') OR (ID_HBA LIKE ''%' +EBuscar.Text+ '%''))';

    sql1 := consulta + sql2;
    ActivarQuery(sql1);
  end
  else
    ActivarQuery(consulta);

end;

procedure TFSelAnimalesEmbriones.ActivarQuery(query : string);
begin
  IBQAnimales.Close;
  IBQAnimales.SQL.Clear;
  IBQAnimales.SQL.Add(query);

  if (owner is TFArbolGeneaExterno) then
    IBQAnimales.ParamByName('sexo').AsInteger := sexo;

  if (owner is TFEveInseminacionArtificial) then
     IBQAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;

  IBQAnimales.Open;
  IBQAnimales.Last;
  IBQAnimales.First;

  LCantidad.Caption := 'Cantidad de Animales: '+IntToStr(IBQAnimales.RecordCount);
end;

procedure TFSelAnimalesEmbriones.BDBGAnimalesCellClick(Column: TColumn);
begin
  inherited;

  RP := '';
  HBA := '';
  NOMBRE := '';
  APODO := '';

  if (IBQAnimales.FieldValues['id_rp'] <> null) then
    RP := IBQAnimales.FieldValues['id_rp'];

  if (IBQAnimales.FieldValues['id_hba'] <> null) then
    HBA := IBQAnimales.FieldValues['id_hba'];

  if (IBQAnimales.FieldValues['nombre'] <> null) then
    NOMBRE := IBQAnimales.FieldValues['nombre'];

  if (IBQAnimales.FieldValues['apodo'] <> null) then
    APODO := IBQAnimales.FieldValues['apodo'];

  if (owner is TFEveInseminacionArtificial) then
    id_animal := IBQAnimales.FieldValues['id_semen']
  else
    if (owner is TFArbolGeneaExterno) then
      id_animal := IBQAnimales.FieldValues['id_animal']
    else
      id_animal := IBQAnimales.FieldValues['id_animal_externo'];

end;

procedure TFSelAnimalesEmbriones.ICancelarClick(Sender: TObject);
begin
  inherited;
  id_animal := -1;
  close();
end;

procedure TFSelAnimalesEmbriones.IElegirClick(Sender: TObject);
begin
  inherited;
  BDBGAnimalesCellClick(nil);
  close();
end;

procedure TFSelAnimalesEmbriones.BDBGAnimalesDblClick(Sender: TObject);
begin
  inherited;
  BDBGAnimalesCellClick(nil);
  close();
end;

procedure TFSelAnimalesEmbriones.FormCreate(Sender: TObject);
begin
  inherited;

  IBQSexoPadre.Close;
  IBQSexoPadre.Open;

  IBQColor.Close;
  IBQColor.Open;
  IBQColor.Last;
  IBQColor.First;

  DBLCBColor.Enabled := false;

end;

procedure TFSelAnimalesEmbriones.BBAceptarMClick(Sender: TObject);
begin
  inherited;

  IBQGenIDExterno.Close;
  IBQGenIDExterno.Open;


  if Validar(IBQGenIDExterno.FieldValues['IDEXT'],EARPAnimal.Text,EASenasa.Text,EAHBA.Text,EARAAnimal.Text,EAOtroAnimal.Text,EAPCAnimal.Text) then
  begin
    PDatosMadre.Visible := false;
    PDatosMadre.Align := alNone;

    Ptop.Align := alTop;
    PCli.Align := alClient;
    Ptop.Visible := true;
    PCli.Visible := true;

    try

      IBQCargarAnimalExt.Close;
      if (EARPAnimal.Text <> '') then
        IBQCargarAnimalExt.ParamByName('id_rp').AsString := EARPAnimal.Text
      else
        IBQCargarAnimalExt.ParamByName('id_rp').Value := null;

      IBQCargarAnimalExt.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;

      IBQCargarAnimalExt.ParamByName('id_animal_externo').AsInteger := IBQGenIDExterno.FieldValues['IDEXT'];

      if (EASenasa.Text <> '') then
        IBQCargarAnimalExt.ParamByName('id_senasa').AsString := EASenasa.Text
      else
        IBQCargarAnimalExt.ParamByName('id_senasa').Value := null;

      if (EAPCAnimal.Text <> '') then
        IBQCargarAnimalExt.ParamByName('id_pc').AsString := EAPCAnimal.Text
      else
        IBQCargarAnimalExt.ParamByName('id_pc').Value := null;

      if (EAHBA.Text <> '') then
        IBQCargarAnimalExt.ParamByName('id_hba').AsString := EAHBA.Text
      else
        IBQCargarAnimalExt.ParamByName('id_hba').Value := null;

      if (EARAAnimal.Text <> '') then
        IBQCargarAnimalExt.ParamByName('id_ra').AsString := EARAAnimal.Text
      else
        IBQCargarAnimalExt.ParamByName('id_ra').Value := null;

      if (EAOtroAnimal.Text <> '') then
        IBQCargarAnimalExt.ParamByName('id_otro').AsString := EAOtroAnimal.Text
      else
        IBQCargarAnimalExt.ParamByName('id_otro').Value := null;

      if (EANombreAnimal.Text <> '') then
        IBQCargarAnimalExt.ParamByName('nombre').AsString := EANombreAnimal.Text
      else
        IBQCargarAnimalExt.ParamByName('nombre').Value := null;

      if (EAApodoAnimal.Text <> '') then
        IBQCargarAnimalExt.ParamByName('apodo').AsString := EAApodoAnimal.Text
      else
        IBQCargarAnimalExt.ParamByName('apodo').Value := null;

      if (DBLCBARazaAnimal.KeyValue <> null) then
        IBQCargarAnimalExt.ParamByName('raza').AsInteger := DBLCBARazaAnimal.KeyValue
      else
        IBQCargarAnimalExt.ParamByName('raza').Value := null;

      if (DBLCBASexoMadre.KeyValue <> null) then
        IBQCargarAnimalExt.ParamByName('sexo').AsInteger := DBLCBASexoMadre.KeyValue
      else
        IBQCargarAnimalExt.ParamByName('sexo').Value := null;

      if (EACriador.Text <> '') then
        IBQCargarAnimalExt.ParamByName('criador').AsString := EACriador.Text
      else
        IBQCargarAnimalExt.ParamByName('criador').Value := null;

      if (EACriador.Text <> '') then
        IBQCargarAnimalExt.ParamByName('propietario').AsString := EACriador.Text
      else
        IBQCargarAnimalExt.ParamByName('propietario').Value := null;

      IBQCargarAnimalExt.ParamByName('fecha_nacimiento').AsDate := DTPAFechaNacAnimal.Date;

      IBQCargarAnimalExt.ParamByName('adn').Value := null;
      IBQCargarAnimalExt.ParamByName('tipificacion_sanguinea').Value := null;

      IBQCargarAnimalExt.ParamByName('visible').AsString := 'N';

      if (DBLCBColor.KeyValue <> null) then
        IBQCargarAnimalExt.ParamByName('color').AsInteger := DBLCBColor.KeyValue
      else
        IBQCargarAnimalExt.ParamByName('color').Value := null;

      if (DBLCBTipoRegistro.KeyValue <> null) then
        IBQCargarAnimalExt.ParamByName('tipo_registro').AsInteger := DBLCBTipoRegistro.KeyValue
      else
        IBQCargarAnimalExt.ParamByName('tipo_registro').Value := null;

      IBQCargarAnimalExt.Open;

      FPrincipal.IBTPrincipal.CommitRetaining;

      ActivarQuery(consulta);

    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;

  IAgregarAnimal.Visible := true;
  LAgregarAnimal.Visible := true;
  IElegir.Visible := true;
  LElegir.Visible := true;

end;

procedure TFSelAnimalesEmbriones.ActMadre;
begin

end;


procedure TFSelAnimalesEmbriones.BBCancelarMClick(Sender: TObject);
begin
  inherited;
  PDatosMadre.Visible := false;
  PDatosMadre.Align := alNone;
  Ptop.Align := alTop;
  PCli.Align := alClient;
  Ptop.Visible := true;
  PCli.Visible := true;

  IAgregarAnimal.Visible := true;
  LAgregarAnimal.Visible := true;
  IElegir.Visible := true;
  LElegir.Visible := true;

end;

procedure TFSelAnimalesEmbriones.IAgregarAnimalClick(Sender: TObject);
var id_animal : integer;
begin
  inherited;

  id_animal := -1;
  id_animal := AgregarAnimalExterno(sexo);

  if (id_animal <> -1) then
  begin
    ActivarQuery(consulta);

    IBQAnimales.Locate('id_animal',id_animal,[]);

    BDBGAnimalesCellClick(nil);

    close();
  end;

end;

function TFSelAnimalesEmbriones.Validar(animal : Integer; RP,SENASA,HBA,RA,OTRO,PC : String) : Boolean;
var
  resultado : boolean;
  Errores : TStringList;
begin
  Errores := TStringList.Create;
  Errores.Clear;

  IBQRNIdentificacion.Close;
  IBQRNIdentificacion.ParamByName('animal').AsInteger := animal;
  IBQRNIdentificacion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  if (RP <> '') then
    IBQRNIdentificacion.ParamByName('rp').Value := RP
  else
    IBQRNIdentificacion.ParamByName('rp').Value := null;

  if (SENASA <> '') then
    IBQRNIdentificacion.ParamByName('senasa').Value := SENASA
  else
    IBQRNIdentificacion.ParamByName('senasa').Value := null;

  if (PC <> '') then
    IBQRNIdentificacion.ParamByName('pc').Value := PC
  else
    IBQRNIdentificacion.ParamByName('pc').Value := null;

  if (HBA <> '') then
    IBQRNIdentificacion.ParamByName('hba').Value := HBA
  else
    IBQRNIdentificacion.ParamByName('hba').Value := null;

  if (RA <> '') then
    IBQRNIdentificacion.ParamByName('ra').Value := RA
  else
    IBQRNIdentificacion.ParamByName('ra').Value := null;

  if (OTRO <> '') then
    IBQRNIdentificacion.ParamByName('otro').Value := OTRO
  else
    IBQRNIdentificacion.ParamByName('otro').Value := null;
  IBQRNIdentificacion.Open;


  IBQRNIdentificacion.First;
  resultado := IBQRNIdentificacion.FieldByName('result').AsString = 'A';

  if not resultado then
  begin
    while not IBQRNIdentificacion.Eof do
    begin
      Errores.Add(IBQRNIdentificacion.FieldValues['result']+': '+RP+': '+IBQRNIdentificacion.FieldValues['mensaje']);
      IBQRNIdentificacion.Next;
    end;
    MostrarMensajeNacimientos(tmError,'Error de Identificación',Errores);
  end;
  Result := resultado;
end;


procedure TFSelAnimalesEmbriones.EARPAnimalChange(Sender: TObject);
begin
  inherited;
  IAceptarAnimal.Visible := EARPAnimal.PuedeGrabar and DBLCBARazaAnimal.PuedeGrabar and EAApodoAnimal.PuedeGrabar and DBLCBAPropietarioAnimal.PuedeGrabar;
  LGuardar.Visible := IAceptarAnimal.Visible;
end;

procedure TFSelAnimalesEmbriones.EAApodoAnimalChange(Sender: TObject);
begin
  inherited;
  IAceptarAnimal.Visible := EARPAnimal.PuedeGrabar and DBLCBARazaAnimal.PuedeGrabar and EAApodoAnimal.PuedeGrabar and DBLCBAPropietarioAnimal.PuedeGrabar;
  LGuardar.Visible := IAceptarAnimal.Visible;

end;

procedure TFSelAnimalesEmbriones.DBLCBARazaAnimalCloseUp(Sender: TObject);
begin
  inherited;

  if (DBLCBARazaAnimal.KeyValue <> null) then
  begin
    IBQTipoRegistro.Close;
    IBQTipoRegistro.ParamByName('raza').AsInteger := DBLCBARazaAnimal.KeyValue;
    IBQTipoRegistro.Open;
    IBQTipoRegistro.Last;
    IBQTipoRegistro.First;

    if (DBLCBARazaAnimal.KeyValue = 29) then
      DBLCBColor.Enabled := true
    else
      DBLCBColor.Enabled := false;
  end;
end;

function TFSelAnimalesEmbriones.AgregarAnimalExterno(sexo : integer) : integer;
var Iabm: IButtonABM;
    form:TFABMPadresExternos;
    rpAux: String;
begin
  inherited;

  nroID := -1;
  try
    form := TFABMPadresExternos.Create(self);
    Iabm := IButtonABM(form);
    Iabm.IFitrate(sexo,FPrincipal.EstablecimientoActual);
    Iabm.ISetCampoRetorno('id_animal_externo');
    Iabm.IAbrir(faAbm);
    if nroID>-1 then
    begin
        Result := nroID;
        nroID:=-1;
    end;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    MostrarMensaje(tmError, 'No se pudo abrir el formulario de animales externos');
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFSelAnimalesEmbriones.EBuscarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if (key =#13) then
    begin
      IBuscarClick(sender);
      Key:= #0;
    end;
end;

procedure TFSelAnimalesEmbriones.AjustarColumnas;
begin

     BDBGAnimales.Columns[0].Width := 70;
     BDBGAnimales.Columns[1].Width := 70;
     BDBGAnimales.Columns[2].Width := 250;
     BDBGAnimales.Columns[3].Width := 250;
     BDBGAnimales.Columns[4].Width := 70;

end;

end.
