unit UPanelCaravanas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, pngimage, Shlobj,
  JvExExtCtrls, JvImage, JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF,
  MemoAuto, jpeg;

type
  TFPanelCaravanas = class(TFUniversal)
    MACaravanas: TMemoAuto;
    IFondoBottom: TImage;
    JvCancelar: TJvImage;
    LCerrar: TLabel;
    LAnimales: TLabel;
    SDEquivalencias: TSaveDialog;
    IExportarAnimales: TImage;
    LExportarAnimales: TLabel;
    procedure JvCancelarClick(Sender: TObject);
    procedure LExportarAnimalesClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    TipoMov : String;
    procedure GenerarTxt;
    procedure GenerarXls;
    function SpecialFolder(Folder: Integer): String;
    function armar_nombre_archivo : String;
  
  end;

var
  FPanelCaravanas: TFPanelCaravanas;

implementation

{$R *.dfm}

uses UCartel, UPrincipal, ComObj;

function TFPanelCaravanas.SpecialFolder(Folder: Integer): String;
var
  SFolder : pItemIDList;
  SpecialPath : Array[0..MAX_PATH] Of Char;
begin
  SHGetSpecialFolderLocation(Self.Handle, Folder, SFolder);
  SHGetPathFromIDList(SFolder, SpecialPath);
  Result := StrPas(SpecialPath);
end;


//******************************************************//
//	INCIDENCIA: 414									                    //
//	INICIO Generación de archivos txt y xls.            //
//         Borrado de temporales creados.               //
//	Carla Gareis							              18/12/2014  //
//******************************************************//

function TFPanelCaravanas.armar_nombre_archivo : String;
var nombre_archivo_nuevo,formattedDateTime, fechasola : string;
    msje: String;
begin
  DateTimeToString(fechasola, 'ddddd', now);
  DateSeparator := '_';
  TimeSeparator := '_';
  DateTimeToString(formattedDateTime, 'ddddd', now);
  nombre_archivo_nuevo := TipoMov+'_'+ formattedDateTime +'_'+ TimeToStr(now);
  DateSeparator := '/';
  TimeSeparator := ':';

  Result := nombre_archivo_nuevo;

end;

procedure TFPanelCaravanas.GenerarTxt;
var
  cartel : TCartel;
  origen : String;
  escritorio, path, nom_archivo : String;
begin
    escritorio := SpecialFolder(CSIDL_DESKTOP);
    escritorio := escritorio+'\AFIP_SIFTA';
{    LineaauxTxt := '';
    Append(arcEquivalenciasTxt);
    Writeln(arcEquivalenciasTxt, LineaauxTxt);
    Append(arcEquivalenciasXls);
    Writeln(arcEquivalenciasXls, LineaauxTxt); }
    if not(DirectoryExists(escritorio)) then
         CreateDir(escritorio);
   // MostrarMensaje(tmAdvertencia,'Debe seleccionar el lugar de destino del archivo de equivalencias.');
    SDEquivalencias.InitialDir := escritorio;
    nom_archivo := armar_nombre_archivo;
    SDEquivalencias.FileName := nom_archivo;
    if SDEquivalencias.Execute then
    begin
      origen := ExtractFilePath(Application.ExeName)+'Exportacion\EquivalenciasTempTxt.txt';
      cartel := TCartel.getInstance;
      cartel.abrircartel('Generando Archivo de Caravanas...');
      try
        CopyFile(PChar(origen),PChar((SDEquivalencias.FileName)+'.txt'),false);
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
      end;
      cartel.cerrarcartel;
      cartel.FreeInstance;
    end;
end;

procedure TFPanelCaravanas.GenerarXls;
var
  Excel, Libro: OLEVariant;
  o : String;
begin
  //A PARTIR DEL .txt genero el .xls
  o := ExtractFilePath(Application.ExeName)+'Exportacion\EquivalenciasTempXls.txt';
  Excel := CreateOleObject('Excel.Application');
  Excel.DisplayAlerts := false;
  Excel.WorkBooks.OpenText(o,,1,1,-4142,,,,,,True,'|',,,,,,);
  Excel.WorkBooks[1].WorkSheets[1].Name := 'Equivalencias';
  Libro := Excel.WorkBooks[1].WorkSheets['Equivalencias'];
  Libro.SaveAs((SDEquivalencias.FileName)+'.xls');
  Excel.Quit;
end;

procedure TFPanelCaravanas.JvCancelarClick(Sender: TObject);
begin
  inherited;
  self.Close; 
end;

procedure TFPanelCaravanas.LExportarAnimalesClick(Sender: TObject);
begin
  inherited;
  GenerarTxt;
  GenerarXls;
end;



end.
