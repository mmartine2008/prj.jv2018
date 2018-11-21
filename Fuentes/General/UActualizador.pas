unit UActualizador;

interface
//{$DEFINE EC}
//{$DEFINE DEMO}


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, StdCtrls, IdLogBase, IdLogFile, IdIntercept, IdFTP, WinInet,
  xmldom, XMLIntf, msxmldom, XMLDoc, AbBrowse, AbMeter, AbBase, AbZBrows,
  AbUnzper, ComCtrls, IBDatabase, DB, IBCustomDataSet, IBQuery, DateUtils,
  Types, Registry, StrUtils, jpeg, ExtCtrls, JvExControls,
  JvAnimatedImage, JvGIFCtrl, IdAntiFreezeBase, IdAntiFreeze, IniFiles,
  IdIOHandlerStream, IdIOHandler, IdIOHandlerThrottle, IdLogEvent, Grids,
  ImgList, idGlobal, ActiveX;

type
  TTiposNodos = (cnIguales,cnDistintos);
  TActualizador = class
  private
    Version, Path : String;
    Descargas : Integer;
    XMLServer, XMLClient : TXMLDocument;
    AntiFreeze : TIdAntiFreeze;
    function VerificarSiHayConexion : Boolean;
    procedure DescargarArchivo();
    procedure VerificarActualizador();
    procedure VerificarDescargas(Nodo : IXMLNode);
    function ExisteNodo(NodoServer, NodoClient : IXMLNode; var Encontro : Boolean) : IXMLNode;
    function CompararNodos(NodoServer, NodoClient : IXMLNode) : TTiposNodos;
    procedure AgregarSiActualiza(NodoServer, NodoClient : IXMLNode);
    procedure MostrarCartel;
  public
    function VerificarActualizaciones : Integer;
  published
    constructor Create(AppPath : String); reintroduce;
  end;


implementation

uses
  UPrincipal, UMensajeHuella;

constructor TActualizador.Create(AppPath : String);
begin
  inherited Create;
  {$IFDEF PRODUCTORES}
        Version := 'Productores';
  {$ELSE}
        Version := 'Veterinarios';
  {$ENDIF}
  if DirectoryExists(AppPath+'Huella Update 1.5') then
    Path := AppPath+'Huella Update 1.5\'
  else
    Path := AppPath+'Huella Update\';
  Descargas := 0;
  AntiFreeze := TIdAntiFreeze.Create(nil);
  AntiFreeze.Active := true;
  CoInitialize(nil);  //Control de ActiveX para los XML
end;

function TActualizador.VerificarSiHayConexion : Boolean;
var
  ConnectedState: Integer;
begin
  ConnectedState := INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_PROXY;
  Result := InternetGetConnectedState(@ConnectedState, 0);
end;

procedure TActualizador.DescargarArchivo;
var
  FileStream : TFileStream;
  Archivo : String;
  FTPConection : TIdFTP;
begin
  Archivo := 'UpdateServer'+Version+'35.xml';
  try
    FTPConection := TIdFTP.Create(nil);
    FTPConection.Host := 'ftp.softhuella.com.ar';
    FTPConection.Password := 'huellaupdate';
    FTPConection.Username := 'actualizador@softhuella.com.ar';
    FTPConection.Passive := true;
    //try
      FTPConection.Connect();
      if FTPConection.Connected then
      begin
        if FileExists(Path+Archivo) then
        begin
          SetFileAttributes(Pchar(Path+Archivo),FILE_ATTRIBUTE_NORMAL);
          DeleteFile(Path+Archivo);
        end;
        FileStream := TFileStream.Create(Path+Archivo,fmCreate);
        FTPConection.ChangeDir('/Version_2_0/'+Version+'/');
        FTPConection.Get('/Version_2_0/'+Version+'/'+Archivo,FileStream,False);
        FileStream.Free;
      end;
    {except
      MostrarMensaje(tmError,'La respuesta del servidor esta tardando demasiado. Verifique si hay actualizaciones desde el actualizador');
    end;}                                                                  
  finally
    FTPConection.Disconnect;
    FTPConection.Destroy;
  end;
end;

procedure TActualizador.VerificarActualizador;
var
  X : IXMLNode;
  Vendor : TDOMVendor;
