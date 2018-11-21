unit UImpExpExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, DateUtils, OleCtnrs,
  PngImage, jpeg, JvExExtCtrls, JvImage, Ayuda3;

type
  TFImpExpExcel = class(TFUniversal)
    ODExcel: TOpenDialog;
    PInicial: TPanel;
    PCont: TPanel;
    OleCExcel: TOleContainer;
    PBoton: TPanel;
    Button1: TButton;
    Button2: TButton;
    IExcelNuevo: TImage;
    ISearchExcel: TImage;
    LNuevoExcel: TLabel;
    LBuscarExcel: TLabel;
    IBottom: TImage;
    IGuardar: TImage;
    IGuardarImp: TImage;
    ISalir: TImage;
    LGuardar: TLabel;
    LGuardarImportar: TLabel;
    LCancel: TLabel;
    PASelOpcExcel: TPanelAyudaHuella3;
    JvImage13: TJvImage;
    Image1: TImage;
    Image5: TImage;
    Label103: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label106: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    CheckBox17: TCheckBox;
    PANuevoExcel: TPanelAyudaHuella3;
    JvImage1: TJvImage;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Image6: TImage;
    Image7: TImage;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    CheckBox1: TCheckBox;
    PASelArch: TPanelAyudaHuella3;
    JvImage2: TJvImage;
    Image8: TImage;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label236: TLabel;
    Label41: TLabel;
    CheckBox2: TCheckBox;
    procedure BExpClick(Sender: TObject);
    procedure BImpClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure IGuardarClick(Sender: TObject);
    procedure JvImage13Click(Sender: TObject);
    procedure PANuevoExcelClick(Sender: TObject);
    procedure JvImage1Click(Sender: TObject);
  private
    procedure SeleccionEvento;
    procedure SetConatainer;
    procedure AcomodarBottom;
    procedure CargarTopImgHints(Itop: String);
    procedure CargarCenterImgHints(ICenter: String);
    procedure CargarBottomImgHints(IBottom: String);
  public
    Evento : Integer;
    archivo_Importacion : String;
    archivo_Exportacion : String;
    Salida : Integer;
  end;

var
  FImpExpExcel: TFImpExpExcel;

implementation

{$R *.dfm}

uses
  UPrincipal, UEveAltaMasiva;

procedure TFImpExpExcel.CargarTopImgHints(Itop: String);
begin
   PANuevoExcel.AsignarTop(Itop);
   PASelArch.AsignarTop(Itop);
   PASelOpcExcel.AsignarTop(Itop);
end;


procedure TFImpExpExcel.CargarCenterImgHints(ICenter: String);
begin
   PANuevoExcel.AsignarCenter(ICenter);
   PASelArch.AsignarCenter(ICenter);
   PASelOpcExcel.AsignarCenter(ICenter);
end;


procedure TFImpExpExcel.CargarBottomImgHints(IBottom: String);
begin
   PANuevoExcel.AsignarBottom(IBottom);
   PASelArch.AsignarBottom(IBottom);
   PASelOpcExcel.AsignarBottom(IBottom);
end;

procedure TFImpExpExcel.SeleccionEvento;
var
  Dir, Archivo, Carpeta_evento, ext : String;
  DirCopia : String;
