unit UUniversal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ActnList, StdCtrls, HtmlHlp, DB, IBCustomDataSet,
  IBStoredProc, DataExport, DataToXLS, WinXP, jpeg, UDMSoftvet, IBQuery,
  AppEvnts, UBDBGrid, DBGrids, TypInfo, Buttons, Registry, JvExExtCtrls,
  JvImage, PngImage, JvGIF, JvExControls, JvLabel, ImgList, PngImageList;

type
  TRecTraducible = record
    Componente : TComponent;
    Propiedad : String;
  end;

  TArrTraducibles = Array of TRecTraducible;

  TFUniversal = class(TForm)
    PTitulo: TPanel;
    ALUniversal: TActionList;
    Image2: TImage;
    LTitulo: TLabel;
    AAyuda: TAction;
    IBSPEstadisticas: TIBStoredProc;
    SDXLS: TSaveDialog;
    DTXLS: TDataToXLS;
    WinXP1: TWinXP;
    IBSPBorrarTablasAuxiliares: TIBStoredProc;
    IBSPFixEstadoLactacion: TIBStoredProc;
    IBStoredFixIDTratamiento: TIBStoredProc;
    IBSPGeneradores: TIBStoredProc;
    IBSPFixTabEstablecimientoPais: TIBStoredProc;
    IBSPFIXRelGruposEventos: TIBStoredProc;
    IBQGetCantAnimales: TIBQuery;
    LTipoVersionLicenciaDerecha1: TLabel;
    ITope: TImage;
    Image10: TImage;
    LTipoVersionLicenciaDerecha: TJvLabel;
    PILeft: TPanel;
    Image3: TImage;
    Image4: TImage;
    IVersionTop: TImage;
    Psocalo: TPanel;
    JvSocalo: TJvImage;
    LDerechos: TLabel;
    PLVersion: TPngImageList;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AAyudaExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);

  private
    FCaminoDirectorio: string;
    FCantAnimalesEjecuciones: Integer;
    function getCaminoDirectorio: string;
    procedure WMSYSCOMMAND(var Msg: TMessage); message WM_SYSCOMMAND;
    procedure DBGridCapturaRueda(var Message: TMessage);
    function ExisteLectorPDF() : Boolean;
    procedure acomodarLabelImagenes();
    procedure CompletarTraducibles;

  protected
      Traducibles : TArrTraducibles;
      procedure PublicarMensaje(Msj: String);
      procedure ComponentesVisiblesPorPais(pais: Integer);virtual;
      procedure HabilitarComponentesVersionBasica; virtual;
      function HH(Command: Word; Data: Integer;var CallHelp: Boolean): Boolean;
      procedure HabilitarDesabilitarControles();

  public
  published
    property CaminoDirectorio: string read getCaminoDirectorio;
    property CantAnimalesEjecuciones: Integer read FCantAnimalesEjecuciones write FCantAnimalesEjecuciones;

  end;

var

  FUniversal: TFUniversal;
  dummy: Boolean;
  pathDirExe: String;


implementation

{$R *.DFM}

uses
    ShellApi, UMensajeHuella, QuickRpt,uTiposGlobales,
  {$ifndef TEST_EXTERNAL}
  UEveUniversal, UEveIndividual,
    UPrincipal,
    {$endif}
  Variants, UTraduccion, Types;

type
   TomaInvento = class(TControl);

procedure TFUniversal.FormShow(Sender: TObject);
var
  hco : integer;
  ind : integer;

