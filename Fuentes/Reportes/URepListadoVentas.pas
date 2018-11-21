unit URepListadoVentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, QuickRpt, QRCtrls, jpeg,
  QRExport, QRPDFFilt, QRPrntr, pngimage, JvExExtCtrls, JvImage;

type
  TFListadoVentas = class(TFUniversal)
    QRListadoVentas: TQuickRep;
    IBQListadoVentas: TIBQuery;
    QRBand3: TQRBand;
    QRImage2: TQRImage;
    QRLabel75: TQRLabel;
    QRShape62: TQRShape;
    QRSysData3: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRBand5: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    IBQListadoVentasID_ANIMAL: TIntegerField;
    IBQListadoVentasRP_TORO: TIBStringField;
    IBQListadoVentasNOMBRE_TORO: TIBStringField;
    IBQListadoVentasAPODO_TORO: TIBStringField;
    IBQListadoVentasDOSIS: TIntegerField;
    IBQListadoVentasPRECIO: TIBBCDField;
    IBQListadoVentasPRECIO_TOTAL: TIBBCDField;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRShape1: TQRShape;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
  private
    { Private declarations }
    procedure cargarDatosPropietario;
  public
    { Public declarations }
    sqlConsulta : string;
    desde, hasta : TDate;
  end;

var
  FListadoVentas: TFListadoVentas;

implementation

uses UPrincipal,uTiposGlobales, URepGeneral;

{$R *.dfm}

procedure TFListadoVentas.cargarDatosPropietario;
var repGeneral : TFRepGeneral;
begin

  repGeneral := TFRepGeneral.Create(self);
  repGeneral.retDatosPropietario();
  QRLNombrePropietario.Caption:= '';
  QRLEmpresa.Caption:= '';
  QRLDatosAbajo.Caption:= '';
  QRLDatosAbajo2.Caption:= '';

  QRLNombrePropietario.Caption:= repGeneral.getNombrePropietario;
  QRLEmpresa.Caption:= repGeneral.getEmpresaPropietario;

  if (Trim(repGeneral.getDireccionPropietario) <> '') then
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + repGeneral.getDireccionPropietario + ' - ';

  if (Trim(repGeneral.getTelefonoPropietario) <> '') then
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + repGeneral.getTelefonoPropietario + ' - ';

  if (Trim(repGeneral.getCelularPropietario) <> '') then
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + repGeneral.getCelularPropietario + ' - ';

  if (Trim(repGeneral.getEmailPropietario) <> '') then
    QRLDatosAbajo2.Caption:= QRLDatosAbajo2.Caption + repGeneral.getEmailPropietario + ' - ';

  if (Trim(repGeneral.getUrlPropietario) <> '') then
    QRLDatosAbajo2.Caption:= QRLDatosAbajo2.Caption + repGeneral.getUrlPropietario + ' - ';

  if (FileExists(repGeneral.getPathImage)) then
    QRImagenEmpresa.Picture.LoadFromFile(repGeneral.getPathImage);

  repGeneral.Destroy;
end;


procedure TFListadoVentas.FormCreate(Sender: TObject);
//var sql1, sql2, sql3, sqlGral : string;
begin
  inherited;
{
  sql1 := 'select * from rep_listado_ventas(:desde,:hasta,:establecimiento)'
  sql2 := ' where id_animal in (' + sqlConsulta + ')';
  sql3 := ' order by dosis desc';

  sqlGral := sql1 + sql2 + sql3;

  IBQListadoVentas.Close;
  IBQListadoVentas.SQL.Clear;
  IBQListadoVentas.SQL.Add(sqlGral);
  IBQListadoVentas.ParamByName('desde').AsDate := desde;
  IBQListadoVentas.ParamByName('hasta').AsDate := hasta;
  IBQListadoVentas.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQListadoVentas.Open;
}
end;

procedure TFListadoVentas.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;

  QRListadoVentas.PrevInitialZoom:= qrZoomOther;
  QRListadoVentas.PrevInitialZoom:= qrZoomToWidth;
  QRListadoVentas.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);


end;

procedure TFListadoVentas.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;

  if (FPrincipal.TipoVersion = TVveterinario) then
  begin
      QRLRenglon2.Enabled := true;
      QRLRenglon2.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
  end
  else
  begin
      QRLRenglon2.Enabled := true;
      QRLRenglon2.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
  end;
  cargarDatosPropietario;
end;

procedure TFListadoVentas.QRExpr1Print(sender: TObject; var Value: String);
begin
  inherited;
  Value := Value + ' dosis';
end;

procedure TFListadoVentas.QRExpr2Print(sender: TObject; var Value: String);
begin
  inherited;
  Value := '$' + Value;
end;

end.
