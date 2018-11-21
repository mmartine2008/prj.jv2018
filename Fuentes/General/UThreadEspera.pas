unit UThreadEspera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, IBQuery,
  JvExControls, JvgProgress, JvWaitingGradient, UPrincipal;

type
  TFThreadEspera = class(TFUniversal)
    LLeyenda: TLabel;
    JvWGEspera: TJvWaitingGradient;
    procedure FormShow(Sender: TObject);
  private
    FormPadre : TFUniversal;
  public

  end;

  TThreadAtomico_O = class(TThread)
  private
    Formulario : TFThreadEspera;
  public
    constructor Create(Padre : TFUniversal); reintroduce;
    procedure Execute; override;
  end;

  TFCartelOpenQuery = class   //Abre un query Query.Open
  private
    Thread : TThreadAtomico_O;
  public
    constructor Create(Padre : TFUniversal); reintroduce;
    procedure BeforeOpenQuery();
    procedure AfterOpenQuery();
  end;

  TThreadAtomico_LF = class(TThread)   //Hace un Last y un First de un Query abierto
  private
    Query : TIBQuery;
  public
    constructor Create(IBQ : TIBQuery); reintroduce;
    procedure Execute; override;
  end;

  TThreadEspera = class(TThread)
  private
    Form : TFThreadEspera;
    Query : TIBQuery;
    T_LF : TThreadAtomico_LF;
    procedure Terminar(Sender : TObject);
  public
    constructor Create(Owner : TFUniversal; CreateSuspend : Boolean; IBQ : TIBQuery; Leyenda : String); reintroduce;
    procedure Execute; override;
  end;

var
  FThreadEspera: TFThreadEspera;

implementation

{$R *.dfm}

/// Class TThreadAtomico LF
constructor TThreadAtomico_LF.Create(IBQ : TIBQuery);
begin
  Query := IBQ;
  inherited Create(false);
  Priority := tpNormal;
end;

procedure TThreadAtomico_LF.Execute;
begin
  Query.First;
  while not Query.Eof do Synchronize(Query.Next);
  Query.First;
  Terminate;
end;

/// Class TThreadAtomico_O
constructor TThreadAtomico_O.Create(Padre : TFUniversal);
begin
  inherited Create(true);
  Formulario := TFThreadEspera.Create(nil);
  Formulario.FormPadre := TFUniversal.Create(nil);
  Formulario.FormPadre := Padre;
  Formulario.LLeyenda.Caption := 'Abriendo Consulta';
end;

procedure TThreadAtomico_O.Execute;
begin
  //Formulario.FormPadre.Enabled := false;
  Formulario.Show;
  while not Terminated do Application.ProcessMessages;
  Formulario.Close;
  //Formulario.FormPadre.Enabled := true;
end;

/// Class TFCartelOpenQuery
constructor TFCartelOpenQuery.Create(Padre : TFUniversal);
begin
  Thread := TThreadAtomico_O.Create(Padre);
end;

procedure TFCartelOpenQuery.BeforeOpenQuery();
begin
  Thread.Resume;
end;

procedure TFCartelOpenQuery.AfterOpenQuery();
begin
  Thread.Terminate;
  //Thread.Destroy;
end;

/// Class TThreadEspera
constructor TThreadEspera.Create(Owner : TFUniversal; CreateSuspend : Boolean; IBQ : TIBQuery; Leyenda : String);
begin
  Query := IBQ;
  inherited Create(CreateSuspend);
  Priority := tpNormal;
  Form := TFThreadEspera.Create(nil);
  Form.FormPadre := TFUniversal.Create(nil);
  Form.FormPadre := Owner;
  Form.LLeyenda.Caption := Leyenda;
  //Deshabilito los Timers de control
  FPrincipal.TimerLlave.Enabled := false;
  FPrincipal.TCheck.Enabled := false;
end;

procedure TThreadEspera.Execute;
begin
  Form.Show;
  Form.FormPadre.Enabled := false;
  T_LF := TThreadAtomico_LF.Create(Query);
  T_LF.OnTerminate := Terminar;
  T_LF.Resume;
  while not T_LF.Terminated do Application.ProcessMessages;
end;

procedure TThreadEspera.Terminar(Sender : TObject);
begin
  Form.FormPadre.Enabled := true;
  Form.Close;
  //Habilito los timers de control
  FPrincipal.TimerLlave.Enabled := true;
  FPrincipal.TCheck.Enabled := true;
  Terminate;
end;

/// Class TFThreadEspera
procedure TFThreadEspera.FormShow(Sender: TObject);
begin
  inherited;
  JvWGEspera.Active := true;
end;



end.