begin

  pathDirExe:= ExtractFilePath(Application.ExeName);

  if FPrincipal.TipoActividad = ttaFeedlot then
  begin
    PTitulo.Color := $00000082;
    PILeft.Color := $00000082;
    LTitulo.Font.Color := clWhite;
    PTitulo.ParentBackground := false;
    PTitulo.ParentBackground := true;
    PTitulo.ParentBackground := false;
    PILeft.ParentBackground := false;
    PILeft.ParentBackground := true;
    PILeft.ParentBackground := false;
    Application.ProcessMessages;
    Image2.Picture.LoadFromFile(pathDirExe+'imagenes\Feedlot\barra_izquierda.png');
    Image3.Picture.LoadFromFile(pathDirExe+'imagenes\Feedlot\barra_derecha.png');
    ITope.Picture := nil;
    ITope.Visible := false;
  end
  else
  begin
    PTitulo.Color := clWhite;
    PILeft.Color := clWhite;
    LTitulo.Font.Color := clBlack;
    PTitulo.ParentBackground := false;
    PTitulo.ParentBackground := true;
    PTitulo.ParentBackground := false;
    PILeft.ParentBackground := false;
    PILeft.ParentBackground := true;
    PILeft.ParentBackground := false;
    Application.ProcessMessages;
    Image2.Picture.LoadFromFile(pathDirExe+'imagenes\barra_izquierda.png');
    Image3.Picture.LoadFromFile(pathDirExe+'imagenes\barra_derecha.png');
    ITope.Picture.LoadFromFile(pathDirExe+'imagenes\borde_up.png');
    ITope.Visible := true;
  end;

  //Image4.Picture.LoadFromFile(pathDirExe+'imagenes\barra_centro.jpg');
  {$IFDEF EC}
    Caption := 'Huella - ' + PTitulo.Caption;
    LTitulo.Caption := PTitulo.Caption;
  {$ELSE}
    Caption := 'Huella - ' + Traducir(PTitulo.Caption);
    LTitulo.Caption := Traducir(PTitulo.Caption);
  {$ENDIF}
  hco := 0;
  
  // Obtenemos el HelpContext
  try
    if (DMSoftvet <> nil) then begin
      DMSoftvet.IBQFormularios.Close;
      DMSoftvet.IBQFormularios.ParamByName('form').AsString := Name;
      DMSoftvet.IBQFormularios.Open;
      hco := DMSoftvet.IBQFormularios.FieldByName('id_formulario').AsInteger * 1000;
    end;
    // Pegamos los HelpContext en el formulario
    HelpContext := hco;
    // ... y en sus componentes
    for ind := 0 to ComponentCount -1 do
      if (Components[ind] is TControl) then
        TControl(Components[ind]).HelpContext := hco;
  except on e:Exception do
    begin
    end;
  end;

  SDXLS.InitialDir:= ExtractFileDir(Application.ExeName)+'\Exportacion';

{  try
    IBSPBorrarTablasAuxiliares.ExecProc;
  except on e:exception do
  end;   }

{$IFDEF DEMO}
  {$IFDEF EC}
    CantAnimalesEjecuciones:= 10000000; // Demo para educacion continua
  {$ELSE}
    CantAnimalesEjecuciones:= 2566; //Son 300 mas de los que tiene cargados
    IBQGetCantAnimales.Close;
    IBQGetCantAnimales.Open;
    if (IBQGetCantAnimales.FieldByName('cantidad').AsInteger > CantAnimalesEjecuciones) then
      MostrarMensaje(tmInformacion,'Ha superado la cantidad de animales permitidos para la versión demo. Ingrese a http://www.softhuella.com.ar para más información.' );
  {$ENDIF}
{$ENDIF}

  HabilitarComponentesVersionBasica();

  acomodarLabelImagenes();
end;

procedure TFUniversal.PublicarMensaje(Msj: String);
begin
//  SBUniversal.SimpleText:=Msj;
//  SBUniversal.Font.Style :=[fsBold];
end;

procedure TFUniversal.CompletarTraducibles;
var
  indComp, IndTrad : integer;
  Comp : TComponent;
  I : Integer;
  D : Double;
