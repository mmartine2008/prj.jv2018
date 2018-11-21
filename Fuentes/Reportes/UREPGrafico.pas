unit UREPGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, ExtCtrls, TeeProcs, TeEngine, Chart,
  DbChart, Series, TeeFunci, ComCtrls, Menus, DatosGenericos, Buttons;

type

    TFREPGrafico = class(TForm)

    Button2: TButton;

    Panel1: TPanel;
    Panel2: TPanel;

    Grafico: TDBChart;

    PopupMenu1: TPopupMenu;

    Salir1: TMenuItem;
    Label4: TLabel;
    DataSource1: TDataSource;
    query: TQuery;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    CBSummaries: TComboBox;
    CHBbyn: TCheckBox;
    CHBTresD: TCheckBox;
    GroupBox3: TGroupBox;
    LBSeries: TListBox;
    GroupBox4: TGroupBox;
    CBMarcas: TComboBox;
    Label3: TLabel;
    Etitulo: TEdit;
    Label1: TLabel;
    ENombreSerie: TEdit;
    Label6: TLabel;
    Label5: TLabel;
    CBTipoGrafico: TComboBox;
    CHBSerieVisible: TCheckBox;
    DG: TDatosGenericos;
    BBAyuda: TBitBtn;


    procedure actualizarConfiguracionSerie(NroSerie:integer);



    //procedure habilitarComponentes();

    procedure CambiarGrafico(pivote:TChartSeries; NroSerie : integer);
    procedure CargarConfiguracion();
    procedure Button2Click(Sender: TObject);
    procedure CBSummariesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBTipoGraficoChange(Sender: TObject);
    procedure CHBTresDClick(Sender: TObject);
    procedure actualizarPropiedades();
    procedure CHBMarcasClick(Sender: TObject);
    procedure CBTipoGraficoS2Change(Sender: TObject);
    procedure CHBPosicionClick(Sender: TObject);
    procedure CHBbynClick(Sender: TObject);
    procedure EtituloChange(Sender: TObject);
    procedure LBSeriesClick(Sender: TObject);
    procedure CHBSerieVisibleClick(Sender: TObject);
    procedure CBMarcasChange(Sender: TObject);
    procedure ENombreSerieChange(Sender: TObject);
    procedure ENombreSerieEnter(Sender: TObject);
    procedure ENombreSerieKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfigurarGrafico (serie : TBarSeries);overload;
    procedure ConfigurarGrafico (serie : TLineSeries);overload;
    procedure ConfigurarGrafico (serie : TAreaSeries);overload;
    procedure ConfigurarGrafico (serie : TPieSeries);overload;
  end;

var
  FREPGrafico: TFREPGrafico;
  nombreSerieAux : String;

implementation

{$R *.dfm}

// con este metodo seteo los valores de la serie en el panel de "configuracion de serie"

procedure TFREPGrafico.actualizarConfiguracionSerie(NroSerie:integer);
begin
  ENombreSerie.Text := DG.Series[NroSerie].Serie.Title;

  case DG.Series[NroSerie].Serie.Marks.Style of
    smsValue :  begin
                    CBMarcas.ItemIndex := 1;
                end;
    smsPercent :begin
                    CBMarcas.ItemIndex := 2;
                end;
      smsLabel: begin
                    CBMarcas.ItemIndex := 0;
                end;
  end;

  CHBSerieVisible.Checked := DG.Series[NroSerie].Serie.Active;
end;

// Este metodo guarda configura los graficos de tipo barra

procedure TFREPGrafico.ConfigurarGrafico (serie : TBarSeries);
begin
  /// aca configuro la serie de tipo barra
  serie.BarStyle := bsRectangle;
  serie.BarWidthPercent := 60;
  serie.MultiBar := mbStacked;
end;

// Este metodo guarda configura los graficos de tipo Line

procedure TFREPGrafico.ConfigurarGrafico (serie : TLineSeries);
begin
  /// aca configuro la serie de tipo line
end;

// Este metodo guarda configura los graficos de tipo area

procedure TFREPGrafico.ConfigurarGrafico (serie : TAreaSeries);
begin
  /// aca configuro la serie de tipo area
end;

// Este metodo guarda configura los graficos de tipo torta

