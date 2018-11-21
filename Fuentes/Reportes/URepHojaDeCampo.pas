unit URepHojaDeCampo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, JvExExtCtrls, JvImage, ComCtrls,
  jpeg, pngimage, ExtCtrls, StdCtrls, JvGIF, Grids, DBGrids, DateUtils,
  ImgList, PngImageList, JvExControls, JvLabel;

type
  TRegDistribucion = record
    suma : double;
    cant : integer;
  end;
  TArrDistribucion = Array [1..10] of TRegDistribucion;

  TFRepHojaDeCampo = class(TFUniversal)
    PFiltros: TPanel;
    PBotones: TPanel;
    PGrilla: TPanel;
    Label4: TLabel;
    DTPDesde: TDateTimePicker;
    Label5: TLabel;
    DTPHasta: TDateTimePicker;
    Image1: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    ICancelar: TImage;
    LCancelar: TLabel;
    IBQRepHojaCampo: TIBQuery;
    DSRepHojaCampo: TDataSource;
    DBGHojaCampo: TDBGrid;
    IBQRepHojaCampoDIAS: TLargeintField;
    IBQRepHojaCampoGDPV: TFloatField;
    IBQRepHojaCampoPESO_INI: TFloatField;
    IBQRepHojaCampoPESO_ACT: TFloatField;
    IBQRepHojaCampoCONSUMO: TFloatField;
    IBQRepHojaCampoCORRAL: TIBStringField;
    IBQRepHojaCampoFECHA_INGRESO: TDateField;
    IBQRepHojaCampoRACION: TIBStringField;
    IBQRepHojaCampoCANTCAB: TIntegerField;
    IBQEstados: TIBQuery;
    BConsulta: TButton;
    JvIBotonBuscar: TJvImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure IPreviewClick(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
    procedure BConsultaClick(Sender: TObject);
  private
    desde, hasta : TDate;
    DistCabezas, DistConsumos : TArrDistribucion;
    CantIn, CantM, CantV : Integer;
    procedure ActConsulta;
    procedure CalcularDistribuciones;
  public
    { Public declarations }
  end;

var
  FRepHojaDeCampo: TFRepHojaDeCampo;

implementation

{$R *.dfm}

uses
  UPrincipal, URepHojaDeCampoPreview, UCartel;

procedure TFRepHojaDeCampo.ActConsulta;
var
  C : TCartel;
begin
  C := TCartel.getInstance;
  C.abrircartel('Obteniendo datos...');
  IBQRepHojaCampo.Close;
  IBQRepHojaCampo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRepHojaCampo.ParamByName('desde').AsDate := desde;
  IBQRepHojaCampo.ParamByName('hasta').AsDate := hasta;
  IBQRepHojaCampo.Open;
  IBQEstados.Close;
  IBQEstados.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQEstados.ParamByName('desde').AsDate := desde;
  IBQEstados.ParamByName('hasta').AsDate := hasta;
  IBQEstados.Open;
  CalcularDistribuciones;
  IPreview.Visible := not IBQRepHojaCampo.IsEmpty;
  LPreview.Visible := not IBQRepHojaCampo.IsEmpty;
  C.cerrarcartel;
  C.FreeInstance;
end;

procedure TFRepHojaDeCampo.CalcularDistribuciones;
var
  i : Integer;
begin
  for i := 1 to 10 do
  begin
    DistCabezas[i].cant := 0;
    DistConsumos[i].cant := 0;
    DistCabezas[i].suma := 0;
    DistConsumos[i].suma := 0;
  end;

  CantIn := 0;
  CantM := 0;
  CantV := 0;
  IBQEstados.First;
  while not IBQEstados.Eof do
  begin
    if IBQEstados.FieldValues['estado'] = 'M' then
      CantM := CantM + IBQEstados.FieldValues['cantcab']
    else
      if IBQEstados.FieldValues['estado'] = 'V' then
        CantV := CantV + IBQEstados.FieldValues['cantcab'];
    IBQEstados.Next;
  end;


  IBQRepHojaCampo.First;
  while not IBQRepHojaCampo.Eof do
  begin
    CantIn := CantIn + IBQRepHojaCampo.FieldValues['cantcab'];
    if (IBQRepHojaCampo.FieldByName('peso_act').AsFloat >= 0) and (IBQRepHojaCampo.FieldByName('peso_act').AsFloat <= 149) then
    begin
      DistCabezas[1].suma := DistCabezas[1].suma + IBQRepHojaCampo.FieldValues['cantcab'];
      DistConsumos[1].suma := DistConsumos[1].suma + IBQRepHojaCampo.FieldValues['consumo'];
      DistConsumos[1].cant := DistConsumos[1].cant + 1;
    end;
    if (IBQRepHojaCampo.FieldByName('peso_act').AsFloat >= 150) and (IBQRepHojaCampo.FieldByName('peso_act').AsFloat <= 199) then
    begin
      DistCabezas[2].suma := DistCabezas[2].suma + IBQRepHojaCampo.FieldValues['cantcab'];
      DistConsumos[2].suma := DistConsumos[2].suma + IBQRepHojaCampo.FieldValues['consumo'];
      DistConsumos[2].cant := DistConsumos[2].cant + 1;
    end;
    if (IBQRepHojaCampo.FieldByName('peso_act').AsFloat >= 200) and (IBQRepHojaCampo.FieldByName('peso_act').AsFloat <= 249) then
    begin
      DistCabezas[3].suma := DistCabezas[3].suma + IBQRepHojaCampo.FieldValues['cantcab'];
      DistConsumos[3].suma := DistConsumos[3].suma + IBQRepHojaCampo.FieldValues['consumo'];
      DistConsumos[3].cant := DistConsumos[3].cant + 1;
    end;
    if (IBQRepHojaCampo.FieldByName('peso_act').AsFloat >= 250) and (IBQRepHojaCampo.FieldByName('peso_act').AsFloat <= 299) then
    begin
      DistCabezas[4].suma := DistCabezas[4].suma + IBQRepHojaCampo.FieldValues['cantcab'];
      DistConsumos[4].suma := DistConsumos[4].suma + IBQRepHojaCampo.FieldValues['consumo'];
      DistConsumos[4].cant := DistConsumos[4].cant + 1;
    end;
    if (IBQRepHojaCampo.FieldByName('peso_act').AsFloat >= 300) and (IBQRepHojaCampo.FieldByName('peso_act').AsFloat <= 349) then
    begin
      DistCabezas[5].suma := DistCabezas[5].suma + IBQRepHojaCampo.FieldValues['cantcab'];
      DistConsumos[5].suma := DistConsumos[5].suma + IBQRepHojaCampo.FieldValues['consumo'];
      DistConsumos[5].cant := DistConsumos[5].cant + 1;
    end;
    if (IBQRepHojaCampo.FieldByName('peso_act').AsFloat >= 350) and (IBQRepHojaCampo.FieldByName('peso_act').AsFloat <= 399) then
    begin
      DistCabezas[6].suma := DistCabezas[6].suma + IBQRepHojaCampo.FieldValues['cantcab'];
      DistConsumos[6].suma := DistConsumos[6].suma + IBQRepHojaCampo.FieldValues['consumo'];
      DistConsumos[6].cant := DistConsumos[6].cant + 1;
    end;
    if (IBQRepHojaCampo.FieldByName('peso_act').AsFloat >= 400) and (IBQRepHojaCampo.FieldByName('peso_act').AsFloat <= 449) then
    begin
      DistCabezas[7].suma := DistCabezas[7].suma + IBQRepHojaCampo.FieldValues['cantcab'];
      DistConsumos[7].suma := DistConsumos[7].suma + IBQRepHojaCampo.FieldValues['consumo'];
      DistConsumos[7].cant := DistConsumos[7].cant + 1;
    end;
    if (IBQRepHojaCampo.FieldByName('peso_act').AsFloat >= 450) and (IBQRepHojaCampo.FieldByName('peso_act').AsFloat <= 499) then
    begin
      DistCabezas[8].suma := DistCabezas[8].suma + IBQRepHojaCampo.FieldValues['cantcab'];
      DistConsumos[8].suma := DistConsumos[8].suma + IBQRepHojaCampo.FieldValues['consumo'];
      DistConsumos[8].cant := DistConsumos[8].cant + 1;
    end;
    if (IBQRepHojaCampo.FieldByName('peso_act').AsFloat >= 500) and (IBQRepHojaCampo.FieldByName('peso_act').AsFloat <= 549) then
    begin
      DistCabezas[9].suma := DistCabezas[9].suma + IBQRepHojaCampo.FieldValues['cantcab'];
      DistConsumos[9].suma := DistConsumos[9].suma + IBQRepHojaCampo.FieldValues['consumo'];
      DistConsumos[9].cant := DistConsumos[9].cant + 1;
    end;
    if (IBQRepHojaCampo.FieldByName('peso_act').AsFloat >= 550) and (IBQRepHojaCampo.FieldByName('peso_act').AsFloat <= 599) then
    begin
      DistCabezas[10].suma := DistCabezas[10].suma + IBQRepHojaCampo.FieldValues['cantcab'];
      DistConsumos[10].suma := DistConsumos[10].suma + IBQRepHojaCampo.FieldValues['consumo'];
      DistConsumos[10].cant := DistConsumos[10].cant + 1;
    end;
    IBQRepHojaCampo.Next;
  end;
  IBQRepHojaCampo.First;
end;

procedure TFRepHojaDeCampo.FormCreate(Sender: TObject);
begin
  inherited;
  desde := IncYear(Date(),-1);
  hasta := Date();
  DTPDesde.Date := desde;
  DTPHasta.Date := hasta;
end;

procedure TFRepHojaDeCampo.FormShow(Sender: TObject);
begin
  inherited;
  LTitulo.Caption := 'Hoja de Campo';
  //ActConsulta;
end;

procedure TFRepHojaDeCampo.DTPDesdeChange(Sender: TObject);
begin
  inherited;
  desde := DTPDesde.Date;
  //ActConsulta;
end;

procedure TFRepHojaDeCampo.DTPHastaChange(Sender: TObject);
begin
  inherited;
  hasta := DTPHasta.Date;
  //ActConsulta;
end;

procedure TFRepHojaDeCampo.IPreviewClick(Sender: TObject);
var
  F : TFRepHojaDeCampoPreview;
  i : Integer;
begin
  inherited;
  F := TFRepHojaDeCampoPreview.Create(self);
  F.QRLPeriodo.Caption := 'Desde el ' +DateToStr(desde)+' a el '+DateToStr(hasta);
  F.QRLCabIn.Caption := IntToStr(CantIn)+' cabezas ingresadas';
  F.QRLCabV.Caption := IntToStr(CantV)+' cabezas vendidas';
  F.QRLCabM.Caption := IntToStr(CantM)+' muertes';
  F.QRLCabAct.Caption := IntToStr(CantIn-CantM-CantV)+' cabezas actuales';
  F.QRLPorcP.Caption := FormatFloat('#0.00',(CantM*100)/CantIn)+'% de mortandad';
  for i := 1 to 10 do
  begin
    case i of
     1 : begin
          if DistCabezas[i].suma > 0 then
            F.c1.Caption := FormatFloat('#####',DistCabezas[i].suma);
          if DistConsumos[i].cant > 0 then
            F.f1.Caption := FormatFloat('#0.00',DistConsumos[i].suma/DistConsumos[i].cant);
         end;
     2 : begin
          if DistCabezas[i].suma > 0 then
            F.c2.Caption := FormatFloat('#####',DistCabezas[i].suma);
          if DistConsumos[i].cant > 0 then
            F.f2.Caption := FormatFloat('#0.00',DistConsumos[i].suma/DistConsumos[i].cant);
         end;
     3 : begin
          if DistCabezas[i].suma > 0 then
            F.c3.Caption := FormatFloat('#####',DistCabezas[i].suma);
          if DistConsumos[i].cant > 0 then
            F.f3.Caption := FormatFloat('#0.00',DistConsumos[i].suma/DistConsumos[i].cant);
         end;
     4 : begin
          if DistCabezas[i].suma > 0 then
            F.c4.Caption := FormatFloat('#####',DistCabezas[i].suma);
          if DistConsumos[i].cant > 0 then
            F.f4.Caption := FormatFloat('#0.00',DistConsumos[i].suma/DistConsumos[i].cant);
         end;
     5 : begin
          if DistCabezas[i].suma > 0 then
            F.c5.Caption := FormatFloat('#####',DistCabezas[i].suma);
          if DistConsumos[i].cant > 0 then
            F.f5.Caption := FormatFloat('#0.00',DistConsumos[i].suma/DistConsumos[i].cant);
         end;
     6 : begin
          if DistCabezas[i].suma > 0 then
            F.c6.Caption := FormatFloat('#####',DistCabezas[i].suma);
          if DistConsumos[i].cant > 0 then
            F.f6.Caption := FormatFloat('#0.00',DistConsumos[i].suma/DistConsumos[i].cant);
         end;
     7 : begin
          if DistCabezas[i].suma > 0 then
            F.c7.Caption := FormatFloat('#####',DistCabezas[i].suma);
          if DistConsumos[i].cant > 0 then
            F.f7.Caption := FormatFloat('#0.00',DistConsumos[i].suma/DistConsumos[i].cant);
         end;
     8 : begin
          if DistCabezas[i].suma > 0 then
            F.c8.Caption := FormatFloat('#####',DistCabezas[i].suma);
          if DistConsumos[i].cant > 0 then
            F.f8.Caption := FormatFloat('#0.00',DistConsumos[i].suma/DistConsumos[i].cant);
         end;
     9 : begin
          if DistCabezas[i].suma > 0 then
            F.c9.Caption := FormatFloat('#####',DistCabezas[i].suma);
          if DistConsumos[i].cant > 0 then
            F.f9.Caption := FormatFloat('#0.00',DistConsumos[i].suma/DistConsumos[i].cant);
         end;
     10 : begin
          if DistCabezas[i].suma > 0 then
            F.c10.Caption := FormatFloat('#####',DistCabezas[i].suma);
          if DistConsumos[i].cant > 0 then
            F.f10.Caption := FormatFloat('#0.00',DistConsumos[i].suma/DistConsumos[i].cant);
         end;
    end;
  end;
  F.ShowModal;
  F.Destroy;
end;

procedure TFRepHojaDeCampo.ICancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFRepHojaDeCampo.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

procedure TFRepHojaDeCampo.BConsultaClick(Sender: TObject);
begin
  inherited;
  ActConsulta;
end;

end.