begin
  {$IFDEF PEN}
  {$ELSE}
  IndTrad := 0;
  for indComp := 0 to ComponentCount-1 do
  begin
    Comp := Components[indComp];
    if Comp <> nil then
     // if Comp is TControl then
      begin
        if IsPublishedProp(Comp,'Caption') then //Labels, CheckBox y RadioButtons
          if (GetPropValue(Comp,'Caption') <> '') and not (VarIsNumeric(GetPropValue(Comp,'Caption'))) then
          begin  //SetPropValue(Comp,'Caption',Traducir(GetPropValue(Comp,'Caption')));
            SetLength(Traducibles,IndTrad+1);
            Traducibles[IndTrad].Componente := Comp;
            Traducibles[IndTrad].Propiedad := 'Caption';
            Inc(IndTrad);
          end;
          if IsPublishedProp(Comp,'Text') then  //Edits
            if (GetPropValue(Comp,'Text') <> '') then
            begin
              if not TryStrToInt(GetPropValue(Comp,'Text'),I) then
              begin  //SetPropValue(Comp,'Text','Ingles');
                SetLength(Traducibles,IndTrad+1);
                Traducibles[IndTrad].Componente := Comp;
                Traducibles[IndTrad].Propiedad := 'Text';
                Inc(IndTrad);
              end;
              if not TryStrToFloat(GetPropValue(Comp,'Text'),D) then
              begin  //SetPropValue(Comp,'Text',Traducir(GetPropValue(Comp,'Text')));
                SetLength(Traducibles,IndTrad+1);
                Traducibles[IndTrad].Componente := Comp;
                Traducibles[IndTrad].Propiedad := 'Text';
                Inc(IndTrad);
              end;
            end;
          if (Comp is TBitDBGrid) then
          begin
            SetLength(Traducibles,IndTrad+1);
            Traducibles[IndTrad].Componente := Comp;
            Traducibles[IndTrad].Propiedad := 'BitDBGrid';
            Inc(IndTrad);
          end;
          if (Comp is TDBGrid) then
          begin
            SetLength(Traducibles,IndTrad+1);
            Traducibles[IndTrad].Componente := Comp;
            Traducibles[IndTrad].Propiedad := 'DBGrid';
            Inc(IndTrad);
          end;
          if (Comp is TRadioGroup) then
          begin
            SetLength(Traducibles,IndTrad+1);
            Traducibles[IndTrad].Componente := Comp;
            Traducibles[IndTrad].Propiedad := 'RadioGroup';
            Inc(IndTrad);
          end;
      end;
  end;
  {$ENDIF}
end;

procedure TFUniversal.FormCreate(Sender: TObject);
Const
  Proporcion = 4/3;
begin
  CompletarTraducibles;

  LDerechos.Left := (Psocalo.Width div 2) - (LDerechos.Width div 2);

  Application.OnHelp := HH;

  JvSocalo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\Socalo.png');
end;

