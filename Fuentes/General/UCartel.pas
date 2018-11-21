unit UCartel;

interface

uses UEstadoConexionBase;

type TCartel= class(TObject)
  public
    ThConexion:TThreadConexion;

    flag: integer;

    class function getInstance: TCartel;

    procedure FreeInstance; override;

    class function RefCount: Integer;

    constructor create;
    procedure abrircartel(s: string);
    procedure cerrarcartel;
    procedure mensajeError(texto: string);

    procedure abrirCartelProgressBar(s: string);
    procedure cerrarCartelProgressBar;
    procedure setCartelProgressBar(t: string; v: integer);

end;

var
  Instance  : TCartel  = nil;
  Ref_Count : Integer     = 0;
  progreso : integer = 0;

implementation

uses Dialogs, UTraduccion, Classes;

//****************************************************************************\\
class function TCartel.getInstance: TCartel;
begin
  if ( not Assigned( Instance ) ) then
  begin
    Instance := TCartel.Create;
  end;
  Result := Instance;
  Inc( Ref_Count );
end;
//****************************************************************************\\
procedure TCartel.FreeInstance;
begin
  Dec( Ref_Count );
  if ( Ref_Count = 0 ) then
  begin
    Instance := nil;
    // Destroy private variables here
    inherited FreeInstance;
  end;
end;
//****************************************************************************\\
class function TCartel.RefCount: Integer;
begin
  Result := Ref_Count;
end;
//****************************************************************************\\
procedure TCartel.abrircartel(s: string);
begin
  if {flag=0} Ref_Count = 1 then
  begin
    if ThConexion <> nil then
      ThConexion.Free;
    ThConexion := TThreadConexion.Create(True);
    ThConexion.mensaje:=Traducir(s);
    ThConexion.Resume;
  end;
  //inc(flag);
end;
//****************************************************************************\\
procedure TCartel.cerrarcartel;
begin
  if {flag=1} Ref_Count = 1 then
  begin
    if thconexion<>nil then
    begin
      Thconexion.suspend;
      thconexion.Free;
      thconexion:=nil;
    end;
    //flag:=0;
  end
  {else
    dec(flag)};
end;
//****************************************************************************\\
constructor TCartel.create;
begin
  inherited;
  flag:=0;
end;
//****************************************************************************\\
procedure TCartel.mensajeError(texto: string);
begin
  MessageDlg(texto, mtError, [mbOK], 0);
end;
//****************************************************************************\\
procedure TCartel.abrirCartelProgressBar(s: string);
begin

  abrircartel(s);

  progreso := 0;

  ThConexion.FormBase.Label2.Alignment := taCenter;
  ThConexion.FormBase.Height := 175;
  ThConexion.FormBase.ProgressBar1.Visible := true;
  ThConexion.FormBase.ProgressBar1.StepBy(progreso);
  ThConexion.FormBase.Repaint;

end;
//****************************************************************************\\
procedure TCartel.cerrarCartelProgressBar;
begin

  cerrarcartel;

end;
//****************************************************************************\\
procedure TCartel.setCartelProgressBar(t: string; v : integer);
begin

  progreso := progreso + v;

  ThConexion.FormBase.Label2.Alignment := taCenter;
  ThConexion.FormBase.Label2.Caption := t;
  ThConexion.FormBase.ProgressBar1.StepBy(progreso);
  ThConexion.FormBase.Repaint;

end;


end.
