unit UAbmPropietario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, IBStoredProc, WinXP, DataExport,
  DataToXLS, AdvPicture, Jpeg, JvExControls, JvLabel, JvGIF, PngImage,
  PngImageList, JvExExtCtrls, JvImage;

type
  TFABMPropietario = class(TFABMSimple)
    DBEditAuto1: TDBEditAuto;
    DBEditAuto2: TDBEditAuto;
    DBEditAuto3: TDBEditAuto;
    DBEditAuto4: TDBEditAuto;
    DBEditAuto5: TDBEditAuto;
    DBEditAuto6: TDBEditAuto;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    IBSPEliminarEstablecimiento: TIBStoredProc;
    Label1: TLabel;
    DBEditAuto7: TDBEditAuto;
    BBAgregarImagen: TBitBtn;
    APPreview: TAdvPicture;
    Label2: TLabel;
    ODFotos: TOpenDialog;
    Image1: TImage;
    BBEliminarImagen: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure AcEliminarExecute(Sender: TObject);
    procedure AcSalirExecute(Sender: TObject);
    procedure IBQAbmSimpleAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure AcCancelarExecute(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
    procedure BBAgregarImagenClick(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure BBEliminarImagenClick(Sender: TObject);
  private
    PathImagen: String;
    procedure ReducirImagen();
    procedure ReduceJPG(origen,destino:String);
  public
  end;

var
  FABMPropietario: TFABMPropietario;

implementation

uses UMensajeHuella, UDMSoftvet, UPrincipal, UBackup, UImportacion, UEveSimple,
     UFunctions;

{$R *.dfm}

(*
  Permitimos cambios, pero no inserciones, ya que existe el
  asistente para la creacion de establecimientos
*)
procedure TFABMPropietario.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := True;
  PermiteInsertar := IBQAbmSimple.IsEmpty;
  AcEliminar.Enabled := false;
  BBEliminar.Enabled:= false;
  PathImagen:= '';
end;

(*

*)
procedure TFABMPropietario.AcEliminarExecute(Sender: TObject);
begin
  inherited;
end;

(*
  Al salir actualizamos el query de establecimientos
  para poder elegir los cambios sin salir del sistema
*)
procedure TFABMPropietario.AcSalirExecute(Sender: TObject);
begin
  //DMSoftvet.IBQEstablecimiento.Close;
  //DMSoftvet.IBQEstablecimiento.Open;
  inherited;
end;

procedure TFABMPropietario.IBQAbmSimpleAfterInsert(DataSet: TDataSet);
begin
  inherited;
  PermiteInsertar:= false;
end;

procedure TFABMPropietario.FormShow(Sender: TObject);
var nomDestino, archivo: String;
begin
  inherited;
  PermiteCambio := True;
  PermiteInsertar := IBQAbmSimple.IsEmpty;
  AcEliminar.Enabled := false;

  nomDestino:= 'imagenempresa.jpg';
  archivo:= ExtractFilePath(Application.ExeName)+nomDestino;
  if (FileExists(archivo)) then
    begin
      BBEliminarImagen.Enabled:= true;
      BBAgregarImagen.Enabled:= false;
    end
   else
      begin
        BBEliminarImagen.Enabled:= false;
        BBAgregarImagen.Enabled:= true;
      end;
  if IBQAbmSimple.IsEmpty then
    AcInsertarExecute(nil)
  else
    AcEditarExecute(nil);
end;

procedure TFABMPropietario.AcGuardarExecute(Sender: TObject);
var nomDestino, archivo: String;
begin
  inherited;
  PermiteInsertar := IBQAbmSimple.IsEmpty;
  AcEliminar.Enabled := false;

  nomDestino:= 'imagenempresa.jpg';
  archivo:= ExtractFilePath(Application.ExeName)+nomDestino;

  if (FileExists(PathImagen)) then
    begin
      {if (FileExists(archivo)) then
        begin
          SetFileAttributes(Pchar(archivo),FILE_ATTRIBUTE_NORMAL);
          DeleteFile(archivo);
        end;  }

      //I:= TImage.Create(nil);
      //TImage(APPreview).Picture.LoadFromFile(PathImagen);

     // CambiarTamanioImagen(Image1, archivo);
      //CargaJPGProporcionado(archivo, Image1);
     // ReducirImagen();
//      Image1.Picture.SaveToFile(archivo);
//      CopyFile(pchar(PathImagen),pchar(archivo),true);
//      Image1.Picture.Assign(GetThumbnail(PWideChar(ExtractFilePath(Application.ExeName)), PWideChar(nomDestino), 96, 96));
      ReduceJPG(PathImagen, archivo);
      //SetFileAttributes(Pchar(archivo),FILE_ATTRIBUTE_READONLY);
      //Image1.Picture.
//      Image1.Picture:= nil;
      Image1.Picture.LoadFromFile(archivo);
    end;
  AcSalirExecute(nil);
end;

procedure TFABMPropietario.AcCancelarExecute(Sender: TObject);
begin
  inherited;
  PermiteInsertar := IBQAbmSimple.IsEmpty;
  AcEliminar.Enabled := false;
end;

procedure TFABMPropietario.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_PROPIETARIO'];
end;

procedure TFABMPropietario.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

procedure TFABMPropietario.BBAgregarImagenClick(Sender: TObject);
var nomDestino, archivo: String;
    I: TImage;
begin
  inherited;
  if (ODFotos.Execute) then
    begin
      {IBQAgregarFoto.ParamByName('animal').AsInteger:= id_animal;
      IBQAgregarFoto.ExecSQL;
      FPrincipal.IBTPrincipal.CommitRetaining;
      IBQGetIdImagen.Close;
      IBQGetIdImagen.Open; }

      {nomDestino:= 'ani'+IntToStr(id_animal)+'id'+IntToStr(IBQGetIdImagen.fieldbyname('id_imagen').AsInteger)+'.jpg';
      foto:= THLAnimales.Thumbnails.Add;
      archivo:= ExtractFilePath(Application.ExeName)+'Fotos\'+FPrincipal.NombreEstablecimiento+'\'+nomDestino;
      CopyFile(pchar(ODFotos.FileName),pchar(archivo),true);
      SetFileAttributes(Pchar(archivo),FILE_ATTRIBUTE_READONLY);
      foto.Tag:= IBQGetIdImagen.fieldbyname('id_imagen').AsInteger; //en el tag guardo el id de la imagen
      foto.Filename:= archivo;
      foto.Picture.LoadFromFile(archivo);}

      if (ExtractFileExt(LowerCase(ODFotos.FileName)) = '.jpg') or (ExtractFileExt((ODFotos.FileName)) = '.bmp') then
       begin
         nomDestino:= 'imagenempresa.jpg';
         PathImagen:= ODFotos.FileName;
         archivo:= ExtractFilePath(Application.ExeName)+nomDestino;
         if (FileExists(archivo)) then
           begin
             SetFileAttributes(Pchar(archivo),FILE_ATTRIBUTE_NORMAL);
             DeleteFile(archivo);
           end;

         //I:= TImage.Create(nil);
        // Image1.Picture.Graphic.LoadFromFile(PathImagen);
         //CambiarTamanioImagen(Image1, archivo);
         //Image1.Picture.SaveToFile(archivo);
         //CopyFile(pchar(ODFotos.FileName),pchar(archivo),true);
         //Image1.Picture.Assign(GetThumbnail(PWideChar(ExtractFilePath(Application.ExeName)), PWideChar(archivo), 96, 96));
         ReduceJPG(PathImagen, archivo);
         //GetThumbnail(PWideChar(ExtractFilePath(Application.ExeName)), PWideChar(archivo), 96, 96).SaveToFile('c:\prueba.bmp');
         //Image1.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'prueba.jpg');
         //Image1.Picture.SaveToFile('c:\pruebita.jpg');
        // CargaJPGProporcionado(archivo, Image1);
          // ReducirImagen();
//         Image1.Picture.SaveToFile(archivo);
         //SetFileAttributes(Pchar(archivo),FILE_ATTRIBUTE_READONLY);

         //Image1.Picture:= nil;

         Image1.Picture.LoadFromFile(archivo);
         BBEliminarImagen.Enabled:= true;
         BBAgregarImagen.Enabled:= false;
       end;
    end;
end;

procedure TFABMPropietario.AcEditarExecute(Sender: TObject);
var nomDestino, archivo : String;
begin
  inherited;
  nomDestino:= 'imagenempresa.jpg';
  archivo:= ExtractFilePath(Application.ExeName)+nomDestino;
  if (FileExists(archivo)) then
    begin
      //Image1.Picture:= nil;
      Image1.Picture.LoadFromFile(archivo);
      PathImagen:= archivo;
    end;
end;

procedure TFABMPropietario.ReducirImagen;
 var
   R: TRect;
   Image: TImage;
   nomDestino, archivo : String;
begin
   nomDestino:= 'imagenempresa.jpg';
   archivo:= ExtractFilePath(Application.ExeName)+nomDestino;

   Image := TImage.Create(Self);

   // Aquí dimensionamos la nueva imagen....
   Image.Height := 130;
   Image.Width  := 130;

   // Preparamos para la función StretchDraw
    R.Left := 0;
    R.Top := 0;
    R.Bottom := Image.Height;
    R.Right := Image.Width;

   // Copiamos la imagen cambiada de tamaño a Image desde Image1...
   // Image1 esta definida en tiempo de diseño....
   Image.Canvas.StretchDraw(R, Image1.Picture.Graphic);

   // La salvamos para ver que ha pasado. ....EURECA....
   Image.Picture.Graphic.SaveToFile(archivo);
end;



procedure TFABMPropietario.ReduceJPG(origen, destino:String);
var bmp: TBitmap;
    escala: Double;
    Imagen:TJPEGImage;
    Ancho,Alto,lado:Integer;
begin

  Imagen := TJPEGImage.Create;

  Imagen.Performance:=jpBestQuality;
  Imagen.LoadFromFile(origen);

  Ancho:= 130;
  Alto:= 90;
  if ((Imagen.Width > Ancho) or (Imagen.Height > Alto)) then
    begin
      if Imagen.Height > Imagen.Width then
        escala := Alto / Imagen.Height
      else
        escala := Ancho / Imagen.Width;
    end
   else
     begin
       escala:= 1;
     end;
  bmp := TBitmap.Create;
  try
  //Crear el thumbnail
    bmp.Width := Round(Imagen.Width*escala);
    bmp.Height := Round(Imagen.Height*escala);
    bmp.Canvas.StretchDraw(bmp.Canvas.Cliprect, Imagen);
    Imagen.Assign(Bmp);
    Imagen.SaveToFile(destino);
  finally
    bmp.free;
  end;

end;


procedure TFABMPropietario.BBEliminarImagenClick(Sender: TObject);
var nomDestino, archivo: String;
begin
  inherited;
  nomDestino:= 'imagenempresa.jpg';
  archivo:= ExtractFilePath(Application.ExeName)+nomDestino;
  If (MostrarMensaje(tmConsulta, 'Está seguro que desea eliminar la imágen? ') = mrYes) then
    if (FileExists(archivo)) then
      begin
        SetFileAttributes(Pchar(archivo),FILE_ATTRIBUTE_NORMAL);
        DeleteFile(archivo);
        Image1.Picture:= nil;
        BBEliminarImagen.Enabled:= false;
        BBAgregarImagen.Enabled:= true;
      end;

end;

end.

