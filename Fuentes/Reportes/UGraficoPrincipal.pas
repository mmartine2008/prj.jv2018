unit UGraficoPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DatosGenericos, Menus, ExtCtrls, DB, DBTables, Grids,
  DBGrids, Buttons;

type
  TFGraficoPrincipal = class(TForm)
    PopupMenu1: TPopupMenu;
    Salir1: TMenuItem;
    Panel1: TPanel;
    BAddSerie: TButton;
    Button1: TButton;
    BVerGrafico: TButton;
    BsetearSQL: TButton;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    CBTipoSum: TComboBox;
    Label2: TLabel;
    CBCamposSum: TComboBox;
    Label3: TLabel;
    ENombreSum: TEdit;
    Panel3: TPanel;
    Label4: TLabel;
    CBCampoGrupo: TComboBox;
    Panel4: TPanel;
    Label5: TLabel;
    CBCampoFiltro: TComboBox;
    Label6: TLabel;
    CBValoresFiltro: TComboBox;
    Label7: TLabel;
    CBOperadorFiltro: TComboBox;
    Label8: TLabel;
    Panel5: TPanel;
    Label9: TLabel;
    CBTipoSeries: TComboBox;
    DSDatosFiltro: TDataSource;
    QConsultaDatosFiltro: TQuery;
    BBAyuda: TBitBtn;
    procedure BVerGraficoClick(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure BAddSerieClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBCampoFiltroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGraficoPrincipal: TFGraficoPrincipal;

implementation

uses UrepGrafico;

{$R *.dfm}


// Hago el show de la herramienta para configurar el grafico

procedure TFGraficoPrincipal.BVerGraficoClick(Sender: TObject);
begin
  if (FREPGrafico.DG.CantSeries <> 0) then
    FREPGrafico.Show;
end;

// Salgo del formulario

procedure TFGraficoPrincipal.Salir1Click(Sender: TObject);
begin
  close;
end;

// En este metodo llamo para agregar la serie al chart, y seteo el SQL configurado para la serie

procedure TFGraficoPrincipal.BAddSerieClick(Sender: TObject);

Var flag:boolean;
begin
  flag := true;

  if ((CBCamposSum.Text <> '') and (CBTipoSum.Text <> '') and (ENombreSum.Text <> '')) then
    begin
      case (CBTipoSum.ItemIndex) of
        0:begin
            FREPGrafico.DG.SetSummarie('Count', ENombreSum.Text, '*')
          end;
        1:begin
            FREPGrafico.DG.SetSummarie('Sum', ENombreSum.Text, CBCamposSum.Text);
          end;
        2:begin
            FREPGrafico.DG.SetSummarie('AVG', ENombreSum.Text, CBCamposSum.Text);
          end;
      end;
    end
  else
    flag:= false;

  if (CBCampoGrupo.Text <> '') then
    FREPGrafico.DG.SetGrupo(CBCampoGrupo.Text)
  else
    flag:= false;

  case (CBOperadorFiltro.ItemIndex) of
    0:begin
        FREPGrafico.DG.SetFiltro(CBCampoFiltro.Text,CBValoresFiltro.Text,'>');
      end;
    1:begin
        FREPGrafico.DG.SetFiltro(CBCampoFiltro.Text,CBValoresFiltro.Text,'<');
      end;
    2:begin
        FREPGrafico.DG.SetFiltro(CBCampoFiltro.Text,CBValoresFiltro.Text,'=');
      end;
    3:begin
        FREPGrafico.DG.SetFiltro(CBCampoFiltro.Text,CBValoresFiltro.Text,'<>');
      end;
    4:begin
        FREPGrafico.DG.SetFiltro(CBCampoFiltro.Text,CBValoresFiltro.Text,'like');
      end;
  end;

  FREPGrafico.DG.SetTipoGrafico(CBTipoSeries.ItemIndex);


  if (flag) then
    FREPGrafico.DG.AgregarSerie(FREPGrafico.Grafico);
end;

// esto es una prueba para ver si estaba generando las sentencias correctamente

procedure TFGraficoPrincipal.FormShow(Sender: TObject);
begin
  CBCamposSum.Items.Clear;
  CBCamposSum.Items.Add('TaxRate');
  CBCamposSum.Items.Add('CustNo');
  CBCamposSum.ItemIndex := 0;

  CBCampoGrupo.Items.Clear;
  CBCampoGrupo.Items.Add('Country');
  CBCampoGrupo.Items.Add('State');
  CBCampoGrupo.ItemIndex := 0;

  CBCampoFiltro.Items.Clear;
  CBCampoFiltro.Items.Add('country');
  CBCampoFiltro.Items.Add('State');
  CBCampoFiltro.ItemIndex := 0;


  FREPGrafico.DG.CantSeries := 10;  // valor maximo de series que se pueden agregar
  FREPGrafico.DG.SQLBasicos := 'select <<SUM>>, <<GRUPO>> from customer where <<FILTRO>> group by <<GRUPO>>';

end;

procedure TFGraficoPrincipal.CBCampoFiltroChange(Sender: TObject);
Var pala : string;
begin
  QConsultaDatosFiltro.Active := false;
  QConsultaDatosFiltro.SQL.Clear;
  QConsultaDatosFiltro.SQL.Add('select distinct('+CBCampoFiltro.Text+') as nombre from customer');
  QConsultaDatosFiltro.Active := true;

  CBValoresFiltro.Items.Clear;
  QConsultaDatosFiltro.First;
  while (not(QconsultaDatosFiltro.Eof)) do
    begin
      pala := QConsultaDatosFiltro.FieldByName('nombre').AsString;
      CBValoresFiltro.Items.Add(pala);
      QConsultaDatosFiltro.Next;
    end;
  CBValoresFiltro.ItemIndex := 0;

end;

end.
