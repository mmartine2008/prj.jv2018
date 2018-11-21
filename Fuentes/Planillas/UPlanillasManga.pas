unit UPlanillasManga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  UFrameMangazo, EditAuto, DB, IBCustomDataSet, IBQuery, DBCtrls,
  UDBLookupComboBoxAuto, MemoAuto, IBStoredProc, WinXP, DataExport,
  DataToXLS, UPlanillaUniversal, Menus, StrUtils, QuickRpt, QRCtrls, JvGIF,
  jpeg, JvExControls, JvLabel, PngImage, ImgList, PngImageList, PngBitBtn,
  JvExExtCtrls, JvImage;

type
  TFPlanillasManga = class(TFUniversal)
    PBotones: TPanel;
    BBSalir: TBitBtn;
    BBImprimirPlanilla: TBitBtn;
    GBManga: TGroupBox;
    MRPAnimal: TMangazo;
    GBConfiguracion: TGroupBox;
    CBCodigos: TCheckBox;
    RBPaginas: TRadioButton;
    RBListarRPs: TRadioButton;
    EACantidadPaginas: TEditAuto;
    LPaginas: TLabel;
    ASalir: TAction;
    IBQConsultaEvento: TIBQuery;
    APreview: TAction;
    DBLCBAEventos: TDBLookupComboBoxAuto;
    LseleccionEvento: TLabel;
//    LTitulo: TLabel;
    ETituloPlanilla: TEdit;
    LObservacion: TLabel;
    MAObservacion: TMemoAuto;
    IBDSAuxPlanillas: TIBDataSet;
    AImprimirPlanilla: TAction;
    BBAyuda: TBitBtn;
    BBRP: TBitBtn;
    BBCodigo: TBitBtn;
    BBPlanilla: TBitBtn;
    ETubo: TEdit;
    LTubo: TLabel;
    PMEventos: TPopupMenu;
    General1: TMenuItem;
    Movimiento1: TMenuItem;
    Cra1: TMenuItem;
    ransferenciaEmbrionaria1: TMenuItem;
    Servicio1: TMenuItem;
    Gestacin1: TMenuItem;
    PartoNacimiento1: TMenuItem;
    Sanitario1: TMenuItem;
    LTituloPLanilla: TLabel;
    CBIATF: TCheckBox;
    CBImprimirRP: TCheckBox;
    IFondoB: TImage;
    IAyuda: TImage;
    LAyuda: TLabel;
    IPreviewRP: TImage;
    LPreviewRP: TLabel;
    ISalir: TImage;
    LSalir: TLabel;
    LPreviewCodigos: TLabel;
    IPreviewCodigos: TImage;
    LPreviewBlanco: TLabel;
    IPreviewBlanco: TImage;
    PILIconosEventos: TPngImageList;
    BSeleccionEvento: TPngBitBtn;
    procedure GBConfiguracionClick(Sender: TObject);
    procedure ASalirExecute(Sender: TObject);
    procedure EACantidadPaginasKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAEventosCloseUp(Sender: TObject);
    procedure MRPAnimalEnter(Sender: TObject);
    procedure MRPAnimalBBAgregarTodosClick(Sender: TObject);
    procedure AImprimirPlanillaExecute(Sender: TObject);
    procedure EACantidadPaginasExit(Sender: TObject);
    procedure BBRPClick(Sender: TObject);
    procedure BBCodigoClick(Sender: TObject);
    procedure BBPlanillaClick(Sender: TObject);
    procedure MRPAnimalRBTodasClick(Sender: TObject);
    procedure MRPAnimalBDBGDisponiblesDblClick(Sender: TObject);
    procedure MRPAnimalBDBGSeleccionadosDblClick(Sender: TObject);
    procedure CBCodigosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MRPAnimalBBEliminarTodosClick(Sender: TObject);
    procedure MRPAnimalBBAgregarUnoClick(Sender: TObject);
    procedure EventosClick(Sender : TObject);
    procedure BSeleccionEventoClick(Sender: TObject);
    procedure MRPAnimalCBxTipoRegistroChange(Sender: TObject);
  private
    CantAnimalesPlanilla : Integer;
    FTipoEvento: integer;
    NombreEvento : String;
    FormularioEC : TFUniversal;
    procedure SetTipoEvento(const Value: integer);
    procedure CambioEvento;
    procedure cargar;
    procedure GenerarAnimales;
    procedure GeneroRPs;
    procedure GeneroVacio;
    procedure GenerarReporte;
    procedure ImprimirReportes;
    procedure PreviewReporteRP;
    procedure PreviewReporteCodigo;
    procedure PreviewReportePlanilla;
    Procedure Imprimir_Preview(boton: Integer);//1 imprimir todo // 2 preview rp // 3 preview codigo // 4 preview planilla
    procedure deshabilitar(checked:Boolean);
    procedure AbrirReporte(F : TFPlanillaUniversal);
    procedure HabilitarComponentesVersionBasica; override;
    procedure CargarEventos;
  public
  published
    property TipoEvento: integer read FTipoEvento write SetTipoEvento;
    constructor Create(AOwner : TComponent; FormEC : TFUniversal); reintroduce;
  end;

