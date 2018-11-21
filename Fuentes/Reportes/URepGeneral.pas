unit URepGeneral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, IBQuery, ImgList,
  PngImageList, JvExControls, JvLabel, JvGIF, pngimage, JvExExtCtrls,
  JvImage;

type
  regPropietario = record
   nombre, empresa, direccion,telefono, celular, email, url, pathImage : string;
  end;

type
  TFRepGeneral = class(TFUniversal)
    IBQPropietario: TIBQuery;
    DSPropietario: TDataSource;
  private
    { Private declarations }
    datosProp: regPropietario;
  public
    { Public declarations }
    procedure retDatosPropietario();
    function getNombrePropietario():String;
    function getEmpresaPropietario():String;
    function getDireccionPropietario():String;
    function getTelefonoPropietario():String;
    function getCelularPropietario():String;
    function getEmailPropietario():String;
    function getUrlPropietario():String;
    function getPathImage():String;    
  end;

var
  FRepGeneral: TFRepGeneral;

implementation

{$R *.dfm}

{ TFRepGeneral }

function TFRepGeneral.getCelularPropietario: String;
begin
  result:= datosProp.celular;
end;

function TFRepGeneral.getDireccionPropietario: String;
begin
  result:= datosProp.direccion;
end;

function TFRepGeneral.getEmailPropietario: String;
begin
  result:= datosProp.email;
end;

function TFRepGeneral.getEmpresaPropietario: String;
begin
  result:= datosProp.empresa;
end;

function TFRepGeneral.getNombrePropietario: String;
begin
  result:= datosProp.nombre;
end;

function TFRepGeneral.getPathImage: String;
begin
  result:= datosProp.pathImage;
end;

function TFRepGeneral.getTelefonoPropietario: String;
begin
  result:= datosProp.telefono;
end;

function TFRepGeneral.getUrlPropietario: String;
begin
  result:= datosProp.url;
end;

procedure TFRepGeneral.retDatosPropietario;
begin
   datosProp.nombre:= '';
   datosProp.empresa:= '';
   datosProp.direccion:= '';
   datosProp.telefono:= '';
   datosProp.celular:= '';
   datosProp.email:= '';
   datosProp.url:= '';
   datosProp.pathImage:= ExtractFilePath(Application.ExeName)+'imagenempresa.jpg';

   IBQPropietario.Close;
   IBQPropietario.Open;
   IBQPropietario.First;

   if not(IBQPropietario.IsEmpty) then
     begin
       datosProp.nombre:= IBQPropietario.fieldbyname('nombre').AsString;
       datosProp.empresa:= IBQPropietario.fieldbyname('empresa').AsString;
       datosProp.direccion:= IBQPropietario.fieldbyname('direccion').AsString;
       datosProp.telefono:= IBQPropietario.fieldbyname('telefono').AsString;
       datosProp.celular:= IBQPropietario.fieldbyname('celular').AsString;
       datosProp.email:= IBQPropietario.fieldbyname('email').AsString;
       datosProp.url:= IBQPropietario.fieldbyname('url').AsString;
     end;
end;

end.

