unit URepListadoAnimalesFenotipos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, PngImage, jpeg, Grids, DBGrids, UBDBGrid, UFrameGrafico,
  ImgList, PngImageList, JvExExtCtrls, JvImage;

type

  TRegFenotipos = record
    Nombre : string;
    Max : string;
    Min : string;
  end;


type
  TFRepListadoAnimalesFenotipos = class(TFUniversal)
    GBFiltros: TGroupBox;
    GBListaAnimales: TGroupBox;
    GBGrafica: TGroupBox;
    PBottom: TPanel;
    IFondo: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    CBSexo: TComboBox;
    CBCategoria: TComboBox;
    BDBGListadoAnimales: TBitDBGrid;
    RBTodos: TRadioButton;
    RBFiltrar: TRadioButton;
    IBQSexo: TIBQuery;
    IBQCategoria: TIBQuery;
    IVerAnimales: TImage;
    Label1: TLabel;
    DSDatosAnimales: TDataSource;
    IBQFenotipos: TIBQuery;
    IBQPromedios: TIBQuery;
    IBQValoresFenotipos: TIBQuery;
    IBQGetDatosEscala: TIBQuery;
    IBQDatosFenotAnimal: TIBQuery;
    GBCuadroValores: TGroupBox;
    LEscala: TLabel;
    LEscalaValor: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Shape3: TShape;
    IVistaPrevia: TImage;
    LVistaPrevia: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    LMinimo: TLabel;
    LMaximo: TLabel;
    Shape1: TShape;
    IBQGetIdValorFenot: TIBQuery;
    IBQGetAnimalesFiltrados: TIBQuery;
    IBDSAuxGraficos: TIBDataSet;
    IBDSAuxGraficosID_ANIMAL: TIntegerField;
    IBDSAuxGraficosIMG_GRA: TBlobField;
    IBQBorrarAuxiliares: TIBQuery;
    IBQPrev: TIBQuery;
    IBQInsertAux: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure RBFiltrarClick(Sender: TObject);
    procedure CBSexoChange(Sender: TObject);
    procedure CBCategoriaChange(Sender: TObject);
    procedure IVerAnimalesClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure RBTodosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure BDBGListadoAnimalesKeyPress(Sender: TObject; var Key: Char);
    procedure BDBGListadoAnimalesDblClick(Sender: TObject);
    procedure IVistaPreviaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure CargarDatosEnCombos;
    procedure CargarDatosDeAnimales;
    procedure ArmarTablaValores;
    procedure MostrarGrafica(tipo : integer);
    procedure BusquedaMultifiltro;
    procedure AgregarFiltrosArrSql;
    procedure MostrarAnimales;
    procedure BloquearFiltroRanking;
    procedure DesbloquearFiltroRanking;
    procedure GuardarGraficoBD(id : integer);
    procedure CargarAuxiliarGraficos;
    procedure BorrarEstructurasAuxiliares;
    procedure InicializarSP;
  public
    { Public declarations }
  end;

var
  FRepListadoAnimalesFenotipos: TFRepListadoAnimalesFenotipos;
  id_sexo, id_categoria, val_ini, cant_filtros : integer;
  fra : TFFrameGrafico;
  arrSql : array of TRegFenotipos;
  multifiltro : boolean;
  
implementation

uses UPrincipal,uTiposGlobales, URepListadoAnimalesFenotiposPreview, UMensajeHuella;

{$R *.dfm}


procedure TFRepListadoAnimalesFenotipos.FormCreate(Sender: TObject);
begin
  inherited;

  fra := nil;

  id_sexo := -1;
  id_categoria := -1;
  cant_filtros := 0;

  SetLength(arrSql,9);

  RBTodos.Checked := true;

  CBCategoria.Enabled := false;
  CBSexo.Enabled := false;

  CargarDatosEnCombos;
  
end;