var
  FPlanillasManga: TFPlanillasManga;
  CantidadAnimales: integer;

implementation

uses UDMSoftvet, UPrincipal, UClassType, UPlanillasMangaPreview, UMensajeHuella,
     URepFichaAnimal, UAvanceTerminar, UPlanillaPeso, UPlanillaCalidadCarneProductor,
     UPlanillaCalidadCarneEcografista, UPlanillasITAFDiag, UTraduccion, UPlanillaAsignacionServicio, UPlanillaCambioUbicacion,
     UPlanillaNoTactadas,UPlanillaReidentificacion,UPlanillaExtraccionSemen, UPlanillaRevisionToros, UPlanillaCapServicio,
     UPlanillaProyPartos;

{$R *.dfm}

constructor TFPlanillasManga.Create(AOwner : TComponent; FormEC : TFUniversal);
begin
  inherited Create(AOwner);
  FormularioEC := FormEC;
end;

procedure TFPlanillasManga.deshabilitar(checked:Boolean);
var
  i:Integer;
begin
   CBImprimirRP.Enabled:=checked;

   for  i:=0 to MRPAnimal.ComponentCount-1 do
     if MRPAnimal.Components[i] is TControl then
        (MRPAnimal.Components[i] as TControl).Enabled:=checked;
end;

procedure TFPlanillasManga.GBConfiguracionClick(Sender: TObject);
begin
  inherited;

  CBIATF.Visible := (TipoEvento = 46) and RBListarRPs.Checked; //Planilla IATF
  if FormularioEC = nil then
  begin
    if (TipoEvento = 46) and RBListarRPs.Checked then
      GBConfiguracion.Height := 153
    else
      GBConfiguracion.Height := 129;
  end;

  if not RBPaginas.Checked then
  begin
    BBPlanilla.Caption := Traducir('Vista Preliminar');
    BBRP.Enabled := true;
    LPreviewBlanco.Caption := Traducir('Vista Preliminar');
    IPreviewRP.Enabled := true;
    LPreviewRP.Enabled := true;
  end
  else
  begin
    BBPlanilla.Caption := Traducir('Planilla en Blanco');
    BBRP.Enabled := false;
    LPreviewBlanco.Caption := Traducir('Vista Preliminar');
    IPreviewRP.Enabled := false;
    LPreviewRP.Enabled := false;
  end;

  MRPAnimal.IBQSeleccionados.Open;
  GBManga.Enabled := RBListarRPs.Checked;
  deshabilitar(RBListarRPs.Checked);
  EACantidadPaginas.Enabled := RBPaginas.Checked;


  if ETituloPlanilla.Text <> '' then
    MRPAnimal.RBTodas.Checked:= true
  else
  begin
      MostrarMensaje(tmError, 'No ha seleccionado ningun evento');
      BSeleccionEvento.SetFocus;
  end;

  cargar;