procedure TFREPGrafico.ConfigurarGrafico (serie : TPieSeries);
begin
  /// aca configuro la serie de tipo torta
end;

// AutoConfiguro el grafico de acuerdo al comoponente de datos generico

procedure TFREPGrafico.CargarConfiguracion();
  var cont : integer;
      pala : string;

begin
{  cont := 1;
  SELF.Caption := DG.FormCaption;
  SELF.CBSummaries.Items.Clear;
  while (cont <= DG.CantSummaries) do
    begin
      SELF.CBSummaries.Items.Add(DG.Summaries[cont].visible);
      inc(cont);
    end;
  Self.CBSummaries.ItemIndex := 0;
}

  grafico.View3DOptions.Rotation := 355;
  grafico.View3DOptions.Elevation := 355;

//  grafico.LeftAxis.Title.Caption := CBSummaries.Text;


  if DG.CantSeries = 1 then
    begin
      //Series1.ColorEachPoint := true;
      Grafico.Legend.LegendStyle := lsValues;
    end
  else
    begin
      //Series1.ColorEachPoint := false;
    end;
  LBSeries.Items.Clear;
  cont := 1;
  while (cont <= DG.CantSeries) do
    begin
      LBSeries.Items.Add(DG.Series[cont].Serie.Title);
      grafico.AddSeries(DG.Series[cont].Serie);
      inc(cont);
    end;

  LBSeries.ItemIndex := 0;
  actualizarConfiguracionSerie( LBSeries.ItemIndex+1 );
  self.ConfigurarGrafico(TBarSeries(DG.Series[1].Serie));


//  ShowMessage(inttostr(grafico.SeriesCount));


end;

// BOTON PARA SALIR

procedure TFREPGrafico.Button2Click(Sender: TObject);
begin
  close;
end;

// CAMBIO EL SUMMARIE DEL GRAFICO

procedure TFREPGrafico.CBSummariesChange(Sender: TObject);
begin
  {series1.YValues.ValueSource := DG.Summaries[CBSummaries.itemindex+1].sql;
  series2.YValues.ValueSource := DG.Summaries[CBSummaries.itemindex+1].sql;
  series3.YValues.ValueSource := DG.Summaries[CBSummaries.itemindex+1].sql;
  series4.YValues.ValueSource := DG.Summaries[CBSummaries.itemindex+1].sql;
  grafico.LeftAxis.Title.Caption := CBSummaries.Text;
  self.actualizarPropiedades();}
end;

// cambio el tipo de grafico de la serie 1
procedure TFREPGrafico.CBTipoGraficoChange(Sender: TObject);

var pivote : TchartSeries;

begin
{  pivote := series1;
  CambiarGrafico(pivote, 1);}

end;

// cambio el tipo de grafico de la serie 2
procedure TFREPGrafico.CBTipoGraficoS2Change(Sender: TObject);
var pivote : TchartSeries;

begin
{  pivote := Series2;
  CambiarGrafico(pivote, 2);}

end;

// PERSONALIZACION DE CADA UNO DE LOS TIPOS DE SERIES

procedure TFREPGrafico.actualizarPropiedades();
begin
  // OPCIONES 3D
{  if (grafico.View3D) then
    begin
      if (self.CBTipoGraficoS1.Text = 'Torta') then
        begin
          grafico.View3DOptions.Elevation := 315;
          grafico.View3DOptions.Rotation := 360;
          grafico.View3DOptions.Orthogonal := false;
          grafico.View3DOptions.HorizOffset := 0;
          grafico.View3DOptions.Perspective := 0;
          TPieSeries(series1).CustomXRadius := 135;
          TPieSeries(series1).CustomYRadius := 65;
          grafico.View3DOptions.Zoom := 120;
        end
      else
        begin
          grafico.View3DOptions.Elevation := 350;
          grafico.View3DOptions.Rotation := 350;
          grafico.View3DOptions.Perspective := 0;
          grafico.Chart3DPercent := 45;
          grafico.View3DOptions.Zoom := 100;
        end;
    end
  else  // OPCIONES 2D
    begin
      if (self.CBTipoGraficoS1.Text = 'Torta') then
        begin
          TPieSeries(series1).CustomXRadius := 160;
          TPieSeries(series1).CustomYRadius := 95;
        end
    end;}
end;

