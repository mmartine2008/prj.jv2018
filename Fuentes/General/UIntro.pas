unit UIntro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, OleCtrls,
  ShockwaveFlashObjects_TLB;

type
  TFIntro = class(TFUniversal)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    SWFIntro: TShockwaveFlash;
    ChkBMostrarIntro: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ChkBMostrarIntroClick(Sender: TObject);
  private
    { Private declarations }
    procedure setMostrarIntro(valor: boolean);
  public
    { Public declarations }
  end;

var
  FIntro: TFIntro;

implementation

uses IniFiles;

{$R *.dfm}

procedure TFIntro.FormShow(Sender: TObject);
begin
  inherited;
  {$IFDEF DEMO}
    {$IFDEF PRODUCTORES}
       //
    {$ELSE}
      SWFIntro.Movie:= pathDirExe+'documentacion\autocapacitacionDemoVet.swf';
      SWFIntro.Play;
      ChkBMostrarIntro.Visible:= False;
    //AbrirFormNormal(TFIntro.Create(self));
    {$ENDIF}
  {$ELSE}
    {$IFDEF PRODUCTORES}
       //
    {$ELSE}
      SWFIntro.Movie:= pathDirExe+'documentacion\autocapacitacionDemoVet.swf';
//      SWFIntro.Movie:= pathDirExe+'documentacion\autocapacitacionVet.swf';
      SWFIntro.Play;
      ChkBMostrarIntro.Visible:= False;
    //AbrirFormNormal(TFIntro.Create(self));
    {$ENDIF}
  {$ENDIF}
end;

procedure TFIntro.FormResize(Sender: TObject);
begin
  inherited;
  SWFIntro.Repaint;
end;

procedure TFIntro.setMostrarIntro(valor: boolean);
var ArchivoIni : TiniFile;
begin
  try
    begin
      ArchivoIni := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'huella.ini');
      if (valor) then
        ArchivoIni.WriteInteger('Introduccion','Mostrar', 0)
       else
        if not(valor) then
          ArchivoIni.WriteInteger('Introduccion','Mostrar', 1);
    end
  except on e:Exception do
  end
end;

procedure TFIntro.ChkBMostrarIntroClick(Sender: TObject);
begin
  inherited;
  setMostrarIntro(ChkBMostrarIntro.Checked);
end;

end.