procedure TFRepListadoAnimalesFenotipos.CargarDatosEnCombos;
begin

    IBQSexo.Close;
    IBQSexo.Open;
    IBQSexo.First;

    while not(IBQSexo.Eof) do
    begin
        CBSexo.AddItem(IBQSexo.FieldValues['sinonimo'],nil);
        IBQSexo.Next;
    end;

    CBSexo.Text := 'SEXO';

    IBQCategoria.Close;
    IBQCategoria.Open;
    IBQCategoria.First;

    while not(IBQCategoria.Eof) do
    begin
        CBCategoria.AddItem(IBQCategoria.FieldValues['sinonimo'],nil);
        IBQCategoria.Next;
    end;

    CBCategoria.Text := 'CATEGORIA';

end;

procedure TFRepListadoAnimalesFenotipos.RBFiltrarClick(Sender: TObject);
begin
  inherited;

  CBSexo.Enabled := true;
  CBCategoria.Enabled := true;
  DesbloquearFiltroRanking;
  
end;

procedure TFRepListadoAnimalesFenotipos.CBSexoChange(Sender: TObject);
begin
  inherited;
  id_sexo := IBQSexo.Lookup('sinonimo',CBSexo.Text,'id_sexo');
end;

procedure TFRepListadoAnimalesFenotipos.CBCategoriaChange(Sender: TObject);
begin
  inherited;
  id_categoria := IBQCategoria.Lookup('sinonimo',CBCategoria.Text,'id_categoria');
end;

procedure TFRepListadoAnimalesFenotipos.CargarDatosDeAnimales;
begin

  if not(multifiltro) then
  begin
    IBQGetAnimalesFiltrados.Close;
    IBQGetAnimalesFiltrados.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;

    if (id_sexo <> -1) then
      IBQGetAnimalesFiltrados.ParamByName('id_sexo').AsInteger := id_sexo;

    if (id_categoria <> -1) then
      IBQGetAnimalesFiltrados.ParamByName('id_categoria').AsInteger := id_categoria;

    IBQGetAnimalesFiltrados.ParamByName('cant_filtro').AsInteger := 0;
    IBQGetAnimalesFiltrados.Open;
  end
  else
    BusquedaMultifiltro;

    IBQGetAnimalesFiltrados.Last;
    IBQGetAnimalesFiltrados.First;
    GBListaAnimales.Caption := ' Animales[' + IntToStr(IBQGetAnimalesFiltrados.RecordCount) + '] ';
end;

procedure TFRepListadoAnimalesFenotipos.IVerAnimalesClick(Sender: TObject);
begin
  inherited;
  MostrarAnimales;
end;

procedure TFRepListadoAnimalesFenotipos.Label1Click(Sender: TObject);
begin
  inherited;
  MostrarAnimales;
end;

procedure TFRepListadoAnimalesFenotipos.RBTodosClick(Sender: TObject);
begin
  inherited;

  id_sexo := -1;
  id_categoria := -1;

  CBCategoria.Enabled := false;
  CBSexo.Enabled := false;

  BloquearFiltroRanking;

  CBCategoria.Text := 'CATEGORIA';
  CBSexo.Text := 'SEXO';

end;

procedure TFRepListadoAnimalesFenotipos.ArmarTablaValores;
var L1, L2 : TLabel;
    E1, E2 : TEdit;
    vtop, vleft1, vleft2, i : integer;
    valor, aux : string;
