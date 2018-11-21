unit UDOSRADenunciaNacimientosPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QRCtrls, QuickRpt, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  StdCtrls, ExtCtrls, jpeg, QRExport, QRPDFFilt, QRPrntr, ImgList,
  PngImageList, JvExControls, JvLabel, JvGIF, pngimage, JvExExtCtrls,
  JvImage;

type
  TFDOSRADenunciaNacimientosPreview = class(TFUniversal)
    QR: TQuickRep;
    QRBand2: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    LObservaciones: TQRLabel;
    QRShape2: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape4: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape26: TQRShape;
    QRShape16: TQRShape;
    QRShape5: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape23: TQRShape;
    QRShape30: TQRShape;
    QRBEncabezadoPlanilla: TQRBand;
    QRLEstablecimientos: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRSEncabezadoPlanilla: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand5: TQRBand;
    QRLabel1: TQRLabel;
    QRLPagRPs: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape6: TQRShape;
    QRShape11: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel22: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape22: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel32: TQRLabel;
    QRShape33: TQRShape;
    QRLabel33: TQRLabel;
    QRShape34: TQRShape;
    QRLabel34: TQRLabel;
    QRShape35: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRImage1: TQRImage;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRImage2: TQRImage;
    QRPDFFilter1: TQRPDFFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRPrincipal: TQuickRep;
    QRBand1: TQRBand;
    QRBand4: TQRBand;
    QRLCodigoRaza: TQRLabel;
    QRLCodigoRazaValor: TQRLabel;
    QRLDatosCriador: TQRLabel;
    QRLDatosRaza: TQRLabel;
    QRLNombreCriador: TQRLabel;
    QRLNombreCriadorValor: TQRLabel;
    QRLNombreRaza: TQRLabel;
    QRLNombreRazaValor: TQRLabel;
    QRLNumeroCriador: TQRLabel;
    QRLNumeroCriadorValor: TQRLabel;
    QRLSubTitulo: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRSLine01: TQRShape;
    QRSLine02: TQRShape;
    QRSLine03: TQRShape;
    QRSLine04: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRShape62: TQRShape;
    QRLabel58: TQRLabel;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRLabel59: TQRLabel;
    QRShape67: TQRShape;
    QRLabel60: TQRLabel;
    QRShape68: TQRShape;
    QRLabel61: TQRLabel;
    QRShape69: TQRShape;
    QRLabel62: TQRLabel;
    QRShape70: TQRShape;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRBand6: TQRBand;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRLFolio: TQRLabel;
    QRLLinea: TQRLabel;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    IBQPrefijo: TIBQuery;
    procedure activarQuery();
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRDBText19Print(sender: TObject; var Value: String);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDOSRADenunciaNacimientosPreview: TFDOSRADenunciaNacimientosPreview;

implementation

uses UCartel, UPrincipal, DateUtils, UDOSRADenunciaNacimientos;
{$R *.dfm}



// cuando se necesita actualizar el query
procedure TFDOSRADenunciaNacimientosPreview.activarQuery;
var cartel: TCartel;
    msje: String;
begin
{  cartel:= TCartel.getInstance();
  msje:= 'Calculando la denuncia de servicio ...';
  cartel.abrircartel(msje);

  IBQDenunciaNacimiento.Active := false;
//  IBQDenunciaNacimiento.SQL.Clear;
//  IBQDenunciaNacimiento.SQL.Add(SQLGeneral);

  IBQDenunciaNacimiento.ParamByName('grupo').Value := null;
  IBQDenunciaNacimiento.ParamByName('potrero').Value := null;
  IBQDenunciaNacimiento.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDenunciaNacimiento.ParamByName('inicio').AsDateTime := now() -2200;
  IBQDenunciaNacimiento.ParamByName('fin').AsDateTime := now();

  IBQDenunciaNacimiento.Active := true;

  cartel.cerrarcartel();
  cartel.FreeInstance();}
end;


procedure TFDOSRADenunciaNacimientosPreview.QRDBText3Print(sender: TObject; var Value: String);
begin
  inherited;
  Value:= IntToStr(DayOf(StrToDate(Value)));
end;

procedure TFDOSRADenunciaNacimientosPreview.QRDBText7Print(sender: TObject; var Value: String);
begin
  inherited;
  Value:= IntToStr(MonthOf(StrToDate(Value)));
