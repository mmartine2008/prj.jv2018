unit UThreadBckBase;

interface
  uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, IBSQLMonitor,
    Forms, ExtCtrls, ComCtrls, StdCtrls, Dialogs, IB;

  type

    TThreadBckBase = class(TThread)
    private
      Monitor : TIBSQLMonitor;
      Timer : TTimer;
      FMutex : THandle;
      Archivo : TextFile;
      procedure BackUP;
    public
      procedure Execute; override;
    published
      constructor Create(); reintroduce;
      procedure OnTimer(Sender : TObject);
      procedure MonitorSQL(EventText: String; EventTime: TDateTime);
      procedure Destruir();
    end;

implementation

constructor TThreadBckBase.Create();
begin
  inherited Create(false);
  Monitor := TIBSQLMonitor.Create(nil);
  Timer := TTimer.Create(nil);
  Monitor.OnSQL := MonitorSQL;
  Monitor.Enabled := true;
  Monitor.TraceFlags := [tfError,tfTransact];
  Timer.OnTimer := OnTimer;
  Timer.Tag := 0;
  Timer.Interval := 1000;
  FMutex := CreateMutex(nil,false,'');
end;

procedure TThreadBckBase.Destruir;
begin
  CloseHandle(FMutex);
end;

procedure TThreadBckBase.OnTimer(Sender : TObject);
begin
  if Timer.Tag = 900000 then  //esta en milisegundos = 15 min
  begin
    Timer.Tag := 1;
    Timer.Enabled := false;
    BackUP;
    Timer.Enabled := true;
  end
  else
    Timer.Tag := Timer.Tag+1;
end;

procedure TThreadBckBase.Execute;
begin
  Timer.Enabled := true;
  while true do Application.ProcessMessages;
end;

procedure TThreadBckBase.MonitorSQL(EventText: String; EventTime: TDateTime);
begin
{  WaitForSingleObject(FMutex,INFINITE);
  Assign(Archivo,ExtractFilePath(Application.ExeName)+'\prueba.txt');
  if FileExists(Archivo) then
  begin
    Reset(Archivo);
  end
  else
    ReWrite(Archivo);
  WriteLn(Archivo,DateToStr(EventTime)+' - '+EventText);
  //showmessage(EventText);
  CloseFile(Archivo);
  ReleaseMutex(FMutex);      }
end;

procedure TThreadBckBase.BackUP;
begin

end;

end.
