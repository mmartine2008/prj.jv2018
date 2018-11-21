unit UImpDeps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  ExtCtrls, UUniversal, UMensajeHuella, Buttons, UImportacion, ImgList,
  PngImageList, JvExControls, JvLabel, JvGIF, pngimage, JvExExtCtrls,
  JvImage;

type
  TFImpDeps = class(TFUniversal)
    OpenDlg: TOpenDialog;
    IBQSPImportarDeps: TIBQuery;
    IBQFechaNac: TIBQuery;
    PanelCentral: TPanel;
    Label1: TLabel;
    LBAnimales: TListBox;
    Label2: TLabel;
    LTotal: TLabel;
    Panel1: TPanel;
    BCerrar: TButton;
    BBXlsImport: TBitBtn;
    IBQGenIdExterno: TIBQuery;
    IBQAgregarExterno: TIBQuery;
    procedure LBAnimalesDblClick(Sender: TObject);
    procedure BCerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BBXlsImportClick(Sender: TObject);
  private
    procedure importarDepsArgAngus(i,j:integer);
    procedure importarDepsArgBraford(i,j:integer);
    procedure importarDepsArgBrahman(i,j:integer);
    procedure importarDepsArgBrangus(i,j:integer);
    procedure importarDepsArgHereford(i,j:integer);
    procedure importarDepsArgShorthorn(i,j:integer);
    procedure importarDepsUru(i,j:integer);
    procedure cargarDatos;
    function altaNuevoExt(animal:TRegAnimal):integer;
    function ObtenerRP(Id : Integer) : String;
  public
    id:integer;
    { Public declarations }
  end;

var
  FImpDeps: TFImpDeps;
  pag:OleVariant;

implementation

uses ComObj, URepFichaAnimal,UABMPadresExternos,UDMSoftvet, UPrincipal,IBDButtonABM,UABMSimple, UTraduccion;

{$R *.dfm}

procedure TFImpDeps.importarDepsArgAngus(i,j:integer);
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

procedure TFImpDeps.importarDepsArgBraford(i,j:integer);
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

procedure TFImpDeps.importarDepsArgBrahman(i,j:integer);
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

procedure TFImpDeps.importarDepsArgBrangus(i,j:integer);
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

procedure TFImpDeps.importarDepsArgHereford(i,j:integer);
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

procedure TFImpDeps.importarDepsArgShorthorn(i,j:integer);
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




