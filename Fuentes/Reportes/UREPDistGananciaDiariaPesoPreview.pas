unit UREPDistGananciaDiariaPesoPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, QuickRpt, QRCtrls,
  jpeg, UPrincipal, IBQuery, QRPDFFilt, QRWebFilt, QRExport, ImgList,
  PngImageList, pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel,
  JvGIF;

type
  TFREPDistGananciaDiariaPesoPreview = class(TFUniversal)
    QRDistGananciaDiaria: TQuickRep;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    LabelTitulo: TQRLabel;
    QRShape6: TQRShape;
    IBQDatosGciaDiaria: TIBQuery;
    QRBand1: TQRBand;
    QRBand5: TQRBand;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand4: TQRBand;
    QRLDesde: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLHasta: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand3: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel16: TQRLabel;
    QRHTMLFilter1: TQRHTMLFilter;
    QRDBText1: TQRDBText;
    QRLCategoria: TQRLabel;
    QRLGrupo: TQRLabel;
    QRLCategSel: TQRLabel;
    QRLGrupoSel: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    IBQDatosGciaDiariaINCREMENTO: TIBStringField;
    IBQDatosGciaDiariaCANTIDAD: TIntegerField;
    IBQDatosGciaDiariaPORCENTAJE: TIBBCDField;
    IBQDatosGciaDiariaPORCENTAJE_ACUMULADO: TIBBCDField;
    IBQDatosGciaDiariaEDAD_MEDIA: TIBBCDField;
    IBQDatosGciaDiariaEDAD_MINIMA: TIntegerField;
    IBQDatosGciaDiariaEDAD_MAXIMA: TIntegerField;
    QRShape16: TQRShape;
    QRSysData1: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLabel17: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    procedure QRDistGananciaDiariaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormShow(Sender: TObject);
  private
    procedure cargarDatosPropietario();  
  public
    FechaInic, FechaFin : TDate;
    Categoria, Grupo : String;
    Cat, Grup : Boolean;
  end;

var
  FREPDistGananciaDiariaPesoPreview: TFREPDistGananciaDiariaPesoPreview;

implementation

uses
  UREPDistGananciaDiariaPeso, URepGeneral,UTiposGlobales;
{$R *.dfm}

procedure TFREPDistGananciaDiariaPesoPreview.QRDistGananciaDiariaBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
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

  QRLDesde.Caption := DateToStr(FechaInic);
  QRLHasta.Caption := DateToStr(FechaFin);

  if Cat then
  begin
    QRLCategoria.Enabled := true;
    QRLCategSel.Enabled := true;
    QRLCategSel.Caption := Categoria;
  end;

  if Grup then
  begin
    QRLGrupo.Enabled := true;
    QRLGrupoSel.Enabled := true;
    QRLGrupoSel.Caption := Grupo;
  end;

  IBQDatosGciaDiaria.Active := false;
  IBQDatosGciaDiaria.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatosGciaDiaria.ParamByName('fechaInic').AsDate := FechaInic;
  IBQDatosGciaDiaria.ParamByName('fechaFin').AsDate := FechaFin;
  IBQDatosGciaDiaria.Active := true;

  cargarDatosPropietario();
end;

procedure TFREPDistGananciaDiariaPesoPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRDistGananciaDiaria.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPDistGananciaDiariaPesoPreview.cargarDatosPropietario;
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

end.
