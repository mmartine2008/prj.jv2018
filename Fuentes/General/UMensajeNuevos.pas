unit UMensajeNuevos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UMensajeHuella, StdCtrls, ExtCtrls, Buttons, UPrincipal, Grids,
  DBGrids, DB, DBClient, IBCustomDataSet, ComCtrls, BaseGrid, AdvGrid,
  ValEdit, IBQuery, UBDBGrid, DBCtrls, jpeg, PngImage;

type
  TFMensajeNuevos = class(TFMensaje)
    BAlta: TButton;
    BIgnorar: TButton;
    DSNuevos: TDataSource;
    DataSetNuevos: TIBDataSet;
    DataSetNuevosID_RP: TIBStringField;
    DataSetNuevosNOMBRE: TIBStringField;
    DBGrid: TDBGrid;
    IBQDeleteAuxAnimales: TIBQuery;
    DataSetNuevosID_ANIMAL: TIntegerField;
    DataSetNuevosID_IE: TIBStringField;
    DataSetNuevosID_AUX: TIntegerField;
    DataSetNuevosESTABLECIMIENTO: TIntegerField;
    DataSetNuevosID_SENASA: TIBStringField;
    DataSetNuevosID_PC: TIBStringField;
    DataSetNuevosID_HBA: TIBStringField;
    DataSetNuevosID_RA: TIBStringField;
    DataSetNuevosID_OTRO: TIBStringField;
    DataSetNuevosFECHA_NACIMIENTO: TDateField;
    DataSetNuevosSEXO: TIntegerField;
    DataSetNuevosPESO: TFloatField;
    DataSetNuevosORIGEN: TIBStringField;
    DataSetNuevosCIRCUNFERENCIA_ESCROTAL: TFloatField;
    DataSetNuevosESTADO_REPRODUCTIVO: TIntegerField;
    DataSetNuevosESTADO_LACTACION: TIntegerField;
    DataSetNuevosPOTRERO: TIntegerField;
    DataSetNuevosLOTE: TIntegerField;
    DataSetNuevosRAZA: TIntegerField;
    DataSetNuevosRODEO: TIntegerField;
    DataSetNuevosCATEGORIA: TIntegerField;
    DataSetNuevosACTIVO: TIBStringField;
    DataSetNuevosCRONOLOGIA_DENTARIA: TIntegerField;
    DataSetNuevosCONDICION_CORPORAL: TIntegerField;
    DataSetNuevosMADRE_BIOLOGICA_EXTERNA: TIntegerField;
    DataSetNuevosMADRE_RECEPTORA_EXTERNA: TIntegerField;
    DataSetNuevosGDR: TIntegerField;
    DataSetNuevosPADRE_EXTERNO: TIntegerField;
    DataSetNuevosMADRE_BIOLOGICA_INTERNA: TIntegerField;
    DataSetNuevosMADRE_RECEPTORA_INTERNA: TIntegerField;
    DataSetNuevosPADRE_INTERNO: TIntegerField;
    DataSetNuevosAPODO: TIBStringField;
    DataSetNuevosV1: TIBStringField;
    DataSetNuevosV2: TIBStringField;
    DataSetNuevosV3: TIBStringField;
    DataSetNuevosV4: TIBStringField;
    DataSetNuevosV5: TIBStringField;
    DataSetNuevosV6: TIBStringField;
    DataSetNuevosEW: TIBStringField;
    DataSetNuevosDTA: TIBStringField;
    DataSetNuevosV7: TIBStringField;
    DataSetNuevosV8: TIBStringField;
    DataSetNuevosV9: TIBStringField;
    DataSetNuevosVUNO1: TIBStringField;
    DataSetNuevosTIPO_ALTA: TIBStringField;
    DataSetNuevosFECHA_ALTA: TDateField;
    DataSetNuevosOBSERVACION: TIBStringField;
    DataSetNuevosRESPONSABLE: TIBStringField;
    DataSetNuevosPRECIO_UNITARIO: TFloatField;
    DataSetNuevosPRECIO_BRUTO: TFloatField;
    DataSetNuevosGASTOS: TFloatField;
    DataSetNuevosV10: TIBStringField;
    DataSetNuevosACTIVIDAD: TIntegerField;
    DataSetNuevosADN: TIBStringField;
    DataSetNuevosTIPIFICACION_SANGUINEA: TIBStringField;
    DataSetNuevosCRIADOR: TIntegerField;
    DataSetNuevosPROPIETARIO: TIntegerField;
    DataSetNuevosORIGEN_ANIMAL: TIntegerField;
    DataSetNuevosV11: TIBStringField;
    DataSetNuevosV12: TIBStringField;
    DataSetNuevosV13: TIBStringField;
    DataSetNuevosVUNO2: TIBStringField;
    DataSetNuevosSUBCATEGORIA: TIntegerField;
    DataSetNuevosV14: TIBStringField;
    DataSetNuevosINSPECCION: TIntegerField;
    DataSetNuevosV15: TIBStringField;
    DataSetNuevosDESTINO_CAB: TIntegerField;
    DataSetNuevosV16: TIBStringField;
    DataSetNuevosMOCHO: TIntegerField;
    DataSetNuevosV17: TIBStringField;
    DataSetNuevosCOLOR: TIntegerField;
    DataSetNuevosNOMCOLOR: TIBStringField;
    LTotales: TLabel;
    procedure BBAceptarClick(Sender: TObject);
    procedure BAltaClick(Sender: TObject);
    procedure BIgnorarClick(Sender: TObject);
    procedure DataSetNuevosNOMBRESetText(Sender: TField;
      const Text: String);
    procedure RGAccionClick(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
  private
    { Private declarations }
    procedure armarGrilla(ListaRps,ListaIE,ListaDisp,ListaCateg,ListaRaza:TStringList);
  public
    evento : Integer;
    procedure listarParecidos(rp:string;var sl:TStringList);
    function  comparacionLetras(rp:string;rpLista:string):integer;
  published
    constructor Create(owner : TComponent; tipo : TTipoMensaje; msg : string; ListaRps,ListaIE,ListaDisp,ListaCateg,ListaRaza:TStringList); reintroduce;
    
  end;

var
  FMensajeNuevos: TFMensajeNuevos;
  function MostrarMensajeNuevos(tipo : TTipoMensaje; msg : String; ListaRp,ListaIE,ListaDisp,ListaCateg,ListaRaza:TStringList; tipoevento : Integer): TModalResult; overload;

implementation

uses UAvanceTerminar,UImportacion,UDMSoftvet,UEveAltaMasiva,UImpDeps,UAbmPadresExternos,UTraduccion;

{$R *.dfm}

function MostrarMensajeNuevos(tipo : TTipoMensaje; msg : String; ListaRp,ListaIE,ListaDisp,ListaCateg,ListaRaza:TStringList; tipoevento : Integer): TModalResult;
var
   retorno : TModalResult;
begin
  FMensajeNuevos := TFMensajeNuevos.Create(FPrincipal,tipo,msg,ListaRp,ListaIE,ListaDisp,ListaCateg,ListaRaza);
  FMensajeNuevos.evento := tipoevento;
  FMensajeNuevos.ShowModal;
  retorno := FMensajeNuevos.ModalResult;
  FMensajeNuevos.Destroy;
  Result := retorno;
end;

function MostrarMensajeNuevos(tipo : TTipoMensaje; msg: String; ListaIE: array of string): TModalResult; overload;
begin
end;

constructor TFMensajeNuevos.Create(owner : TComponent; tipo : TTipoMensaje; msg : string; ListaRps,ListaIE,ListaDisp,ListaCateg,ListaRaza:TStringList);
begin
  inherited Create(owner,tipo,msg);
  armarGrilla(ListaRps,ListaIE,ListaDisp,ListaCateg,ListaRaza);
  //LNroNuevos.Caption:=inttostr(DSNuevos.DataSet.RecordCount);
  //LNroTotal.Caption:=inttostr(Length(anim));
  LTotales.Caption := 'Hay '+inttostr(DSNuevos.DataSet.RecordCount)+' animales nuevos de un total de '+inttostr(Length(anim))+' animales';
end;

procedure TFMensajeNuevos.BBAceptarClick(Sender: TObject);
var ind:integer;
    str:string;
    abrirAltaMasiva:boolean;
begin
  inherited;
  abrirAltaMasiva:=false;
  DSNuevos.Enabled:=false;
  DataSetNuevos.First;
  while not Datasetnuevos.Eof do
    begin
    if  DataSetNuevos.FieldValues['NOMBRE']<>null then
      str:=DataSetNuevos.FieldValues['NOMBRE']
    else
      str:='';
    try
      if DataSetNuevos.FieldValues['ID_RP']<>null then
        ind:=TFImportacion(owner).getPosicion(DataSetNuevos.FieldValues['ID_RP'],anim,evento)
      else if DataSetNuevos.FieldValues['ID_IE']<>null then
        ind:=TFImportacion(owner).getPosicion(DataSetNuevos.FieldValues['ID_IE'],anim,evento);
      if LowerCase(str)='dar de alta' then
        begin
        //anim[ind].id:=-1;
        abrirAltaMasiva:=true;
        end
      else if (LowerCase(str)='ignorar') or (str='') then
        anim[ind].id:=-1000
      else //if str<>'' then
        begin
        if DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',str,'ID_ANIMAL')<>null then
          begin
          setDato('rp',str,anim[ind]);
          anim[ind].id:=DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',str,'ID_ANIMAL');
          end;
        //if DMSoftvet.IBQAnimExt.Lookup('ID_RP',str,'ID_ANIMAL_EXTERNO')<>null then
          //anim[ind].id:=DMSoftvet.IBQAnimExt.Lookup('ID_RP',str,'ID_ANIMAL_EXTERNO');
        end;
      except
      end;
    DataSetNuevos.Next;
    end;
  DSNuevos.Enabled:=true;
  IBQDeleteAuxAnimales.Close;
  IBQDeleteAuxAnimales.Open;
  if abrirAltaMasiva then
    begin
    cargaDeMovil:=true;
    //if deps then
      //FPrincipal.AbrirFormNormal(TFABMPadresExternos.Create(self))
    //else
    try
      begin
        Fprincipal.importaMovil := true;
        FPrincipal.AbrirFormNormal(TFEveAltaMasiva.Create(self));
      end;
    except
      //MostrarMensaje(tmerror,'Error en la importacion MENSAJENUEVOS');
      end;
    end;
end;

procedure TFMensajeNuevos.RGAccionClick(Sender: TObject);
begin
  inherited;
  {case RGAccion.ItemIndex of
    0:begin
      BAltaClick(self);
      //RGAccion.ItemIndex:=0;
      end;
    1:begin
      BIgnorarClick(self);
      //RGAccion.ItemIndex:=1;
      end;
    2:begin
      end;
    end;}
end;

procedure TFMensajeNuevos.BAltaClick(Sender: TObject);
begin
  inherited;
  DataSetNuevos.First;
  DSNuevos.Enabled:=false;
  while not Datasetnuevos.Eof do
    begin
    DataSetNuevos.Edit;
    DataSetNuevosNOMBRESetText(DataSetNuevos.FieldByName('NOMBRE'),'Dar de alta');
    DataSetNuevos.Next;
    end;
  DSNuevos.Enabled:=true;
  //LNroAlta:=LNroNuevos;
  DataSetNuevos.First;
end;

procedure TFMensajeNuevos.BIgnorarClick(Sender: TObject);
begin
  inherited;
  DataSetNuevos.First;
  DSNuevos.Enabled:=false;
  while not Datasetnuevos.Eof do
    begin
    DataSetNuevos.Edit;
    DataSetNuevosNOMBRESetText(DataSetNuevos.FieldByName('NOMBRE'),'Ignorar');
    DataSetNuevos.Next;
    end;
  DSNuevos.Enabled:=true;
  //LNroIgnorar:=LNroNuevos;
  DataSetNuevos.First;
end;

procedure TFMensajeNuevos.armarGrilla(ListaRps,ListaIE,ListaDisp,ListaCateg,ListaRaza:TStringList);
var cBox:TComboBox;
    i:integer;
begin
  DataSetNuevos.Open;
    //*/*/*/
  FAvanceTerminar:= TFAvanceTerminar.Create(self);
  //FAvanceTerminar.FormStyle:=fsStayOnTop;
  FAvanceTerminar.Modo := maDetalle;
  FAvanceTerminar.LTitulo.Caption:=Traducir('Buscando animales nuevos');
  FAvanceTerminar.Max := ListaRps.Count;
  FAvanceTerminar.Pos := 1;
  FAvanceTerminar.Update;
    //*/*/
  for i:=0 to ListaRps.Count-1 do
    begin
      DataSetNuevos.Insert;
      DataSetNuevos.FieldByName('ID_AUX').AsInteger:=i;
      DataSetNuevos.FieldByName('ID_RP').AsString:=ListaRps.Strings[i];
      DataSetNuevos.FieldByName('ID_IE').AsString:=ListaIE.Strings[i];
      DataSetNuevos.FieldByName('ID_ANIMAL').AsInteger:=-1;
      DataSetNuevos.FieldByName('V1').AsString:=ListaCateg.Strings[i];
      DataSetNuevos.FieldByName('V2').AsString:=ListaRaza.Strings[i];
      DataSetNuevos.FieldByName('NOMBRE').AsString := 'Dar de alta';
      DataSetNuevos.Post;
      FAvanceTerminar.Pos := FAvanceTerminar.Pos+1;
    end;
  DBGrid.Columns[DBGrid.Columns.Count-1].PickList:=ListaDisp;
  FAvanceTerminar.Destroy;
end;

procedure TFMensajeNuevos.DataSetNuevosNOMBRESetText(Sender: TField;
  const Text: String);
var sl:TStringList;
begin
  inherited;
  {if (DBGrid.Columns[DBGrid.Columns.Count-1].PickList.IndexOf(Text)<>-1) and (Sender.AsString<>Text) then
    begin
    RGAccion.ItemIndex:=2;
      begin
      sl:=TStringList.Create;
      sl.AddStrings(DBGrid.Columns[DBGrid.Columns.Count-1].PickList);
      if (Text<>'Dar de alta') and (Text<>'Ignorar') and (Text<>'') then
        sl.Delete(sl.IndexOf(Text));
      if (Sender.AsString<>'Dar de alta') and (Sender.AsString<>'Ignorar') and (Sender.AsString<>'') then
        sl.Add(Sender.AsString);
      sl.Sort;
      sl.Move(sl.indexof('Dar de alta'),0);
      sl.Move(sl.indexof('Ignorar'),1);
      DBGrid.Columns[DBGrid.Columns.Count-1].PickList:=sl;
      end;
    Sender.AsString:=Text;
    end;   }
end;

procedure TFMensajeNuevos.DBGridCellClick(Column: TColumn);
var i:integer;
    str:string;
    sl:TStringList;
begin
  inherited;
  if Column.Title.Caption=Traducir('NOMBRE') then
    begin
    str:=DAtasetNuevos.FieldByName('ID_RP').AsString;//[1]+DAtasetNuevos.FieldByName('ID_RP').AsString[2];
    sl:=TStringList.Create;
    sl.AddStrings(DBGrid.Columns[DBGrid.Columns.Count-1].PickList);
    {for i:=0 to sl.Count-1 do
      begin
      if ansipos(str,sl.Strings[i])=1 then
        sl.Move(i,2);
      end;}
    listarParecidos(str,sl);
    dbgrid.Columns[DBGrid.Columns.Count-1].PickList:=sl;
    end;
end;

{procedure TFMensajeNuevos.listarParecidos(rp:string;var sl:TStringList);
var comp:string;
    i,j,pos:integer;
begin
  j:=Length(rp)-1;
  pos:=2;
  while j>3 do
    begin
    comp:=rp;
    setLength(comp,j);
    for i:=0 to sl.Count-1 do
      if pos<sl.Count then
        if (ansipos(comp,sl.Strings[i])=1) then
          begin
          sl.Move(i,pos);
          pos:=pos+1;
          end
        else if (comparacionLetras(rp,sl.Strings[i])>=length(rp)-2) then //si se quiere mas precision poner -1 en vez de -2
          begin
          sl.Move(i,pos);
          pos:=pos+1;
          end;
    j:=j-1;
    end;
end;}

procedure TFMensajeNuevos.listarParecidos(rp:string;var sl:TStringList);
var i,pos:integer;
begin
  //sl.Sort;
  pos:=0;
  for i:=0 to sl.Count-1 do
    if(length(sl.Strings[i])>2)then
        if (comparacionLetras(rp,sl.Strings[i])>=length(rp)-1) then //si se quiere mas precision poner -1 en vez de -2
          begin
          //if pos<length(sl.Strings[i]) then
            sl.Move(i,pos);
          pos:=pos+1;
          end;
  pos:=0;
  for i:=0 to sl.Count-1 do
    if(length(sl.Strings[i])>2)then
        if ((ansipos(rp,sl.Strings[i])<>0) or (ansipos(sl.Strings[i],rp)<>0)) then
          begin
          //if pos<length(sl.Strings[i]) then
            sl.Move(i,pos);
          pos:=pos+1;
          end;
  sl.Move(sl.indexof('Dar de alta'),0);
  sl.Move(sl.indexof('Ignorar'),1);

end;

function TFMensajeNuevos.comparacionLetras(rp:string;rpLista:string):integer;
var i,iguales,long:integer;
begin
iguales:=0;
if length(rpLista)>=length(rp) then long:=length(rp)-1 else long:=length(rpLista)-1; 
for i:=1 to long do
  begin
  if rp[i]=rpLista[i] then iguales:=iguales+1;
  end;
comparacionLetras:=iguales;
end;

end.
