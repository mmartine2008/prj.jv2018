unit UImpArchivosGES3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, OleServer,
  IDEBinDll_TLB, jpeg, ShellCtrls, JvComponentBase, JvHidControllerClass,
  PngImage;

type
  TFImpArchivosGES3 = class(TFUniversal)
    PBottom: TPanel;
    Button1: TButton;
    PCli: TPanel;
    IFondoBottom: TImage;
    Panel1: TPanel;
    LLector: TLabel;
    POpciones: TPanel;
    SLVArchivos: TShellListView;
    RBControl: TRadioButton;
    RBEquivalencia: TRadioButton;
    IEliminarP: TImage;
    LSalir: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IEliminarPClick(Sender: TObject);
    procedure RBEquivalenciaClick(Sender: TObject);
    procedure RBControlClick(Sender: TObject);
  private
    Lector : Char;
  public
    { Public declarations }
  end;

var
  FImpArchivosGES3: TFImpArchivosGES3;

implementation

{$R *.dfm}

procedure TFImpArchivosGES3.Button1Click(Sender: TObject);
begin
  inherited;
 { clsRCTtoTXT.ArchivoOrigen := SLVArchivos.;
  clsRCTtoTXT.CarpetaDestino := 'C:\Huella\';
  clsRCTtoTXT.Encabezado := true;
  clsRCTtoTXT.separador := '|';
  clsRCTtoTXT.Formato := 1;
  clsRCTtoTXT.IncluirControlesBorrados := false;
  clsRCTtoTXT.EjecutarConversion;}
end;

procedure TFImpArchivosGES3.FormCreate(Sender: TObject);
var
  encontro : boolean;
  L : Char;
begin
  inherited;
  encontro := false;
  WinExec(PAnsiChar('regsrv32 '+ExtractFilePath(Application.ExeName)+'IDEBin.dll'),SW_HIDE);
  for L := 'C' to 'Z' do
    if GetDriveType(PAnsiChar(L+':\')) = DRIVE_REMOVABLE then
      if DirectoryExists(L+':\System\Binary\') then
      begin
        encontro := true;
        Lector := L;
        break;
      end;
  if encontro then
  begin
    LLector.Caption := 'Se detectó el dispositivo Ges 3 en la unidad '+Lector;
    POpciones.Visible := true;
    SLVArchivos.Root := Lector+':\Controls\';
  end
  else
    LLector.Caption := 'No se encuentra el dispositivo Ges 3';
end;

procedure TFImpArchivosGES3.IEliminarPClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFImpArchivosGES3.RBEquivalenciaClick(Sender: TObject);
begin
  inherited;
  if RBEquivalencia.Checked then
    SLVArchivos.Root := Lector+':\Equivalences\';
end;

procedure TFImpArchivosGES3.RBControlClick(Sender: TObject);
begin
  inherited;
  if RBControl.Checked then
    SLVArchivos.Root := Lector+':\Controls\';
end;

end.