begin
  XMLServer := TXMLDocument.Create(FPrincipal);
  XMLClient := TXMLDocument.Create(FPrincipal);
  XMLServer.DOMVendor := GetDOMVendor('MSXML');
  XMLClient.DOMVendor := GetDOMVendor('MSXML');
  XMLServer.LoadFromFile(Path+'UpdateServer'+Version+'35.xml');
  XMLServer.Active := true;
  XMLClient.LoadFromFile(Path+'UpdateClient.xml');
  XMLClient.Active := true;
  VerificarDescargas(XMLServer.ChildNodes.FindNode('UpdateInfo'));
end;

procedure TActualizador.VerificarDescargas(Nodo : IXMLNode);
var
  XMLServerNode, XMLClientNode : IXMLNode;
  Cant : Integer;
  EncuentraNodo : Boolean;
begin
  for Cant := 0 to Nodo.ChildNodes.Count-1 do
  begin
    XMLServerNode := Nodo.ChildNodes[Cant];
    XMLClientNode := nil;
    EncuentraNodo := false;
    XMLClientNode := ExisteNodo(XMLServerNode,XMLClient.ChildNodes.FindNode('UpdateInfo'),EncuentraNodo);
    if ((XMLServerNode.Attributes['tipo'] = 'tnFolder') and (XMLClientNode = nil)) then
      AgregarSiActualiza(XMLServerNode,XMLClientNode);
    if (XMLServerNode.Attributes['tipo'] = 'tnFile') then
      AgregarSiActualiza(XMLServerNode,XMLClientNode);
    if (XMLServerNode.Attributes['tipo'] = 'tnScripts') then
      AgregarSiActualiza(XMLServerNode,XMLClientNode);
    VerificarDescargas(Nodo.ChildNodes[Cant]);
  end
end;

function TActualizador.ExisteNodo(NodoServer, NodoClient : IXMLNode; var Encontro : Boolean) : IXMLNode;
var
  Cant : Integer;
begin
  if CompararNodos(NodoServer, NodoClient) = cnIguales then
  begin
    Result := NodoClient;
    Encontro := true;
  end
  else
    for Cant := 0 to NodoClient.ChildNodes.Count-1 do
      if not Encontro then
        Result := ExisteNodo(NodoServer,NodoClient.ChildNodes[Cant],Encontro);
end;

function TActualizador.CompararNodos(NodoServer, NodoClient : IXMLNode) : TTiposNodos;
begin
  Result := cnDistintos;
  if NodoServer.Attributes['tipo'] = NodoClient.Attributes['tipo'] then
  begin
    if NodoServer.Attributes['tipo'] = 'tnFile' then
      if NodoServer.Attributes['nombre'] = NodoClient.Attributes['nombre'] then
        Result := cnIguales;
    if NodoServer.Attributes['tipo'] = 'tnFolder' then
      if NodoServer.NodeName = NodoClient.NodeName then
        Result := cnIguales;
    if NodoServer.Attributes['tipo'] = 'tnScripts' then
      if NodoServer.NodeName = NodoClient.NodeName then
        Result := cnIguales;
  end;
end;

procedure TActualizador.AgregarSiActualiza(NodoServer, NodoClient : IXMLNode);
var
  Indice : Integer;
  agrega : Boolean;
begin
  {if NodoServer.Attributes['tipo'] = 'tnFolder' then
    Inc(Descargas);}

  if NodoServer.Attributes['tipo'] = 'tnFile' then
  begin
    if NodoClient <> nil then
      agrega := StrToDate(NodoServer.Attributes['fecha']) > StrToDate(NodoClient.Attributes['fecha'])
    else
      agrega := true;
    if agrega then
      Inc(Descargas);
  end;
  if NodoServer.Attributes['tipo'] = 'tnScripts' then
    if StrToDate(NodoServer.Attributes['fecha']) > StrToDate(NodoClient.Attributes['fecha']) then
      Inc(Descargas);
end;

procedure TActualizador.MostrarCartel;
begin
end;

function TActualizador.VerificarActualizaciones : Integer;
begin
  Result := 0;
  if VerificarSiHayConexion then
  begin
    try
      DescargarArchivo();
      VerificarActualizador();
      if Descargas > 0 then
        Result := 1;
      if FileExists(Path+'UpdateServer'+Version+'.xml') then
      begin
        SetFileAttributes(Pchar(Path+'UpdateServer'+Version+'35.xml'),FILE_ATTRIBUTE_NORMAL);
        DeleteFile(Path+'UpdateServer'+Version+'.xml');
      end;
    except
      Result := -1;
    end;
  end;
end;

end.