end;

procedure TFDOSRADenunciaNacimientosPreview.QRDBText8Print(sender: TObject; var Value: String);
begin
  inherited;
  Value:= IntToStr(YearOf(StrToDate(Value)));
end;

procedure TFDOSRADenunciaNacimientosPreview.QRDBText5Print(sender: TObject; var Value: String);
begin
  inherited;
  QRDBText5.Visible:= true;
  QRDBText12.Visible:= false;
  if (Trim(Value) = '') then
    begin
      QRDBText5.Visible:= false;
      QRDBText12.Visible:= true;
    end;
end;

procedure TFDOSRADenunciaNacimientosPreview.QRDBText13Print(sender: TObject; var Value: String);
begin
  inherited;

  if (Value = 'S') then
    begin
      //QRDBText13.Enabled:= true;
      Value := 'X';
    end
   else
     begin
      //QRDBText13.Enabled:= false;
      Value := '';
     end;
end;

procedure TFDOSRADenunciaNacimientosPreview.QRDBText14Print(sender: TObject; var Value: String);
begin
  inherited;
  if (Value = 'S') then
    begin
      //QRDBText14.Enabled:= true;
      Value := 'X';
    end
   else
     begin
      //QRDBText14.Enabled:= false;
      Value := '';
     end;
end;

procedure TFDOSRADenunciaNacimientosPreview.QRDBText15Print(sender: TObject; var Value: String);
begin
  inherited;
  if (Value = 'S') then
    begin
      //QRDBText15.Enabled:= true;
      Value := 'X';
    end
   else
     begin
      //QRDBText15.Enabled:= false;
      Value := '';
     end;
end;

procedure TFDOSRADenunciaNacimientosPreview.QRDBText19Print(sender: TObject; var Value: String);
begin
  inherited;
  if (Value = '11') then
    begin
      //QRDBText19.Enabled:= true;
      Value := 'X';
    end
   else
     begin
      //QRDBText19.Enabled:= false;
      Value := '';
     end;
end;

procedure TFDOSRADenunciaNacimientosPreview.QRDBText17Print(sender: TObject; var Value: String);
begin
  inherited;
  if (Value = '3') then
    begin
      //QRDBText17.Enabled:= true;
      Value := 'X';
    end
   else
     begin
      //QRDBText17.Enabled:= false;
      Value := '';
     end;
end;

procedure TFDOSRADenunciaNacimientosPreview.QRDBText18Print(sender: TObject; var Value: String);
begin
  inherited;
  if (Value = '4') then
    begin
      //QRDBText18.Enabled:= true;
      Value := 'X';
    end
   else
     begin
      //QRDBText18.Enabled:= false;
      Value := '';
     end;
end;

procedure TFDOSRADenunciaNacimientosPreview.QRDBText16Print(sender: TObject; var Value: String);
begin
  inherited;
  if (Value = '2') then
    begin
      //QRDBText16.Enabled:= true;
      Value := 'X';
    end
   else
     begin
      //QRDBText16.Enabled:= false;
      Value := '';
     end;
end;

procedure TFDOSRADenunciaNacimientosPreview.QRDBText4Print(sender: TObject; var Value: String);
begin
  inherited;
  if (Value = '3') then
    begin
      Value := '1';
    end
   else
    if (Value = '4') then
      begin
        Value := '2';
      end
     else
      if (Value = '7') then
        begin
          Value := '3';
        end
       else
        if (Value = '8') then
          begin
            Value := '4';
          end
         else
          if (Value = '10') then
            begin
              Value := '5';
            end
           else
             begin
               Value := '';
             end;
end;

procedure TFDOSRADenunciaNacimientosPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  {
  QR.PrevInitialZoom:= qrZoomOther;
  QR.PrevInitialZoom:= qrZoomToWidth;
  QR.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0); }
  IBQPrefijo.Close;
  IBQPrefijo.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPrefijo.Open;
  QRPrincipal.PrevInitialZoom:= qrZoomOther;
  QRPrincipal.PrevInitialZoom:= qrZoomToWidth;
  QRPrincipal.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);



   //showmessage (inttostr(FPrincipal.EstablecimientoActual));

end;

end.
