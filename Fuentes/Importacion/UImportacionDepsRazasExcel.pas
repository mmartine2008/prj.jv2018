unit UImportacionDepsRazasExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, DB, IBDatabase, Grids, DBGrids, StdCtrls, ComCtrls,
  IBQuery, WinXP, DataExport, DataToXLS, IBCustomDataSet, IBStoredProc,
  ActnList, ExtCtrls, DateUtils, ADODB, Dbf, VKDBFDataSet, DBTables,
  UBDBGrid, Types, EditAuto, StrUtils, JvExControls, JvLabel, JvGIF,
  PngImage, jpeg, ImgList, PngImageList, Buttons, JvExExtCtrls, JvImage;

type
  TFImportacionDepsRazasExcel = class(TFUniversal)
    PPrincipal: TPanel;
    Label1: TLabel;
    IReferenciaDeps: TImage;
    IImportarArchivo: TImage;
    PGrilla: TPanel;
    BDBGDetalle: TBitDBGrid;
    PIzq: TPanel;
    PSuperior: TPanel;
    PBotones: TPanel;
    Image5: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    BitBtn3: TBitBtn;
    LNombreRaza: TLabel;
    IBQSPImportarDeps: TIBQuery;
    OpenDlg: TOpenDialog;
    IBQExisteAnimal: TIBQuery;
    IBQInsertAux: TIBQuery;
    IBQAnimalesNuevos: TIBQuery;
    IBQFechaNac: TIBQuery;
    IBQNuevos: TIBQuery;
    IBQLimpiarNuevos: TIBQuery;
    IBQAnimales: TIBQuery;
    DSDetalle: TDataSource;
    Label2: TLabel;
    LCancelar: TLabel;
    LTerminar: TLabel;
    ICancelar: TImage;
    ITerminar: TImage;
    IBQGuardarDeps: TIBQuery;
    IBQLimpiarDeps: TIBQuery;
    IBQExisteAnimalExterno: TIBQuery;
    LCantidadAnimales: TLabel;
    IBQHayDatos: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure IImportarArchivoClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
    procedure ITerminarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure CargarDatos;
    procedure CargarDatosDeps(i : integer);
    procedure ImportarDatosAngus(i,j : integer);
    procedure ImportarDatosBraford(i,j : integer);
    procedure ImportarDatosBrahman(i,j : integer);
    procedure ImportarDatosBrangus(i,j : integer);
    procedure ImportarDatosHereford(i,j : integer);
    procedure ImportarDatosShorthorn(i,j : integer);

    procedure AcomodarGrilla;
    procedure PasarAGrilla;
    procedure GuardarDeps;
    procedure LimpiarEstructuras;

    function BuscarAnimal(RP, HBA, FechaN, Sexo, Color : string) : integer;

  public
    { Public declarations }
    NombreRaza, TipoImportacion : string;
    Id_Raza : integer;
  end;

var
  FImportacionDepsRazasExcel: TFImportacionDepsRazasExcel;

implementation

uses UImportacion, UPrincipal, UDMSoftvet, UMensajeNuevosERA, UMensajeHuella, UCartel, UTraduccion, UCargaNuevosDeps;

{$R *.dfm}