begin
  Dir := ExtractFilePath(Application.ExeName)+'Planillas\';

  case Evento of
    7,10,22 : Carpeta_evento := 'Cria\';
    44,41,4,8,9,18,25,26,45,36,53 : Carpeta_evento := 'General\';
    13 : Carpeta_evento := 'Gestacion\';
    2,3 : Carpeta_evento := 'Movimientos\';
    39,49 : Carpeta_evento := 'Parto\';
    12,32,35,33,34,30,27,31 : Carpeta_evento := 'Sanitario\';
    6,11,17,28 : Carpeta_evento := 'Servicio\';
    47,48 : Carpeta_evento := 'Transferencia\';
  end;
  case Evento of
    //Cria
    7 : Archivo := 'Castracion.xls';
    10 : Archivo := 'Destete.xls';
    22 : Archivo := 'Medicion Frame.xls';
    //General
    44 : Archivo := 'Actividad.xls';
    41 : Archivo := 'Calidad Carne.xls';
    4 : Archivo := 'Calidad Seminal.xls';
    8 : Archivo := 'Circunferencia Escrotal.xls';
    9 : Archivo := 'Condicion Corporal.xls';
    18 : Archivo := 'Examen Clinico Macho.xls';
    25 : Archivo := 'Peso.xls';
    26 : Archivo := 'Sincronizacion Celo.xls';
    45 : Archivo := 'Suplementacion.xls';
    36 : Archivo := 'Reidentificacion.xls';
    53 : Archivo := 'Cambio Categoria.xls';
    //Gestacion
    13 : Archivo := 'Diagnostico Gestacion.xls';
    //Movimientos
    2 : Archivo := 'Alta Masiva.xls';
    3 : Archivo := 'Baja.xls';
    //Parto
    39 : Archivo := 'Parto Masivo.xls';
    49 : Archivo := 'Planilla Partos y Nacimientos.xls';
    //Sanitario
    12 : Archivo := 'Diagnostico Enfermedad.xls';
    32 : Archivo := 'Muestreo de Toros por Venereas.xls';
    35 : Archivo := 'Resultados Muestreo Toro Venereas.xls';
    33 : Archivo := 'Resultados Sangrado Brucelosis.xls';
    34 : Archivo := 'Resultados Tuberculina.xls';
    30 : Archivo := 'Sangrado Brucelosis.xls';
    27 : Archivo := 'Tratamiento.xls';
    31 : Archivo := 'Tuberculinizacion.xls';
    //Servicio
    6 : Archivo := 'Capacidad Servicio.xls';
    11 : Archivo := 'Deteccion Celo.xls';
    17 : Archivo := 'Evaluacion Preservicio Check.xls';
    28 : Archivo := 'Inseminacion Artificial.xls';
    //Transferencia
    47 : Archivo := 'Flushing y Coleccion de Embriones.xls';
    48 : Archivo := 'Transferencia Embrionaria.xls';
  end;

  ext := ExtractFileExt(Archivo);
  Archivo := StringReplace(Archivo,ext,'',[rfReplaceAll]);


  DirCopia := ExtractFilePath(Application.ExeName)+'Planillas Excel\';

  if not DirectoryExists(DirCopia) then
    MkDir(DirCopia);

  DirCopia := DirCopia + Carpeta_evento;

  if not DirectoryExists(DirCopia) then
    MkDir(DirCopia);

  archivo_Importacion := DirCopia+Archivo+'_'+StringReplace(FPrincipal.NombreEstablecimiento,' ','_',[rfReplaceAll])+'_'+IntToStr(HourOf(Time))+'-'+IntToStr(MinuteOf(Time))+'_'+StringReplace(DateToStr(Date),'/','-',[rfReplaceAll])+ext;
  archivo_Exportacion := Dir+Carpeta_evento+Archivo+ext;

  CopyFile(PAnsiChar(archivo_Exportacion),PAnsiChar(archivo_Importacion),false);

end;

procedure TFImpExpExcel.BExpClick(Sender: TObject);
begin
  inherited;
  PASelOpcExcel.Visible:= false;
  if FPrincipal.AsistenteCMasivaPlanilla then
    PANuevoExcel.Visible:= true;
  SeleccionEvento;
  SetConatainer;
end;

procedure TFImpExpExcel.BImpClick(Sender: TObject);
begin
  inherited;
  PASelOpcExcel.Visible:= false;
  if FPrincipal.AsistenteCMasivaPlanilla then
    PASelArch.Visible:= true;
  if ODExcel.Execute then
  begin
    PASelArch.Visible:= false;
    if FPrincipal.AsistenteCMasivaPlanilla then
      PANuevoExcel.Visible:= true;
    archivo_Importacion := ODExcel.FileName;
    SetConatainer;
  end;
  PASelArch.Visible:= false;
end;

procedure TFImpExpExcel.SetConatainer;
begin
  WindowState := wsMaximized;
  PInicial.Visible := false;
  PCont.Visible := true;
  Application.ProcessMessages;
  FormResize(nil);
  OleCExcel.CreateObjectFromFile(archivo_Importacion,false);
  OleCExcel.SetFocus;