begin

    IBQGetDatosEscala.Close;
    IBQGetDatosEscala.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQGetDatosEscala.Open;

    valor := IBQGetDatosEscala.FieldValues['valor'];

    if (valor[1] <> '') then
      if (valor[1] = '0') then
        val_ini := 0
      else
        val_ini := -5;

    LEscalaValor.Caption := valor;

    i := 60;

    vtop := Shape3.Top + 3;
    vleft1 := 6;
    vleft2 := 110;

    IBQFenotipos.Close;
    IBQFenotipos.Open;
    IBQFenotipos.First;

    while not(IBQFenotipos.Eof) do
    begin
        valor := IBQFenotipos.FieldValues['sinonimo'];
        aux := IBQFenotipos.FieldValues['nombre'];

        L1 := TLabel.Create(GBCuadroValores);
        L1.Parent := GBCuadroValores;
        L1.AutoSize := false;
        L1.Name := 'Label'+IntToStr(i);
        L1.Top := vtop;
        L1.Left := vleft1;
        L1.Alignment := taCenter;
        L1.Height := 15;
        L1.Width := 100;
        L1.Font.Size := 8;
        L1.Caption := valor;

        Inc(i);

        IBQPromedios.Close;
        IBQPromedios.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQPromedios.ParamByName('idf').AsInteger := IBQFenotipos.FieldValues['id_fenotipo'];
        IBQPromedios.Open;

        if (IBQPromedios.FieldValues['prom'] <> null) then
        begin

          E1 := TEdit.Create(GBCuadroValores);
          E2 := TEdit.Create(GBCuadroValores);
          E1.Parent := GBCuadroValores;
          E2.Parent := GBCuadroValores;
          E1.AutoSize := false;
          E2.AutoSize := false;
          if (aux = 'TAMAÑO') then
          begin
            E1.Name := 'ETamanioMn';
            E2.Name := 'ETamanioMx';
          end
          else
          begin
            E1.Name := 'E'+aux+'Mn';
            E2.Name := 'E'+aux+'Mx';
          end;

          E1.Top := vtop;
          E2.Top := vtop;
          E1.Left := LMinimo.Left;
          E2.Left := LMaximo.Left;
          E1.Height := 15;
          E2.Height := 15;
          E1.Width := 80;
          E2.Width := 80;
          E1.CharCase := ecUpperCase;
          E2.CharCase := ecUpperCase;
          E1.Text := '';
          E2.Text := '';
          E1.Tag := IBQFenotipos.FieldValues['id_fenotipo'];
          E2.Tag := IBQFenotipos.FieldValues['id_fenotipo'];

          IBQValoresFenotipos.Close;
          IBQValoresFenotipos.ParamByName('idf').AsInteger := IBQFenotipos.FieldValues['id_fenotipo'];
          IBQValoresFenotipos.ParamByName('val').AsString := IBQPromedios.FieldValues['prom'];
          IBQValoresFenotipos.Open;

          valor := IBQValoresFenotipos.FieldValues['valor_desc'];

          L2 := TLabel.Create(GBCuadroValores);
          L2.Parent := GBCuadroValores;
          L2.AutoSize := false;
          L2.Name := 'Label'+IntToStr(i);
          L2.Alignment := taCenter;
          L2.Top := vtop;
          L2.Left := vleft2;
          L2.Height := 15;
          L2.Width := 100;
          L2.Font.Size := 8;
          L2.Caption := valor;

          Inc(i);

        end;
        vtop := L1.Top + 17;
        IBQFenotipos.Next;
    end;

    IBQFenotipos.First;
end;

procedure TFRepListadoAnimalesFenotipos.FormShow(Sender: TObject);
begin
  inherited;
  ArmarTablaValores;
  BloquearFiltroRanking;
end;

procedure TFRepListadoAnimalesFenotipos.MostrarGrafica(tipo : integer);
begin
    IBQDatosFenotAnimal.Close;
    IBQDatosFenotAnimal.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDatosFenotAnimal.ParamByName('animal').AsInteger := IBQGetAnimalesFiltrados.FieldValues['animal'];
    IBQDatosFenotAnimal.Open;
    IBQDatosFenotAnimal.First;

    if (fra = nil) then
    begin
      fra := TFFrameGrafico.Create(self);
      fra.ArmarGraficoDatosFenotipicos(IBQDatosFenotAnimal,val_ini,4);

      if (tipo = 1) then
      begin
        fra.Name := 'FFrameGrafico1';
        fra.Parent := GBGrafica;
        fra.Align := alTop;
      end
      else
        fra.Visible := false;
    end
    else
    begin
      fra.Destroy;
      fra := nil;
      MostrarGrafica(tipo);
    end;
end;

procedure TFRepListadoAnimalesFenotipos.ISalirClick(Sender: TObject);
begin
  inherited;

  Close();
end;

procedure TFRepListadoAnimalesFenotipos.BDBGListadoAnimalesKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
    BDBGListadoAnimalesDblClick(sender);
end;

procedure TFRepListadoAnimalesFenotipos.BDBGListadoAnimalesDblClick(
  Sender: TObject);
begin
  inherited;
  if (BDBGListadoAnimales.RowCount <> 0) then
  begin
    MostrarGrafica(1);
  end;
end;

procedure TFRepListadoAnimalesFenotipos.AgregarFiltrosArrSql;
var i : integer;
    E : TComponent;
