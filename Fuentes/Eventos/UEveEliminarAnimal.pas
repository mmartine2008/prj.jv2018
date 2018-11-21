unit UEveEliminarAnimal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, IBQuery, DB, IBCustomDataSet, WinXP, DataExport,
  DataToXLS, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Grids,
  DBGrids, UBDBGrid, MemoAuto, EditAuto, UFrameMangazo, Buttons, ImgList,
  PngImageList, JvExControls, JvLabel, PngImage, JvExExtCtrls, JvImage,
  jpeg, JvGIF, JvComponentBase, JvBalloonHint, xmldom, XMLIntf, msxmldom,
  XMLDoc, Menus;

type RegAnimal=record
          idanimal:Integer;
          establecimiento:Integer;
          idimagen:Integer;
          nombreFoto: String;
       end;
type
  TFEveEliminarAnimal = class(TFEveSimple)
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleEW: TIBStringField;
    LRPAnimal: TLabel;
    IBQImagen: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
  private
    { Private declarations }
    arregloAnimales:array of RegAnimal;
  public
    { Public declarations }
  protected
    Procedure CargarParametrosSP;override;
    Procedure CargarParametrosRN;override;
    procedure CargarDatosGrilla;override;
    Procedure CargarParametrosMasivo;override;
  end;

var
  FEveEliminarAnimal: TFEveEliminarAnimal;

implementation

{$R *.dfm}

Uses UPrincipal, UMensajeHuella, UTraduccion;

procedure TFEveEliminarAnimal.CargarDatosGrilla;
begin
  inherited;
if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple))then
begin
  IBDSSimple.Insert;
  IDAnimal :=MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
  IBDSSimple.FieldByName('ID_RP').Value:=MSimple.IBQSeleccionados.FieldValues['ID_RP'];
  IBDSSimple.FieldByName('ID_SENASA').Value:=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
  //IBDSSimple.FieldByName('FECHA').Value:= now();
  IBDSSimple.FieldByName('ID_ANIMAL').Value:= IDAnimal;
end;
end;

procedure TFEveEliminarAnimal.CargarParametrosMasivo;
begin
  //IBQSPEventoInd.ParamByName('FECHA').Value := now();
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  //IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
end;

procedure TFEveEliminarAnimal.CargarParametrosRN;
var largoArreglo: Integer;
    nomDestino, archivo, Path: String;
begin
  {IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
  IBQSPRN.ParamByName('FECHA').AsDate := now(); }

  if(self.ModoEve = meIndividual)then
    begin
      IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
      IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
      IBQSPRN.ParamByName('FECHA').AsDate := now();
    end
  else
    begin
      IDAnimal := IBDSSimple.fieldbyname('id_animal').AsInteger;
      IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
      IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
      IBQSPRN.ParamByName('FECHA').AsDate := now();
    end;
  Path:= ExtractFilePath(Application.ExeName)+'Fotos\'+FPrincipal.NombreEstablecimiento+'\';

  IBQImagen.Close;
  IBQImagen.ParamByName('animal').AsInteger:= IDAnimal;
  IBQImagen.Open;
  IBQImagen.First;

  while not(IBQImagen.Eof) do
   begin
      nomDestino:= 'ani'+IntToStr(IDAnimal)+'id'+IntToStr(IBQImagen.fieldbyname('id_imagen').AsInteger)+'.jpg';
      archivo:= Path+nomDestino;
      if (FileExists(archivo)) then
        begin
          largoArreglo:= Length(arregloAnimales);
          SetLength(arregloAnimales,largoArreglo+1);
          largoArreglo:= largoArreglo + 1;
          arregloAnimales[largoArreglo - 1].idanimal:= IDAnimal;
          arregloAnimales[largoArreglo - 1].establecimiento:= FPrincipal.EstablecimientoActual;
          arregloAnimales[largoArreglo - 1].nombreFoto:= archivo;
        end;
      IBQImagen.Next;
   end;
end;

procedure TFEveEliminarAnimal.CargarParametrosSP;
begin
 IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IDAnimal;
end;

procedure TFEveEliminarAnimal.FormCreate(Sender: TObject);
begin
  inherited;
  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, fecha_nacimiento, nombre, apodo from VIS_ELIMINAR_ANIMAL';
  CrearGrupo := False;
end;

procedure TFEveEliminarAnimal.FormShow(Sender: TObject);
begin
  inherited;
  MSimple.PasarParametros(0,0);//cambie codigo
  GBObservaciones.Visible:= False;
  GBDatos.Align:= alClient;
  if(ModoEve = meIndividual)then
    begin
      TSDatos.TabVisible:= true;
      LRPAnimal.Caption:=Traducir('Rp: ')+IDRP;
    end
     else
        LRPAnimal.Caption:= '';
       //TSDatos.TabVisible:= false;

  arregloAnimales:=nil;
  SetLength(arregloAnimales,0);
end;

procedure TFEveEliminarAnimal.ATerminarExecute(Sender: TObject);
var i: Integer;
begin
  if (MostrarMensaje(tmConsulta, 'Está seguro de eliminar el/los animal/es?. No se podrán recuperar.') = mrYes)then
   inherited;
  if PuedeTerminar then
    begin
      i:=0;
      while (i < Length(arregloAnimales)) do
         begin
           SetFileAttributes(Pchar(arregloAnimales[i].nombreFoto),FILE_ATTRIBUTE_NORMAL);
           DeleteFile(arregloAnimales[i].nombreFoto);
           inc(i);
         end;
    end;
end;

end.