// grafico 3D o no

procedure TFREPGrafico.CHBTresDClick(Sender: TObject);
begin
  grafico.View3D := CHBTresD.Checked;
//  DG.View3D := grafico.View3D;
  actualizarPropiedades();
end;

// grafico con marcas o no, cuando hay solo un serie

procedure TFREPGrafico.CHBMarcasClick(Sender: TObject);
begin
{  series1.Marks.Visible := not(series1.Marks.Visible);}
end;

// Muestro el formulario

procedure TFREPGrafico.FormShow(Sender: TObject);

begin
  CargarConfiguracion();
end;

// para cambiar de posicion las series cuando se muestran dos

procedure TFREPGrafico.CHBPosicionClick(Sender: TObject);
begin
{  if (CHBPosicion.Checked) then
    Grafico.SeriesDown(Series1)
  else
    Grafico.SeriesDown(Series2);}
end;

procedure TFREPGrafico.CHBbynClick(Sender: TObject);
begin
  Grafico.Gradient.Visible := CHBbyn.Checked;
end;

// cambia el tipo de las series dependiendo de que comboBox fue modificado

procedure TFREPGrafico.CambiarGrafico(pivote:TChartSeries; NroSerie : integer);

var texto: string;

begin
{
  if (NroSerie = 1) then
    texto := CBTipoGraficoS1.Text
  else
    texto := CBTipoGraficoS2.Text;


  if (texto = 'Barras') then
    begin
      ChangeSeriesType(pivote, TBarSeries);
      TBarSeries(pivote).MultiBar := mbStacked;
      TBarSeries(pivote).BarWidthPercent := 60;
    end;
  if (texto = 'Torta')then
    begin
      ChangeSeriesType(pivote, TpieSeries);
    end ;
  if (texto = 'Lineas') then
    begin
      ChangeSeriesType(pivote, TlineSeries);
      TLineSeries(pivote).LinePen.Width := 2;
    end;
  if (texto = 'Areas') then
    begin
      ChangeSeriesType(pivote, TareaSeries);
    end;
  self.actualizarPropiedades();}
end;

procedure TFREPGrafico.EtituloChange(Sender: TObject);
begin
  if (Length(Etitulo.Text) < 50) then
     begin
      Grafico.Title.Text.Clear;
      Grafico.Title.Text.Add(Etitulo.Text);
     end;

end;

procedure TFREPGrafico.LBSeriesClick(Sender: TObject);
begin
  if (grafico.SeriesCount >1) then
    grafico.Legend.LegendStyle := lsSeries;

  self.actualizarConfiguracionSerie(LBSeries.ItemIndex+1);
  self.ConfigurarGrafico(TBarSeries(grafico.SeriesList.Series[LBSeries.itemIndex]));
end;

procedure TFREPGrafico.CHBSerieVisibleClick(Sender: TObject);
begin
  Grafico.Series[LBSeries.ItemIndex].Active := CHBSerieVisible.Checked;
end;

procedure TFREPGrafico.CBMarcasChange(Sender: TObject);
begin
  case (CBMarcas.ItemIndex) of
    0:  begin
          Grafico.Series[LBSeries.ItemIndex].Marks.Visible := false;
        end;
    1:  begin
          Grafico.Series[LBSeries.ItemIndex].Marks.Visible := true;
          Grafico.Series[LBSeries.ItemIndex].Marks.Style := smsValue;
        end;
    2:  begin
          Grafico.Series[LBSeries.ItemIndex].Marks.Visible := true;
          Grafico.Series[LBSeries.ItemIndex].Marks.Style := smsPercent;
        end;
  end;

end;

procedure TFREPGrafico.ENombreSerieChange(Sender: TObject);
begin
  grafico.Series[LBSeries.ItemIndex].Title := ENombreSerie.Text;
  //CargarConfiguracion();
end;

procedure TFREPGrafico.ENombreSerieEnter(Sender: TObject);
begin
    nombreSerieAux := ENombreSerie.Text;
end;

procedure TFREPGrafico.ENombreSerieKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #27) then
    begin
      ENombreSerie.Text := nombreSerieAux;
      grafico.Series[LBSeries.ItemIndex].Title := nombreSerieAux;
    end;
  //CargarConfiguracion();

end;

end.