procedure TFImportacionDepsRazasExcel.FormShow(Sender: TObject);
begin
  inherited;

  ITerminar.Visible := false;
  LTerminar.Visible := false;

  ICancelar.Visible := false;
  LCancelar.Visible := false;

  PGrilla.Visible := false;
  PGrilla.SendToBack;

  PPrincipal.Visible := true;
  PPrincipal.BringToFront;

  DMSoftvet.IBQDatosAnimal.Close;
  DMSoftvet.IBQDatosAnimal.parambyname('establecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQDatosAnimal.Open;

  dmsoftvet.IBQRodeo.Close;
  dmsoftvet.IBQRodeo.parambyname('esta').AsInteger:=fprincipal.EstablecimientoActual;
  dmsoftvet.IBQRodeo.Open;
  
  dmsoftvet.IBQAnimExt.Close;
  dmsoftvet.IBQAnimExt.ParamByName('establecimiento').AsInteger:=fprincipal.EstablecimientoActual;
  dmsoftvet.IBQAnimExt.Open;

  Self.Height := 640;
  Self.Width := 890;
  Self.Position := poScreenCenter;
  
end;

procedure TFImportacionDepsRazasExcel.IImportarArchivoClick(Sender: TObject);
var archivo : string;
begin
  inherited;

  if OpenDlg.Execute then
  begin
    archivo := OpenDlg.FileName;
    tipoEv := TipoImportacion;
    abrirArchivo(self,archivo);
    try
      cargarDatos;
      PGrilla.Visible := true;
    except
      on E : Exception do
        MostrarMensaje(tmError,'Ocurrió un error en la importación. Por favor verifique la planilla.');
    end;
  end;
  
end;

procedure TFImportacionDepsRazasExcel.ImportarDatosAngus(i,j : integer);
var str : string;
begin
    IBQSPImportarDeps.ParamByName('ESTABLECIMIENTO').AsInteger:=FPrincipal.EstablecimientoActual;

    if anim[i].datos[0] <> '' then
      IBQSPImportarDeps.ParamByName('FUENTE').Value := DMSoftvet.IBQFuentesDeps.Lookup('NOMBRE',anim[i].datos[0],'ID_FUENTE_DEPS');
    if getDatoDEP('crías',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CRIAS').Value:=getDatoDEP('crías',anim[i].arrDEP[j]);
    if getDatoDEP('rodeo',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('RODEO').Value:=DMSoftvet.IBQRodeo.Lookup('NOMBRE',getDatoDEP('rodeo',anim[i].arrDEP[j]),'ID_RODEO');
    if getDatoDEP('gest. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('GESTDEP').Value:=normalizarfloat(getDatoDEP('gest. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('GESTDEP').Value:=null;
    if getDatoDEP('gest. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('GESTPREC').Value:=normalizarfloat(getDatoDEP('gest. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('GESTPREC').Value:=null;
    if getDatoDEP('nacer dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('NACERDEP').Value:=normalizarfloat(getDatoDEP('nacer dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('NACERDEP').Value:=null;
    if getDatoDEP('nacer prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('NACERPREC').Value:=normalizarfloat(getDatoDEP('nacer prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('NACERPREC').Value:=null;
    if getDatoDEP('dest. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('DESTDEP').Value:=normalizarfloat(getDatoDEP('dest. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('DESTDEP').Value:=null;
    if getDatoDEP('dest. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('DESTPREC').Value:=normalizarfloat(getDatoDEP('dest. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('DESTPREC').Value:=null;
    if getDatoDEP('leche dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('LECHEDEP').Value:=normalizarfloat(getDatoDEP('leche dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('LECHEDEP').Value:=null;
    if getDatoDEP('leche prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('LECHEPREC').Value:=normalizarfloat(getDatoDEP('leche prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('LECHEPREC').Value:=null;
    if getDatoDEP('final dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('FINALDEP').Value:=normalizarfloat(getDatoDEP('final dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('FINALDEP').Value:=null;
    if getDatoDEP('final prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('FINALPREC').Value:=normalizarfloat(getDatoDEP('final prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('FINALPREC').Value:=null;
    if getDatoDEP('c.e. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CEDEP').Value:=normalizarfloat(getDatoDEP('c.e. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('CEDEP').Value:=null;
    if getDatoDEP('c.e. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CEPREC').Value:=normalizarfloat(getDatoDEP('c.e. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('CEPREC').Value:=null;
    if getDatoDEP('altura dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('ALTURADEP').Value:=normalizarfloat(getDatoDEP('altura dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('ALTURADEP').Value:=null;
    if getDatoDEP('altura prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('ALTURAPREC').Value:=normalizarfloat(getDatoDEP('altura prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('ALTURAPREC').Value:=null;
    if getDatoDEP('e.g.d. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGDDEP').Value:=normalizarfloat(getDatoDEP('e.g.d. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGDDEP').Value:=null;
    if getDatoDEP('e.g.d. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGDPREC').Value:=normalizarfloat(getDatoDEP('e.g.d. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGDPREC').Value:=null;
    if getDatoDEP('e.g.c. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGCDEP').Value:=normalizarfloat(getDatoDEP('e.g.c. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGCDEP').Value:=null;
    if getDatoDEP('e.g.c. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGCPREC').Value:=normalizarfloat(getDatoDEP('e.g.c. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGCPREC').Value:=null;
    if getDatoDEP('a.o.b. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('AOBDEP').Value:=normalizarfloat(getDatoDEP('a.o.b. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('AOBDEP').Value:=null;
    if getDatoDEP('a.o.b. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('AOBPREC').Value:=normalizarfloat(getDatoDEP('a.o.b. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('AOBPREC').Value:=null;
    if getDatoDEP('% g.i. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('PORGIDEP').Value:=normalizarfloat(getDatoDEP('% g.i. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('PORGIDEP').Value:=null;
    if getDatoDEP('% g.i. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('PORGIPREC').Value:=normalizarfloat(getDatoDEP('% g.i. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('PORGIPREC').Value:=null;
    if getDatoDEP('% c.m. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('PORCMDEP').Value:=normalizarfloat(getDatoDEP('% c.m. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('PORCMDEP').Value:=null;
    if getDatoDEP('% c.m. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('PORCMPREC').Value:=normalizarfloat(getDatoDEP('% c.m. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('PORCMPREC').Value:=null;
end;


procedure TFImportacionDepsRazasExcel.ImportarDatosBraford(i,j : integer);
var str : string;
begin
    IBQSPImportarDeps.ParamByName('ESTABLECIMIENTO').AsInteger:=FPrincipal.EstablecimientoActual;

    if anim[i].datos[0] <> '' then
      IBQSPImportarDeps.ParamByName('FUENTE').Value := DMSoftvet.IBQFuentesDeps.Lookup('NOMBRE',anim[i].datos[0],'ID_FUENTE_DEPS');

    if getDatoDEP('crías',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CRIAS').Value := getDatoDEP('crías',anim[i].arrDEP[j]);

    if getDatoDEP('rodeo',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('RODEO').Value := DMSoftvet.IBQRodeo.Lookup('NOMBRE',getDatoDEP('rodeo',anim[i].arrDEP[j]),'ID_RODEO');

    if getDatoDEP('aptitud materna dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('GESTDEP').Value := normalizarfloat(getDatoDEP('aptitud materna dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('GESTDEP').Value := null;

    if getDatoDEP('aptitud materna prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('GESTPREC').Value := normalizarfloat(getDatoDEP('aptitud materna prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('GESTPREC').Value := null;

    if getDatoDEP('peso al nacer dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('NACERDEP').Value := normalizarfloat(getDatoDEP('peso al nacer dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('NACERDEP').Value := null;

    if getDatoDEP('peso al nacer prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('NACERPREC').Value := normalizarfloat(getDatoDEP('peso al nacer prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('NACERPREC').Value := null;

    if getDatoDEP('peso al destete dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('DESTDEP').Value := normalizarfloat(getDatoDEP('peso al destete dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('DESTDEP').Value := null;

    if getDatoDEP('peso al destete prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('DESTPREC').Value := normalizarfloat(getDatoDEP('peso al destete prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('DESTPREC').Value := null;

    if getDatoDEP('Leche & crecim. DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('LECHEDEP').Value := normalizarfloat(getDatoDEP('Leche & crecim. DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('LECHEDEP').Value := null;

    IBQSPImportarDeps.ParamByName('LECHEPREC').Value := null;

    if getDatoDEP('peso final dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('FINALDEP').Value := normalizarfloat(getDatoDEP('peso final dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('FINALDEP').Value := null;

    if getDatoDEP('peso final prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('FINALPREC').Value := normalizarfloat(getDatoDEP('peso final prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('FINALPREC').Value := null;

    if getDatoDEP('c.e. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CEDEP').Value := normalizarfloat(getDatoDEP('c.e. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('CEDEP').Value := null;

    if getDatoDEP('c.e. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CEPREC').Value := normalizarfloat(getDatoDEP('c.e. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('CEPREC').Value := null;

    IBQSPImportarDeps.ParamByName('ALTURADEP').Value := null;
    IBQSPImportarDeps.ParamByName('ALTURAPREC').Value := null;
    IBQSPImportarDeps.ParamByName('EGDDEP').Value := null;
    IBQSPImportarDeps.ParamByName('EGDPREC').Value := null;
    IBQSPImportarDeps.ParamByName('EGCDEP').Value := null;
    IBQSPImportarDeps.ParamByName('EGCPREC').Value := null;
    IBQSPImportarDeps.ParamByName('AOBDEP').Value := null;
    IBQSPImportarDeps.ParamByName('AOBPREC').Value := null;
    IBQSPImportarDeps.ParamByName('PORGIDEP').Value := null;
    IBQSPImportarDeps.ParamByName('PORGIPREC').Value := null;
    IBQSPImportarDeps.ParamByName('PORCMDEP').Value := null;
    IBQSPImportarDeps.ParamByName('PORCMPREC').Value := null;
end;


procedure TFImportacionDepsRazasExcel.ImportarDatosBrahman(i,j : integer);
var str : string;
begin
    IBQSPImportarDeps.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;

    if anim[i].datos[0] <> '' then
      IBQSPImportarDeps.ParamByName('FUENTE').Value := DMSoftvet.IBQFuentesDeps.Lookup('NOMBRE',anim[i].datos[0],'ID_FUENTE_DEPS');

    if getDatoDEP('crías',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CRIAS').Value := getDatoDEP('crías',anim[i].arrDEP[j]);

    if getDatoDEP('cabaña',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('RODEO').Value := DMSoftvet.IBQRodeo.Lookup('NOMBRE',getDatoDEP('cabaña',anim[i].arrDEP[j]),'ID_RODEO');

    if getDatoDEP('aptitud materna dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('GESTDEP').Value := normalizarfloat(getDatoDEP('aptitud materna dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('GESTDEP').Value := null;

    if getDatoDEP('aptitud materna prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('GESTPREC').Value := normalizarfloat(getDatoDEP('aptitud materna prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('GESTPREC').Value := null;

    if getDatoDEP('peso al nacer dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('NACERDEP').Value := normalizarfloat(getDatoDEP('peso al nacer dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('NACERDEP').Value := null;

    if getDatoDEP('peso al nacer prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('NACERPREC').Value := normalizarfloat(getDatoDEP('peso al nacer prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('NACERPREC').Value := null;

    if getDatoDEP('peso al destete dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('DESTDEP').Value := normalizarfloat(getDatoDEP('peso al destete dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('DESTDEP').Value := null;

    if getDatoDEP('peso al destete prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('DESTPREC').Value := normalizarfloat(getDatoDEP('peso al destete prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('DESTPREC').Value:=null;
      
    if getDatoDEP('Leche & crecim. DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('LECHEDEP').Value := normalizarfloat(getDatoDEP('Leche & crecim. DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('LECHEDEP').Value := null;

    IBQSPImportarDeps.ParamByName('LECHEPREC').Value := null;

    if getDatoDEP('peso final dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('FINALDEP').Value := normalizarfloat(getDatoDEP('peso final dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('FINALDEP').Value := null;

    if getDatoDEP('peso final prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('FINALPREC').Value := normalizarfloat(getDatoDEP('peso final prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('FINALPREC').Value := null;

    if getDatoDEP('Circun. Escrotal DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CEDEP').Value := normalizarfloat(getDatoDEP('Circun. Escrotal DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('CEDEP').Value := null;

    if getDatoDEP('Circun. Escrotal Prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CEPREC').Value := normalizarfloat(getDatoDEP('Circun. Escrotal Prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('CEPREC').Value := null;
      
    IBQSPImportarDeps.ParamByName('ALTURADEP').Value := null;
    IBQSPImportarDeps.ParamByName('ALTURAPREC').Value := null;
    IBQSPImportarDeps.ParamByName('EGDDEP').Value := null;
    IBQSPImportarDeps.ParamByName('EGDPREC').Value := null;
    IBQSPImportarDeps.ParamByName('EGCDEP').Value := null;
    IBQSPImportarDeps.ParamByName('EGCPREC').Value := null;
    IBQSPImportarDeps.ParamByName('AOBDEP').Value := null;
    IBQSPImportarDeps.ParamByName('AOBPREC').Value := null;
    IBQSPImportarDeps.ParamByName('PORGIDEP').Value := null;
    IBQSPImportarDeps.ParamByName('PORGIPREC').Value := null;
    IBQSPImportarDeps.ParamByName('PORCMDEP').Value := null;
    IBQSPImportarDeps.ParamByName('PORCMPREC').Value := null;
end;


procedure TFImportacionDepsRazasExcel.ImportarDatosBrangus(i,j : integer);
var str : string;
begin
    IBQSPImportarDeps.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;

    if anim[i].datos[0] <> '' then
      IBQSPImportarDeps.ParamByName('FUENTE').Value := DMSoftvet.IBQFuentesDeps.Lookup('NOMBRE',anim[i].datos[0],'ID_FUENTE_DEPS');

    if getDatoDEP('crías',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CRIAS').Value := getDatoDEP('crías',anim[i].arrDEP[j]);

    if getDatoDEP('cabaña',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('RODEO').Value := DMSoftvet.IBQRodeo.Lookup('NOMBRE',getDatoDEP('cabaña',anim[i].arrDEP[j]),'ID_RODEO');

    if getDatoDEP('aptitud materna dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('GESTDEP').Value := normalizarfloat(getDatoDEP('aptitud materna dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('GESTDEP').Value := null;

    if getDatoDEP('aptitud materna prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('GESTPREC').Value := normalizarfloat(getDatoDEP('aptitud materna prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('GESTPREC').Value := null;

    if getDatoDEP('peso al nacer dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('NACERDEP').Value := normalizarfloat(getDatoDEP('peso al nacer dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('NACERDEP').Value := null;

    if getDatoDEP('peso al nacer prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('NACERPREC').Value := normalizarfloat(getDatoDEP('peso al nacer prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('NACERPREC').Value := null;

    if getDatoDEP('peso al destete dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('DESTDEP').Value := normalizarfloat(getDatoDEP('peso al destete dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('DESTDEP').Value := null;

    if getDatoDEP('peso al destete prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('DESTPREC').Value := normalizarfloat(getDatoDEP('peso al destete prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('DESTPREC').Value := null;
      
    if getDatoDEP('Leche & Crecim DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('LECHEDEP').Value := normalizarfloat(getDatoDEP('Leche & Crecim DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('LECHEDEP').Value := null;

    IBQSPImportarDeps.ParamByName('LECHEPREC').Value := null;

    if getDatoDEP('peso final dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('FINALDEP').Value := normalizarfloat(getDatoDEP('peso final dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('FINALDEP').Value := null;

    if getDatoDEP('peso final prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('FINALPREC').Value := normalizarfloat(getDatoDEP('peso final prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('FINALPREC').Value := null;
      
    if getDatoDEP('Circun. Escrotal DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CEDEP').Value := normalizarfloat(getDatoDEP('Circun. Escrotal DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('CEDEP').Value := null;
      
    if getDatoDEP('Circun. Escrotal Prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CEPREC').Value := normalizarfloat(getDatoDEP('Circun. Escrotal Prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('CEPREC').Value := null;

    IBQSPImportarDeps.ParamByName('ALTURADEP').Value := null;
    IBQSPImportarDeps.ParamByName('ALTURAPREC').Value := null;
    
    if getDatoDEP('Grasa dorsal DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGDDEP').Value := normalizarfloat(getDatoDEP('Grasa dorsal DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGDDEP').Value := null;

    if getDatoDEP('Grasa dorsal Prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGDPREC').Value := normalizarfloat(getDatoDEP('Grasa dorsal Prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGDPREC').Value := null;
      
    if getDatoDEP('Grasa de cadera DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGCDEP').Value := normalizarfloat(getDatoDEP('Grasa de cadera DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGCDEP').Value := null;
      
    if getDatoDEP('Grasa de cadera Prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGCPREC').Value := normalizarfloat(getDatoDEP('Grasa de cadera Prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGCPREC').Value := null;
      
    if getDatoDEP('Area de ojo de bife DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('AOBDEP').Value := normalizarfloat(getDatoDEP('Area de ojo de bife DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('AOBDEP').Value := null;

    if getDatoDEP('Area de ojo de bife Prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('AOBPREC').Value := normalizarfloat(getDatoDEP('Area de ojo de bife Prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('AOBPREC').Value := null;
      
    if getDatoDEP('% G.I. DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('PORGIDEP').Value := normalizarfloat(getDatoDEP('% G.I. DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('PORGIDEP').Value := null;

    if getDatoDEP('% G.I. Prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('PORGIPREC').Value := normalizarfloat(getDatoDEP('% G.I. Prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('PORGIPREC').Value := null;

    IBQSPImportarDeps.ParamByName('PORCMDEP').Value := null;
    IBQSPImportarDeps.ParamByName('PORCMPREC').Value := null;
end;



procedure TFImportacionDepsRazasExcel.ImportarDatosHereford(i,j : integer);
var str : string;
begin

    IBQSPImportarDeps.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;

    if anim[i].datos[0] <> '' then
      IBQSPImportarDeps.ParamByName('FUENTE').Value := DMSoftvet.IBQFuentesDeps.Lookup('NOMBRE',anim[i].datos[0],'ID_FUENTE_DEPS');

    if getDatoDEP('hijas',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CRIAS').Value := getDatoDEP('hijas',anim[i].arrDEP[j]);

    if getDatoDEP('rodeos',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('RODEO').Value:=DMSoftvet.IBQRodeo.Lookup('NOMBRE',getDatoDEP('rodeos',anim[i].arrDEP[j]),'ID_RODEO');

    if getDatoDEP('LM DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('GESTDEP').Value := normalizarfloat(getDatoDEP('LM DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('GESTDEP').Value := null;

    if getDatoDEP('LM Prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('GESTPREC').Value := normalizarfloat(getDatoDEP('LM Prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('GESTPREC').Value := null;
      
    if getDatoDEP('PN DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('NACERDEP').Value := normalizarfloat(getDatoDEP('PN DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('NACERDEP').Value := null;

    if getDatoDEP('PN Prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('NACERPREC').Value := normalizarfloat(getDatoDEP('PN Prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('NACERPREC').Value := null;
      
    if getDatoDEP('PD DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('DESTDEP').Value := normalizarfloat(getDatoDEP('PD DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('DESTDEP').Value := null;

    if getDatoDEP('PD Prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('DESTPREC').Value := normalizarfloat(getDatoDEP('PD Prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('DESTPREC').Value := null;
      
    if getDatoDEP('L&C DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('LECHEDEP').Value := normalizarfloat(getDatoDEP('L&C DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('LECHEDEP').Value := null;

    IBQSPImportarDeps.ParamByName('LECHEPREC').Value := null;

    if getDatoDEP('PF DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('FINALDEP').Value := normalizarfloat(getDatoDEP('PF DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('FINALDEP').Value := null;

    if getDatoDEP('PF Prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('FINALPREC').Value := normalizarfloat(getDatoDEP('PF Prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('FINALPREC').Value := null;
      
    if getDatoDEP('CE DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CEDEP').Value := normalizarfloat(getDatoDEP('CE DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('CEDEP').Value := null;

    if getDatoDEP('CE Prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CEPREC').Value := normalizarfloat(getDatoDEP('CE Prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('CEPREC').Value := null;
      
    if getDatoDEP('Prog Eco',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('ALTURADEP').Value := normalizarfloat(getDatoDEP('Prog Eco',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('ALTURADEP').Value := null;

    IBQSPImportarDeps.ParamByName('ALTURAPREC').Value := null;

    if getDatoDEP('GD DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGDDEP').Value := normalizarfloat(getDatoDEP('GD DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGDDEP').Value := null;

    if getDatoDEP('GD Prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGDPREC').Value := normalizarfloat(getDatoDEP('GD Prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGDPREC').Value := null;

    if getDatoDEP('PA DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGCDEP').Value := normalizarfloat(getDatoDEP('PA DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGCDEP').Value := null;

    if getDatoDEP('PA Prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGCPREC').Value := normalizarfloat(getDatoDEP('PA Prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGCPREC').Value := null;
      
    if getDatoDEP('AOB DEP',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('AOBDEP').Value := normalizarfloat(getDatoDEP('AOB DEP',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('AOBDEP').Value := null;

    if getDatoDEP('AOB Prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('AOBPREC').Value := normalizarfloat(getDatoDEP('AOB Prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('AOBPREC').Value := null;

    if getDatoDEP('Prog',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('PORGIDEP').Value := normalizarfloat(getDatoDEP('Prog',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('PORGIDEP').Value := null;

    IBQSPImportarDeps.ParamByName('PORGIPREC').Value := null;
    IBQSPImportarDeps.ParamByName('PORCMDEP').Value := null;
    IBQSPImportarDeps.ParamByName('PORCMPREC').Value := null;
end;


procedure TFImportacionDepsRazasExcel.ImportarDatosShorthorn(i,j : integer);
var str : string;
begin
    IBQSPImportarDeps.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;

    if anim[i].datos[0] <> '' then
      IBQSPImportarDeps.ParamByName('FUENTE').Value := DMSoftvet.IBQFuentesDeps.Lookup('NOMBRE',anim[i].datos[0],'ID_FUENTE_DEPS');

    if getDatoDEP('crías',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CRIAS').Value := getDatoDEP('crías',anim[i].arrDEP[j]);

    if getDatoDEP('rod.',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('RODEO').Value := DMSoftvet.IBQRodeo.Lookup('NOMBRE',getDatoDEP('rod.',anim[i].arrDEP[j]),'ID_RODEO');

    if getDatoDEP('gest. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('GESTDEP').Value := normalizarfloat(getDatoDEP('gest. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('GESTDEP').Value := null;

    if getDatoDEP('gest. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('GESTPREC').Value := normalizarfloat(getDatoDEP('gest. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('GESTPREC').Value := null;

    if getDatoDEP('nacer dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('NACERDEP').Value := normalizarfloat(getDatoDEP('nacer dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('NACERDEP').Value := null;

    if getDatoDEP('nacer prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('NACERPREC').Value := normalizarfloat(getDatoDEP('nacer prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('NACERPREC').Value := null;

    if getDatoDEP('dest. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('DESTDEP').Value := normalizarfloat(getDatoDEP('dest. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('DESTDEP').Value := null;

    if getDatoDEP('dest. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('DESTPREC').Value := normalizarfloat(getDatoDEP('dest. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('DESTPREC').Value := null;

    if getDatoDEP('leche dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('LECHEDEP').Value := normalizarfloat(getDatoDEP('leche dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('LECHEDEP').Value := null;

    if getDatoDEP('leche prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('LECHEPREC').Value := normalizarfloat(getDatoDEP('leche prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('LECHEPREC').Value := null;

    if getDatoDEP('final dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('FINALDEP').Value := normalizarfloat(getDatoDEP('final dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('FINALDEP').Value := null;

    if getDatoDEP('final prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('FINALPREC').Value := normalizarfloat(getDatoDEP('final prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('FINALPREC').Value := null;

    if getDatoDEP('c.e. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CEDEP').Value := normalizarfloat(getDatoDEP('c.e. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('CEDEP').Value := null;
      
    if getDatoDEP('c.e. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('CEPREC').Value := normalizarfloat(getDatoDEP('c.e. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('CEPREC').Value := null;
      
    if getDatoDEP('altura dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('ALTURADEP').Value := normalizarfloat(getDatoDEP('altura dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('ALTURADEP').Value := null;
      
    if getDatoDEP('altura prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('ALTURAPREC').Value := normalizarfloat(getDatoDEP('altura prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('ALTURAPREC').Value := null;

    if getDatoDEP('e.g.d. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGDDEP').Value := normalizarfloat(getDatoDEP('e.g.d. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGDDEP').Value := null;
      
    if getDatoDEP('e.g.d. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGDPREC').Value := normalizarfloat(getDatoDEP('e.g.d. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGDPREC').Value := null;
      
    if getDatoDEP('e.g.c. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGCDEP').Value := normalizarfloat(getDatoDEP('e.g.c. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGCDEP').Value := null;
      
    if getDatoDEP('e.g.c. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('EGCPREC').Value := normalizarfloat(getDatoDEP('e.g.c. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('EGCPREC').Value := null;
      
    if getDatoDEP('a.o.b. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('AOBDEP').Value := normalizarfloat(getDatoDEP('a.o.b. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('AOBDEP').Value := null;

    if getDatoDEP('a.o.b. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('AOBPREC').Value := normalizarfloat(getDatoDEP('a.o.b. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('AOBPREC').Value := null;

    if getDatoDEP('% g.i. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('PORGIDEP').Value := normalizarfloat(getDatoDEP('% g.i. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('PORGIDEP').Value := null;

    if getDatoDEP('% g.i. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('PORGIPREC').Value := normalizarfloat(getDatoDEP('% g.i. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('PORGIPREC').Value := null;

    if getDatoDEP('% c.m. dep',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('PORCMDEP').Value := normalizarfloat(getDatoDEP('% c.m. dep',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('PORCMDEP').Value := null;

    if getDatoDEP('% c.m. prec',anim[i].arrDEP[j])<>'' then
      IBQSPImportarDeps.ParamByName('PORCMPREC').Value := normalizarfloat(getDatoDEP('% c.m. prec',anim[i].arrDEP[j]))
    else
      IBQSPImportarDeps.ParamByName('PORCMPREC').Value := null;

end;



procedure TFImportacionDepsRazasExcel.CargarDatos;
var i, cantidad, cantNoExist, animal : integer;
    nombre_animal, fecha_nac, identificador_animal, rp_planilla, rp_animal, sexo_animal, color_animal : string;
    F : TFCargaNuevosDeps;
    Termina : boolean;
begin

    DMSoftvet.IBQFuentesDeps.Close;
    DMsoftvet.IBQFuentesDeps.Open;

    cantidad := 0;
    cantNoExist := 0;

    for i := 0 to Length(anim)-1 do
    begin
        nombre_animal := getDatoDEP('nombre',anim[i].arrdep[0]);       //getDato('nombre',anim[i]);
        fecha_nac := getDatoDEP('fecha nacimiento',anim[i].arrdep[0]); //getDato('fecha nacimiento',anim[i]);
        identificador_animal := getDatoDEP('hb',anim[i].arrdep[0]);    //getDato('hba*',anim[i]);
        rp_animal := getDatoDEP('rp animal',anim[i].arrdep[0]);        //getDato('rp animal*',anim[i]);
        sexo_animal := getDatoDEP('sexo',anim[i].arrdep[0]);           //getDato('sexo*',anim[i]);
        color_animal := getDatoDep('color',anim[i].arrdep[0]);

        animal := BuscarAnimal(rp_animal,identificador_animal,fecha_nac,sexo_animal,color_animal);

        if (animal <> -1) then
        begin
            try
                Inc(Cantidad);
                anim[i].id := animal;
                CargarDatosDeps(i);      //Estos datos los carga en la tabla Aux_Imp_Era
                IBQSPImportarDeps.ExecSQL;
                IBQSPImportarDeps.Transaction.CommitRetaining;
            except
                IBQSPImportarDeps.Transaction.RollbackRetaining;
                raise Exception.Create('Error en la carga de DEPs');
                break;
            end;
        end
        else
        begin
             Inc(CantNoExist);

             //---Cargo aquellos animales que no estan en el sistema en: Aux_Animales
             try
                IBQNuevos.Close;
                IBQNuevos.ParamByName('rp').AsString := rp_animal;
                IBQNuevos.ParamByName('identificador').AsString := identificador_animal;
                IBQNuevos.ParamByName('nombre').AsString := nombre_animal;
                if (UpperCase(sexo_animal) = 'MACHO') then
                  IBQNuevos.ParamByName('sexo').AsInteger := 1;

                if (UpperCase(sexo_animal) = 'HEMBRA') then
                  IBQNuevos.ParamByName('sexo').AsInteger := 2;

                if ((fecha_nac <> '') and (fecha_nac <> null)) then
                  IBQNuevos.ParamByName('fechanac').AsDate := StrToDate(fecha_nac)
                else
                  IBQNuevos.ParamByName('fechanac').Value := null;

                IBQNuevos.ParamByName('nomsexo').AsString := UpperCase(sexo_animal);
                IBQNuevos.ParamByName('raza').AsInteger := Id_Raza;
                IBQNuevos.ParamByName('color').AsInteger := 0;
                IBQNuevos.Open;

                FPrincipal.IBTPrincipal.CommitRetaining;
             except
                FPrincipal.IBTPrincipal.RollbackRetaining;
             end;

             try
                CargarDatosDeps(i);      //Estos datos los carga en la tabla Aux_Imp_Era
                IBQSPImportarDeps.ExecSQL;
                IBQSPImportarDeps.Transaction.CommitRetaining;
            except
                IBQSPImportarDeps.Transaction.RollbackRetaining;
                raise Exception.Create('Error en la carga de DEPs');
                break;
            end;
        end;
    end;

    Termina := false;

    if (cantNoExist > 0) then
    begin
         F := TFCargaNuevosDeps.Create(self);
         F.ShowModal;
         Termina := F.NoGuarda;
         F.Destroy;
    end;


    if not(Termina) then
    begin
        ISalir.Visible := false;
        LSalir.Visible := false;

        ITerminar.Visible := true;
        LTerminar.Visible := true;
        ICancelar.Visible := true;
        LCancelar.Visible := true;

        IBQHayDatos.Close;
        IBQHayDatos.Open;
        IBQHayDatos.Last;
        IBQHayDatos.First;

        if (IBQHayDatos.RecordCount > 0) then
        begin
            AcomodarGrilla;
            PasarAGrilla;
        end;
    end
    else
        ICancelarClick(self);        

end;

procedure TFImportacionDepsRazasExcel.CargarDatosDeps(i:integer);
var j : integer;
    fecha_nac : string;
begin
  for j := 0 to Length(anim[i].arrDEP)-1 do
  begin
            IBQSPImportarDeps.ParamByName('ANIO').AsInteger := getDatoDEP('año',anim[i].arrDEP[j]);
            IBQSPImportarDeps.ParamByName('ANIMAL').Value := anim[i].id;
            IBQSPImportarDeps.ParamByName('RP').AsString := getDatoDEP('rp animal',anim[i].arrdep[j]);

            if ((DMSoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',anim[i].id,'ID_RP')<>null))then
            begin
              if (dmsoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',anim[i].id,'ID_HBA')<>null) and (dmsoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',anim[i].id,'ID_HBA')<>'') then
              begin
                if (dmsoftvet.IBQDatosAnimal.Lookup('ID_HBA',getDatoDEP('hb',anim[i].arrDEP[j]
                ),'ID_HBA')<>null) then
                begin
                  IBQSPImportarDeps.ParamByName('HBA').Value := getDatoDEP('hb',anim[i].arrDEP[j]); //null;
                  IBQSPImportarDeps.ParamByName('TIPO_ANIMAL').AsString:='I';
                end
                else
                begin
                  IBQSPImportarDeps.ParamByName('TIPO_ANIMAL').AsString:='E';
                  fecha_nac := getDatoDEP('fecha nac',anim[i].arrDEP[j]);
                  if ((dmsoftvet.IBQAnimExt.Lookup('ID_ANIMAL_EXTERNO',anim[i].id,'FECHA_NACIMIENTO')='1/1/1900')) and (fecha_nac <> '') then
                  begin
                    IBQFechaNac.Close;
                    IBQFechaNac.ParamByName('id').AsInteger:=anim[i].id;
                    IBQFechaNac.ParamByName('fecha').AsDate:=strtoDate(fecha_nac);
                    IBQFechaNac.Open;
                  end;
                  if (dmsoftvet.IBQAnimExt.Lookup('ID_ANIMAL_EXTERNO',anim[i].id,'ID_HBA') <> null) and (dmsoftvet.IBQAnimExt.Lookup('ID_ANIMAL_EXTERNO',anim[i].id,'ID_HBA') <> '') then
                    IBQSPImportarDeps.ParamByName('HBA').Value := null
                  else
                    IBQSPImportarDeps.ParamByName('HBA').Value := getDatoDEP('hb',anim[i].arrDEP[j]);
                end;
              end
              else
              begin
                IBQSPImportarDeps.ParamByName('HBA').Value := getDatoDEP('hb',anim[i].arrDEP[j]);
                IBQSPImportarDeps.ParamByName('TIPO_ANIMAL').AsString:='I';
              end
            end
            else
            begin
              IBQSPImportarDeps.ParamByName('TIPO_ANIMAL').AsString:='E';
              fecha_nac := getDatoDEP('fecha nac',anim[i].arrDEP[j]);
              if ((dmsoftvet.IBQAnimExt.Lookup('ID_ANIMAL_EXTERNO',anim[i].id,'FECHA_NACIMIENTO')='1/1/1900')) and (fecha_nac <> '') then
              begin
                IBQFechaNac.Close;
                IBQFechaNac.ParamByName('id').AsInteger:=anim[i].id;
                IBQFechaNac.ParamByName('fecha').AsDate:=strtoDate(fecha_nac);
                IBQFechaNac.Open;
              end;
              if (dmsoftvet.IBQAnimExt.Lookup('ID_ANIMAL_EXTERNO',anim[i].id,'ID_HBA') <> null) and (dmsoftvet.IBQAnimExt.Lookup('ID_ANIMAL_EXTERNO',anim[i].id,'ID_HBA') <> '') then
                IBQSPImportarDeps.ParamByName('HBA').Value := getDatoDEP('hb',anim[i].arrDEP[j])
              else
                IBQSPImportarDeps.ParamByName('HBA').Value := getDatoDEP('hb',anim[i].arrDEP[j]);
            end;

            if (Id_Raza = 29) then
              ImportarDatosAngus(i,j);

            if (Id_Raza = 11) then
              ImportarDatosBraford(i,j);

            if (Id_Raza = 10) then
              ImportarDatosBrahman(i,j);

            if (Id_Raza = 12) then
              ImportarDatosBrangus(i,j);

            if (Id_Raza = 4) then
              ImportarDatosHereford(i,j);

            if (id_Raza = 7) then
              ImportarDatosShorthorn(i,j);
  end;
end;


function TFImportacionDepsRazasExcel.BuscarAnimal(RP, HBA, FechaN, Sexo, Color : string) : integer;
var Animal, SexoVal : Integer;
    AuxRp, AuxHBA : String;
    Fecha : TDateTime;
begin
  Animal := -1;

  if (rp <> '') then
  begin
    AuxRP := Trim(RP);
    AuxHBA := Trim(HBA);

    IBQExisteAnimal.Close;
    IBQExisteAnimal.ParamByName('RP').Value := AuxRp;
    IBQExisteAnimal.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
    IBQExisteAnimal.Open;

    if not(IBQExisteAnimal.IsEmpty) then       //Existe el RP del animal
    begin
          if ((FechaN <> '') and (Sexo <> '')) then
          begin
                if ((UpperCase(Trim(Sexo)) = 'MACHO')) then
                    SexoVal := 1;

                if ((UpperCase(Trim(Sexo)) = 'HEMBRA')) then
                    SexoVal := 2;

                Fecha := StrToDateTime(FechaN);

                IBQExisteAnimal.First;

                if (IBQExisteAnimal.Locate('ID_HBA;FECHA_NACIMIENTO;SEXO',VarArrayOf([AuxHBA,Fecha,SexoVal]),[])) then
                begin
                      Animal := IBQExisteAnimal.FieldValues['id_animal'];
                end
                else
                    if (IBQExisteAnimal.Locate('FECHA_NACIMIENTO;SEXO',VarArrayOf([Fecha,SexoVal]),[])) then
                    begin
                          Animal := IBQExisteAnimal.FieldValues['id_animal'];
                    end
                    else
                          Animal := -1;
          end;
    end
    else   //el RP no existe como interno
    begin
          IBQExisteAnimalExterno.Close;
          IBQExisteAnimalExterno.ParamByName('RP').Value := AuxRp;
          IBQExisteAnimalExterno.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
          IBQExisteAnimalExterno.Open;

          if not(IBQExisteAnimalExterno.IsEmpty) then       //Existe el RP del animal como externo
          begin
                if ((FechaN <> '') and (Sexo <> '')) then
                begin
                      if ((UpperCase(Trim(Sexo)) = 'MACHO')) then
                          SexoVal := 1;

                      if ((UpperCase(Trim(Sexo)) = 'HEMBRA')) then
                          SexoVal := 2;

                      Fecha := StrToDateTime(FechaN);

                      IBQExisteAnimalExterno.First;

                      if (IBQExisteAnimalExterno.Locate('ID_HBA;FECHA_NACIMIENTO;SEXO',VarArrayOf([AuxHBA,Fecha,SexoVal]),[])) then
                      begin
                            Animal := IBQExisteAnimalExterno.FieldValues['id_animal_externo'];
                      end
                      else
                          if (IBQExisteAnimalExterno.Locate('FECHA_NACIMIENTO;SEXO',VarArrayOf([Fecha,SexoVal]),[])) then
                          begin
                                Animal := IBQExisteAnimalExterno.FieldValues['id_animal_externo'];
                          end
                          else
                                Animal := -1;
                end;
          end
          else //Rp no existe ni como interno, ni como externo.
              Animal := -1;
    end;
  end;

  Result := Animal;
end;

procedure TFImportacionDepsRazasExcel.PasarAGrilla;
begin

     IBQAnimales.Close;
     IBQAnimales.Open;
     IBQAnimales.Last;
     IBQAnimales.First;

     LCantidadAnimales.Caption := LCantidadAnimales.Caption + ' ' + IntToStr(IBQAnimales.RecordCount);

     PPrincipal.Align := alNone;
     PPrincipal.Visible := false;
     PPrincipal.SendToBack;

     PGrilla.Align := alClient;
     PGrilla.Visible := true;
     PGrilla.BringToFront;

     Self.Height := 730;
     Self.Width := 940;
     Self.Top := 2;
     
end;



procedure TFImportacionDepsRazasExcel.ISalirClick(Sender: TObject);
begin
  inherited;

  LimpiarEstructuras;

  Close();
end;

procedure TFImportacionDepsRazasExcel.ICancelarClick(Sender: TObject);
begin
  inherited;

  LimpiarEstructuras;

  Close();
end;

procedure TFImportacionDepsRazasExcel.ITerminarClick(Sender: TObject);
begin
  inherited;

  try
    GuardarDeps;

    LimpiarEstructuras;

    MostrarMensaje(tmInformacion,'Los DEPs de los animales se guardaron correctamente.');
  except
    MostrarMensaje(tmInformacion,'Ocurrió un error inesperado, los datos no han sido guardados.');
  end;

  Close();
end;

procedure TFImportacionDepsRazasExcel.GuardarDeps;
begin

    try
      IBQGuardarDeps.Close;
      IBQGuardarDeps.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
    
end;

procedure TFImportacionDepsRazasExcel.AcomodarGrilla;
var i : integer;
begin

     BDBGDetalle.Columns[0].Title.Caption := 'Rp Animal';
     BDBGDetalle.Columns[0].Width := 80;
     BDBGDetalle.Columns[2].Title.Caption := 'Fecha Nac.';
     BDBGDetalle.Columns[2].Width := 70;

     for i := 5 to 28 do
     begin
          BDBGDetalle.Columns[i].Width := 70;
          BDBGDetalle.Columns[i].Visible := false;
     end;

     if ((Id_Raza = 29) or (Id_Raza = 7)) then
     begin
          BDBGDetalle.Columns[1].Width := 80;

          BDBGDetalle.Columns[5].Title.Caption := 'Gest. DEP';
          BDBGDetalle.Columns[6].Title.Caption := 'Gest. PREC';
          BDBGDetalle.Columns[7].Title.Caption := 'Nacer DEP';
          BDBGDetalle.Columns[8].Title.Caption := 'Nacer PREC';
          BDBGDetalle.Columns[9].Title.Caption := 'Dest. DEP';
          BDBGDetalle.Columns[10].Title.Caption := 'Dest. PREC';
          BDBGDetalle.Columns[11].Title.Caption := 'Leche DEP';
          BDBGDetalle.Columns[12].Title.Caption := 'Leche PREC';
          BDBGDetalle.Columns[13].Title.Caption := 'Final DEP';
          BDBGDetalle.Columns[14].Title.Caption := 'Final PREC';
          BDBGDetalle.Columns[15].Title.Caption := 'C.E. DEP';
          BDBGDetalle.Columns[16].Title.Caption := 'C.E. PREC';
          BDBGDetalle.Columns[17].Title.Caption := 'Altura DEP';
          BDBGDetalle.Columns[18].Title.Caption := 'Altura PREC';
          BDBGDetalle.Columns[19].Title.Caption := 'EGD DEP';
          BDBGDetalle.Columns[20].Title.Caption := 'EGD PREC';
          BDBGDetalle.Columns[21].Title.Caption := 'EGC DEP';
          BDBGDetalle.Columns[22].Title.Caption := 'EGC PREC';
          BDBGDetalle.Columns[23].Title.Caption := 'AOB DEP';
          BDBGDetalle.Columns[24].Title.Caption := 'AOB PREC';
          BDBGDetalle.Columns[25].Title.Caption := '%GI DEP';
          BDBGDetalle.Columns[26].Title.Caption := '%GI PREC';
          BDBGDetalle.Columns[27].Title.Caption := '%CM DEP';
          BDBGDetalle.Columns[28].Title.Caption := '%CM PREC';

          for i := 5 to 28 do
          begin
               BDBGDetalle.Columns[i].Visible := true;
          end;
     end;

     if (Id_Raza = 11) then
     begin
          BDBGDetalle.Columns[1].Width := 80;

          BDBGDetalle.Columns[5].FieldName := 'NACERDEP';
          BDBGDetalle.Columns[5].Title.Caption := 'Peso Nacer DEP';
          BDBGDetalle.Columns[5].Width := 120;
          BDBGDetalle.Columns[5].Visible := true;

          BDBGDetalle.Columns[6].FieldName := 'NACERPREC';
          BDBGDetalle.Columns[6].Title.Caption := 'Peso Nacer PREC';
          BDBGDetalle.Columns[6].Width := 120;
          BDBGDetalle.Columns[6].Visible := true;

          BDBGDetalle.Columns[7].FieldName := 'DESTDEP';
          BDBGDetalle.Columns[7].Title.Caption := 'Peso Destete DEP';
          BDBGDetalle.Columns[7].Width := 120;
          BDBGDetalle.Columns[7].Visible := true;

          BDBGDetalle.Columns[8].FieldName := 'DESTPREC';
          BDBGDetalle.Columns[8].Title.Caption := 'Peso Destete PREC';
          BDBGDetalle.Columns[8].Width := 120;
          BDBGDetalle.Columns[8].Visible := true;

          BDBGDetalle.Columns[9].FieldName := 'GESTDEP';
          BDBGDetalle.Columns[9].Title.Caption := 'Aptitud Materna DEP';
          BDBGDetalle.Columns[9].Width := 120;
          BDBGDetalle.Columns[9].Visible := true;

          BDBGDetalle.Columns[10].FieldName := 'GESTPREC';
          BDBGDetalle.Columns[10].Title.Caption := 'Aptitud Materna PREC';
          BDBGDetalle.Columns[10].Width := 120;
          BDBGDetalle.Columns[10].Visible := true;

          BDBGDetalle.Columns[11].FieldName := 'LECHEDEP';
          BDBGDetalle.Columns[11].Title.Caption := 'Leche & Crecim. DEP';
          BDBGDetalle.Columns[11].Width := 120;
          BDBGDetalle.Columns[11].Visible := true;

          BDBGDetalle.Columns[12].FieldName := 'FINALDEP';
          BDBGDetalle.Columns[12].Title.Caption := 'Peso Final DEP';
          BDBGDetalle.Columns[12].Width := 120;
          BDBGDetalle.Columns[12].Visible := true;

          BDBGDetalle.Columns[13].FieldName := 'FINALPREC';
          BDBGDetalle.Columns[13].Title.Caption := 'Peso Final PREC';
          BDBGDetalle.Columns[13].Width := 120;
          BDBGDetalle.Columns[13].Visible := true;

          BDBGDetalle.Columns[14].FieldName := 'CEDEP';
          BDBGDetalle.Columns[14].Title.Caption := 'Circun. Escrotal DEP';
          BDBGDetalle.Columns[14].Width := 120;
          BDBGDetalle.Columns[14].Visible := true;

          BDBGDetalle.Columns[15].FieldName := 'CEPREC';
          BDBGDetalle.Columns[15].Title.Caption := 'Circun. Escrotal PREC';
          BDBGDetalle.Columns[15].Width := 120;
          BDBGDetalle.Columns[15].Visible := true;
     end;

     if (Id_Raza = 10) then
     begin
          BDBGDetalle.Columns[1].Width := 100;

          BDBGDetalle.Columns[5].FieldName := 'NACERDEP';
          BDBGDetalle.Columns[5].Title.Caption := 'Peso Nacer DEP';
          BDBGDetalle.Columns[5].Width := 120;
          BDBGDetalle.Columns[5].Visible := true;

          BDBGDetalle.Columns[6].FieldName := 'NACERPREC';
          BDBGDetalle.Columns[6].Title.Caption := 'Peso Nacer PREC';
          BDBGDetalle.Columns[6].Width := 120;
          BDBGDetalle.Columns[6].Visible := true;

          BDBGDetalle.Columns[7].FieldName := 'DESTDEP';
          BDBGDetalle.Columns[7].Title.Caption := 'Peso Destete DEP';
          BDBGDetalle.Columns[7].Width := 120;
          BDBGDetalle.Columns[7].Visible := true;

          BDBGDetalle.Columns[8].FieldName := 'DESTPREC';
          BDBGDetalle.Columns[8].Title.Caption := 'Peso Destete PREC';
          BDBGDetalle.Columns[8].Width := 120;
          BDBGDetalle.Columns[8].Visible := true;

          BDBGDetalle.Columns[9].FieldName := 'GESTDEP';
          BDBGDetalle.Columns[9].Title.Caption := 'Aptitud Materna DEP';
          BDBGDetalle.Columns[9].Width := 120;
          BDBGDetalle.Columns[9].Visible := true;

          BDBGDetalle.Columns[10].FieldName := 'GESTPREC';
          BDBGDetalle.Columns[10].Title.Caption := 'Aptitud Materna PREC';
          BDBGDetalle.Columns[10].Width := 120;
          BDBGDetalle.Columns[10].Visible := true;

          BDBGDetalle.Columns[11].FieldName := 'LECHEDEP';
          BDBGDetalle.Columns[11].Title.Caption := 'Leche & Crecim. DEP';
          BDBGDetalle.Columns[11].Width := 120;
          BDBGDetalle.Columns[11].Visible := true;

          BDBGDetalle.Columns[12].FieldName := 'FINALDEP';
          BDBGDetalle.Columns[12].Title.Caption := 'Peso Final DEP';
          BDBGDetalle.Columns[12].Width := 120;
          BDBGDetalle.Columns[12].Visible := true;

          BDBGDetalle.Columns[13].FieldName := 'FINALPREC';
          BDBGDetalle.Columns[13].Title.Caption := 'Peso Final PREC';
          BDBGDetalle.Columns[13].Width := 120;
          BDBGDetalle.Columns[13].Visible := true;

          BDBGDetalle.Columns[14].FieldName := 'CEDEP';
          BDBGDetalle.Columns[14].Title.Caption := 'Circun. Escrotal DEP';
          BDBGDetalle.Columns[14].Width := 120;
          BDBGDetalle.Columns[14].Visible := true;

          BDBGDetalle.Columns[15].FieldName := 'CEPREC';
          BDBGDetalle.Columns[15].Title.Caption := 'Circun. Escrotal PREC';
          BDBGDetalle.Columns[15].Width := 120;
          BDBGDetalle.Columns[15].Visible := true;
     end;

     if ((Id_Raza = 12) or (Id_Raza = 28)) then
     begin
          BDBGDetalle.Columns[1].Width := 120;

          BDBGDetalle.Columns[5].FieldName := 'NACERDEP';
          BDBGDetalle.Columns[5].Title.Caption := 'Peso Nacer DEP';
          BDBGDetalle.Columns[5].Width := 120;
          BDBGDetalle.Columns[5].Visible := true;

          BDBGDetalle.Columns[6].FieldName := 'NACERPREC';
          BDBGDetalle.Columns[6].Title.Caption := 'Peso Nacer PREC';
          BDBGDetalle.Columns[6].Width := 120;
          BDBGDetalle.Columns[6].Visible := true;

          BDBGDetalle.Columns[7].FieldName := 'DESTDEP';
          BDBGDetalle.Columns[7].Title.Caption := 'Peso Destete DEP';
          BDBGDetalle.Columns[7].Width := 120;
          BDBGDetalle.Columns[7].Visible := true;

          BDBGDetalle.Columns[8].FieldName := 'DESTPREC';
          BDBGDetalle.Columns[8].Title.Caption := 'Peso Destete PREC';
          BDBGDetalle.Columns[8].Width := 120;
          BDBGDetalle.Columns[8].Visible := true;

          BDBGDetalle.Columns[9].FieldName := 'GESTDEP';
          BDBGDetalle.Columns[9].Title.Caption := 'Aptitud Materna DEP';
          BDBGDetalle.Columns[9].Width := 120;
          BDBGDetalle.Columns[9].Visible := true;

          BDBGDetalle.Columns[10].FieldName := 'GESTPREC';
          BDBGDetalle.Columns[10].Title.Caption := 'Aptitud Materna PREC';
          BDBGDetalle.Columns[10].Width := 120;
          BDBGDetalle.Columns[10].Visible := true;

          BDBGDetalle.Columns[11].FieldName := 'LECHEDEP';
          BDBGDetalle.Columns[11].Title.Caption := 'Leche & Crecim. DEP';
          BDBGDetalle.Columns[11].Width := 120;
          BDBGDetalle.Columns[11].Visible := true;

          BDBGDetalle.Columns[12].FieldName := 'FINALDEP';
          BDBGDetalle.Columns[12].Title.Caption := 'Peso Final DEP';
          BDBGDetalle.Columns[12].Width := 120;
          BDBGDetalle.Columns[12].Visible := true;

          BDBGDetalle.Columns[13].FieldName := 'FINALPREC';
          BDBGDetalle.Columns[13].Title.Caption := 'Peso Final PREC';
          BDBGDetalle.Columns[13].Width := 120;
          BDBGDetalle.Columns[13].Visible := true;

          BDBGDetalle.Columns[14].FieldName := 'CEDEP';
          BDBGDetalle.Columns[14].Title.Caption := 'Circun. Escrotal DEP';
          BDBGDetalle.Columns[14].Width := 120;
          BDBGDetalle.Columns[14].Visible := true;

          BDBGDetalle.Columns[15].FieldName := 'CEPREC';
          BDBGDetalle.Columns[15].Title.Caption := 'Circun. Escrotal PREC';
          BDBGDetalle.Columns[15].Width := 120;
          BDBGDetalle.Columns[15].Visible := true;

          BDBGDetalle.Columns[16].FieldName := 'AOBDEP';
          BDBGDetalle.Columns[16].Title.Caption := 'Area ojo de bife DEP';
          BDBGDetalle.Columns[16].Width := 120;
          BDBGDetalle.Columns[16].Visible := true;

          BDBGDetalle.Columns[17].FieldName := 'AOBPREC';
          BDBGDetalle.Columns[17].Title.Caption := 'Area ojo de bife PREC';
          BDBGDetalle.Columns[17].Width := 120;
          BDBGDetalle.Columns[17].Visible := true;

          BDBGDetalle.Columns[18].FieldName := 'EGCDEP';
          BDBGDetalle.Columns[18].Title.Caption := 'Grasa cadera DEP';
          BDBGDetalle.Columns[18].Width := 120;
          BDBGDetalle.Columns[18].Visible := true;

          BDBGDetalle.Columns[19].FieldName := 'EGCPREC';
          BDBGDetalle.Columns[19].Title.Caption := 'Grasa cadera PREC';
          BDBGDetalle.Columns[19].Width := 120;
          BDBGDetalle.Columns[19].Visible := true;

          BDBGDetalle.Columns[20].FieldName := 'EGDDEP';
          BDBGDetalle.Columns[20].Title.Caption := 'Grasa dorsal DEP';
          BDBGDetalle.Columns[20].Width := 120;
          BDBGDetalle.Columns[20].Visible := true;

          BDBGDetalle.Columns[21].FieldName := 'EGDPREC';
          BDBGDetalle.Columns[21].Title.Caption := 'Grasa dorsal PREC';
          BDBGDetalle.Columns[21].Width := 120;
          BDBGDetalle.Columns[21].Visible := true;

          BDBGDetalle.Columns[22].FieldName := 'PORGIDEP';
          BDBGDetalle.Columns[22].Title.Caption := '%Grasa intramusc. DEP';
          BDBGDetalle.Columns[22].Width := 120;
          BDBGDetalle.Columns[22].Visible := true;

          BDBGDetalle.Columns[23].FieldName := 'PORGIPREC';
          BDBGDetalle.Columns[23].Title.Caption := '%Grasa intramusc. PREC';
          BDBGDetalle.Columns[23].Width := 120;
          BDBGDetalle.Columns[23].Visible := true;
     end;

     if ((Id_Raza = 4) or (Id_Raza = 5)) then
     begin
          BDBGDetalle.Columns[1].Width := 120;

          BDBGDetalle.Columns[3].FieldName := 'ACT_PORGIPREC';
          BDBGDetalle.Columns[3].Title.Caption := 'Rodeos';
          BDBGDetalle.Columns[3].Width := 100;
          BDBGDetalle.Columns[3].Visible := true;

          BDBGDetalle.Columns[4].FieldName := 'PORGIDEP';
          BDBGDetalle.Columns[4].Title.Caption := 'Prog';
          BDBGDetalle.Columns[4].Width := 100;
          BDBGDetalle.Columns[4].Visible := true;

          BDBGDetalle.Columns[5].FieldName := 'ALTURADEP';
          BDBGDetalle.Columns[5].Title.Caption := 'Prog Eco';
          BDBGDetalle.Columns[5].Width := 100;
          BDBGDetalle.Columns[5].Visible := true;

          BDBGDetalle.Columns[6].FieldName := 'CRIAS';
          BDBGDetalle.Columns[6].Title.Caption := 'Hijas';
          BDBGDetalle.Columns[6].Width := 100;
          BDBGDetalle.Columns[6].Visible := true;

          BDBGDetalle.Columns[7].FieldName := 'NACERDEP';
          BDBGDetalle.Columns[7].Title.Caption := 'PN DEP';
          BDBGDetalle.Columns[7].Width := 100;
          BDBGDetalle.Columns[7].Visible := true;

          BDBGDetalle.Columns[8].FieldName := 'NACERPREC';
          BDBGDetalle.Columns[8].Title.Caption := 'PN PREC';
          BDBGDetalle.Columns[8].Width := 100;
          BDBGDetalle.Columns[8].Visible := true;

          BDBGDetalle.Columns[9].FieldName := 'DESTDEP';
          BDBGDetalle.Columns[9].Title.Caption := 'PD DEP';
          BDBGDetalle.Columns[9].Width := 100;
          BDBGDetalle.Columns[9].Visible := true;

          BDBGDetalle.Columns[10].FieldName := 'DESTPREC';
          BDBGDetalle.Columns[10].Title.Caption := 'PD PREC';
          BDBGDetalle.Columns[10].Width := 100;
          BDBGDetalle.Columns[10].Visible := true;

          BDBGDetalle.Columns[11].FieldName := 'EGCDEP';
          BDBGDetalle.Columns[11].Title.Caption := 'PA DEP';
          BDBGDetalle.Columns[11].Width := 100;
          BDBGDetalle.Columns[11].Visible := true;

          BDBGDetalle.Columns[12].FieldName := 'EGCPREC';
          BDBGDetalle.Columns[12].Title.Caption := 'PA PREC';
          BDBGDetalle.Columns[12].Width := 100;
          BDBGDetalle.Columns[12].Visible := true;

          BDBGDetalle.Columns[13].FieldName := 'FINALDEP';
          BDBGDetalle.Columns[13].Title.Caption := 'PF DEP';
          BDBGDetalle.Columns[13].Width := 100;
          BDBGDetalle.Columns[13].Visible := true;

          BDBGDetalle.Columns[14].FieldName := 'FINALPREC';
          BDBGDetalle.Columns[14].Title.Caption := 'PF PREC';
          BDBGDetalle.Columns[14].Width := 100;
          BDBGDetalle.Columns[14].Visible := true;

          BDBGDetalle.Columns[15].FieldName := 'GESTDEP';
          BDBGDetalle.Columns[15].Title.Caption := 'LM DEP';
          BDBGDetalle.Columns[15].Width := 100;
          BDBGDetalle.Columns[15].Visible := true;

          BDBGDetalle.Columns[16].FieldName := 'GESTPREC';
          BDBGDetalle.Columns[16].Title.Caption := 'LM PREC';
          BDBGDetalle.Columns[16].Width := 100;
          BDBGDetalle.Columns[16].Visible := true;

          BDBGDetalle.Columns[17].FieldName := 'LECHEDEP';
          BDBGDetalle.Columns[17].Title.Caption := 'L&C DEP';
          BDBGDetalle.Columns[17].Width := 100;
          BDBGDetalle.Columns[17].Visible := true;

          BDBGDetalle.Columns[18].FieldName := 'CEDEP';
          BDBGDetalle.Columns[18].Title.Caption := 'CE DEP';
          BDBGDetalle.Columns[18].Width := 100;
          BDBGDetalle.Columns[18].Visible := true;

          BDBGDetalle.Columns[19].FieldName := 'CEPREC';
          BDBGDetalle.Columns[19].Title.Caption := 'CE PREC';
          BDBGDetalle.Columns[19].Width := 100;
          BDBGDetalle.Columns[19].Visible := true;

          BDBGDetalle.Columns[20].FieldName := 'AOBDEP';
          BDBGDetalle.Columns[20].Title.Caption := 'AOB DEP';
          BDBGDetalle.Columns[20].Width := 100;
          BDBGDetalle.Columns[20].Visible := true;

          BDBGDetalle.Columns[21].FieldName := 'AOBPREC';
          BDBGDetalle.Columns[21].Title.Caption := 'AOB PREC';
          BDBGDetalle.Columns[21].Width := 100;
          BDBGDetalle.Columns[21].Visible := true;

          BDBGDetalle.Columns[22].FieldName := 'EGDDEP';
          BDBGDetalle.Columns[22].Title.Caption := 'GD DEP';
          BDBGDetalle.Columns[22].Width := 100;
          BDBGDetalle.Columns[22].Visible := true;

          BDBGDetalle.Columns[23].FieldName := 'EGDPREC';
          BDBGDetalle.Columns[23].Title.Caption := 'GD PREC';
          BDBGDetalle.Columns[23].Width := 100;
          BDBGDetalle.Columns[23].Visible := true;

     end;
end;

procedure TFImportacionDepsRazasExcel.LimpiarEstructuras;
begin

    try
        IBQLimpiarDeps.Close;
        IBQLimpiarDeps.Open;

        IBQLimpiarNuevos.Close;
        IBQLimpiarNuevos.Open;

        FPrincipal.IBTPrincipal.CommitRetaining;
    except
        FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
    
end;

procedure TFImportacionDepsRazasExcel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  LimpiarEstructuras;
end;

end.
