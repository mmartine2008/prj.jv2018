unit UREPInfoGralGestPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, QRCtrls, jpeg,
  QuickRpt, UPrincipal, QRExport, QRPDFFilt, IBQuery, ImgList,
  PngImageList, pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel,
  JvGIF;

type
  TFREPInfoGralGestPreview = class(TFUniversal)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRImage2: TQRImage;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    QRITact: TQRImage;
    QRIServ: TQRImage;
    QRIDist: TQRImage;
    QRShape2: TQRShape;
    QRLTipo: TQRLabel;
    QRBand4: TQRBand;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QuickRep2: TQuickRep;
    QRBand3: TQRBand;
    QRImage1: TQRImage;
    QRLabel3: TQRLabel;
    QRBand5: TQRBand;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel10: TQRLabel;
    QRBand6: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRCCRRep: TQRCompositeReport;
    QRICondVac: TQRImage;
    QRICondPre: TQRImage;
    QuickRep3: TQuickRep;
    QRBand7: TQRBand;
    QRImage3: TQRImage;
    QRLabel61: TQRLabel;
    QRBand8: TQRBand;
    QRShape7: TQRShape;
    QRLabel65: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel66: TQRLabel;
    Grupo: TQRLabel;
    QRBand33: TQRBand;
    QRBTabList: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLTitulo: TQRLabel;
    QRLFecha: TQRLabel;
    Fecha: TQRLabel;
    QRLFiltro: TQRLabel;
    TipoF: TQRLabel;
    Filtro: TQRLabel;
    QRLabel1: TQRLabel;
    QRLTotal: TQRLabel;
    QRShape10: TQRShape;
    QRGroup: TQRGroup;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRShape8: TQRShape;
    QRLabel2: TQRLabel;
    QuickRep4: TQuickRep;
    QRBand9: TQRBand;
    QRImage4: TQRImage;
    QRLabel83: TQRLabel;
    QRBand10: TQRBand;
    QRShape11: TQRShape;
    QRLabel87: TQRLabel;
    QRSysData7: TQRSysData;
    QRLabel88: TQRLabel;
    QRBand11: TQRBand;
    QRLPorCronDent: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRICronVac: TQRImage;
    QRICronPre: TQRImage;
    QRIPorPrenCron: TQRImage;
    QRIPorPrenCond: TQRImage;
    QRLabel84: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel85: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel86: TQRLabel;
    QRLabel89: TQRLabel;
    QRShape15: TQRShape;
    QRLabel90: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    ChildBand1: TQRChildBand;
    QRMemo: TQRMemo;
    QRLabel81: TQRLabel;
    QRShape20: TQRShape;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLResBrucN: TQRLabel;
    QRLResBrucP: TQRLabel;
    QRLResBrucS: TQRLabel;
    QRLResBrucND: TQRLabel;
    QRLPorBrucN: TQRLabel;
    QRLPorBrucP: TQRLabel;
    QRLPorBrucS: TQRLabel;
    QRLPorBrucND: TQRLabel;
    QRShape21: TQRShape;
    QRLabel94: TQRLabel;
    QRLResTotal: TQRLabel;
    QRLPorTotal: TQRLabel;
    QRLabel95: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape1: TQRShape;
    QRSysData11: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLabel34: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRShape4: TQRShape;
    QRSysData1: TQRSysData;
    QRLEmpresa3: TQRLabel;
    QRLNombrePropietario3: TQRLabel;
    QRLRenglon4: TQRLabel;
    QRLRenglon3: TQRLabel;
    QRLEstablecimientos1: TQRLabel;
    QRImagenEmpresa3: TQRImage;
    QRLabel101: TQRLabel;
    QRLDatosAbajo3: TQRLabel;
    QRLDatosAbajo4: TQRLabel;
    QRShape9: TQRShape;
    QRSysData2: TQRSysData;
    QRLEmpresa7: TQRLabel;
    QRLNombrePropietario7: TQRLabel;
    QRLRenglon8: TQRLabel;
    QRLRenglon7: TQRLabel;
    QRLEstablecimientos3: TQRLabel;
    QRImagenEmpresa7: TQRImage;
    QRLabel102: TQRLabel;
    QRLDatosAbajo7: TQRLabel;
    QRLDatosAbajo8: TQRLabel;
    QRShape6: TQRShape;
    QRSysData4: TQRSysData;
    QRLEmpresa5: TQRLabel;
    QRLNombrePropietario5: TQRLabel;
    QRLRenglon6: TQRLabel;
    QRLRenglon5: TQRLabel;
    QRLEstablecimientos2: TQRLabel;
    QRImagenEmpresa5: TQRImage;
    QRLabel103: TQRLabel;
    QRLDatosAbajo5: TQRLabel;
    QRLDatosAbajo6: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLServicio: TQRLabel;
    QRLabel5: TQRLabel;
    TipoFc: TQRLabel;
    Filtroc: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRCCRRepAddReports(Sender: TObject);
    procedure QRLabePrint(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FormularioEC : TFUniversal;
    procedure cargarDatosPropietario();
  public
    Estab, Prop, RENS, Vet, DirVet, Tel, Mail, URL : String;
  published
    constructor Create(AOwner : TComponent; F : TFUniversal); reintroduce;
  end;

var
  FREPInfoGralGestPreview: TFREPInfoGralGestPreview;

implementation

uses UREPInfoGralGest, URepGeneral, UEducacionContinua,uTiposGlobales;

{$R *.dfm}

constructor TFREPInfoGralGestPreview.Create(AOwner : TComponent; F : TFUniversal);
begin
  inherited Create(AOwner);
  FormularioEC := F;
  if FormularioEC <> nil then
  begin
    QuickRep1.DataSet := (FormularioEC as TFEducacionContinua).IBQListado;
    QuickRep2.DataSet := (FormularioEC as TFEducacionContinua).IBQListado;
    QuickRep3.DataSet := (FormularioEC as TFEducacionContinua).IBQListado;
    QuickRep4.DataSet := (FormularioEC as TFEducacionContinua).IBQListado;
    QRDBText1.DataSet := (FormularioEC as TFEducacionContinua).IBQListado;
    QRDBText8.DataSet := (FormularioEC as TFEducacionContinua).IBQListado;
    QRDBText2.DataSet := (FormularioEC as TFEducacionContinua).IBQListado;
    QRDBText3.DataSet := (FormularioEC as TFEducacionContinua).IBQListado;
    QRDBText4.DataSet := (FormularioEC as TFEducacionContinua).IBQListado;
    QRDBText5.DataSet := (FormularioEC as TFEducacionContinua).IBQListado;
    QRDBText6.DataSet := (FormularioEC as TFEducacionContinua).IBQListado;
    QRDBText7.DataSet := (FormularioEC as TFEducacionContinua).IBQListado;

    QRLabel95.Enabled := false;
    QRIServ.Enabled := false;
    QRITact.Left := 136;
    QRITact.Top := 160;
    QRITact.Width := 505;
    QRITact.Height := 273;
  end;
end;

procedure TFREPInfoGralGestPreview.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  Dir : String;
begin
  inherited;

  QRImage1.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage3.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage4.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  if FormularioEC <> nil then
  begin
    QRLEstablecimientos.Caption := Estab;
    QRLEstablecimientos1.Caption := Estab;
    QRLEstablecimientos2.Caption := Estab;
    QRLEstablecimientos3.Caption := Estab;
    QRLRenglon1.Caption := Vet;
    QRLRenglon2.Caption := Prop+ ' ' + RENS;
    QRLRenglon4.Caption := Vet;
    QRLRenglon3.Caption := Prop+ ' ' + RENS;
    QRLRenglon6.Caption := Vet;
    QRLRenglon5.Caption := Prop+ ' ' + RENS;
    QRLRenglon8.Caption := Vet;
    QRLRenglon7.Caption := Prop+ ' ' + RENS;
  end
  else
  begin
    QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
    QRLEstablecimientos1.Caption := FPrincipal.NombreEstablecimiento;
    QRLEstablecimientos2.Caption := FPrincipal.NombreEstablecimiento;
    QRLEstablecimientos3.Caption := FPrincipal.NombreEstablecimiento;
     if (FPrincipal.TipoVersion = TVveterinario) then
      begin
        QRLRenglon1.Enabled := true;
        QRLRenglon2.Enabled := true;
        QRLRenglon3.Enabled := true;
        QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
        QRLRenglon2.Caption := FPrincipal.Renspa;
        QRLRenglon4.Caption := FPrincipal.NombreVeterinario;
        QRLRenglon3.Caption := FPrincipal.Renspa;
        QRLRenglon6.Caption := FPrincipal.NombreVeterinario;
        QRLRenglon5.Caption := FPrincipal.Renspa;
        QRLRenglon8.Caption := FPrincipal.NombreVeterinario;
        QRLRenglon7.Caption := FPrincipal.Renspa;
      end
    else
      begin
        QRLRenglon1.Enabled := true;
        QRLRenglon2.Enabled := true;
        QRLRenglon3.Enabled := true;
        QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
        QRLRenglon2.Caption := FPrincipal.Renspa;
        QRLRenglon4.Caption := FPrincipal.NombreVeterinario;
        QRLRenglon3.Caption := FPrincipal.Renspa;
        QRLRenglon6.Caption := FPrincipal.NombreVeterinario;
        QRLRenglon5.Caption := FPrincipal.Renspa;
        QRLRenglon8.Caption := FPrincipal.NombreVeterinario;
        QRLRenglon7.Caption := FPrincipal.Renspa;
      end;
  end;
  Dir := ExtractFilePath(Application.ExeName);
  QRITact.Picture.LoadFromFile(Dir+'Tact.wmf');
  QRIServ.Picture.LoadFromFile(Dir+'Serv.wmf');
  QRIDist.Picture.LoadFromFile(Dir+'Dist.wmf');
  QRICondPre.Picture.LoadFromFile(Dir+'ConPren.wmf');
  QRICondVac.Picture.LoadFromFile(Dir+'ConVac.wmf');
  QRICronPre.Picture.LoadFromFile(Dir+'CronPren.wmf');
  QRICronVac.Picture.LoadFromFile(Dir+'CronVac.wmf');
  QRIPorPrenCond.Picture.LoadFromFile(Dir+'PorPrenCond.wmf');
  QRIPorPrenCron.Picture.LoadFromFile(Dir+'PorPrenCron.wmf');

  cargarDatosPropietario();
end;

procedure TFREPInfoGralGestPreview.QRCCRRepAddReports(Sender: TObject);
begin
  inherited;
  QRCCRRep.Reports.Clear;
  QRCCRRep.Reports.Add(QuickRep1);
  QRCCRRep.Reports.Add(QuickRep2);
  QRCCRRep.Reports.Add(QuickRep4);
  QRCCRRep.Reports.Add(QuickRep3);
end;

procedure TFREPInfoGralGestPreview.QRLabePrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value+'%';
end;

procedure TFREPInfoGralGestPreview.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  inherited;
  QRDBText6.Font.Color:= clWindowText;
  QRDBText6.Font.Style:= [];  
  if (Value = 'POSITIVO') then
     begin
      QRDBText6.Font.Color:= clRed;
      QRDBText6.Font.Style:= [fsBold];
     end
   else
      if (Value = 'SOSPECHOSO') then
        begin
         QRDBText6.Font.Color:= clRed;
         QRDBText6.Font.Style:= [];
        end;
end;

procedure TFREPInfoGralGestPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRCCRRep.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPInfoGralGestPreview.cargarDatosPropietario;
var
  repGeneral : TFRepGeneral;
begin

  QRLNombrePropietario.Caption:= '';
  QRLEmpresa.Caption:= '';
  QRLDatosAbajo.Caption:= '';
  QRLDatosAbajo2.Caption:= '';
  if FormularioEC <> nil then
  begin
    if (Trim(DirVet) <> '') then
      QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + DirVet + ' - ';

    if (Trim(Tel) <> '') then
      QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + Tel + ' - ';

    if (Trim(Mail) <> '') then
      QRLDatosAbajo2.Caption:= QRLDatosAbajo2.Caption + Mail + ' - ';

    if (Trim(URL) <> '') then
      QRLDatosAbajo2.Caption:= QRLDatosAbajo2.Caption + URL + ' - ';

    {if (Trim(Vet) <> '') then
      QRLEmpresa.Caption := Vet;}
  end
  else
  begin
    repGeneral := TFRepGeneral.Create(self);
    repGeneral.retDatosPropietario();

    QRLNombrePropietario.Caption:= repGeneral.getNombrePropietario;
    QRLEmpresa.Caption:= repGeneral.getEmpresaPropietario;

    if (Trim(repGeneral.getNombrePropietario) <> '') then
      begin
        QRLRenglon1.Enabled:= false;
        QRLNombrePropietario.Enabled:= true;

        QRLRenglon4.Enabled:= false;
        QRLNombrePropietario3.Enabled:= true;
        QRLRenglon8.Enabled:= false;
        QRLNombrePropietario7.Enabled:= true;
        QRLRenglon6.Enabled:= false;
        QRLNombrePropietario5.Enabled:= true;
      end
     else
       begin
         QRLRenglon1.Enabled:= true;
         QRLNombrePropietario.Enabled:= false;

         QRLRenglon4.Enabled:= true;
         QRLNombrePropietario3.Enabled:= false;
         QRLRenglon8.Enabled:= true;
         QRLNombrePropietario7.Enabled:= false;
         QRLRenglon6.Enabled:= true;
         QRLNombrePropietario5.Enabled:= false;
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
        // QRLImagenEmpresa12.Picture.LoadFromFile(repGeneral.getPathImage);
         QRImagenEmpresa3.Picture.LoadFromFile(repGeneral.getPathImage);
         QRImagenEmpresa7.Picture.LoadFromFile(repGeneral.getPathImage);
         QRImagenEmpresa5.Picture.LoadFromFile(repGeneral.getPathImage);
      end;

    repGeneral.Destroy;
  end;

  QRLNombrePropietario3.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa3.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo3.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo4.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario7.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa7.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo7.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo8.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario5.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa5.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo5.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo6.Caption:= QRLDatosAbajo2.Caption;
end;

end.