function TFUniversal.HH(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
begin
  if (Command = 0) and (Data = 0) then
    HtmlHelp(Application.Handle, PChar(Application.HelpFile), HH_DISPLAY_TOC, 0);
  CallHelp := False;
  Result := True;
end;

function TFUniversal.ExisteLectorPDF : Boolean;

begin
 { Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CLASSES_ROOT;
  Result := Reg.KeyExists('.pdf\OpenWithList');
  Reg.Destroy;}
  Result := true;
end;

procedure TFUniversal.AAyudaExecute(Sender: TObject);
var
  Dir : String;
begin

  if ExisteLectorPDF then
  begin
    Dir := ExtractFilePath(Application.ExeName)+'\Documentacion\Manual de Usuario.pdf';
    ShellExecute(self.Handle,'open',PChar(Dir),nil,nil,SW_SHOWNORMAL);
  end
  else
    MostrarMensaje(tmInformacion,'No tiene instalado ningún lector de archivos PDF. Se le recomienda instalar Acrobat Reader para poder ver la ayuda.');


 { aux := PAnsiChar(copy(Application.ExeName, 0, length(Application.ExeName) -4) + '.chm');
  HtmlHelp(0, aux, HH_HELP_CONTEXT, HelpContext);}
end;

function TFUniversal.getCaminoDirectorio: string;
begin

   FCaminoDirectorio := copy(Application.ExeName, 0, length(Application.ExeName) - 4) + '.Chm';
   result := FCaminoDirectorio;
end;


// usar este metodo en el caso de que empiecen a surgir problemas con cerrar desde la cruz
procedure TFUniversal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
{  if MessageDlg('Close the form?', mtConfirmation,
    [mbOk, mbCancel], 0) = mrCancel then
     CanClose := False;}
end;

procedure TFUniversal.ComponentesVisiblesPorPais(pais: Integer);
begin

end;

procedure TFUniversal.WMSYSCOMMAND(var Msg: TMessage);
begin
  if Msg.wParam = SC_MINIMIZE then
  begin
    Application.Minimize;
  end else
    Inherited;
end;

procedure TFUniversal.DBGridCapturaRueda(var Message: TMessage);
{ var
   Cuanto : short;
   ind: Integer;}
 begin
 { for ind := 0 to ComponentCount -1 do
    if (Components[ind] is TBitDbGrid) then
       begin
        if (Message.Msg = WM_MOUSEWHEEL) then
          begin
           Cuanto:=HIWORD(Message.WParam);
           Cuanto:=Cuanto div 120;
           TBitDbGrid(Components[ind]).DataSource.DataSet.MoveBy(-Cuanto);
          end
         else TomaInvento(TBitDbGrid(Components[ind])).WndProc(Message);
       end
     else
         begin
          if (Components[ind] is TDbGrid) then
            if (Message.Msg = WM_MOUSEWHEEL) then
              begin
               Cuanto:=HIWORD(Message.WParam);
               Cuanto:=Cuanto div 120;
               TDbGrid(Components[ind]).DataSource.DataSet.MoveBy(-Cuanto);
              end
             else TomaInvento(TDbGrid(Components[ind])).WndProc(Message);
         end;     }
end;

procedure TFUniversal.HabilitarDesabilitarControles;
var i : Integer;
begin
  for i:= 0 to ComponentCount-1 do
    begin
      if (self.components[i] is TControl) then
         TControl(self.components[i]).Enabled:= not(TControl(self.components[i]).Enabled);
    end;
end;

procedure TFUniversal.HabilitarComponentesVersionBasica;
begin
//
end;

procedure TFUniversal.acomodarLabelImagenes;
begin
  {$IFDEF PEN}
      LTipoVersionLicenciaDerecha.Caption:= '';
      LTipoVersionLicenciaDerecha.Left:= Image2.Left + Image2.Width + 5;
      LTipoVersionLicenciaDerecha.Top:= PTitulo.Top + PTitulo.Height - LTipoVersionLicenciaDerecha.Height-7;
      {$IFDEF TERMINAL}
        LTipoVersionLicenciaDerecha.Caption:= Traducir('');
      {$ELSE}
        {$IFDEF DEMO}
          {$IFDEF EC}
            LTipoVersionLicenciaDerecha.Caption:= 'Educación Continua';
          {$ELSE}
            LTipoVersionLicenciaDerecha.Caption:= Traducir('');
          {$ENDIF}
        {$ELSE}
          LTipoVersionLicenciaDerecha.Caption:= Traducir('MODULO PENDRIVE');
        {$ENDIF}
      {$ENDIF}
      //PLVersion.GetBitmap(3,IVersionTop.Picture.Bitmap);
  {$ELSE}
        LTipoVersionLicenciaDerecha.Caption:= '';
        LTipoVersionLicenciaDerecha.Left:= Image2.Left + Image2.Width + 5;
        LTipoVersionLicenciaDerecha.Top:= PTitulo.Top + PTitulo.Height - LTipoVersionLicenciaDerecha.Height-7;
        {$IFDEF DEMO}
          {$IFDEF EC}
            LTipoVersionLicenciaDerecha.Caption:= 'Educación Continua';
          {$ELSE}
            LTipoVersionLicenciaDerecha.Caption:= Traducir('');
          {$ENDIF}
        {$ELSE}
        {if (FPrincipal <> nil) then
          if (FPrincipal.TipoVersionLicencia = 'Basico') then
            begin
              LTipoVersionLicenciaDerecha.Caption:= Traducir('MODULO BASE');
            end
           else
            if (FPrincipal.TipoVersionLicencia = 'Estandar') then
              begin
                LTipoVersionLicenciaDerecha.Caption:= Traducir('MODULO ESTANDAR');
              end
             else
              if (FPrincipal.TipoVersionLicencia = 'Full') then
                begin
                  LTipoVersionLicenciaDerecha.Caption:= '';
                end;    }
        {$ENDIF}
  {$ENDIF}
end;

procedure TFUniversal.FormResize(Sender: TObject);
begin
  acomodarLabelImagenes();
end;

procedure TFUniversal.FormPaint(Sender: TObject);
var
  Indice : Integer;
begin

end;

end.