end;

procedure TFImpExpExcel.Button1Click(Sender: TObject);
begin
  inherited;
  PANuevoExcel.Visible:= false;
  if Owner is TFEveAltaMasiva then
  begin
    if FPrincipal.AsistenteCMasivaPlanilla then
      (self.Owner as TFEveAltaMasiva).PAPlanillaAM.Visible:= true;
  end;
  archivo_Importacion := StringReplace(archivo_importacion,ExtractFileExt(archivo_Importacion),'',[rfReplaceAll]);
  archivo_Importacion := archivo_Importacion+'_imp_.xls';
  OleCExcel.OleObject.SaveAs(archivo_Importacion);
  Salida := 1;
  Close;
end;

procedure TFImpExpExcel.Button2Click(Sender: TObject);
begin
  inherited;
  if Owner is TFEveAltaMasiva then
    (self.Owner as TFEveAltaMasiva).PAFinGuardar.Visible:=false;
  FPrincipal.AsistenteCMasivaPlanilla:= false;
  Salida := -1;
  Close;
end;

procedure TFImpExpExcel.FormCreate(Sender: TObject);
begin
  inherited;
  if FPrincipal.AsistenteCMasivaPlanilla then
    PASelOpcExcel.Visible:= true;
  Salida := -1;
 try
    CargarBottomImgHints(ExtractFilePath(Application.ExeName)+'Imagenes\BottomHint.png');
    CargarCenterImgHints(ExtractFilePath(Application.ExeName)+'Imagenes\CenterHint.png');
    CargarTopImgHints(ExtractFilePath(Application.ExeName)+'Imagenes\TopHint.png');
  except
  end;
end;

procedure TFImpExpExcel.AcomodarBottom;
var
  w, h, l : INteger;
begin
  w := PBoton.Width div 3;
  IGuardar.Left := (w div 2) - (IGuardar.Width div 2);
  IGuardarImp.Left := (w div 2) - (IGuardarImp.Width div 2) + w;
  ISalir.Left := (w div 2) - (ISalir.Width div 2) + (w*2);
  LGuardar.Left := IGuardar.Left + IGuardar.Width + 5;
  LGuardarImportar.Left := IGuardarImp.Left + IGuardarImp.Width + 5;
  LCancel.Left := ISalir.Left + ISalir.Width + 5;

  w := PInicial.Width div 2;
  IExcelNuevo.Left := (w div 2) - (IExcelNuevo.Width div 2);
  IExcelNuevo.Top := (PInicial.Height div 2) - (IExcelNuevo.Height div 2);
  LNuevoExcel.Left := IExcelNuevo.Left - 28;
  LNuevoExcel.Top := IExcelNuevo.Top + IExcelNuevo.Height + 10;

  ISearchExcel.Left := (w div 2) - (ISearchExcel.Width div 2) + w;
  ISearchExcel.Top := (PInicial.Height div 2) - (ISearchExcel.Height div 2);
  LBuscarExcel.Left := ISearchExcel.Left - 28;
  LBuscarExcel.Top := ISearchExcel.Top + ISearchExcel.Height + 10;

end;

procedure TFImpExpExcel.FormResize(Sender: TObject);
begin
  inherited;
  AcomodarBottom;
end;

procedure TFImpExpExcel.IGuardarClick(Sender: TObject);
begin
  inherited;
  PANuevoExcel.Visible:=false;
  if Owner is TFEveAltaMasiva then
  begin
    if FPrincipal.AsistenteCMasivaPlanilla then
       (self.Owner as TFEveAltaMasiva).PAFinGuardar.Visible:=true;
  end;
  OleCExcel.OleObject.SaveAs(archivo_Importacion);
  Salida := 2;
  Close;
end;

procedure TFImpExpExcel.JvImage13Click(Sender: TObject);
begin
  inherited;
  PASelOpcExcel.Visible:= false;
end;

procedure TFImpExpExcel.PANuevoExcelClick(Sender: TObject);
begin
  inherited;
  PANuevoExcel.Visible:= false;
end;

procedure TFImpExpExcel.JvImage1Click(Sender: TObject);
begin
  inherited;
  PANuevoExcel.Visible:= false;
end;

end.