begin

    for i:=0 to GBCuadroValores.ComponentCount-1 do
    begin
        E := GBCuadroValores.Components[i];
        if (E is TEdit) then
          if ((E as TEdit).Text <> '') then
          begin
            multifiltro := true;

            if (E.Tag = 1) then
              if ((E as TEdit).Name = 'EPATAMn') then
              begin
                Inc(cant_filtros);
                arrSql[0].Min := ((E as TEdit).Text);
              end
              else
                arrSql[0].Max := ((E as TEdit).Text);

            if (E.Tag = 2) then
              if ((E as TEdit).Name = 'EHUESOMn') then
              begin
                Inc(cant_filtros);
                arrSql[1].Min := ((E as TEdit).Text);
              end
              else
                arrSql[1].Max := ((E as TEdit).Text);

            if (E.Tag = 3) then
              if ((E as TEdit).Name = 'EPREPUCIOMn') then
              begin
                Inc(cant_filtros);
                arrSql[2].Min := ((E as TEdit).Text);
              end
              else
                arrSql[2].Max := ((E as TEdit).Text);

            if (E.Tag = 4) then
              if ((E as TEdit).Name = 'EOMBLIGOMn') then
              begin
                Inc(cant_filtros);
                arrSql[3].Min := ((E as TEdit).Text);
              end
              else
                arrSql[3].Max := ((E as TEdit).Text);

            if (E.Tag = 5) then
              if ((E as TEdit).Name = 'ECOLORMn') then
              begin
                Inc(cant_filtros);
                arrSql[4].Min := ((E as TEdit).Text);
              end
              else
                arrSql[4].Max := ((E as TEdit).Text);

            if (E.Tag = 6) then
              if ((E as TEdit).Name = 'ECONFORMACIONMn') then
              begin
                Inc(cant_filtros);
                arrSql[5].Min := ((E as TEdit).Text);
              end
              else
                arrSql[5].Max := ((E as TEdit).Text);

            if (E.Tag = 7) then
              if ((E as TEdit).Name = 'EOJOSMn') then
              begin
                Inc(cant_filtros);
                arrSql[6].Min := ((E as TEdit).Text);
              end
              else
                arrSql[6].Max := ((E as TEdit).Text);

            if (E.Tag = 8) then
              if ((E as TEdit).Name = 'ETamanioMn') then
              begin
                Inc(cant_filtros);
                arrSql[7].Min := ((E as TEdit).Text);
              end
              else
                arrSql[7].Max := ((E as TEdit).Text);

            if (E.Tag = 9) then
              if ((E as TEdit).Name = 'EFERTILIDADMn') then
              begin
                Inc(cant_filtros);
                arrSql[8].Min := ((E as TEdit).Text);
              end
              else
                arrSql[8].Max := ((E as TEdit).Text);

          end;
    end;
end;

procedure TFRepListadoAnimalesFenotipos.BusquedaMultifiltro;
var i, id_val_min, id_val_max : integer;
    v1, v2 : string;
