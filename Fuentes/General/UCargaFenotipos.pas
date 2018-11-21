unit UCargaFenotipos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, DBCtrls, UDBLookupComboBoxAuto, PngImage, jpeg, UImportacion, UMensajeHuella,
  Grids, DBGrids, UBDBGrid, StrUtils, ImgList, PngImageList, JvExExtCtrls,
  JvImage;

type
  TFCargaFenotipos = class(TFUniversal)
    IBQHabilitarFenotipo: TIBQuery;
    IBQPata: TIBQuery;
    IBQHueso: TIBQuery;
    IBQPrepucio: TIBQuery;
    IBQOmbligo: TIBQuery;
    IBQColor: TIBQuery;
    IBQConformacion: TIBQuery;
    IBQOjos: TIBQuery;
    IBQTamanio: TIBQuery;
    IBQFertilidad: TIBQuery;
    IBQDatosFenotAnimal: TIBQuery;
    IBQInsertValores: TIBQuery;
    IBQFenotipos: TIBQuery;
    PBottom: TPanel;
    IFondo: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    LAceptar: TLabel;
    IAceptar: TImage;
    IImportar: TImage;
    LImportacion: TLabel;
    IBQSPImportarFenotipos: TIBQuery;
    OpenDlg: TOpenDialog;
    PCentral: TPanel;
    PSuperior: TPanel;
    GBGrilla: TGroupBox;
    IBQRazas: TIBQuery;
    IBQCategorias: TIBQuery;
    SGDetalle: TStringGrid;
    LCantAnimales: TLabel;
    DSFertilidad: TDataSource;
    DSTamanio: TDataSource;
    DSOjos: TDataSource;
    DSConformacion: TDataSource;
    DSColor: TDataSource;
    DSPrepucio: TDataSource;
    DSHueso: TDataSource;
    DSOmbligo: TDataSource;
    DSPata: TDataSource;
    GBCentralCargaInd: TGroupBox;
    GBDatosAnimal: TGroupBox;
    GBEspecificFenotip: TGroupBox;
    LPata: TLabel;
    LHueso: TLabel;
    LPrepucio: TLabel;
    LOmbligo: TLabel;
    LColor: TLabel;
    LConformacion: TLabel;
    LOjos: TLabel;
    LTamanio: TLabel;
    LFertilidad: TLabel;
    DBLCBAPata: TDBLookupComboBoxAuto;
    DBLCBAHueso: TDBLookupComboBoxAuto;
    DBLCBAPrepucio: TDBLookupComboBoxAuto;
    DBLCBAOmbligo: TDBLookupComboBoxAuto;
    DBLCBAColor: TDBLookupComboBoxAuto;
    DBLCBAConformacion: TDBLookupComboBoxAuto;
    DBLCBAOjos: TDBLookupComboBoxAuto;
    DBLCBATamanio: TDBLookupComboBoxAuto;
    DBLCBAFertilidad: TDBLookupComboBoxAuto;
    LRp: TLabel;
    LNombre: TLabel;
    LApodo: TLabel;
    LFechaNac: TLabel;
    LCategoria: TLabel;
    LRaza: TLabel;
    Label1: TLabel;
    IBQDatosAnimal: TIBQuery;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure IImportarClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IAceptarClick(Sender: TObject);
    procedure SGDetalleDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormResize(Sender: TObject);
    procedure DBLCBAPataCloseUp(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
    procedure cargarDatos;
    procedure CargarFenotipos(i,j : integer);
    function HabilitarFenotipos(nombre : string; i : integer) : boolean;
    procedure PasarDatosAGrilla(id : integer; valor : string; fila : integer);
    procedure ImportarFenotipos;
    procedure InicializarArrays;
    procedure VerificarTerminar;
    procedure AbrirQuerys;
    procedure DibujarComponentes;
    procedure HabilitarComponentes;
    procedure OcultarCombosLabels;
    procedure CargarMostrarDatosAnimal;
    procedure CargaMasiva;
    procedure CargaIndividual;
    procedure AlinearBotones;
    procedure CargaIndividualFenotipos;
    procedure HabilitarTerminarCargaIndividual;
    procedure SetearCombos;
  public
    { Public declarations }
    tipoCarga : string;
    id : integer;
  end;

var
  FCargaFenotipos: TFCargaFenotipos;
  fenotipHabilitAM : array of string;
  columnaFenotipo : array of integer;
  puedeTerminar : boolean;
  
implementation

uses UPrincipal,uTiposGlobales, UConfigValoresFenotipicos;

{$R *.dfm}

procedure TFCargaFenotipos.InicializarArrays;
begin

  fenotipHabilitAM[0] := 'N';
  fenotipHabilitAM[1] := 'N';
  fenotipHabilitAM[2] := 'N';
  fenotipHabilitAM[3] := 'N';
  fenotipHabilitAM[4] := 'N';
  fenotipHabilitAM[5] := 'N';
  fenotipHabilitAM[6] := 'N';
  fenotipHabilitAM[7] := 'N';
  fenotipHabilitAM[8] := 'N';

  columnaFenotipo[0] := 0;
  columnaFenotipo[1] := 0;
  columnaFenotipo[2] := 0;
  columnaFenotipo[3] := 0;
  columnaFenotipo[4] := 0;
  columnaFenotipo[5] := 0;
  columnaFenotipo[6] := 0;
  columnaFenotipo[7] := 0;
  columnaFenotipo[8] := 0;

end;

procedure TFCargaFenotipos.AbrirQuerys;
begin

     IBQRazas.Close;
     IBQRazas.Open;

     IBQCategorias.Close;
     IBQCategorias.Open; 

     IBQPata.Close;
     IBQPata.Open;
     IBQPata.Last;
     IBQPata.First;

     IBQHueso.Close;
     IBQHueso.Open;
     IBQHueso.Last;
     IBQHueso.First;

     IBQPrepucio.Close;
     IBQPrepucio.Open;
     IBQPrepucio.Last;
     IBQPrepucio.First;

     IBQOmbligo.Close;
     IBQOmbligo.Open;
     IBQOmbligo.Last;
     IBQOmbligo.First;

     IBQColor.Close;
     IBQColor.Open;
     IBQColor.Last;
     IBQColor.First;

     IBQConformacion.Close;
     IBQConformacion.Open;
     IBQConformacion.Last;
     IBQConformacion.First;

     IBQOjos.Close;
     IBQOjos.Open;
     IBQOjos.Last;
     IBQOjos.First;

     IBQTamanio.Close;
     IBQTamanio.Open;
     IBQTamanio.Last;
     IBQTamanio.First;

     IBQFertilidad.Close;
     IBQFertilidad.Open;
     IBQFertilidad.Last;
     IBQFertilidad.First;

end;


procedure TFCargaFenotipos.IImportarClick(Sender: TObject);
var archivo:string;
begin
  inherited;

  if OpenDlg.Execute then
  begin
    archivo := OpenDlg.FileName;
    tipoEv := self.LTitulo.Caption;
    abrirArchivo(self,archivo);

    try
      cargarDatos;
    except
      on E : Exception do

        MostrarMensaje(tmError,'Ocurrió un error en la importación. Por favor verifique la planilla');
    end;

  end;
end;

procedure TFCargaFenotipos.cargarDatos;
var i, j, id_animal : integer;
    rp, raza, catego, fecha, valor : string;
begin

  VerificarTerminar;

  j := 1;

  for i:=0 to Length(anim)-1 do
  begin
       rp := getDato('rp',anim[i]);
       fecha := getDato('fecha',anim[i]);
       raza := getDato('raza',anim[i]);
       catego := getDato('categoría',anim[i]);

       SGDetalle.Cells[0,j] := rp;

       SGDetalle.Cells[1,j] := fecha;

       if (IBQRazas.Lookup('codigo',raza,'sinonimo') <> null) then
           valor := IBQRazas.Lookup('codigo',raza,'sinonimo')
       else
           valor := IBQRazas.Lookup('nombre',raza,'sinonimo');

       SGDetalle.Cells[2,j] := valor;

       if (IBQCategorias.Lookup('codigo',catego,'sinonimo') <> null) then
           SGDetalle.Cells[3,j] := IBQCategorias.Lookup('codigo',catego,'sinonimo')
       else
           SGDetalle.Cells[3,j] := IBQCategorias.Lookup('nombre',catego,'sinonimo');

       IBQFenotipos.Close;
       IBQFenotipos.Open;

       CargarFenotipos(i,j);

       Inc(j);
       SGDetalle.RowCount := j;
  end;
end;

procedure TFCargaFenotipos.CargarFenotipos(i,j : integer);
var valor : string;
begin

  valor := getDato('pata',anim[i]);

  if (valor <> '') then
  begin
    if (IBQFenotipos.Lookup('ID_FENOTIPO',1,'ID_FENOTIPO') = NULL) then
    begin
      if (not(fenotipHabilitAM[0] = 'S')) then
        if (HabilitarFenotipos('PATA',1)) then
          PasarDatosAGrilla(1,valor,j);
    end
    else
        PasarDatosAGrilla(1,valor,j);
  end;

  valor := getDato('hueso',anim[i]);

  if (valor <> '') then
  begin
    if (IBQFenotipos.Lookup('ID_FENOTIPO',2,'ID_FENOTIPO') = NULL) then
    begin
      if (not(fenotipHabilitAM[1] = 'S')) then
        if (HabilitarFenotipos('HUESO',2)) then
          PasarDatosAGrilla(2,valor,j);
    end
    else
        PasarDatosAGrilla(2,valor,j);
  end;

  valor := getDato('prepucio',anim[i]);

  if (valor <> '') then
  begin
    if (IBQFenotipos.Lookup('ID_FENOTIPO',3,'ID_FENOTIPO') = NULL) then
    begin
      if (not(fenotipHabilitAM[2] = 'S')) then
        if (HabilitarFenotipos('PREPUCIO',3)) then
          PasarDatosAGrilla(3,valor,j);
    end
    else
      PasarDatosAGrilla(3,valor,j);
  end;

  valor := getDato('ombligo',anim[i]);

  if (valor <> '') then
  begin
    if (IBQFenotipos.Lookup('ID_FENOTIPO',4,'ID_FENOTIPO') = NULL) then
    begin
      if (not(fenotipHabilitAM[3] = 'S')) then
        if (HabilitarFenotipos('OMBLIGO',4)) then
          PasarDatosAGrilla(4,valor,j);
    end
    else
      PasarDatosAGrilla(4,valor,j);
  end;

  valor := getDato('color',anim[i]);

  if (valor <> '') then
  begin
    if (IBQFenotipos.Lookup('ID_FENOTIPO',5,'ID_FENOTIPO') = NULL) then
    begin
      if (not(fenotipHabilitAM[4] = 'S')) then
        if (HabilitarFenotipos('COLOR',5)) then
          PasarDatosAGrilla(5,valor,j);
    end
    else
      PasarDatosAGrilla(5,valor,j);
  end;

  valor := getDato('conformación',anim[i]);

  if (valor <> '') then
  begin
    if (IBQFenotipos.Lookup('ID_FENOTIPO',6,'ID_FENOTIPO') = NULL) then
    begin
      if (not(fenotipHabilitAM[5] = 'S')) then
        if (HabilitarFenotipos('CONFORMACION',6)) then
          PasarDatosAGrilla(6,valor,j);
    end
    else
      PasarDatosAGrilla(6,valor,j);
  end;

  valor := getDato('ojos',anim[i]);

  if (valor <> '') then
  begin
    if (IBQFenotipos.Lookup('ID_FENOTIPO',7,'ID_FENOTIPO') = NULL) then
    begin
      if (not(fenotipHabilitAM[6] = 'S')) then
        if (HabilitarFenotipos('OJOS',7)) then
          PasarDatosAGrilla(7,valor,j);
    end
    else
      PasarDatosAGrilla(7,valor,j);
  end;

  valor := getDato('tamaño',anim[i]);

  if (valor <> '') then
  begin
    if (IBQFenotipos.Lookup('ID_FENOTIPO',8,'ID_FENOTIPO') = NULL) then
    begin
      if (not(fenotipHabilitAM[7] = 'S')) then
        if (HabilitarFenotipos('TAMAÑO',8)) then
          PasarDatosAGrilla(8,valor,j);
    end
    else
      PasarDatosAGrilla(8,valor,j);
  end;

  valor := getDato('fertilidad',anim[i]);

  if (valor <> '') then
  begin
    if (IBQFenotipos.Lookup('ID_FENOTIPO',9,'ID_FENOTIPO') = NULL) then
    begin
      if (not(fenotipHabilitAM[8] = 'S')) then
        if (HabilitarFenotipos('FERTILIDAD',9)) then
          PasarDatosAGrilla(9,valor,j);
    end
    else
      PasarDatosAGrilla(9,valor,j);
  end;

end;

function TFCargaFenotipos.HabilitarFenotipos(nombre : string; i : integer) : boolean;
var F : TFConfigValoresFenotipicos;
    L : TObject;
    R : boolean;
    c, indice : integer;
    s : string;
begin

  R := false;
  fenotipHabilitAM[i-1] := 'S';

  if (MostrarMensaje(tmConsulta,' Actualmente no tiene habilitado el parámetro '+nombre+'.'+#13+'¿Desea habilitarlo, para comenzar a usarlo?') = mrYes ) then
  begin
      try
        IBQHabilitarFenotipo.Close;
        IBQHabilitarFenotipo.ParamByName('nomb').AsString := nombre;
        IBQHabilitarFenotipo.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;

      IBQFenotipos.Close;
      IBQFenotipos.Open;

      SGDetalle.ColCount := SGDetalle.ColCount + 1;

      if (nombre = 'TAMAÑO') then
      begin
        s := 'Tamaño';
        SGDetalle.Cells[c,0] := s;
      end
      else
      begin
        s := IBQFenotipos.Lookup('nombre',nombre,'sinonimo');
        s := LowerCase(s);
        c := SGDetalle.ColCount-1;
        SGDetalle.Cells[c,0] := StuffString(s,1,1,UpperCase(LeftStr(s,1)));
      end;

      indice := IBQFenotipos.Lookup('nombre',nombre,'id_fenotipo');
      columnaFenotipo[indice-1] := c;
      
      R := true;

      if (MostrarMensaje(tmConsulta,'¿Desea configurar ahora los valores para el fenotípo '+nombre+'?') = mrYes ) then
      begin
          F := TFConfigValoresFenotipicos.Create(self);
          if (nombre = 'TAMAÑO') then
            L := F.FindComponent('LTamanio')
          else
            L := F.FindComponent('L'+nombre);
          F.LabelClick(L);
          F.Destroy;
      end;
  end;

  Result := R;
end;


procedure TFCargaFenotipos.ISalirClick(Sender: TObject);
begin
  inherited;

  Close();
end;

procedure TFCargaFenotipos.PasarDatosAGrilla(id : integer; valor : string; fila : integer);
begin

     SGDetalle.Cells[columnaFenotipo[id-1],fila] := valor;
end;

procedure TFCargaFenotipos.FormShow(Sender: TObject);
begin
  inherited;

  IBQFenotipos.Close;
  IBQFenotipos.Open;
  IBQFenotipos.First;

  SetLength(fenotipHabilitAM,9);
  SetLength(columnaFenotipo,9);

  InicializarArrays;
  AbrirQuerys;

  if (tipoCarga = 'Individual') then
    CargaIndividual
  else
    CargaMasiva;

end;

procedure TFCargaFenotipos.CargaIndividualFenotipos;
begin

 try
  IBQSPImportarFenotipos.Close;
  IBQSPImportarFenotipos.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPImportarFenotipos.ParamByName('animal').AsInteger := id;

  if (DBLCBAPata.Visible) then
   begin
      IBQSPImportarFenotipos.ParamByName('ID_PATA').AsInteger := 1;
      IBQSPImportarFenotipos.ParamByName('ID_PATA_VALOR').AsString := DBLCBAPata.KeyValue;
   end
   else
   begin
      IBQSPImportarFenotipos.ParamByName('ID_PATA').Value := null;
      IBQSPImportarFenotipos.ParamByName('ID_PATA_VALOR').Value := null;
   end;

   if (DBLCBAHueso.Visible) then
   begin
      IBQSPImportarFenotipos.ParamByName('ID_HUESO').AsInteger := 2;
      IBQSPImportarFenotipos.ParamByName('ID_HUESO_VALOR').AsInteger := DBLCBAHueso.KeyValue;
   end
   else
   begin
      IBQSPImportarFenotipos.ParamByName('ID_HUESO').Value := null;
      IBQSPImportarFenotipos.ParamByName('ID_HUESO_VALOR').Value := null;
   end;

   if (DBLCBAPrepucio.Visible) then
   begin
      IBQSPImportarFenotipos.ParamByName('ID_PREPUCIO').AsInteger := 3;
      IBQSPImportarFenotipos.ParamByName('ID_PREPUCIO_VALOR').AsInteger := DBLCBAPrepucio.KeyValue;
   end
   else
   begin
      IBQSPImportarFenotipos.ParamByName('ID_PREPUCIO').Value := null;
      IBQSPImportarFenotipos.ParamByName('ID_PREPUCIO_VALOR').Value := null;
   end;

   if (DBLCBAOmbligo.Visible) then
   begin
      IBQSPImportarFenotipos.ParamByName('ID_OMBLIGO').AsInteger := 4;
      IBQSPImportarFenotipos.ParamByName('ID_OMBLIGO_VALOR').AsInteger := DBLCBAOmbligo.KeyValue;
   end
   else
   begin
      IBQSPImportarFenotipos.ParamByName('ID_OMBLIGO').Value := null;
      IBQSPImportarFenotipos.ParamByName('ID_OMBLIGO_VALOR').Value := null;
   end;

   if (DBLCBAColor.Visible) then
   begin
      IBQSPImportarFenotipos.ParamByName('ID_COLOR').AsInteger := 5;
      IBQSPImportarFenotipos.ParamByName('ID_COLOR_VALOR').AsInteger := DBLCBAColor.KeyValue;
   end
   else
   begin
      IBQSPImportarFenotipos.ParamByName('ID_COLOR').Value := null;
      IBQSPImportarFenotipos.ParamByName('ID_COLOR_VALOR').Value := null;
   end;

   if (DBLCBAConformacion.Visible) then
   begin
      IBQSPImportarFenotipos.ParamByName('ID_CONFORMACION').AsInteger := 6;
      IBQSPImportarFenotipos.ParamByName('ID_CONFORMACION_VALOR').AsInteger := DBLCBAConformacion.KeyValue;
   end
   else
   begin
      IBQSPImportarFenotipos.ParamByName('ID_CONFORMACION').Value := null;
      IBQSPImportarFenotipos.ParamByName('ID_CONFORMACION_VALOR').Value := null;
   end;

   if (DBLCBAOjos.Visible) then
   begin
      IBQSPImportarFenotipos.ParamByName('ID_OJOS').AsInteger := 7;
      IBQSPImportarFenotipos.ParamByName('ID_OJOS_VALOR').AsInteger := DBLCBAOjos.KeyValue;
   end
   else
   begin
      IBQSPImportarFenotipos.ParamByName('ID_OJOS').Value := null;
      IBQSPImportarFenotipos.ParamByName('ID_OJOS_VALOR').Value := null;
   end;

   if (DBLCBATamanio.Visible) then
   begin
      IBQSPImportarFenotipos.ParamByName('ID_TAMANIO').AsInteger := 8;
      IBQSPImportarFenotipos.ParamByName('ID_TAMANIO_VALOR').AsInteger := DBLCBATamanio.KeyValue;
   end
   else
   begin
      IBQSPImportarFenotipos.ParamByName('ID_TAMANIO').Value := null;
      IBQSPImportarFenotipos.ParamByName('ID_TAMANIO_VALOR').Value := null;
   end;

   if (DBLCBAFertilidad.Visible) then
   begin
      IBQSPImportarFenotipos.ParamByName('ID_FERTILIDAD').AsInteger := 9;
      IBQSPImportarFenotipos.ParamByName('ID_FERTILIDAD_VALOR').AsInteger := DBLCBAFertilidad.KeyValue;
   end
   else
   begin
      IBQSPImportarFenotipos.ParamByName('ID_FERTILIDAD').Value := null;
      IBQSPImportarFenotipos.ParamByName('ID_FERTILIDAD_VALOR').Value := null;
   end;

   IBQSPImportarFenotipos.Open;
   FPrincipal.IBTPrincipal.CommitRetaining;
 except
   FPrincipal.IBTPrincipal.RollbackRetaining;
 end;
end;

procedure TFCargaFenotipos.ImportarFenotipos;
var i : integer;
    valor : string;
begin

   for i := 0 to Length(anim)-1 do
   begin
      try
        IBQSPImportarFenotipos.Close;
        IBQSPImportarFenotipos.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
        IBQSPImportarFenotipos.ParamByName('animal').AsInteger := anim[i].id;

        valor := getDato('pata',anim[i]);
        if (fenotipHabilitAM[0] = 'S') then
        begin
          if (valor <> '') then
          begin
            IBQSPImportarFenotipos.ParamByName('id_pata').AsInteger := 1;
            IBQSPImportarFenotipos.ParamByName('id_pata_valor').AsInteger := IBQPata.Lookup('valor_desc',valor,'id_valor');
          end;
        end
        else
        begin
            IBQSPImportarFenotipos.ParamByName('id_pata').Value := null;
            IBQSPImportarFenotipos.ParamByName('id_pata_valor').Value := null;
        end;

        valor := getDato('hueso',anim[i]);
        if (fenotipHabilitAM[1] = 'S') then
        begin
          if (valor <> '') then
          begin
            IBQSPImportarFenotipos.ParamByName('id_hueso').AsInteger := 2;
            IBQSPImportarFenotipos.ParamByName('id_hueso_valor').AsInteger := IBQHueso.Lookup('valor_desc',valor,'id_valor');
          end;
        end
        else
        begin
            IBQSPImportarFenotipos.ParamByName('id_hueso').Value := null;
            IBQSPImportarFenotipos.ParamByName('id_hueso_valor').Value := null;
        end;

        valor := getDato('prepucio',anim[i]);
        if (fenotipHabilitAM[2] = 'S') then
        begin
          if (valor <> '') then
          begin
            IBQSPImportarFenotipos.ParamByName('id_prepucio').AsInteger := 3;
            IBQSPImportarFenotipos.ParamByName('id_prepucio_valor').AsInteger := IBQPrepucio.Lookup('valor_desc',valor,'id_valor');
          end;
        end
        else
        begin
            IBQSPImportarFenotipos.ParamByName('id_prepucio').Value := null;
            IBQSPImportarFenotipos.ParamByName('id_prepucio_valor').Value := null;
        end;

        valor := getDato('ombligo',anim[i]);
        if (fenotipHabilitAM[3] = 'S') then
        begin
          if (valor <> '') then
          begin
            IBQSPImportarFenotipos.ParamByName('id_ombligo').AsInteger := 4;
            IBQSPImportarFenotipos.ParamByName('id_ombligo_valor').AsInteger := IBQOmbligo.Lookup('valor_desc',valor,'id_valor');
          end;
        end
        else
        begin
            IBQSPImportarFenotipos.ParamByName('id_ombligo').Value := null;
            IBQSPImportarFenotipos.ParamByName('id_ombligo_valor').Value := null;
        end;


        valor := getDato('color',anim[i]);
        if (fenotipHabilitAM[4] = 'S') then
        begin
          if (valor <> '') then
          begin
            IBQSPImportarFenotipos.ParamByName('id_color').AsInteger := 5;
            IBQSPImportarFenotipos.ParamByName('id_color_valor').AsInteger := IBQColor.Lookup('valor_desc',valor,'id_valor');
          end;
        end
        else
        begin
            IBQSPImportarFenotipos.ParamByName('id_color').Value := null;
            IBQSPImportarFenotipos.ParamByName('id_color_valor').Value := null;
        end;

        valor := getDato('conformación',anim[i]);
        if (fenotipHabilitAM[5] = 'S') then
        begin
          if (valor <> '') then
          begin
            IBQSPImportarFenotipos.ParamByName('id_conformacion').AsInteger := 6;
            IBQSPImportarFenotipos.ParamByName('id_conformacion_valor').AsInteger := IBQConformacion.Lookup('valor_desc',valor,'id_valor');
          end;
        end
        else
        begin
            IBQSPImportarFenotipos.ParamByName('id_conformacion').Value := null;
            IBQSPImportarFenotipos.ParamByName('id_conformacion_valor').Value := null;
        end;

        valor := getDato('ojos',anim[i]);
        if (fenotipHabilitAM[6] = 'S') then
        begin
          if (valor <> '') then
          begin
            IBQSPImportarFenotipos.ParamByName('id_ojos').AsInteger := 7;
            IBQSPImportarFenotipos.ParamByName('id_ojos_valor').AsInteger := IBQOjos.Lookup('valor_desc',valor,'id_valor');
          end;
        end
        else
        begin
            IBQSPImportarFenotipos.ParamByName('id_ojos').Value := null;
            IBQSPImportarFenotipos.ParamByName('id_ojos_valor').Value := null;
        end;

        valor := getDato('tamaño',anim[i]);
        if (fenotipHabilitAM[7] = 'S') then
        begin
          if (valor <> '') then
          begin
            IBQSPImportarFenotipos.ParamByName('id_tamanio').AsInteger := 8;
            IBQSPImportarFenotipos.ParamByName('id_tamanio_valor').AsInteger := IBQTamanio.Lookup('valor_desc',valor,'id_valor');
          end;
        end
        else
        begin
            IBQSPImportarFenotipos.ParamByName('id_tamanio').Value := null;
            IBQSPImportarFenotipos.ParamByName('id_tamanio_valor').Value := null;
        end;

        valor := getDato('fertilidad',anim[i]);
        if (fenotipHabilitAM[8] = 'S') then
        begin
          if (valor <> '') then
          begin
            IBQSPImportarFenotipos.ParamByName('id_fertilidad').AsInteger := 9;
            IBQSPImportarFenotipos.ParamByName('id_fertilidad_valor').AsInteger := IBQFertilidad.Lookup('valor_desc',valor,'id_valor');
          end;
        end
        else
        begin
            IBQSPImportarFenotipos.ParamByName('id_fertilidad').Value := null;
            IBQSPImportarFenotipos.ParamByName('id_fertilidad_valor').Value := null;
        end;

        IBQSPImportarFenotipos.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
   end;

end;

procedure TFCargaFenotipos.VerificarTerminar;
begin

  if not(tipoCarga = 'Individual') then
    puedeTerminar := (Length(anim) > 0);

  if (puedeTerminar) then
  begin
    IAceptar.Visible := true;
    LAceptar.Visible := true;

    LCantAnimales.Caption := 'Cantidad de animales a importar: '+ IntToStr(Length(anim));
  end;

end;

procedure TFCargaFenotipos.FormCreate(Sender: TObject);
begin
  inherited;

  puedeTerminar := false;
  LAceptar.Visible := puedeTerminar;
  IAceptar.Visible := puedeTerminar;
  
end;

procedure TFCargaFenotipos.IAceptarClick(Sender: TObject);
begin
  inherited;

  if (puedeTerminar) then
  begin
    if (tipoCarga = 'Individual') then
    begin
      CargaIndividualFenotipos;
      MostrarMensaje(tmInformacion,'Los datos se cargaron correctamente.');
      Close();
    end
    else
    begin
      ImportarFenotipos;
      MostrarMensaje(tmInformacion,'Los datos se importaron correctamente.');
      Close();
    end;
  end;
end;


procedure TFCargaFenotipos.SGDetalleDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Grid: TStringGrid;
    Texto: String;
begin
  with Sender as TStringGrid do with Canvas do
  begin
    { selección del color de fondo }
    if gdFixed in State then Brush.Color := clBtnFace
    else 
      if gdSelected in State then Brush.Color := clInactiveCaption //clNavy
      else Brush.Color := clWhite;
 
    { dibujado del fondo }
    FillRect(Rect);
 
    { selección del color de texto }
    if gdSelected in State then
      SetTextColor(Canvas.Handle, clWhite)
    else SetTextColor(Canvas.Handle, clBlack);
 
    { dibujado del texto usando el API }
    DrawText(Canvas.Handle, PChar(Cells[ACol,ARow]), -1, Rect ,
              DT_CENTER or DT_NOPREFIX or DT_VCENTER or DT_SINGLELINE  );
  end;
end;

procedure TFCargaFenotipos.DibujarComponentes;
var i, j, v, n, res, columTam, anchoPanel, topPanel, izqPanel, topLabel, izqLabel, cantcomp : integer;
    c : string;
    fenotiposVisibles : array of integer;
begin

    anchoPanel := GBEspecificFenotip.Width;
    topPanel := 40;
    izqPanel := 12;

    IBQFenotipos.Close;
    IBQFenotipos.Open;

    IBQFenotipos.Last;
    IBQFenotipos.First;

    cantcomp := IBQFenotipos.RecordCount;

    SetLength(fenotiposVisibles,cantComp);

    topLabel := 24;
    izqLabel := 11;

    res := cantComp mod 2;

    if (res = 0) then
    begin
      n := 2;
      columTam := anchoPanel div 2;
    end
    else
    begin
      n := 3;
      columTam := anchoPanel div 3;
    end;

    i := 0;
    j := 0;
        
    while not(IBQFenotipos.Eof) do
    begin
      if (i < n) then
      begin
         v := IBQFenotipos.FieldValues['id_fenotipo'];

        if (v = 1) then
        begin
          DBLCBAPata.Visible := true;
          DBLCBAPata.Left := (izqPanel + (i)*(columTam));
          DBLCBAPata.Top := topPanel;
          DBLCBAPata.Enabled := false;
          LPata.Visible := true;
          LPata.Left := (izqLabel + (i)*(columTam));
          LPata.Top := topLabel;

          c := LowerCase(IBQFenotipos.FieldValues['sinonimo']);
          LPata.Caption := StuffString(c,1,1,UpperCase(LeftStr(c,1)));
          LPata.Enabled := false;

          fenotiposVisibles[j] := 1;
          Inc(j);
        end;

        if (v = 2) then
        begin
          DBLCBAHueso.Visible := true;
          DBLCBAHueso.Left := (izqPanel + (i)*(columTam));
          DBLCBAHueso.Top := topPanel;
          DBLCBAHueso.Enabled := false;
          LHueso.Visible := true;
          LHueso.Left := (izqLabel + (i)*(columTam));
          LHueso.Top := topLabel;

          c := LowerCase(IBQFenotipos.FieldValues['sinonimo']);
          LHueso.Caption := StuffString(c,1,1,UpperCase(LeftStr(c,1)));
          LHueso.Enabled := false;

          fenotiposVisibles[j] := 2;
          Inc(j);
        end;

        if (v = 3) then
        begin
          DBLCBAPrepucio.Visible := true;
          DBLCBAPrepucio.Left := (izqPanel + (i)*(columTam));
          DBLCBAPrepucio.Top := topPanel;
          DBLCBAPrepucio.Enabled := false;
          LPrepucio.Visible := true;
          LPrepucio.Left := (izqLabel + (i)*(columTam));
          LPrepucio.Top := topLabel;

          c := LowerCase(IBQFenotipos.FieldValues['sinonimo']);
          LPrepucio.Caption := StuffString(c,1,1,UpperCase(LeftStr(c,1)));
          LPrepucio.Enabled := false;

          fenotiposVisibles[j] := 3;
          Inc(j);
        end;

        if (v = 4) then
        begin
          DBLCBAOmbligo.Visible := true;
          DBLCBAOmbligo.Left := (izqPanel + (i)*(columTam));
          DBLCBAOmbligo.Top := topPanel;
          DBLCBAOmbligo.Enabled := false;
          LOmbligo.Visible := true;
          LOmbligo.Left := (izqLabel + (i)*(columTam));
          LOmbligo.Top := topLabel;

          c := LowerCase(IBQFenotipos.FieldValues['sinonimo']);
          LOmbligo.Caption := StuffString(c,1,1,UpperCase(LeftStr(c,1)));
          LOmbligo.Enabled := false;

          fenotiposVisibles[j] := 4;
          Inc(j);
        end;

        if (v = 5) then
        begin
          DBLCBAColor.Visible := true;
          DBLCBAColor.Left := (izqPanel + (i)*(columTam));
          DBLCBAColor.Top := topPanel;
          DBLCBAColor.Enabled := false;
          LColor.Visible := true;
          LColor.Left := (izqLabel + (i)*(columTam));
          LColor.Top := topLabel;

          c := LowerCase(IBQFenotipos.FieldValues['sinonimo']);
          LColor.Caption := StuffString(c,1,1,UpperCase(LeftStr(c,1)));
          LColor.Enabled := false;

          fenotiposVisibles[j] := 5;
          Inc(j);
        end;

        if (v = 6) then
        begin
          DBLCBAConformacion.Visible := true;
          DBLCBAConformacion.Left := (izqPanel + (i)*(columTam));
          DBLCBAConformacion.Top := topPanel;
          DBLCBAConformacion.Enabled := false;
          LConformacion.Visible := true;
          LConformacion.Left := (izqLabel + (i)*(columTam));
          LConformacion.Top := topLabel;

          c := LowerCase(IBQFenotipos.FieldValues['sinonimo']);
          LConformacion.Caption := StuffString(c,1,1,UpperCase(LeftStr(c,1)));
          LConformacion.Enabled := false;

          fenotiposVisibles[j] := 6;
          Inc(j);
        end;

        if (v = 7) then
        begin
          DBLCBAOjos.Visible := true;
          DBLCBAOjos.Left := (izqPanel + (i)*(columTam));
          DBLCBAOjos.Top := topPanel;
          DBLCBAOjos.Enabled := false;
          LOjos.Visible := true;
          LOjos.Left := (izqLabel + (i)*(columTam));
          LOjos.Top := topLabel;

          c := LowerCase(IBQFenotipos.FieldValues['sinonimo']);
          LOjos.Caption := StuffString(c,1,1,UpperCase(LeftStr(c,1)));
          LOjos.Enabled := false;

          fenotiposVisibles[j] := 7;
          Inc(j);
        end;

        if (v = 8) then
        begin
          DBLCBATamanio.Visible := true;
          DBLCBATamanio.Left := (izqPanel + (i)*(columTam));
          DBLCBATamanio.Top := topPanel;
          DBLCBATamanio.Enabled := false;
          LTamanio.Visible := true;
          LTamanio.Left := (izqLabel + (i)*(columTam));
          LTamanio.Top := topLabel;

          c := LowerCase(IBQFenotipos.FieldValues['sinonimo']);
          LTamanio.Caption := StuffString(c,1,1,UpperCase(LeftStr(c,1)));
          LTamanio.Enabled := false;

          fenotiposVisibles[j] := 8;
          Inc(j);
        end;

        if (v = 9) then
        begin
          DBLCBAFertilidad.Visible := true;
          DBLCBAFertilidad.Left := (izqPanel + (i)*(columTam));
          DBLCBAFertilidad.Top := topPanel;
          DBLCBAFertilidad.Enabled := false;
          LFertilidad.Visible := true;
          LFertilidad.Left := (izqLabel + (i)*(columTam));
          LFertilidad.Top := topLabel;

          c := LowerCase(IBQFenotipos.FieldValues['sinonimo']);
          LFertilidad.Caption := StuffString(c,1,1,UpperCase(LeftStr(c,1)));
          LFertilidad.Enabled := false;

          fenotiposVisibles[j] := 9;
          Inc(j);
        end;

         Inc(i);
         IBQFenotipos.Next;
      end
      else
      begin
        i := 0;
        topPanel := topPanel + 60;
        topLabel := topLabel + 60;
      end;
    end;
end;

procedure TFCargaFenotipos.HabilitarComponentes;
begin
      DBLCBAPata.EsRequerido := DBLCBAPata.Visible;
      DBLCBAPata.Enabled := DBLCBAPata.Visible;
      LPata.Enabled := DBLCBAPata.Visible;
      DBLCBAHueso.EsRequerido := DBLCBAHueso.Visible;
      DBLCBAHueso.Enabled := DBLCBAHueso.Visible;
      LHueso.Enabled := DBLCBAHueso.Visible;
      DBLCBAPrepucio.EsRequerido := DBLCBAPrepucio.Visible;
      DBLCBAPrepucio.Enabled := DBLCBAPrepucio.Visible;
      LPrepucio.Enabled := DBLCBAPrepucio.Visible;
      DBLCBAOmbligo.EsRequerido := DBLCBAOmbligo.Visible;
      DBLCBAOmbligo.Enabled := DBLCBAOmbligo.Visible;
      LOmbligo.Enabled := DBLCBAOmbligo.Visible;
      DBLCBAColor.EsRequerido := DBLCBAColor.Visible;
      DBLCBAColor.Enabled := DBLCBAColor.Visible;
      LColor.Enabled := DBLCBAColor.Visible;
      DBLCBAConformacion.EsRequerido := DBLCBAConformacion.Visible;
      DBLCBAConformacion.Enabled := DBLCBAConformacion.Visible;
      LConformacion.Enabled := DBLCBAConformacion.Visible;
      DBLCBAOjos.EsRequerido := DBLCBAOjos.Visible;
      DBLCBAOjos.Enabled := DBLCBAOjos.Visible;
      LOjos.Enabled := DBLCBAOjos.Visible;
      DBLCBATamanio.EsRequerido := DBLCBATamanio.Visible;
      DBLCBATamanio.Enabled := DBLCBATamanio.Visible;
      LTamanio.Enabled := DBLCBATamanio.Visible;
      DBLCBAFertilidad.EsRequerido := DBLCBAFertilidad.Visible;
      DBLCBAFertilidad.Enabled := DBLCBAFertilidad.Visible;
      LFertilidad.Enabled := DBLCBAFertilidad.Visible;
end;

procedure TFCargaFenotipos.OcultarCombosLabels;
begin
      DBLCBAColor.Visible := false;
      DBLCBAColor.EsRequerido:= false;
      LColor.Visible := false;
      DBLCBAConformacion.Visible := false;
      DBLCBAConformacion.EsRequerido:= false;
      LConformacion.Visible := false;
      DBLCBAFertilidad.Visible := false;
      DBLCBAFertilidad.EsRequerido:= false;
      LFertilidad.Visible := false;
      DBLCBAHueso.Visible := false;
      DBLCBAHueso.EsRequerido:= false;
      LHueso.Visible := false;
      DBLCBAOjos.Visible := false;
      DBLCBAOjos.EsRequerido:= false;
      LOjos.Visible := false;
      DBLCBAOmbligo.Visible := false;
      DBLCBAOmbligo.EsRequerido:= false;
      LOmbligo.Visible := false;
      DBLCBAPata.Visible := false;
      DBLCBAPata.EsRequerido:= false;
      LPata.Visible := false;
      DBLCBAPrepucio.Visible := false;
      DBLCBAPrepucio.EsRequerido:= false;
      LPrepucio.Visible := false;
      DBLCBATamanio.Visible := false;
      DBLCBATamanio.EsRequerido:= false;
      LTamanio.Visible := false;
end;

procedure TFCargaFenotipos.FormResize(Sender: TObject);
begin
  inherited;

  AbrirQuerys;
  OcultarCombosLabels;
  DibujarComponentes;
  HabilitarComponentes;
  SetearCombos;

end;

procedure TFCargaFenotipos.CargarMostrarDatosAnimal;
var i : integer;
    c : string;
begin

      SetearCombos;
      HabilitarTerminarCargaIndividual;
      VerificarTerminar;

      IBQDatosAnimal.Close;
      IBQDatosAnimal.ParamByName('id').AsInteger := id;
      IBQDatosAnimal.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQDatosAnimal.Open;


      if (IBQDatosAnimal.FieldValues['id_rp'] <> null) then
        LRp.Caption := IBQDatosAnimal.FieldValues['id_rp']
      else
        LRp.Caption := '';

      if (IBQDatosAnimal.FieldValues['nombre'] <> null) then
        LNombre.Caption := IBQDatosAnimal.FieldValues['nombre']
      else
        LNombre.Caption := '';

      if (IBQDatosAnimal.FieldValues['apodo'] <> null) then
        LApodo.Caption := IBQDatosAnimal.FieldValues['apodo']
      else
            LApodo.Caption := '';

      if (IBQDatosAnimal.FieldValues['fecha_nacimiento'] <> null) then
        LFechaNac.Caption := DateToStr(IBQDatosAnimal.FieldValues['fecha_nacimiento'])
      else
        LFechaNac.Caption := '';

      IBQCategorias.Close;
      IBQCategorias.Open;
      i := IBQDatosAnimal.FieldValues['categoria'];
      c := IBQCategorias.Lookup('id_categoria',i,'sinonimo');
      LCategoria.Caption := c;

      IBQRazas.Close;
      IBQRazas.Open;
      i := IBQDatosAnimal.FieldValues['raza'];
      c := IBQRazas.Lookup('id_raza',i,'sinonimo');
      LRaza.Caption := c;

end;

procedure TFCargaFenotipos.CargaMasiva;
var en_uso, nombre : string;
    i, c, indice : integer;
begin

  GBCentralCargaInd.Visible := false;

  SGDetalle.Cells[0,0] := 'Rp';
  SGDetalle.Cells[1,0] := 'Fecha';
  SGDetalle.Cells[2,0] := 'Raza';
  SGDetalle.Cells[3,0] := 'Categoria';

  while not(IBQFenotipos.Eof) do
  begin
    en_uso := IBQFenotipos.FieldValues['en_uso'];
    i := IBQFenotipos.FieldValues['id_fenotipo'];
    fenotipHabilitAM[i-1] := en_uso;
    if (en_uso = 'S') then
    begin
      SGDetalle.ColCount := SGDetalle.ColCount + 1;
      nombre := LowerCase(IBQFenotipos.FieldValues['sinonimo']);
      c := SGDetalle.ColCount-1;
      SGDetalle.Cells[c,0] := StuffString(nombre,1,1,UpperCase(LeftStr(nombre,1)));

      indice := IBQFenotipos.FieldValues['id_fenotipo'];
      columnaFenotipo[indice-1] := c;
    end;
    IBQFenotipos.Next;
  end;
end;

procedure TFCargaFenotipos.CargaIndividual;
begin

    IImportar.Visible := false;
    LImportacion.Visible := false;
    GBGrilla.Visible := false;
    GBCentralCargaInd.Top := 92;
    GBCentralCargaInd.Left := 2;
    self.Width := GBCentralCargaInd.Width + 4;

    AlinearBotones;

    self.Height := 640;
    PTitulo.Caption := 'Carga de fenotipos';
    LTitulo.Caption := 'Carga de fenotipos';

    DibujarComponentes;

    CargarMostrarDatosAnimal;
    
end;

procedure TFCargaFenotipos.AlinearBotones;
var ancho, division : integer;
begin

    ancho := Self.Width;

    division := ancho div 2;

    ISalir.Left := (division div 2) - (ISalir.Width div 2);
    LSalir.Left := (division div 2) - (LSalir.Width div 2);

    IAceptar.Left := (division + (division div 2)) - (IAceptar.Width div 2);
    LAceptar.Left := (division + (division div 2)) - (LSalir.Width div 2);

end;

procedure TFCargaFenotipos.HabilitarTerminarCargaIndividual;
var c : string;
    D : TComponent;
begin

    puedeTerminar := true;

    IBQFenotipos.Close;
    IBQFenotipos.Open;
    IBQFenotipos.First;

    while not(IBQFenotipos.Eof) do
    begin
        c := IBQFenotipos.FieldValues['nombre'];

        if (c = 'TAMAÑO') then
          c := 'tamanio';
          
        D := FindComponent('DBLCBA'+c);
        if ((D as TDBLookupComboBoxAuto).Text = '') then
          puedeTerminar := false;

        IBQFenotipos.Next;
    end;
end;

procedure TFCargaFenotipos.DBLCBAPataCloseUp(Sender: TObject);
begin
  inherited;

  HabilitarTerminarCargaIndividual;
  VerificarTerminar;
end;

procedure TFCargaFenotipos.Label1MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= clWindowText;
    (Sender as TLabel).Font.Style:= [fsUnderline];
  end;
end;

procedure TFCargaFenotipos.Label1MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      (Sender as TLabel).Font.Color:= $00606C02;
      (Sender as TLabel).Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFCargaFenotipos.Label1Click(Sender: TObject);
var F : TFConfigValoresFenotipicos;
begin
  inherited;

  F := TFConfigValoresFenotipicos.Create(self);
  F.ShowModal;
  F.Destroy;

  FormResize(sender);
  HabilitarTerminarCargaIndividual;
  VerificarTerminar;

end;

procedure TFCargaFenotipos.SetearCombos;
begin

 IBQDatosFenotAnimal.Close;
 IBQDatosFenotAnimal.ParamByName('animal').AsInteger := id;
 IBQDatosFenotAnimal.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual; 
 IBQDatosFenotAnimal.Open;

 if (DBLCBAPata.Visible) then
  if (IBQDatosFenotAnimal.Lookup('id_fenotipo',1,'id_valor') <> null) then
    DBLCBAPata.KeyValue := IBQDatosFenotAnimal.Lookup('id_fenotipo',1,'id_valor')
  else
    DBLCBAPata.KeyValue := 6;

 if (DBLCBAHueso.Visible) then
  if (IBQDatosFenotAnimal.Lookup('id_fenotipo',2,'id_valor') <> null) then
    DBLCBAHueso.KeyValue := IBQDatosFenotAnimal.Lookup('id_fenotipo',2,'id_valor')
  else
    DBLCBAHueso.KeyValue := 17;

 if (DBLCBAPrepucio.Visible) then
  if (IBQDatosFenotAnimal.Lookup('id_fenotipo',3,'id_valor') <> null) then
    DBLCBAPrepucio.KeyValue := IBQDatosFenotAnimal.Lookup('id_fenotipo',3,'id_valor')
  else
    DBLCBAPrepucio.KeyValue := 28;

 if (DBLCBAOmbligo.Visible) then
  if (IBQDatosFenotAnimal.Lookup('id_fenotipo',4,'id_valor') <> null) then
    DBLCBAOmbligo.KeyValue := IBQDatosFenotAnimal.Lookup('id_fenotipo',4,'id_valor')
  else
    DBLCBAOmbligo.KeyValue := 39;

 if (DBLCBAColor.Visible) then
  if (IBQDatosFenotAnimal.Lookup('id_fenotipo',5,'id_valor') <> null) then
    DBLCBAColor.KeyValue := IBQDatosFenotAnimal.Lookup('id_fenotipo',5,'id_valor')
  else
    DBLCBAColor.KeyValue := 50;

 if (DBLCBAConformacion.Visible) then
  if (IBQDatosFenotAnimal.Lookup('id_fenotipo',6,'id_valor') <> null) then
    DBLCBAConformacion.KeyValue := IBQDatosFenotAnimal.Lookup('id_fenotipo',6,'id_valor')
  else
    DBLCBAConformacion.KeyValue := 61;

 if (DBLCBAOjos.Visible) then
  if (IBQDatosFenotAnimal.Lookup('id_fenotipo',7,'id_valor') <> null) then
    DBLCBAOjos.KeyValue := IBQDatosFenotAnimal.Lookup('id_fenotipo',7,'id_valor')
  else
    DBLCBAOjos.KeyValue := 72;

 if (DBLCBATamanio.Visible) then
  if (IBQDatosFenotAnimal.Lookup('id_fenotipo',8,'id_valor') <> null) then
    DBLCBATamanio.KeyValue := IBQDatosFenotAnimal.Lookup('id_fenotipo',8,'id_valor')
  else
    DBLCBATamanio.KeyValue := 83;

 if (DBLCBAFertilidad.Visible) then
  if (IBQDatosFenotAnimal.Lookup('id_fenotipo',9,'id_valor') <> null) then
    DBLCBAFertilidad.KeyValue := IBQDatosFenotAnimal.Lookup('id_fenotipo',9,'id_valor')
  else
    DBLCBAFertilidad.KeyValue := 94;
end;

end.
