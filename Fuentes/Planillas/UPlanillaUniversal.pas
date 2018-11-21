unit UPlanillaUniversal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, QRCtrls, jpeg,
  QuickRpt, IBQuery, ImgList, PngImageList, JvExControls, JvLabel, JvGIF,
  pngimage, JvExExtCtrls, JvImage;

type
  TFPlanillaUniversal = class(TFUniversal)
    QRPlanillaUniversal: TQuickRep;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage: TQRImage;
    QRLTituloPlanilla: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRLRenglon1: TQRLabel;
    Separador4: TQRShape;
    QRSysData3: TQRSysData;
    Separador3: TQRShape;
    QRLRenglon2: TQRLabel;
    QRBDatos: TQRBand;
    QRLValores: TQRLabel;
    QRMObservacion: TQRMemo;
    QRSTitlePlanilla3: TQRShape;
    QRSTitlePlanilla2: TQRShape;
    QRSTitlePlanilla4: TQRShape;
    QRLabel5: TQRLabel;
    CantRPS1: TQRLabel;
    QRBand4: TQRBand;
    QRSSumaryPlanilla: TQRShape;
    QRLabel4: TQRLabel;
    QRSDPagePlanilla: TQRSysData;
    QRLPagPlanilla: TQRLabel;
    IBQHeaders: TIBQuery;
    IBQAnimales: TIBQuery;
    procedure QRPlanillaUniversalBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure IBQAnimalesAfterOpen(DataSet: TDataSet);
    procedure QRPlanillaUniversalAfterPreview(Sender: TObject);
    procedure QRLNroPagPrint(sender: TObject; var Value: String);
  private
    Fila : Integer;
    procedure GenerarValoresComunes();
  public
    CantAnimalesPlanilla : Integer;
    procedure ConfigurarReporte(); virtual;
  protected
    Evento : integer;
    ConAnimales : Boolean;
  published
    constructor Create(Owner : TComponent; TipoEvento : Integer; AnimalesExistentes : Boolean); reintroduce;
  end;

var
  FPlanillaUniversal: TFPlanillaUniversal;

implementation

uses UPrincipal,uTiposGlobales, URepGeneral;

{$R *.dfm}

procedure TFPlanillaUniversal.QRPlanillaUniversalBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  repGeneral : TFRepGeneral;
begin
  inherited;
  repGeneral := TFRepGeneral.Create(self);
  repGeneral.retDatosPropietario();

  QRImage.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      if (Trim(repGeneral.getNombrePropietario) <> '') then
         QRLRenglon1.Caption := repGeneral.getNombrePropietario
       else
         QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
         
      QRLRenglon2.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      if (Trim(repGeneral.getNombrePropietario) <> '') then
         QRLRenglon1.Caption := repGeneral.getNombrePropietario
       else
         QRLRenglon1.Caption := FPrincipal.NombrePropietario;

      QRLRenglon2.Caption := FPrincipal.Renspa;
    end;

  repGeneral.Destroy;
end;

procedure TFPlanillaUniversal.GenerarValoresComunes();
var auxTop : integer;
begin
  IBQHeaders.Close;
  IBQHeaders.ParamByName('evento').AsInteger := Evento;
  IBQHeaders.Open;
  IBQHeaders.First;
  auxTop := 128;
  while not(IBQHeaders.Eof) do
    begin
      with  (TQRLabel (QRBDatos.AddPrintable(TQRLabel))) do
        begin
          Left := 25;
          Top := auxTop;
          Height := 20;
          autoSize := true;
          Caption := IBQHeaders.fieldByName('titulo').AsString+': ';
          alignment := taLeftJustify;
        end;
      IBQHeaders.Next;
      if not(IBQHeaders.Eof) then
        begin
          QRBDatos.Height := QRBDatos.Height + 20;
          QRSTitlePlanilla4.Top := QRSTitlePlanilla4.Top + 20;
        end;
      auxTop := auxTop + 20;
    end;
end;

constructor TFPlanillaUniversal.Create(Owner: TComponent; TipoEvento : Integer; AnimalesExistentes : Boolean);
begin
  inherited Create(Owner);
  Evento :=  TipoEvento;
  GenerarValoresComunes();
  ConAnimales := AnimalesExistentes;
  Fila := 1;
end;

procedure TFPlanillaUniversal.ConfigurarReporte;
begin
end;

procedure TFPlanillaUniversal.IBQAnimalesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
  CantRPS1.Caption := IntToStr(DataSet.RecordCount);
end;

procedure TFPlanillaUniversal.QRPlanillaUniversalAfterPreview(
  Sender: TObject);
begin
  inherited;
 { try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    Fprincipal.IBTPrincipal.RollbackRetaining;
  end;   }
end;

procedure TFPlanillaUniversal.QRLNroPagPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if Fila >= CantAnimalesPlanilla then
    Fila := 1;
  Value := IntToStr(Fila);
  Inc(Fila);
end;

end.