begin

    IBQGetAnimalesFiltrados.Close;
    IBQGetAnimalesFiltrados.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;

    if (id_sexo <> -1) then
      IBQGetAnimalesFiltrados.ParamByName('id_sexo').AsInteger := id_sexo;

    if (id_categoria <> -1) then
      IBQGetAnimalesFiltrados.ParamByName('id_categoria').AsInteger := id_categoria;

    for i:=0 to length(arrSql)-1 do
    begin
       v1 := arrSql[i].Min;
       v2 := arrSql[i].Max;

       if ((v1 <> '') and (v2 <> '')) then
       begin
         IBQGetIdValorFenot.Close;
         IBQGetIdValorFenot.ParamByName('id').AsInteger := i+1;
         IBQGetIdValorFenot.ParamByName('valor').AsString := v1;
         IBQGetIdValorFenot.Open;

         id_val_min := IBQGetIdValorFenot.FieldValues['id_valor'];

         IBQGetIdValorFenot.Close;
         IBQGetIdValorFenot.ParamByName('id').AsInteger := i+1;
         IBQGetIdValorFenot.ParamByName('valor').AsString := v2;
         IBQGetIdValorFenot.Open;

         id_val_max := IBQGetIdValorFenot.FieldValues['id_valor'];

         if (i = 0) then
         begin
            IBQGetAnimalesFiltrados.ParamByName('min_pata').AsInteger := id_val_min;
            IBQGetAnimalesFiltrados.ParamByName('max_pata').AsInteger := id_val_max;
         end;

         if (i = 1) then
         begin
            IBQGetAnimalesFiltrados.ParamByName('min_hueso').AsInteger := id_val_min;
            IBQGetAnimalesFiltrados.ParamByName('max_hueso').AsInteger := id_val_max;
         end;

         if (i = 2) then
         begin
            IBQGetAnimalesFiltrados.ParamByName('min_prepucio').AsInteger := id_val_min;
            IBQGetAnimalesFiltrados.ParamByName('max_prepucio').AsInteger := id_val_max;
         end;

         if (i = 3) then
         begin
            IBQGetAnimalesFiltrados.ParamByName('min_ombligo').AsInteger := id_val_min;
            IBQGetAnimalesFiltrados.ParamByName('max_ombligo').AsInteger := id_val_max;
         end;

         if (i = 4) then
         begin
            IBQGetAnimalesFiltrados.ParamByName('min_color').AsInteger := id_val_min;
            IBQGetAnimalesFiltrados.ParamByName('max_color').AsInteger := id_val_max;
         end;

         if (i = 5) then
         begin
            IBQGetAnimalesFiltrados.ParamByName('min_conformacion').AsInteger := id_val_min;
            IBQGetAnimalesFiltrados.ParamByName('max_conformacion').AsInteger := id_val_max;
         end;

         if (i = 6) then
         begin
            IBQGetAnimalesFiltrados.ParamByName('min_ojos').AsInteger := id_val_min;
            IBQGetAnimalesFiltrados.ParamByName('max_ojos').AsInteger := id_val_max;
         end;

         if (i = 7) then
         begin
            IBQGetAnimalesFiltrados.ParamByName('min_tamanio').AsInteger := id_val_min;
            IBQGetAnimalesFiltrados.ParamByName('max_tamanio').AsInteger := id_val_max;
         end;

         if (i = 8) then
         begin
            IBQGetAnimalesFiltrados.ParamByName('min_fertilidad').AsInteger := id_val_min;
            IBQGetAnimalesFiltrados.ParamByName('max_fertilidad').AsInteger := id_val_max;
         end;
       end;
    end;

    IBQGetAnimalesFiltrados.ParamByName('cant_filtro').AsInteger := cant_filtros;
    IBQGetAnimalesFiltrados.Open;
end;

procedure TFRepListadoAnimalesFenotipos.MostrarAnimales;
begin

  SetLength(arrSql,0);
  SetLength(arrSql,9);

  multifiltro := false;
  cant_filtros := 0;

  InicializarSP;  

  BorrarEstructurasAuxiliares;

  AgregarFiltrosArrSql;

  CargarDatosDeAnimales;

  CargarAuxiliarGraficos;
end;

procedure TFRepListadoAnimalesFenotipos.BloquearFiltroRanking;
var i : integer;
    E : TComponent;
begin

    for i:=0 to GBCuadroValores.ComponentCount-1 do
    begin
        E := GBCuadroValores.Components[i];
        if (E is TEdit) then
        begin
          (E as TEdit).Text := '';
          (E as TEdit).Enabled := false;
        end;
    end;

end;

procedure TFRepListadoAnimalesFenotipos.DesbloquearFiltroRanking;
var i : integer;
    E : TComponent;
begin

    for i:=0 to GBCuadroValores.ComponentCount-1 do
    begin
        E := GBCuadroValores.Components[i];
        if (E is TEdit) then
        begin
          (E as TEdit).Text := '';
          (E as TEdit).Enabled := true;
        end;
    end;
    
end;

