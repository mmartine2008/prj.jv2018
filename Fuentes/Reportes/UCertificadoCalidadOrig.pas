unit UCertificadoCalidadOrig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, QRCtrls, jpeg, QuickRpt,
  pngimage, JvExExtCtrls, JvImage;

type
  TFCertificadoCalidadOrig = class(TFUniversal)
    QRDetalle: TQuickRep;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    QRLTituloPlanilla: TQRLabel;
    QRShape4: TQRShape;
    QRSysData1: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRBand5: TQRBand;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLApodoValue: TQRLabel;
    QRLRazaValue: TQRLabel;
    QRLPartidaValue: TQRLabel;
    QRLabel5: TQRLabel;
    QRLFechaExt: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLPartidaDos: TQRLabel;
    QRLPorcDescCero: TQRLabel;
    QRLabel11: TQRLabel;
    QRLVigorCero: TQRLabel;
    QRLabel13: TQRLabel;
    QRLPartidaTres: TQRLabel;
    QRLPorcDescDos: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLVigorDos: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLPartidaCuatro: TQRLabel;
    QRLE27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape7: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLMetodoExtraccion: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLNroExtraccion: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLVolumenValue: TQRLabel;
    QRLabel38: TQRLabel;
    QRLConcentracionValue: TQRLabel;
    QRLabel40: TQRLabel;
    QRLColorValue: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLVigorValue: TQRLabel;
    QRLabel45: TQRLabel;
    QRLPajuelasProducidas: TQRLabel;
    QRLDilucion: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLEspermasPorPajuela: TQRLabel;
    QRLabel52: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLFecha: TQRLabel;
    QRLHora: TQRLabel;
    IBQRepCertificadoCalidad: TIBQuery;
    QRLabel9: TQRLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure cargarDatosPropietario;

    procedure CargarDatosDetalle;
  public
    id_extraccion : integer;
    { Public declarations }
  end;

var
  FCertificadoCalidadOrig: TFCertificadoCalidadOrig;

implementation

uses UPrincipal,uTiposGlobales, URepGeneral;

{$R *.dfm}

procedure TFCertificadoCalidadOrig.cargarDatosPropietario;
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


procedure TFCertificadoCalidadOrig.FormShow(Sender: TObject);
var H : HWND;
begin
  inherited;

  cargarDatosPropietario;
  CargarDatosDetalle;
  
  QRDetalle.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);

end;

procedure TFCertificadoCalidadOrig.CargarDatosDetalle;
begin
    IBQRepCertificadoCalidad.Close;
    IBQRepCertificadoCalidad.ParamByName('id_extraccion').AsInteger := id_extraccion;
    IBQRepCertificadoCalidad.Open;

    if not(IBQRepCertificadoCalidad.IsEmpty) then
    begin

         if (IBQRepCertificadoCalidad.FieldValues['apodo_anim'] <> null) then
          QRLApodoValue.Caption := IBQRepCertificadoCalidad.FieldValues['apodo_anim']
         else
          QRLApodoValue.Caption := '';

         if (IBQRepCertificadoCalidad.FieldValues['raza_anim'] <> null) then
          QRLRazaValue.Caption := IBQRepCertificadoCalidad.FieldValues['raza_anim']
         else
          QRLRazaValue.Caption := '';


         if (IBQRepCertificadoCalidad.FieldValues['nro_ext'] <> null) then
          QRLNroExtraccion.Caption := IntToStr(IBQRepCertificadoCalidad.FieldValues['nro_ext'])
         else
          QRLNroExtraccion.Caption := '';

         if (IBQRepCertificadoCalidad.FieldValues['partida_ext'] <> null) then
         begin
            QRLPartidaValue.Caption := IBQRepCertificadoCalidad.FieldValues['partida_ext'];
            QRLPartidaDos.Caption := IBQRepCertificadoCalidad.FieldValues['partida_ext'];
            QRLPartidaTres.Caption := IBQRepCertificadoCalidad.FieldValues['partida_ext'];
            QRLPartidaCuatro.Caption := IBQRepCertificadoCalidad.FieldValues['partida_ext'];
         end
         else
         begin
            QRLPartidaValue.Caption := '';
            QRLPartidaDos.Caption := '';
            QRLPartidaTres.Caption := '';
            QRLPartidaCuatro.Caption := '';
         end;

         if (IBQRepCertificadoCalidad.FieldValues['fecha_ext'] <> null) then
         begin
          QRLFecha.Caption := DateToStr(IBQRepCertificadoCalidad.FieldValues['fecha_ext']);
          QRLFechaExt.Caption := DateToStr(IBQRepCertificadoCalidad.FieldValues['fecha_ext']);
         end
         else
         begin
          QRLFecha.Caption := '';
          QRLFechaExt.Caption := '';
         end;

         if (IBQRepCertificadoCalidad.FieldValues['hora_ext'] <> null) then
          QRLHora.Caption := TimeToStr(IBQRepCertificadoCalidad.FieldValues['hora_ext'])
         else
          QRLHora.Caption := '';

         if (IBQRepCertificadoCalidad.FieldValues['porc_desc_viv_cero'] <> null) then
          QRLPorcDescCero.Caption := FormatFloat('#,##0.00;(#,##0.00)',IBQRepCertificadoCalidad.FieldValues['porc_desc_viv_cero'])
         else
          QRLPorcDescCero.Caption := '';
