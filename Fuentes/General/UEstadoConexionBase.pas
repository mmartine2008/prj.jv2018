unit UEstadoConexionBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  ImgList, jpeg, PngImage, ComCtrls{, jpeg, aniicon, JvExControls, JvAnimatedImage, JvGIFCtrl};//, SplashScreenConf;

type
  TEstadoConexionBase = class;
  TThreadConexion = class;


  TThreadConexion = class(TThread)
  private
    { Private declarations }
    FForm : TEstadoConexionBase;

  protected
    procedure ActualizarConexion;
    procedure ActualizarTablas;
    procedure ActualizarEscenarios;


  public
    mensaje: string;
    procedure execute; override;
    procedure suspend;
    procedure resume;
    property FormBase: TEstadoConexionBase read FForm write FForm;
  end;

  TEstadoConexionBase = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ImageList1: TImageList;
    Image3: TImage;
    LTipoVersionLicenciaDerechaCartel: TLabel;
    ProgressBar1: TProgressBar;
    procedure TimerTerminarTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    FConexion: Boolean;
    FTablas: Boolean;
    FEscenarios: Boolean;
    { Private declarations }

   
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

    property Conexion   : Boolean read FConexion  write FConexion default False;
    property Tablas     : Boolean read FTablas    write FTablas default False;
    property Escenarios : Boolean  read FEscenarios  write FEscenarios  default False;

  end;

var
  EstadoConexionBase: TEstadoConexionBase;
  ThConexion  : TThreadConexion;

implementation
//uses uprincipaldred;
uses UPrincipal, UTraduccion, uTiposGlobales;
{$R *.dfm}

procedure TThreadConexion.ActualizarConexion;
begin
  FForm.Label1.Caption := 'Abriendo las Tablas';
  FForm.Invalidate;
  FForm.Repaint;
  FForm.Paint;
end;

procedure TThreadConexion.ActualizarEscenarios;
begin
  FForm.Label1.Caption := 'Proceso Terminado';
  FForm.Invalidate;
  FForm.Repaint;
  FForm.Paint;
end;

procedure TThreadConexion.ActualizarTablas;
begin
  FForm.Label1.Caption := 'Abriendo los Escenarios';
  FForm.Invalidate;
  FForm.Repaint;
  FForm.Paint;
end;

procedure TThreadConexion.Execute;
var pathDirExe: String;
begin
  inherited;
  if FForm =nil then
      self.FForm:=TEstadoConexionBase.Create(nil);


  self.FForm.Caption := Traducir('Información de HUELLA');
  self.FForm.Label2.Caption:=mensaje;
  self.FForm.Label2.Alignment := taCenter;
  self.FForm.Position:=poScreenCenter;

  pathDirExe:= ExtractFilePath(Application.ExeName);
  if FPrincipal.TipoActividad = ttaFeedlot then
    self.FForm.Image3.Picture.LoadFromFile(pathDirExe+'imagenes\Feedlot\cartel.png')
  else
    self.FForm.Image3.Picture.LoadFromFile(pathDirExe+'imagenes\cartel.png');
  self.FForm.Show;
  //self.FForm.Timer1.Enabled:= true;

  FForm.Invalidate;
  FForm.Repaint;
  Application.ProcessMessages;
//  while (true) do
//   begin
      if (self.FForm.Label2.Color = clWhite) then
         self.FForm.Label2.Color:= $00606D01
       else
         self.FForm.Label2.Color:= clWhite;
      //Application.ProcessMessages;
//       self.WaitFor;
//    end;

end;

procedure TThreadConexion.resume;
begin
  self.execute;
end;

procedure TThreadConexion.suspend;
begin
  self.FForm.Close;
  self.FForm.Free;
end;

{ TEstadoConexionBase }

procedure TEstadoConexionBase.TimerTerminarTimer(Sender: TObject);
begin
  Close;
  Hide;
end;

constructor TEstadoConexionBase.Create(AOwner: TComponent);
begin
  inherited;
  FConexion := False;
  FTablas := False;
  FEscenarios := False;
end;

procedure TEstadoConexionBase.FormShow(Sender: TObject);
begin
  FConexion := False;
  FTablas := False;
  FEscenarios := False;

  LTipoVersionLicenciaDerechaCartel.Caption:= '';
  Label1.Caption := Traducir('Por favor espere...');

  Label2.Alignment := taCenter;

  Label2.Caption := Traducir(Label2.Caption);

  {$IFDEF PEN}
    {$IFDEF TERMINAL}
        LTipoVersionLicenciaDerechaCartel.Caption := Traducir('');
      {$ELSE}
        {$IFDEF DEMO}
          {$IFDEF EC}
            LTipoVersionLicenciaDerechaCartel.Caption:= Traducir('Educación Continua');
          {$ELSE}
            LTipoVersionLicenciaDerechaCartel.Caption:= Traducir('');
          {$ENDIF}
        {$ELSE}
          LTipoVersionLicenciaDerechaCartel.Caption:= Traducir('MODULO PENDRIVE');
        {$ENDIF}
      {$ENDIF}
  {$ELSE}
      {if (FPrincipal <> nil) then
        if (FPrincipal.TipoVersionLicencia = 'Basico') then
          begin
            LTipoVersionLicenciaDerechaCartel.Caption:= Traducir('MODULO BASE');
          end
         else
          if (FPrincipal.TipoVersionLicencia = 'Estandar') then
            begin
              LTipoVersionLicenciaDerechaCartel.Caption:= Traducir('MODULO ESTANDAR');
            end
           else
            if (FPrincipal.TipoVersionLicencia = 'Full') then
              begin
                LTipoVersionLicenciaDerechaCartel.Caption:= '';
              end;    }
  {$ENDIF}
end;

end.
