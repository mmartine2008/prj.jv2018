unit UMovCargarDatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Buttons, xmldom,
  XMLIntf, msxmldom, XMLDoc, IBDatabase, IBQuery, UEveDiagnosticoGestacion,
  UEveAltaMasiva, UBDBGrid, Grids, DBGrids, UPrincipal,UDMSoftVet, UCartel, UFunctions,
  FileCtrl, ShellCtrls, BaseGrid, AdvGrid, jpeg, JvGIF, ImgList,
  PngImageList, pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel;

type
  TFMovCargarDatos = class(TFUniversal)
    GBElegir: TGroupBox;
    BBCancelar: TBitBtn;
    DLGOpen: TOpenDialog;
    XMLDoc: TXMLDocument;
    IBQObtenerID: TIBQuery;
    GroupBox1: TGroupBox;
    ShellTreeView1: TShellTreeView;
    CBEventos: TComboBox;
    SGArchivos2: TStringGrid;
    BBCargar: TBitBtn;
    IBQImportados: TIBQuery;
    SGArchivos: TAdvStringGrid;
    checkAgregados: TCheckBox;
    IBTPrincipal: TIBTransaction;
    procedure BBCancelarClick(Sender: TObject);
    procedure BBCargarClick(Sender: TObject);
    procedure CBEventosChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBEventosCloseUp(Sender: TObject);
    //procedure ListBox1DblClick(Sender: TObject);
    procedure ShellTreeView1Click(Sender: TObject);
    //procedure SGArchivos2DblClick(Sender: TObject);
    //procedure SGArchivos2SelectCell(Sender: TObject; ACol, ARow: Integer;
    //var CanSelect: Boolean);
    procedure SGArchivosDblClick(Sender: TObject);
    procedure SGArchivosSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure checkAgregadosClick(Sender: TObject);
  private
    tipoArch,idArchivo:string;
    procedure ReemplazarChar(arch:string;old:string;new:string);
    procedure FindFiles(StartDir, FileMask: string);
    function armarString(str:string):string;
    procedure agregarEnTabla(archivo:string);
    function getEvento(eve:string):string;
    procedure abrirEvento;
  public
    nom,ap,dir,dirBase,nombreArch:string;
  end;

var
  FMovCargarDatos: TFMovCargarDatos;
  tipoEve:integer;
  gral:IXMLNode;

implementation

{$R *.dfm}
uses UMensajeHuella,UAbmEmpleados,UAbmRodeos,UEvePeso,UImportacion,UEveEvaluacionPreservicio, UEveInseminacionArtificial, UEveNacimientos, UEveImportarPartosNacimientos;

procedure TFMovCargarDatos.BBCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFMovCargarDatos.BBCargarClick(Sender: TObject);
var
  encontro:boolean;
  nodoGral:IXMLNode;
begin
inherited;
abrirEvento;
end;

procedure TFMovCargarDatos.ReemplazarChar(arch:string;old:string;new:string);   //Para poder cargar el xml, reemplaza el caracter old por new (para las ñ)
 var
   fileData : TStringList;
   lines, i : Integer;
 begin
   fileData := TStringList.Create;
   fileData.LoadFromFile(arch);
   lines := fileData.Count;
   for i:=0 to lines-1 do
      filedata[i]:= StringReplace(filedata[i],old,new,[rfIgnoreCase,rfReplaceAll]);
    filedata.SaveToFile(arch);
end;

procedure TFMovCargarDatos.CBEventosChange(Sender: TObject);
begin
  inherited;
  tipoEve:=CBEventos.ItemIndex;
end;

