unit UAcerca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, Buttons, ExtCtrls, jpeg, shellapi, UTraduccion;

type
  TFAcerca = class(TFUniversal)
    ILogo: TImage;
    Memo1: TMemo;
    softHuellaLink: TLabel;
    procedure BBAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure softHuellaLinkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAcerca: TFAcerca;

implementation

{$R *.dfm}

procedure TFAcerca.BBAceptarClick(Sender: TObject);
begin
  inherited;
  close();
end;

procedure TFAcerca.FormShow(Sender: TObject);
begin
  PTitulo.Caption := Traducir('Acerca');
  LTitulo.Caption := Traducir('Acerca');
  //pathDirExe:= ExtractFilePath(Application.ExeName);
  ILogo.Picture.LoadFromFile(pathDirExe+'imagenes\logoAcerca.jpg');
  ILogo.Stretch:= false;
  ILogo.Stretch:= true;  
  inherited;
end;

procedure TFAcerca.FormCreate(Sender: TObject);
begin
  inherited;
  {$IFDEF PRODUCTORES}
    softHuellaLink.Font.Color := $004FAB52;
  {$ELSE}
    softHuellaLink.Font.Color := clTeal;
  {$ENDIF}
end;

procedure TFAcerca.softHuellaLinkClick(Sender: TObject);
begin
  inherited;
  ShellExecute(Application.MainForm.Handle , 'open',PChar(softHuellaLink.Caption), nil, nil, SW_MAXIMIZE);
end;

end.