//    FormatFloat('#,##0.00;(#,##0.00)',TotalDividido);
         if (IBQRepCertificadoCalidad.FieldValues['porc_desc_vig_cero'] <> null) then
          QRLVigorCero.Caption := IBQRepCertificadoCalidad.FieldValues['porc_desc_vig_cero']
         else
          QRLVigorCero.Caption := '';

         if (IBQRepCertificadoCalidad.FieldValues['porc_desc_viv_dos'] <> null) then
          QRLPorcDescDos.Caption := FormatFloat('#,##0.00;(#,##0.00)',IBQRepCertificadoCalidad.FieldValues['porc_desc_viv_dos'])
         else
          QRLPorcDescDos.Caption := '';

         if (IBQRepCertificadoCalidad.FieldValues['porc_desc_vig_dos'] <> null) then
          QRLVigorDos.Caption := IBQRepCertificadoCalidad.FieldValues['porc_desc_vig_dos']
         else
          QRLVigorDos.Caption := '';

         if (IBQRepCertificadoCalidad.FieldValues['e27'] <> null) then
          QRLE27.Caption := FormatFloat('#,##0.00;(#,##0.00)',IBQRepCertificadoCalidad.FieldValues['e27'])
         else
          QRLE27.Caption := '';

         if (IBQRepCertificadoCalidad.FieldValues['volumen'] <> null) then
          QRLVolumenValue.Caption := FormatFloat('#,##0.00;(#,##0.00)',IBQRepCertificadoCalidad.FieldValues['volumen'])
         else
          QRLVolumenValue.Caption := '';

         if (IBQRepCertificadoCalidad.FieldValues['color'] <> null) then
          QRLColorValue.Caption := IBQRepCertificadoCalidad.FieldValues['color']
         else
          QRLColorValue.Caption := '';

         if (IBQRepCertificadoCalidad.FieldValues['vigor'] <> null) then
          QRLVigorValue.Caption := IBQRepCertificadoCalidad.FieldValues['vigor']
         else
          QRLVigorValue.Caption := '';

         if (IBQRepCertificadoCalidad.FieldValues['metodo_ext'] <> null) then
          QRLMetodoExtraccion.Caption := IBQRepCertificadoCalidad.FieldValues['metodo_ext']
         else
          QRLMetodoExtraccion.Caption := '';

         if (IBQRepCertificadoCalidad.FieldValues['concentracion'] <> null) then
          QRLConcentracionValue.Caption := IntToStr(IBQRepCertificadoCalidad.FieldValues['concentracion'])
         else
          QRLConcentracionValue.Caption := '';

         if (IBQRepCertificadoCalidad.FieldValues['pajuelas_prod'] <> null) then
          QRLPajuelasProducidas.Caption := FormatFloat('#,##0.00;(#,##0.00)',IBQRepCertificadoCalidad.FieldValues['pajuelas_prod'])
         else
          QRLPajuelasProducidas.Caption := '';

         if (IBQRepCertificadoCalidad.FieldValues['esperm_x_pajuela'] <> null) then
          QRLEspermasPorPajuela.Caption := IntToStr(IBQRepCertificadoCalidad.FieldValues['esperm_x_pajuela'])
         else
          QRLEspermasPorPajuela.Caption := '';

         if (IBQRepCertificadoCalidad.FieldValues['dilucion'] <> null) then
          QRLDilucion.Caption := FormatFloat('#,##0.00;(#,##0.00)',IBQRepCertificadoCalidad.FieldValues['dilucion'])
         else
          QRLDilucion.Caption := '';
          
    end;

end;

end.