procedure TFMovCargarDatos.FormCreate(Sender: TObject);
begin
  inherited;
  tipoEve:=-1;
  IBQObtenerID.Open;
  dirBase:='C:\';
  IBQImportados.Close;
  IBQImportados.ParamByName('establecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
  IBQImportados.Open;
  SGArchivos.HideColumn(3);
end;

procedure TFMovCargarDatos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    cargaDeMovil:=false;
    anim:=nil;
end;

procedure TFMovCargarDatos.CBEventosCloseUp(Sender: TObject);
var lista:TStringList;
begin
  inherited;
  FindFiles(dirBase,'*.XML');
end;

procedure TFMovCargarDatos.FindFiles(StartDir, FileMask: string);
var
  SR: TSearchRec;
  DirList: TStringList;
  IsFound,existeImportacion: Boolean;
  i: integer;
  str:string;
  datos:IXMLNode;
begin
  if StartDir[length(StartDir)] <> '\' then
    StartDir := StartDir + '\';

  { Build a list of the files in directory StartDir
     (not the directories!)                         }
  IsFound := FindFirst(StartDir+FileMask, faAnyFile-faDirectory, SR) = 0;
  SGArchivos.RowCount:=1;
  SGArchivos.Rows[0].Clear;
  while IsFound do begin
    try
      //Lee el nodo de datos grales del archivo
      XMLDoc.LoadFromFile(StartDir+SR.Name);
      datos := XMLDoc.DocumentElement;
      tipoEv := datos.NodeName;
      nombreArch:=SR.Name;
      existeImportacion:=IBQImportados.Locate('ID_IMPORTACION',nombreArch,[]);
      if (not existeImportacion) then
      begin
        if ((existeImportacion)and(checkAgregados.Checked)) or (not existeImportacion) then
        begin
          agregarEnTabla(nombreArch);
          SGArchivos.RowCount:=SGArchivos.RowCount+1;
        end;
      end;
    except
    end;
    IsFound := FindNext(SR) = 0;
  end;
  FindClose(SR);
  SGArchivos.RowCount:=SGArchivos.RowCount-1;
end;


procedure TFMovCargarDatos.ShellTreeView1Click(Sender: TObject);
begin
  inherited;
  dirBase:=TShellTreeView(Sender).Path+'\';
  FindFiles(dirBase,'*.XML');
end;

function TFMovCargarDatos.armarString(str:string):string;
var evento,hora,fecha:string;
    strings:TStringList;
    strAux:PChar;
begin
    strings:=TStringList.Create;
    strAux:=pchar(str);
    ExtractStrings(['-','.'],[' '],strAux,TStrings(strings));
    if strings.Count>=6 then
      begin
      tipoArch:=strings[0];
      evento:=strings[0];
      fecha:=strings[3]+'/'+strings[2]+'/'+strings[1];
      hora:=strings[4]+':'+strings[5];
      armarString:= evento+'  -  '+fecha+' '+hora+' -- '+str;
      end
    else
      armarString:='';
end;

procedure TFMovCargarDatos.agregarEnTabla(archivo:string);
var evento,hora,fecha:string;
    strings:TStringList;
    strAux:PChar;
begin
    strings:=TStringList.Create;
    strAux:=pchar(archivo);
    if tipoEv = 'EventoPeso' then
      evento := 'Peso';
    if tipoEv = 'EventoGestacion' then
      evento := 'Diagnóstico de Gestación';
    if tipoEv = 'EventoCargaMasiva' then
      evento := 'Carga Masiva';
    if tipoEv = 'EventoInseminacion' then
      evento := 'Inseminacion Artificial';
    if tipoEv = 'EventoEvaluacionPreServicio' then
      evento := 'Evaluación de Preservicio';
    if tipoEv = 'EventoNacimiento' then
      evento := 'Nacimientos';  
    SGArchivos.Cells[0,SGArchivos.RowCount-1] := evento;
    SGArchivos.Cells[2,SGArchivos.RowCount-1] := archivo;
    SGArchivos.Cells[3,SGArchivos.RowCount-1] := nombreArch;
end;

function TFMovCargarDatos.getEvento(eve:string):string;
begin
if eve='GES' then getEvento:='Diagnóstico de Gestación';
if eve='PES' then getEvento:='Peso';
if eve='SER' then getEvento:='Evaluación de Preservicio';
end;

procedure TFMovCargarDatos.SGArchivosDblClick(Sender: TObject);
begin
  inherited;
  abrirEvento;
end;

procedure TFMovCargarDatos.SGArchivosSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  idArchivo:=SGArchivos.Cells[3,ARow];
  nombreArch:=SGArchivos.Cells[2,ARow];
  tipoEv:=SGArchivos.Cells[0,ARow];
end;

procedure TFMovCargarDatos.checkAgregadosClick(Sender: TObject);
begin
  inherited;
  FindFiles(dirBase,'*.XML');
end;

procedure TFMovCargarDatos.abrirEvento;
begin
if IBQImportados.Locate('ID_IMPORTACION',ansiuppercase(idArchivo),[]) then
    if MostrarMensaje(tmConsulta,'Este archivo ya fue ingresado al sistema. Desea volver a cargarlo?')=mrNo then
      abort;
  begin
  cargaDeMovil:=true;
  if tipoEv='Diagnóstico de Gestación' then FPrincipal.AbrirEventoConManga(TFEveDiagnosticoGestacion.Create(self));
  if tipoEv='Peso' then FPrincipal.AbrirEventoConManga(TFEvePeso.Create(self));
  if tipoEv='Evaluación de Preservicio' then FPrincipal.AbrirEventoConManga(TFEveEvaluacionPreservicio.Create(self));
  if tipoEv='Carga Masiva' then FPrincipal.AbrirFormNormal(TFEveAltaMasiva.Create(self));
  //if tipoEv='Inseminacion Artificial' then FPrincipal.AbrirFormNormal(TFEveInseminacionArtificial.Create(self));
  //f tipoEv='Carga Masiva' then FPrincipal.AbrirEventoConManga(TFEveAltaMasiva.Create(self));
  if tipoEv='Inseminacion Artificial' then FPrincipal.AbrirEventoConManga(TFEveInseminacionArtificial.Create(self));
  //if tipoEv='Nacimientos' then FPrincipal.AbrirEventoConManga(TFEveNacimientos.Create(self));
  if tipoEv='Nacimientos' then FPrincipal.AbrirEventoConManga(TFEveImportarPartosNacimientos.Create(self));
  end;
  IBQImportados.Close;
  IBQImportados.Open;
  checkAgregados.OnClick(self);
end;

end.