procedure TFImpDeps.importarDepsUru(i,j:integer);
begin
    IBQSPImportarDeps.ParamByName('ESTABLECIMIENTO').AsInteger:=FPrincipal.EstablecimientoActual;
    if getDatoDEP('pn dep',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('NACERDEP').Value:=normalizarfloat(getDatoDEP('pn dep',anim[i].arrDEP[j]))
    else IBQSPImportarDeps.ParamByName('NACERDEP').Value:=null;
    if getDatoDEP('pn prec',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('NACERPREC').Value:=normalizarfloat(getDatoDEP('pn prec',anim[i].arrDEP[j]))
    else IBQSPImportarDeps.ParamByName('NACERPREC').Value:=null;
    if getDatoDEP('pd dep',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('DESTDEP').Value:=normalizarfloat(getDatoDEP('pd dep',anim[i].arrDEP[j]))
    else IBQSPImportarDeps.ParamByName('DESTDEP').Value:=null;
    if getDatoDEP('pd prec',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('DESTPREC').Value:=normalizarfloat(getDatoDEP('pd prec',anim[i].arrDEP[j]))
    else IBQSPImportarDeps.ParamByName('DESTPREC').Value:=null;
    if getDatoDEP('hl dep',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('LECHEDEP').Value:=normalizarfloat(getDatoDEP('hl dep',anim[i].arrDEP[j]))
    else IBQSPImportarDeps.ParamByName('LECHEDEP').Value:=null;
    if getDatoDEP('hl prec',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('LECHEPREC').Value:=normalizarfloat(getDatoDEP('hl prec',anim[i].arrDEP[j]))
    else IBQSPImportarDeps.ParamByName('LECHEPREC').Value:=null;
    if getDatoDEP('c.e. dep',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('CEDEP').Value:=normalizarfloat(getDatoDEP('c.e. dep',anim[i].arrDEP[j]))
    else IBQSPImportarDeps.ParamByName('CEDEP').Value:=null;
    if getDatoDEP('c.e. prec',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('CEPREC').Value:=normalizarfloat(getDatoDEP('c.e. prec',anim[i].arrDEP[j]))
    else IBQSPImportarDeps.ParamByName('CEPREC').Value:=null;
    if getDatoDEP('e.g.s. dep',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('EGCDEP').Value:=normalizarfloat(getDatoDEP('e.g.s. dep',anim[i].arrDEP[j]))
    else IBQSPImportarDeps.ParamByName('EGCDEP').Value:=null;
    if getDatoDEP('e.g.s. prec',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('EGCPREC').Value:=normalizarfloat(getDatoDEP('e.g.s. prec',anim[i].arrDEP[j]))
    else IBQSPImportarDeps.ParamByName('EGCPREC').Value:=null;
    if getDatoDEP('a.o.b. dep',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('AOBDEP').Value:=normalizarfloat(getDatoDEP('a.o.b. dep',anim[i].arrDEP[j]))
    else IBQSPImportarDeps.ParamByName('AOBDEP').Value:=null;
    if getDatoDEP('a.o.b. prec',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('AOBPREC').Value:=normalizarfloat(getDatoDEP('a.o.b. prec',anim[i].arrDEP[j]))
    else IBQSPImportarDeps.ParamByName('AOBPREC').Value:=null;
    if getDatoDEP('p18 dep',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('P18DEP').Value:=normalizarfloat(getDatoDEP('p18 dep',anim[i].arrDEP[j]))
    else IBQSPImportarDeps.ParamByName('P18DEP').Value:=null;
    if getDatoDEP('p18 prec',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('P18PREC').Value:=normalizarfloat(getDatoDEP('p18 prec',anim[i].arrDEP[j]))
    else IBQSPImportarDeps.ParamByName('P18PREC').Value:=null;

    IBQSPImportarDeps.ParamByName('CRIADOR').AsString:= getDatoDEP('criador',anim[i].arrDEP[j]);
    IBQSPImportarDeps.ParamByName('CODIGO_PROPIETARIO').AsString:=getDatoDEP('código propietario',anim[i].arrDEP[j]);
    if getDatoDEP('NHIJ',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('NHIJ').AsInteger:=getDatoDEP('nhij',anim[i].arrDEP[j]);
    if getDatoDEP('NHIJM',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('NHIJM').AsInteger:=getDatoDEP('nhijm',anim[i].arrDEP[j]);
    if getDatoDEP('NHIJU',anim[i].arrDEP[j])<>'' then IBQSPImportarDeps.ParamByName('NHIJU').AsInteger:=getDatoDEP('nhiju',anim[i].arrDEP[j]);
    IBQSPImportarDeps.ParamByName('DATO_PD').AsString:=getDatoDEP('dato pd',anim[i].arrDEP[j]);
end;

procedure TFImpDeps.LBAnimalesDblClick(Sender: TObject);
var
  ext:TFABMPadresExternos;
  Iabm:IButtonABM;
  F : TFREPFichaAnimal;
begin
  inherited;
  DMSoftvet.IBQDatosAnimal.Close;
  DMSoftvet.IBQDatosAnimal.Open;
  if (LBAnimales.ItemIndex>-1) then
    if (dmsoftvet.IBQDatosAnimal.Lookup('id_hba',LBAnimales.Items[LBAnimales.ItemIndex],'id_animal')<>null) then
    begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := dmsoftvet.IBQDatosAnimal.Lookup('id_hba',LBAnimales.Items[LBAnimales.ItemIndex],'id_animal');
      F.modificar := false;
      F.ShowModal;
      F.Destroy;
    end
    else
      if (dmsoftvet.IBQAnimExt.Lookup('id_hba',LBAnimales.Items[LBAnimales.ItemIndex],'id_animal_externo')<>null) then
      begin
        id:= dmsoftvet.IBQAnimExt.Lookup('id_hba',LBAnimales.Items[LBAnimales.ItemIndex],'id_animal_externo');
        if (Iabm = nil) then
        begin
          Application.CreateForm(TFABMPadresExternos, FABMPadresExternos);
          FABMPadresExternos:=TFABMPadresExternos.Create(self);
          FABMPadresExternos.nom:=inttostr(id);
          Iabm := IButtonABM(FABMPadresExternos);
          Iabm.ISetCampoRetorno('id_animal_externo');
          Iabm.IFitrate(-1,FPrincipal.EstablecimientoActual);
          Iabm.IAbrir(faabm); (*tambien llama al ShowModal*)
          FABMPadresExternos.Destroy;
        end;
      //Iabm.AcEditarExecute(nil);
      end;
end;

procedure TFImpDeps.BCerrarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFImpDeps.FormActivate(Sender: TObject);
begin
  inherited;
  LTitulo.Caption:=Traducir('Importación');
  Caption:='Huella - '+Traducir('Importación de Datos Genéticos');
  DMSoftvet.IBQDatosAnimal.Close;
  DMSoftvet.IBQDatosAnimal.parambyname('establecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQDatosAnimal.Open;
  dmsoftvet.IBQRodeo.Close;
  dmsoftvet.IBQRodeo.parambyname('esta').AsInteger:=fprincipal.EstablecimientoActual;
  dmsoftvet.IBQRodeo.Open;
  dmsoftvet.IBQAnimExt.Close;
  dmsoftvet.IBQAnimExt.ParamByName('establecimiento').AsInteger:=fprincipal.EstablecimientoActual;
  dmsoftvet.IBQAnimExt.Open;
end;

procedure TFImpDeps.BBXlsImportClick(Sender: TObject);
var
  archivo:string;
begin
  inherited;
  //try
  if OpenDlg.Execute then
  begin
    archivo:=OpenDlg.FileName;
    tipoEv:=self.LTitulo.Caption;
    abrirArchivo(self,archivo);
    try
      cargarDatos;
    except
      on E : Exception do
        MostrarMensaje(tmError,'Ocurrió un error en la importación. Por favor verifique la planilla');
    end;
    cargaDeMovil:=false;
  end;
  LTotal.Caption:=inttostr(LBAnimales.Count);
end;

function TFImpDeps.ObtenerRP(Id : Integer) : String;
begin
  if DMSoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',Id,'ID_RP') <> null then
    ObtenerRP := DMSoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',Id,'ID_RP')
  else
    ObtenerRP := '';
end;

procedure TFImpDeps.cargarDatos;
var i,j:integer;
    nom,fecha,tipo,rp_planilla, rp_animal:string;
begin
    DMSoftvet.IBQFuentesDeps.Close;
    DMsoftvet.IBQFuentesDeps.Open;
    for i:=0 to Length(anim)-1 do
    begin
      if anim[i].id=-1 then
      begin
          try
            anim[i].id:=altaNuevoExt(anim[i]);  //la funcion altaNuevoExt devuelve el id del animal nuevo
            IBQAgregarExterno.Transaction.CommitRetaining;
            DMSoftvet.IBQAnimExt.Close;
            DMSoftvet.IBQAnimExt.ParamByName('establecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
            DMSoftvet.IBQAnimExt.Open;
            DMSoftvet.IBQAnimExt.Transaction.CommitRetaining;
          except
            DMSoftvet.IBQAnimExt.Transaction.RollbackRetaining;
            raise Exception.Create('Error en alta de animal externo');
            break;
          end;
      end;
      if (anim[i].id<>-1000) and (anim[i].id<>-1) then
        for j:=0 to Length(anim[i].arrDEP)-1 do
        begin
          try
            rp_planilla := GetDatoDep('rp',anim[i].arrDEP[j]);
            rp_animal := ObtenerRP(anim[i].id);
            IBQSPImportarDeps.ParamByName('ANIO').AsInteger:=getDatoDEP('año',anim[i].arrDEP[j]);
            IBQSPImportarDeps.ParamByName('ANIMAL').Value:=anim[i].id;
            if ((DMSoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',anim[i].id,'ID_RP')<>null) and (rp_animal = rp_planilla))then
            begin
              if (dmsoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',anim[i].id,'ID_HBA')<>null) and (dmsoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',anim[i].id,'ID_HBA')<>'') then
              begin
                if (dmsoftvet.IBQDatosAnimal.Lookup('ID_HBA',getDatoDEP('hb',anim[i].arrDEP[j]),'ID_HBA')<>null) then
                begin
                  IBQSPImportarDeps.ParamByName('HBA').Value := null;
                  IBQSPImportarDeps.ParamByName('TIPO_ANIMAL').AsString:='I';
                  tipo:='I';
                end
                else
                begin
                  IBQSPImportarDeps.ParamByName('TIPO_ANIMAL').AsString:='E';
                  tipo:='E';
                  fecha:=getDatoDEP('fecha nac',anim[i].arrDEP[j]);
                  if ((dmsoftvet.IBQAnimExt.Lookup('ID_ANIMAL_EXTERNO',anim[i].id,'FECHA_NACIMIENTO')='1/1/1900'))
                  and (fecha<>'') then
                  begin
                    IBQFechaNac.Close;
                    IBQFechaNac.ParamByName('id').AsInteger:=anim[i].id;
                    IBQFechaNac.ParamByName('fecha').AsDate:=strtoDate(fecha);
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
                tipo:='I';
              end
            end
            else
            begin
              IBQSPImportarDeps.ParamByName('TIPO_ANIMAL').AsString:='E';
              tipo:='E';
              fecha:=getDatoDEP('fecha nac',anim[i].arrDEP[j]);
              if ((dmsoftvet.IBQAnimExt.Lookup('ID_ANIMAL_EXTERNO',anim[i].id,'FECHA_NACIMIENTO')='1/1/1900'))
              and (fecha<>'') then
              begin
                IBQFechaNac.Close;
                IBQFechaNac.ParamByName('id').AsInteger:=anim[i].id;
                IBQFechaNac.ParamByName('fecha').AsDate:=strtoDate(fecha);
                IBQFechaNac.Open;
              end;
              if (dmsoftvet.IBQAnimExt.Lookup('ID_ANIMAL_EXTERNO',anim[i].id,'ID_HBA') <> null) and (dmsoftvet.IBQAnimExt.Lookup('ID_ANIMAL_EXTERNO',anim[i].id,'ID_HBA') <> '') then
                IBQSPImportarDeps.ParamByName('HBA').Value := null
              else
                IBQSPImportarDeps.ParamByName('HBA').Value := getDatoDEP('hb',anim[i].arrDEP[j]);
            end;
            case FPrincipal.Pais of
              1: importarDepsArgAngus(i,j);
              2: importarDepsUru(i,j);
            end;
            if (FPrincipal.Pais >= 3) then
              importarDepsUru(i,j);
            IBQSPImportarDeps.ExecSQL;
            IBQSPImportarDeps.Transaction.CommitRetaining;
          except
            IBQSPImportarDeps.Transaction.RollbackRetaining;
            raise Exception.Create('Error en la carga de DEPs');
            break;
          end;
        end;
      if (Tipo = 'I') then
      begin
        if (dmsoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',anim[i].id,'ID_HBA')<>null) then
          nom:=dmsoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',anim[i].id,'ID_HBA')
        else
          nom:=dmsoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',anim[i].id,'ID_RP');
      end
      else
      begin
        if (dmsoftvet.IBQAnimExt.Lookup('ID_ANIMAL_EXTERNO',anim[i].id,'ID_HBA')<>null) then
          nom:=dmsoftvet.IBQAnimExt.Lookup('ID_ANIMAL_EXTERNO',anim[i].id,'ID_HBA')
        else
          nom:=dmsoftvet.IBQAnimExt.Lookup('ID_ANIMAL_EXTERNO',anim[i].id,'ID_RP');
      end;
      if nom<>'' then
        LBAnimales.Items.Add(nom);
    end;
end;

function TFImpDeps.altaNuevoExt(animal:TRegAnimal):integer; //devuelve el ID del animal
var
  str:string;
begin
  DMSoftvet.IBQSexo.Close;
  DMSoftvet.IBQSexo.Open;
  DMSoftvet.IBQRaza.Close;
  DMSoftvet.IBQRaza.Open;
  IBQGenIdExterno.Close;
  IBQGenIdExterno.Open;
  IBQAgregarExterno.Close;
  IBQAgregarExterno.ParamByName('ID_ANIMAL_EXTERNO').AsInteger:=IBQGenIdExterno.FieldValues['IDEXT'];
  IBQAgregarExterno.ParamByName('ID_RP').AsString:=getDatoDEP('rp animal',animal.arrdep[0]);
  IBQAgregarExterno.ParamByName('ID_HBA').AsString:=getDatoDEP('hb',animal.arrdep[0]);
  IBQAgregarExterno.ParamByName('SEXO').AsInteger:=DMSoftvet.IBQSexo.Lookup('NOMBRE',getDatoDEP('sexo',animal.arrdep[0]),'SEXO');

  if dmsoftvet.IBQRaza.Lookup('CODIGO',getDatoDEP('raza',animal.arrdep[0]),'ID_RAZA')<>null then
    IBQAgregarExterno.ParamByName('RAZA').AsInteger:=dmsoftvet.IBQRaza.Lookup('CODIGO',getDatoDEP('raza',animal.arrdep[0]),'ID_RAZA')
  else
    IBQAgregarExterno.ParamByName('RAZA').AsInteger:=dmsoftvet.IBQRaza.Lookup('NOMBRE',getDatoDEP('raza',animal.arrdep[0]),'ID_RAZA');

  str:=getDatoDEP('fecha nacimiento',animal.arrdep[0]);
  if str<>'' then
    IBQAgregarExterno.ParamByName('FECHA_NACIMIENTO').AsDateTime:=strtodatetime(str)
  else
    IBQAgregarExterno.ParamByName('FECHA_NACIMIENTO').AsDateTime:=strtodatetime('1/1/1900');
  IBQAgregarExterno.ParamByName('NOMBRE').AsString:=getDatoDEP('nombre',animal.arrdep[0]);
  IBQAgregarExterno.ParamByName('ESTABLECIMIENTO').AsInteger:=FPrincipal.EstablecimientoActual;
  IBQAgregarExterno.ParamByName('PROPIETARIO').AsInteger:=0;
  IBQAgregarExterno.Open;
  altaNuevoExt:=IBQGenIdExterno.FieldValues['IDEXT'];
end;

end.

