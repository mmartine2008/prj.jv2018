unit UGuardarEstiloHuella;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ComCtrls, ShellCtrls, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, JvExControls,
  JvLabel, StdCtrls, ExtCtrls, JvGIF, PngImage, jpeg, ImgList, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFGuardarEstiloHuella = class(TFUniversal)
    STVArbolSistema: TShellTreeView;
    SLVDirectorios: TShellListView;
    Label1: TLabel;
    PBotones: TPanel;
    Image5: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IAceptar: TImage;
    LAceptar: TLabel;
    procedure ISalirClick(Sender: TObject);
    procedure IAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SLVDirectoriosAddFolder(Sender: TObject;
      AFolder: TShellFolder; var CanAdd: Boolean);
  private
    filtro: String;
    filtroHabilitado: boolean;
    { Private declarations }
  public
    { Public declarations }
    ruta : string;
    procedure setFilter(filter: String);
    procedure HabilitarFiltro(value: boolean);
    procedure setTitulo(titulo: String);
    procedure setMostrarArchivos;
    procedure setExportXLS(titulo: String);
  end;

var
  FGuardarEstiloHuella: TFGuardarEstiloHuella;

implementation

{$R *.dfm}

procedure TFGuardarEstiloHuella.ISalirClick(Sender: TObject);
begin

  ruta := '';
  close();

end;

procedure TFGuardarEstiloHuella.IAceptarClick(Sender: TObject);
begin

  ruta := STVArbolSistema.Path;
  close();

end;


procedure TFGuardarEstiloHuella.FormCreate(Sender: TObject);
begin

  LTitulo.Caption := 'Guardar archivos a importar.';
  filtroHabilitado := false;
  filtro := '';
end;

procedure TFGuardarEstiloHuella.SLVDirectoriosAddFolder(Sender: TObject;
  AFolder: TShellFolder; var CanAdd: Boolean);
var
  FileExt: string;
begin
  if (filtroHabilitado) then
  begin
    CanAdd := not AFolder.IsFolder;
    if CanAdd then
    begin
      FileExt := ExtractFileExt(AFolder.PathName);
      CanAdd := (FileExt = filtro);
    end;
  end;
end;


    procedure TFGuardarEstiloHuella.setFilter(filter: String);
    begin
        Self.filtro := filter;
    end;

    procedure TFGuardarEstiloHuella.HabilitarFiltro(value: boolean);
    begin
      filtroHabilitado := value;
    end;

    procedure TFGuardarEstiloHuella.setTitulo(titulo: String);
    begin
      Label1.Caption := titulo;
    end;

    procedure TFGuardarEstiloHuella.setMostrarArchivos;
    var
      paramsFiles : TShellObjectTypes;
    begin
      paramsFiles := [otFolders, otNonFolders];
      Self.SLVDirectorios.ObjectTypes := paramsFiles;
    end;

    procedure TFGuardarEstiloHuella.setExportXLS(titulo: String);
    begin
      setMostrarArchivos;
      setTitulo(titulo);
      HabilitarFiltro(true);
      setFilter('.xls');
    end;

end.
