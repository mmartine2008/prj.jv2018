unit URepResumenTratamientoPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QRCtrls, jpeg, QuickRpt, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  StdCtrls, ExtCtrls, IBQuery, QRPDFFilt, QRExport, QRPrntr, ImgList,
  PngImageList, pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel,
  JvGIF;

type
  TFRepResumenTratamientoPreview = class(TFUniversal)
    QRResumenTratamiento: TQuickRep;
    QRBColumnHeaderPlanilla: TQRGroup;
    QRLRodeoPotrero: TQRLabel;
    QRSColumnHeaderPlanilla: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRBDetailPlanilla: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBGFgrilla: TQRBand;
    QRBand5: TQRBand;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    QRLabel4: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRLRenglon2: TQRLabel;
    QRBand3: TQRBand;
    QRLDesde: TQRLabel;
    QRLDesdeValue: TQRLabel;
    QRBand4: TQRBand;
    QRDBText12: TQRDBText;
    QRLHasta: TQRLabel;
    QRLHastaValue: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel18: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLEmpresa: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLDatosAbajo2: TQRLabel;
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel5Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRLabel17Print(sender: TObject; var Value: String);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QRLabel20Print(sender: TObject; var Value: String);
    procedure QRLabel21Print(sender: TObject; var Value: String);
    procedure QRLabel22Print(sender: TObject; var Value: String);
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure QRLabel18Print(sender: TObject; var Value: String);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    cantTerneros, cantNovillos, cantToros, cantTerneras, cantVaquillonas, cantVacas: Integer;
    procedure cambiarCero(var Value: String);
    procedure cargarDatosPropietario();
  public
    { Public declarations }
  end;

var
  FRepResumenTratamientoPreview: TFRepResumenTratamientoPreview;

implementation

uses UPrincipal,uTiposGlobales, URepResumenTratamiento, URepGeneral;
{$R *.dfm}

procedure TFRepResumenTratamientoPreview.QRBEncabezadoPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
    end;

  cargarDatosPropietario();    
end;

procedure TFRepResumenTratamientoPreview.QRLabel5Print(sender: TObject;
  var Value: String);
begin
  inherited;

  QRDBText5.DataSet := QRResumenTratamiento.DataSet;
  QRDBText6.DataSet := QRResumenTratamiento.DataSet;
  QRDBText7.DataSet := QRResumenTratamiento.DataSet;
  QRDBText8.DataSet := QRResumenTratamiento.DataSet;
  QRDBText3.DataSet := QRResumenTratamiento.DataSet;
  QRDBText9.DataSet := QRResumenTratamiento.DataSet;

  value:= IntToStr(StrToInt(QRDBText5.DataSet.FieldByName('TERNEROS').AsString) +
                   StrToInt(QRDBText6.DataSet.FieldByName('NOVILLOS').AsString) +
                   StrToInt(QRDBText7.DataSet.FieldByName('TOROS').AsString) +
                   StrToInt(QRDBText8.DataSet.FieldByName('TERNERAS').AsString) +
                   StrToInt(QRDBText3.DataSet.FieldByName('VAQUILLONAS').AsString) +
                   StrToInt(QRDBText9.DataSet.FieldByName('VACAS').AsString));    
  //FRepResumenTratamiento.IBQResumenTratamiento.fieldbyname('terneras').AsString;

end;

procedure TFRepResumenTratamientoPreview.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if Value <> '0' then
  begin
    cantTerneros:= cantTerneros + StrToInt(Value);
  end
  else
  begin
    cambiarCero(Value);
  end;
end;

procedure TFRepResumenTratamientoPreview.cambiarCero(var Value: String);
begin
  if (Value = '0') then
    Value := '-';
end;

procedure TFRepResumenTratamientoPreview.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  inherited;
  cantNovillos:= cantNovillos + StrToInt(Value);
  cambiarCero(Value);
end;

procedure TFRepResumenTratamientoPreview.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  inherited;
  cantToros:= cantToros + StrToInt(Value);
  cambiarCero(Value);
end;

procedure TFRepResumenTratamientoPreview.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  inherited;
  cantTerneras:= cantTerneras + StrToInt(Value);
  cambiarCero(Value);
end;

procedure TFRepResumenTratamientoPreview.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  inherited;
  cantVaquillonas:= cantVaquillonas + StrToInt(Value);
  cambiarCero(Value);
end;

procedure TFRepResumenTratamientoPreview.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  inherited;
  cantVacas:= cantVacas + StrToInt(Value);
  cambiarCero(Value);
end;

procedure TFRepResumenTratamientoPreview.QRLabel17Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value:= IntToStr(cantTerneros);
end;

procedure TFRepResumenTratamientoPreview.QRLabel19Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value:= IntToStr(cantNovillos);
end;

procedure TFRepResumenTratamientoPreview.QRLabel20Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value:= IntToStr(cantToros);
end;

procedure TFRepResumenTratamientoPreview.QRLabel21Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value:= IntToStr(cantTerneras);
end;

procedure TFRepResumenTratamientoPreview.QRLabel22Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value:= IntToStr(cantVaquillonas);
end;

procedure TFRepResumenTratamientoPreview.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value:= IntToStr(cantVacas);
end;

procedure TFRepResumenTratamientoPreview.QRLabel18Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value:= IntToStr(cantTerneros + cantNovillos + cantToros + cantTerneras + cantVaquillonas + cantVacas);
end;

procedure TFRepResumenTratamientoPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRResumenTratamiento.PrevInitialZoom:= qrZoomOther;
  QRResumenTratamiento.PrevInitialZoom:= qrZoomToWidth;
  QRResumenTratamiento.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFRepResumenTratamientoPreview.cargarDatosPropietario;
var
  repGeneral : TFRepGeneral;
begin
  repGeneral := TFRepGeneral.Create(self);
  repGeneral.retDatosPropietario();
  QRLNombrePropietario.Caption:= '';
  QRLEmpresa.Caption:= '';
  QRLDatosAbajo.Caption:= '';
  QRLDatosAbajo2.Caption:= '';

  QRLNombrePropietario.Caption:= repGeneral.getNombrePropietario;
  QRLEmpresa.Caption:= repGeneral.getEmpresaPropietario;

  if (Trim(repGeneral.getNombrePropietario) <> '') then
    begin
      QRLRenglon1.Enabled:= false;
      QRLNombrePropietario.Enabled:= true;
    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;
     end;

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
    begin
       QRImagenEmpresa.Picture.LoadFromFile(repGeneral.getPathImage);
    end;

  repGeneral.Destroy;
end;

procedure TFRepResumenTratamientoPreview.FormCreate(Sender: TObject);
begin
  inherited;
  cantTerneros:= 0;
  cantNovillos:= 0;
  cantToros:= 0;
  cantTerneras:= 0;
  cantVaquillonas:= 0;
  cantVacas:= 0;
end;

end.