procedure TFRepListadoAnimalesFenotipos.IVistaPreviaClick(Sender: TObject);
begin

    if not(IBQGetAnimalesFiltrados.IsEmpty) then
    begin
      IBQPrev.Close;
      IBQPrev.Open;

      CargarDatosDeAnimales;

      Application.CreateForm(TFRepListadoAnimalesFenotiposPreview, FRepListadoAnimalesFenotiposPreview);

      FRepListadoAnimalesFenotiposPreview.Show;

      FRepListadoAnimalesFenotiposPreview.Hide;

      FRepListadoAnimalesFenotiposPreview.QRLAnimales.Caption := IntToStr(IBQGetAnimalesFiltrados.RecordCount);

      FRepListadoAnimalesFenotiposPreview.QRRankingFenotipos.Preview;

      FRepListadoAnimalesFenotiposPreview.Destroy;
    end
    else
      MostrarMensaje(tmInformacion,'No se han listado animales. Por lo tanto no hay vista previa para generar.');
end;

procedure TFRepListadoAnimalesFenotipos.GuardarGraficoBD(id : integer);
var
  m, f: TStream;
  s: string;
begin

    try
      IBDSAuxGraficos.Close;
      IBDSAuxGraficos.Open;

      IBDSAuxGraficos.Insert;

      IBDSAuxGraficosID_ANIMAL.AsInteger := id;

      m := IBDSAuxGraficos.CreateBlobStream(IBDSAuxGraficosIMG_GRA, bmWrite);

      s := ExtractFilePath(Application.ExeName);

      f := TFileStream.Create(s+'\grafico.bmp', fmOpenRead);

      m.CopyFrom(f, f.Size);

      IBDSAuxGraficos.Post;

      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;

    f.Free;
    m.Free;
end;

procedure TFRepListadoAnimalesFenotipos.CargarAuxiliarGraficos;
begin
     IBQGetAnimalesFiltrados.First;

     while not(IBQGetAnimalesFiltrados.Eof) do
     begin
          MostrarGrafica(0);
          GuardarGraficoBD(IBQGetAnimalesFiltrados.FieldValues['animal']);
         try
          IBQInsertAux.Close;
          IBQInsertAux.ParamByName('rp').AsString := IBQGetAnimalesFiltrados.FieldValues['id_rp'];

          if (IBQGetAnimalesFiltrados.FieldValues['nombre'] <> null) then
            IBQInsertAux.ParamByName('nombre').AsString := IBQGetAnimalesFiltrados.FieldValues['nombre']
          else
            IBQInsertAux.ParamByName('nombre').Value := null;

          if (IBQGetAnimalesFiltrados.FieldValues['apodo'] <> null) then
            IBQInsertAux.ParamByName('apodo').AsString := IBQGetAnimalesFiltrados.FieldValues['apodo']
          else
            IBQInsertAux.ParamByName('apodo').Value := null;

          IBQInsertAux.ParamByName('fecha').AsDate := IBQGetAnimalesFiltrados.FieldValues['fecha_nacimiento'];

          if (IBQGetAnimalesFiltrados.FieldValues['id_pc'] <> null) then
            IBQInsertAux.ParamByName('id_pc').AsString := IBQGetAnimalesFiltrados.FieldValues['id_pc']
          else
            IBQInsertAux.ParamByName('id_pc').Value := null;

          IBQInsertAux.ParamByName('id').AsInteger := IBQGetAnimalesFiltrados.FieldValues['animal'];
          IBQInsertAux.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
         except
          FPrincipal.IBTPrincipal.RollbackRetaining;
         end;

          IBQGetAnimalesFiltrados.Next;
     end;
end;

procedure TFRepListadoAnimalesFenotipos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  BorrarEstructurasAuxiliares;
end;

procedure TFRepListadoAnimalesFenotipos.BorrarEstructurasAuxiliares;
begin
  try
    IBQBorrarAuxiliares.Close;
    IBQBorrarAuxiliares.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFRepListadoAnimalesFenotipos.InicializarSP;
begin

    IBQGetAnimalesFiltrados.ParamByName('establecimiento').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('id_sexo').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('id_categoria').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('min_pata').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('max_pata').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('min_hueso').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('max_hueso').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('min_prepucio').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('max_prepucio').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('min_ombligo').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('max_ombligo').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('min_color').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('max_color').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('min_conformacion').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('max_conformacion').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('min_ojos').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('max_ojos').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('min_tamanio').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('max_tamanio').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('min_fertilidad').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('max_fertilidad').Value := null;
    IBQGetAnimalesFiltrados.ParamByName('cant_filtro').Value := null;

end;


end.
