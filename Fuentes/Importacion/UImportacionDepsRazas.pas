unit UImportacionDepsRazas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, PngImage, JvExExtCtrls,
  JvImage;

type
  TFImportacionDepsRazas = class(TFUniversal)
    LImpAngus: TLabel;
    LImpBraford: TLabel;
    LImpBrahman: TLabel;
    LImpBrangus: TLabel;
    LImpHereford: TLabel;
    LShorthorn: TLabel;
    Image1: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    procedure LImpBrafordClick(Sender: TObject);
    procedure LImpAngusClick(Sender: TObject);
    procedure LImpBrahmanClick(Sender: TObject);
    procedure LImpBrangusClick(Sender: TObject);
    procedure LImpHerefordClick(Sender: TObject);
    procedure LShorthornClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImportacionDepsRazas: TFImportacionDepsRazas;

implementation

uses UImportacionDepsRazasExcel;

{$R *.dfm}

procedure TFImportacionDepsRazas.LImpBrafordClick(Sender: TObject);
var F : TFImportacionDepsRazasExcel;
    ruta : string;
begin

    ruta := ExtractFilePath(Application.ExeName) + '\RefDepsBraford.bmp';

    F := TFImportacionDepsRazasExcel.Create(self);
    F.NombreRaza := 'Braford';
    F.Id_Raza := 11;
    F.PPrincipal.Visible := false;
    F.LNombreRaza.Caption := 'para Raza Braford';
    F.TipoImportacion := 'Importación Datos Genéticos Braford';
    F.IReferenciaDeps.Picture.LoadFromFile(ruta);
    F.PPrincipal.Align := alClient;
    F.PPrincipal.Visible := true;

    F.ShowModal;
    F.Destroy;

end;

procedure TFImportacionDepsRazas.LImpAngusClick(Sender: TObject);
var F : TFImportacionDepsRazasExcel;
    ruta : string;
begin


    ruta := ExtractFilePath(Application.ExeName) + '\RefDepsAngus.bmp';

    F := TFImportacionDepsRazasExcel.Create(self);
    F.NombreRaza := 'Angus';
    F.Id_Raza := 29;
    F.PPrincipal.Visible := false;
    F.LNombreRaza.Caption := 'para Raza Aberdeen Angus';
    F.TipoImportacion := 'Importación Datos Genéticos Aberdeen Angus';
    F.IReferenciaDeps.Picture.LoadFromFile(ruta);
    F.PPrincipal.Align := alClient;
    F.PPrincipal.Visible := true;

    F.ShowModal;
    F.Destroy;

end;

procedure TFImportacionDepsRazas.LImpBrahmanClick(Sender: TObject);
var F : TFImportacionDepsRazasExcel;
    ruta : string;
begin

    ruta := ExtractFilePath(Application.ExeName) + '\RefDepsBrahman.bmp';

    F := TFImportacionDepsRazasExcel.Create(self);
    F.NombreRaza := 'Brahman';
    F.Id_Raza := 10;
    F.PPrincipal.Visible := false;
    F.LNombreRaza.Caption := 'para Raza Brahman';
    F.TipoImportacion := 'Importación Datos Genéticos Brahman';
    F.IReferenciaDeps.Picture.LoadFromFile(ruta);
    F.PPrincipal.Align := alClient;
    F.PPrincipal.Visible := true;

    F.ShowModal;
    F.Destroy;

end;

procedure TFImportacionDepsRazas.LImpBrangusClick(Sender: TObject);
var F : TFImportacionDepsRazasExcel;
    ruta : string;
begin

    ruta := ExtractFilePath(Application.ExeName) + '\RefDepsBrangus.bmp';

    F := TFImportacionDepsRazasExcel.Create(self);
    F.NombreRaza := 'Brangus';
    F.Id_Raza := 12;
    F.PPrincipal.Visible := false;
    F.LNombreRaza.Caption := 'para Raza Brangus';
    F.TipoImportacion := 'Importación Datos Genéticos Brangus';
    F.IReferenciaDeps.Picture.LoadFromFile(ruta);
    F.PPrincipal.Align := alClient;
    F.PPrincipal.Visible := true;

    F.ShowModal;
    F.Destroy;
    
end;

procedure TFImportacionDepsRazas.LImpHerefordClick(Sender: TObject);
var F : TFImportacionDepsRazasExcel;
    ruta : string;
begin

    ruta := ExtractFilePath(Application.ExeName) + '\RefDepsHereford.bmp';

    F := TFImportacionDepsRazasExcel.Create(self);
    F.NombreRaza := 'Hereford';
    F.Id_Raza := 4;
    F.PPrincipal.Visible := false;
    F.LNombreRaza.Caption := 'para Raza Hereford';
    F.TipoImportacion := 'Importación Datos Genéticos Hereford';
    F.IReferenciaDeps.Picture.LoadFromFile(ruta);
    F.PPrincipal.Align := alClient;
    F.PPrincipal.Visible := true;

    F.ShowModal;
    F.Destroy;
    
end;

procedure TFImportacionDepsRazas.LShorthornClick(Sender: TObject);
var F : TFImportacionDepsRazasExcel;
    ruta : string;
begin

    ruta := ExtractFilePath(Application.ExeName) + '\RefDepsShorthorn.bmp';

    F := TFImportacionDepsRazasExcel.Create(self);
    F.NombreRaza := 'Shorthorn';
    F.Id_Raza := 7;
    F.PPrincipal.Visible := false;
    F.LNombreRaza.Caption := 'para Raza Shorthorn';
    F.TipoImportacion := 'Importación Datos Genéticos Shorthorn';
    F.IReferenciaDeps.Picture.LoadFromFile(ruta);
    F.PPrincipal.Align := alClient;
    F.PPrincipal.Visible := true;

    F.ShowModal;
    F.Destroy;

end;

end.
