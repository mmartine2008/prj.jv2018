{ DAIANA - 16.12.2014 - Incidencia 412 - Inicio
  Esta unidad muestra documentos PDF en huella. Se creó para mostrar los DTE
  pero sirve para mostrar cualquier PDF en general. }

unit UPdf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, pngimage, PdfViewer,
  JvExExtCtrls, JvImage, JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF,
  Registry;

type
  TFPdf = class(TFUniversal)
    PCuerpo: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    PDFViewer: TAcroPDF;
    Abre : Boolean;
    function VerificarAcrobat : Boolean;
  public
    Path : String;
  end;

var
  FPdf: TFPdf;

implementation

uses UMensajeHuella;

{$R *.dfm}

procedure TFPdf.FormCreate(Sender: TObject);
var msj : String;
begin
  inherited;
  Path := '';
  if VerificarAcrobat() then
  begin
    try
      PdfViewer := TAcroPDF.Create(self);
      PdfViewer.Parent := PCuerpo;
      PdfViewer.Align := alClient;
    except
       msj := 'Acrobat Reader no es compatible con la version del Sistema. Es necesario instalarlo.'+AnsiString(#13#10)+'http://get.adobe.com/es/reader/';
       MostrarMensaje(tmInformacion, msj);
    end;
  end
  else
  begin
    msj := 'Acrobat Reader no es compatible con la version del Sistema. Es necesario instalarlo.'+AnsiString(#13#10)+'http://get.adobe.com/es/reader/';
    MostrarMensaje(tmInformacion, msj);
  end;
end;

function TFPdf.VerificarAcrobat : Boolean;
var
  Reg : TRegistry;
begin
try
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Result := Reg.OpenKey('SOFTWARE\Adobe\Acrobat Reader',false);
  Reg.Destroy;
  Abre := Result;
except
  result := false;
end;
end;

procedure TFPdf.FormShow(Sender: TObject);
begin
  inherited;
  if Abre then
  begin
    if (Path <> '') then PdfViewer.LoadFile(Path);
    Application.ProcessMessages;
    PdfViewer.setCurrentPage(1);
    PdfViewer.setZoom(75);
  end
  else
    Close;
end;

end.

{ DAIANA - 16.12.2014 - Incidencia 412 - Fin }