end;

// salimos del formulario
procedure TFPlanillasManga.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  Close;
end;

procedure TFPlanillasManga.SetTipoEvento(const Value: integer);
begin
  FTipoEvento := Value;
  if ((Value = 13) or (value = 17) or (value = 24)) then
    CantidadAnimales := 25
  else
    CantidadAnimales := 40;
end;

procedure TFPlanillasManga.EACantidadPaginasKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 4)) and (key <> #8)) then key:=#0;
end;

procedure TFPlanillasManga.DBLCBAEventosCloseUp(Sender: TObject);
begin
  inherited;
  CambioEvento;

  if not MRPAnimal.IBQSeleccionados.IsEmpty then
  begin
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;

    MRPAnimal.RBTodas.Checked:= true;
    MRPAnimal.ActualizarLosQuery;
    MRPAnimalRBTodasClick(self);
  end;


  if (TipoEvento = 38) then
  begin
    RBPaginas.Checked := true;
    RBPaginas.Caption := Traducir('Cant. Animales');
    if FormularioEC = nil then
      EACantidadPaginas.Left := 117
    else
    begin
      EACantidadPaginas.Left := RBPaginas.Left + RBPaginas.Width + 5;
    end;
    RBListarRPs.Visible := false;
    LTubo.Visible := true;
    ETubo.Visible := true;
  end
  else
  begin
    RBPaginas.Caption := Traducir('Imprimir planilla en blanco para');
    EACantidadPaginas.Left := 189;
    RBListarRPs.Visible := true;
    LTubo.Visible := false;
    ETubo.Visible := false;
  end;

  cargar;

end;

procedure TFPlanillasManga.cargar;
begin

  if ETituloPlanilla.Text <> '' then
  begin
    if(RBListarRPs.Checked) then
    begin
     { MRPAnimal.RBAnimales.Checked:=true;
      MRPAnimal.RBAnimales.Checked:=false;
      MRPAnimal.RBTodas.Checked:= true;}
    end;

    MRPAnimalRBTodasClick(self);
    MRPAnimal.FilCargados := true;
  end;

  if(TipoEvento = 40) then
    RBPaginas.Checked:=true;

end;

// actualizo todo el formulario segun la seleccion del evento
procedure TFPlanillasManga.CambioEvento;
begin
      RBListarRPs.Enabled:=true;

      if (TipoEvento = 40) then
      begin
        RBListarRPs.Enabled:=false;
        MRPAnimal.SQLBasico := 'select id_animal, id_rp, id_senasa, id_pc, id_hba, id_otro, nombre, apodo, color from vis_animales';
        MRPAnimal.IBQDisponibles.Close;
        MRPAnimal.IBQDisponibles.Open;
      end
      else
      begin
        IBQConsultaEvento.Close;
        IBQConsultaEvento.ParamByName('TipoEvento').AsInteger := TipoEvento;
        IBQConsultaEvento.Open;

        PTitulo.Caption := Traducir('Planillas para ')+IBQConsultaEvento.fieldByName('nombre').AsString;

        MRPAnimal.SQLBasico := 'select id_animal, id_rp, id_senasa, id_pc, id_hba, id_otro, nombre, apodo, color from '+ IBQConsultaEvento.fieldByName('vista').AsString;
        MRPAnimal.PasarParametros(0,0);//cambie codigo
      end;

      ETituloPlanilla.Text := Traducir('Planilla para ')+ NombreEvento;//DBLCBAEventos.Text;
      ETituloPlanilla.SetFocus;

      CBIATF.Visible := (TipoEvento = 46) and RBListarRPs.Checked; //Planilla IATF

      if FormularioEC = nil then
      begin
        if (TipoEvento = 46) and RBListarRPs.Checked then
          GBConfiguracion.Height := 153
        else
          GBConfiguracion.Height := 129;
      end;

end;

procedure TFPlanillasManga.GenerarAnimales;
begin
  if (RBPaginas.Checked) then
    GeneroVacio
  else
    GeneroRPs;
end;

// inserto en aux_planillas los rps seleccionados
procedure TFPlanillasManga.GeneroRPs;
var id : integer;
begin
  id := 1;
  if not(IBDSAuxPlanillas.IsEmpty) then
    IBDSAuxPlanillas.Delete;

  MRPAnimal.BDBGSeleccionados.DataSource := nil;
  MRPAnimal.IBQSeleccionados.First;
  while not(MRPAnimal.IBQSeleccionados.Eof) do
    begin
      IBDSAuxPlanillas.Insert;
      IBDSAuxPlanillas.FieldByName('id_aux').AsInteger := MRPAnimal.IBQSeleccionados.fieldByName('id_animal').AsInteger;
      IBDSAuxPlanillas.FieldByName('RP').AsString := MRPAnimal.IBQSeleccionados.fieldByName('id_rp').AsString;
      IBDSAuxPlanillas.Post;
      inc(id);
      MRPAnimal.IBQSeleccionados.Next;
    end;
  MRPAnimal.IBQSeleccionados.First;
  MRPAnimal.BDBGSeleccionados.DataSource := MRPAnimal.DSSeleccionados;
  CantAnimalesPlanilla := id;
end;

// inserto una repeticion de inserciones vacios en aux_planillas
procedure TFPlanillasManga.GeneroVacio;
var id : integer;
begin
  if (TipoEvento = 38) then
    id := 0
  else
    id := 1;
  if not(IBDSAuxPlanillas.IsEmpty) then
    IBDSAuxPlanillas.Delete;

  while (id < StrToInt(EACantidadPaginas.Text)) do
    begin
      IBDSAuxPlanillas.Insert;
      IBDSAuxPlanillas.FieldByName('id_aux').AsInteger := id;
      if (TipoEvento = 38) then
        IBDSAuxPlanillas.FieldByName('RP').AsString := IntToStr(id+StrToInt(ETubo.Text))
      else
        IBDSAuxPlanillas.FieldByName('RP').AsString := '';
      IBDSAuxPlanillas.Post;
      inc(id);
    end;
  CantAnimalesPlanilla := id;
end;

procedure TFPlanillasManga.GenerarReporte;
var cont : integer;
begin
  cont := 0;
  Application.CreateForm(TFPlanillasMangaPreview, FPlanillasMangaPreview);
  FPlanillasMangaPreview.IBQCodigos.Close;
  FPlanillasMangaPreview.IBQCodigos.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
  FPlanillasMangaPreview.IBQCodigos.ParamByName('evento').AsInteger := TipoEvento;//DBLCBAEventos.KeyValue;
  FPlanillasMangaPreview.IBQCodigos.Open;
  FPlanillasMangaPreview.evento := TipoEvento;//DBLCBAEventos.KeyValue;
  FPlanillasMangaPreview.RPVisibles := CBImprimirRP.Checked;
  FPlanillasMangaPreview.CodigosVisibles := CBCodigos.Checked;
  FPlanillasMangaPreview.ReporteRPsVisible := RBListarRPs.Checked;
  while (cont < MAObservacion.Lines.Count) do
    begin
      FPlanillasMangaPreview.QRMObservacion.Lines.Add(MAObservacion.Lines.Strings[cont]);
      inc(cont);
    end;
  // seteo los titulos de los reportes
  FPlanillasMangaPreview.QRLTitulosRPs.Caption := ETituloPlanilla.Text;
  FPlanillasMangaPreview.QRLTituloCodigos.Caption := ETituloPlanilla.Text;
  FPlanillasMangaPreview.QRLTituloPlanilla.Caption := ETituloPlanilla.Text;

  FPlanillasMangaPreview.ConfigurarPlanilla();

end;

procedure TFPlanillasManga.MRPAnimalEnter(Sender: TObject);
begin
  inherited;
  if ETituloPlanilla.Text = '' then
  //if (DBLCBAEventos.KeyValue = Null) then
    begin
      MostrarMensaje(tmError, 'No ha seleccionado ningun evento');
      //DBLCBAEventos.SetFocus;
      //ETituloPlanilla.SetFocus;
      BSeleccionEvento.SetFocus;
    end;
end;

procedure TFPlanillasManga.MRPAnimalBBAgregarTodosClick(Sender: TObject);
begin
  inherited;
  MRPAnimal.BBAgregarTodosClick(Sender);

end;

procedure TFPlanillasManga.AImprimirPlanillaExecute(Sender: TObject);
begin
  inherited;
  Imprimir_Preview(1);//imprimo todo
end;

// mando a imprimir los reportes por separados dependiendo de las selecciones
procedure TFPlanillasManga.ImprimirReportes;
begin
  if (FPlanillasMangaPreview.ReporteRPsVisible) then
    FPlanillasMangaPreview.QRRPs.Print;
  if (FPlanillasMangaPreview.CodigosVisibles) then
    FPlanillasMangaPreview.QRCodigos.Print;

  FPlanillasMangaPreview.QRPlanilla.Print;
end;

procedure TFPlanillasManga.PreviewReporteRP;
begin
  if (FPlanillasMangaPreview.ReporteRPsVisible) then
    FPlanillasMangaPreview.QRRPs.Preview;
end;

procedure TFPlanillasManga.PreviewReporteCodigo;
begin
  if (FPlanillasMangaPreview.CodigosVisibles) then
    FPlanillasMangaPreview.QRCodigos.Preview;
end;

procedure TFPlanillasManga.PreviewReportePlanilla;
begin
  FPlanillasMangaPreview.CantAnimalesPlanilla := CantAnimalesPlanilla;
  FPlanillasMangaPreview.QRPlanilla.Preview;
end;

procedure TFPlanillasManga.EACantidadPaginasExit(Sender: TObject);
begin
  inherited;
  if (EACantidadPaginas.Text = '') then
    EACantidadPaginas.Text := '25';
end;

procedure TFPlanillasManga.Imprimir_Preview(boton: Integer);
begin
//1 imprimir todo // 2 preview rp // 3 preview codigo // 4 preview planilla

  if ETituloPlanilla.Text <> '' then
  //if (DBLCBAEventos.KeyValue <> Null) then
    begin
      if ((not(MRPAnimal.IBQSeleccionados.IsEmpty)and(RBListarRPs.Checked)) or ((MRPAnimal.IBQSeleccionados.IsEmpty)and not(RBListarRPs.Checked)) or RBPaginas.Checked)then
        begin
          // hay que cambiar el recordcount por una property de la manga que sea cantidad seleccionados
          if (((RBPaginas.Checked) and (StrToInt(EACantidadPaginas.Text)>= 1000)) or ((RBListarRPs.Checked) and (MRPAnimal.IBQSeleccionados.RecordCount >= 1000))) then
            begin
              if (MostrarMensaje(tmConsulta, 'Este proceso tardará algunos minutos.Desea continuar?') = mrYes) then
                begin
                  GenerarAnimales;
                  GenerarReporte;
                  if (boton = 1) then
                    ImprimirReportes
                   else
                    if (boton = 2) then
                      PreviewReporteRP
                     else
                      if (boton = 3) then
                        PreviewReporteCodigo
                       else
                       begin
                            FPlanillasMangaPreview.IBQDetalleAnimales.Close;
                            FPlanillasMangaPreview.IBQDetalleAnimales.SQL.Clear;
                            //if (TipoEvento= 38) then
                              FPlanillasMangaPreview.IBQDetalleAnimales.SQL.Add('select * from aux_planillas');
                            {else
                              FPlanillasMangaPreview.IBQDetalleAnimales.SQL.Add('select * from aux_planillas order by rp');}
                         PreviewReportePlanilla;
                       end;
                end;
            end
          else
            begin
              GenerarAnimales;
              GenerarReporte;
              if (boton = 1) then
                ImprimirReportes
               else
                if (boton = 2) then
                  PreviewReporteRP
                 else
                  if (boton = 3) then
                    PreviewReporteCodigo
                   else
                     PreviewReportePlanilla;
            end;
        end
      else
        MostrarMensaje(tmError, 'No ha seleccionado animales');
    end
  else
    begin
      MostrarMensaje(tmError, 'No ha seleccionado ningun evento');
      //DBLCBAEventos.SetFocus;
      //ETituloPlanilla.SetFocus;
      BSeleccionEvento.SetFocus;
    end;
end;

procedure TFPlanillasManga.BBRPClick(Sender: TObject);
begin
  inherited;
  Imprimir_Preview(2);//preview RP
end;

procedure TFPlanillasManga.BBCodigoClick(Sender: TObject);
begin
  inherited;
  Imprimir_Preview(3);//preview codigo
end;

procedure TFPlanillasManga.AbrirReporte(F : TFPlanillaUniversal);
begin
  GenerarAnimales;
  F.ConfigurarReporte;
  F.CantAnimalesPlanilla := CantAnimalesPlanilla;
  F.QRLTituloPlanilla.Caption := ETituloPlanilla.Text;
  F.QRMObservacion.Lines.AddStrings(MAObservacion.Lines);
  F.QRPlanillaUniversal.Preview;
  F.Destroy;
end;

procedure TFPlanillasManga.BBPlanillaClick(Sender: TObject);
var
  F : TFPlanillaUniversal;
begin
  inherited;
  case TipoEvento of
    25 : begin   //Evento Peso
          F := TFPlanillaPeso.Create(self,TipoEvento,not RBPaginas.Checked);
          AbrirReporte(F);
         end;
    42 : begin
          F := TFPlanillaCalidadCarneProductor.Create(self,TipoEvento,not RBPaginas.Checked);
          AbrirReporte(F);
         end;
    43 : begin
          F := TFPlanillaCalidadCarneEcografista.Create(self,TipoEvento,not RBPaginas.Checked);
          AbrirReporte(F);
         end;
    46 : begin
          F := TFPlanillasITAFDiag.Create(self,TipoEvento,not RBPaginas.Checked,CBIATF.Checked);
          AbrirReporte(F);
         end;
    5  : begin
          F := TFPlanillaCambioUbicacion.Create(self,TipoEvento,not RBPaginas.Checked);
          AbrirReporte(F);
         end;
    36  : begin
          F := TFPlanillaReidentificacion.Create(self,TipoEvento,not RBPaginas.Checked);
          AbrirReporte(F);
         end;
    50  : begin //Asignacion de Servicio
          F := TFPlanillaAsignacionServicio.Create(self,TipoEvento,not RBPaginas.Checked);
          AbrirReporte(F);
         end;
    51 : begin  //Hembras no tactadas
         F := TFPlanillaNoTactadas.Create(self,TipoEvento,not RBPaginas.Checked);
         AbrirReporte(F);
         end;
    52 : begin
         F := TFPlanillaExtraccionSemen.Create(self,TipoEvento,not RBPaginas.Checked);
         AbrirReporte(F);
         end;
    55 : begin
         F := TFPlanillaRevisionToros.Create(self,TipoEvento,not RBPaginas.Checked);
         AbrirReporte(F);
         end;
    56 : begin
         F := TFPlanillaCapServicio.Create(self,TipoEvento,not RBPaginas.Checked);
         AbrirReporte(F);
         end;
    57 : begin
         F := TFPlanillaProyPartos.Create(self,TipoEvento,not RBPaginas.Checked);
         AbrirReporte(F);
         end;
  else
    Imprimir_Preview(4);//preview planilla
  end;
end;

procedure TFPlanillasManga.MRPAnimalRBTodasClick(Sender: TObject);
begin
  inherited;
  MRPAnimal.RBTodasClick(Sender);

end;

procedure TFPlanillasManga.MRPAnimalBDBGDisponiblesDblClick(
  Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (MRPAnimal.BDBGDisponibles.SelectedIndex = MRPAnimal.BDBGDisponibles.ColumnByField('id_rp').Index) then
    if not(MRPAnimal.IBQDisponibles.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := MRPAnimal.IBQDisponibles.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFPlanillasManga.MRPAnimalBDBGSeleccionadosDblClick(
  Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (MRPAnimal.BDBGSeleccionados.SelectedIndex = MRPAnimal.BDBGSeleccionados.ColumnByField('id_rp').Index) then
    if not(MRPAnimal.IBQSeleccionados.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := MRPAnimal.IBQSeleccionados.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFPlanillasManga.CBCodigosClick(Sender: TObject);
begin
  inherited;
  //BBCodigo.Enabled:= CBCodigos.Checked;
  LPreviewCodigos.Enabled := CBCodigos.Checked;
  IPreviewCodigos.Enabled := CBCodigos.Checked;
end;

procedure TFPlanillasManga.FormShow(Sender: TObject);
begin
  inherited;
  MRPAnimal.IBQSeleccionados.Open;
  //BBCodigo.Enabled:= CBCodigos.Checked;
  LPreviewCodigos.Enabled := CBCodigos.Checked;
  IPreviewCodigos.Enabled := CBCodigos.Checked;

  deshabilitar(false);
  CargarEventos;
  MRPAnimal.CBxTipoRegistro.Visible := FPrincipal.FuncDEPs;

  IBDSAuxPlanillas.Close;
  IBDSAuxPlanillas.Open;

  if FormularioEC <> nil then
  begin
    GBManga.Visible := false;
    BSeleccionEvento.Visible := false;
    LseleccionEvento.Visible := false;
    GBConfiguracion.Align := alClient;



    LTituloPLanilla.Left := 23;
    LTituloPLanilla.Font.Size := 14;
    ETituloPlanilla.Font.Size := 14;
    ETituloPlanilla.Left := LTituloPLanilla.Left + LTituloPLanilla.Width + 10;
    ETituloPlanilla.Top := LTituloPLanilla.Top;
    ETituloPlanilla.Width := 600;

    LObservacion.Left := 23;
    LObservacion.Font.Size := 12;
    MAObservacion.Left := LObservacion.Left + LObservacion.Width + 10;
    MAObservacion.Width := 600;
    MAObservacion.Top := LObservacion.Top;

    RBPaginas.Font.Size := 12;
    RBPaginas.Left := 23;
    RBPaginas.Width := 250;
    RBPaginas.Top := MAObservacion.Top + MAObservacion.Height + 20;
    EACantidadPaginas.Left := RBPaginas.Left + RBPaginas.Width + 10;
    EACantidadPaginas.Font.Size := 12;
    EACantidadPaginas.Top := RBPaginas.Top;
    LPaginas.Left := EACantidadPaginas.Left + EACantidadPaginas.Width + 5;
    LPaginas.Font.Size := 12;
    LPaginas.Top := RBPaginas.Top;

    LTubo.Top := RBPaginas.Top + RBPaginas.Height + 20;
    LTubo.Font.Size := 12;
    LTubo.Left := 23;
    ETubo.Top := LTubo.Top;
    ETubo.Left := LTubo.Left + LTubo.Width + 15;
    ETubo.Font.Size := 12;

    IPreviewCodigos.Visible := false;
    LPreviewCodigos.Visible := false;
    IPreviewRP.Visible := false;
    LPreviewRP.Visible := false;

    EventosClick(nil);
  end;
end;

procedure TFPlanillasManga.MRPAnimalBBEliminarTodosClick(Sender: TObject);
begin
  inherited;
  MRPAnimal.BBEliminarTodosClick(Sender);
end;

procedure TFPlanillasManga.MRPAnimalBBAgregarUnoClick(Sender: TObject);
begin
  inherited;
  MRPAnimal.BBAgregarUnoClick(Sender);
end;

procedure TFPlanillasManga.HabilitarComponentesVersionBasica;
begin
  inherited;
//  {$IFDEF BASICO}
  if (FPrincipal.TipoVersionLicencia = 'Basico') then
    begin
      //MRPAnimal.JvROBusquedaAvanzada.Visible:= true;
      DMSoftvet.IBQEventosPlanillas.Close;
      DMSoftvet.IBQEventosPlanillas.SQL.Clear;
      DMSoftvet.IBQEventosPlanillas.SQL.Add('select * from cod_tipos_evento where (tiene_planilla = '+'''S'''+') and id_tipo_evento <> 29 and id_tipo_evento <> 41 and id_tipo_evento <> 42 and id_tipo_evento <> 43 and id_tipo_evento <> 47 and id_tipo_evento <> 48 order by nombre asc');
      DMSoftvet.IBQEventosPlanillas.Open;
    end
   else
    begin
      //
    end;
//  {$ELSE}
    //
//  {$ENDIF}
end;

procedure TFPlanillasManga.CargarEventos;
var
  I : TMenuItem;
begin
  DMSoftvet.IBQEventosPlanillas.Close;
  DMSoftvet.IBQEventosPlanillas.Open;
  DMSoftvet.IBQEventosPlanillas.First;
  with DMSoftvet.IBQEventosPlanillas do
  begin
    while not Eof do
    begin
      I := TMenuItem.Create(PMEventos);
      I.Caption := FieldByName('NOMBRE').AsString;
      I.OnClick := EventosClick;
      I.Tag := FieldByName('id_tipo_evento').AsInteger;
      case I.Tag of
        41,42,43 : I.Enabled := FPrincipal.FuncCalidadCarne;
      end;
      if FieldByName('id_tipo_evento').AsInteger in [47..48] then
        PMEventos.Items[3].Add(I)
      else
        PMEventos.Items[FieldByName('Categoria').AsInteger - 1].Add(I);
      Next;
    end;
  end;
  PMEventos.Items[3].Enabled := FPrincipal.FuncTransferencia;
end;

procedure TFPlanillasManga.EventosClick(Sender : TObject);
begin
  if FormularioEC <> nil then
  begin
    TipoEvento := 38;
    NombreEvento := 'Diagnóstico de Gestación - Alta';
    ETituloPlanilla.Visible := true;
    LTituloPLanilla.Visible := true;
  end
  else
  begin
    TipoEvento := (Sender  as TMenuItem).Tag;
    NombreEvento := (Sender as TMenuItem).Caption;
  end;
  CambioEvento;
  if not MRPAnimal.IBQSeleccionados.IsEmpty then
    begin
      IBSPBorrarTablasAuxiliares.Close;
      IBSPBorrarTablasAuxiliares.ExecProc;

      MRPAnimal.RBTodas.Checked:= true;
      MRPAnimal.ActualizarLosQuery;
      MRPAnimalRBTodasClick(self);
    end;
  if (TipoEvento = 38) then
  begin
    RBPaginas.Checked := true;
    RBPaginas.Caption := Traducir('Cant. Animales');
    if FormularioEC = nil then
      EACantidadPaginas.Left := 117
    else
      EACantidadPaginas.Left := RBPaginas.Left + RBPaginas.Width + 5;
    RBListarRPs.Visible := false;
    LTubo.Visible := true;
    ETubo.Visible := true;
  end
  else
  begin
    RBPaginas.Caption := Traducir('Imprimir planilla en blanco para');
    EACantidadPaginas.Left := 189;
    RBListarRPs.Visible := true;
    LTubo.Visible := false;
    ETubo.Visible := false;
  end;

  cargar;
end;

procedure TFPlanillasManga.BSeleccionEventoClick(Sender: TObject);
begin
  inherited;
  PMEventos.Popup(LSeleccionEvento.Left+self.Left+LSeleccionEvento.Width+4,self.Top+Ptitulo.Height+LSeleccionEvento.Height);
  ETituloPlanilla.Visible := true;
  LTituloPLanilla.Visible := true;
end;

procedure TFPlanillasManga.MRPAnimalCBxTipoRegistroChange(Sender: TObject);
begin
  inherited;
  MRPAnimal.CBxTipoRegistroChange(Sender);
end;

end.
