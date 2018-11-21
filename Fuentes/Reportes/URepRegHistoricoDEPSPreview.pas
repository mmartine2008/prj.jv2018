unit URepRegHistoricoDEPSPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  QRCtrls, jpeg, QuickRpt, QRExport, QRWebFilt, QRPDFFilt, ImgList,
  PngImageList, pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel,
  JvGIF;

type
  TFRepRegHistoricoDEPSPreview = class(TFUniversal)
    QRRegHistoDeps: TQuickRep;
    QRBand1: TQRBand;
    QRImage2: TQRImage;
    QRLabel4: TQRLabel;
    QRBand5: TQRBand;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLNombre: TQRLabel;
    QRLHBA: TQRLabel;
    QRLAnio: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel3: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
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
    QRShape34: TQRShape;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape35: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRHTMLFilter1: TQRHTMLFilter;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape40: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRShape41: TQRShape;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRShape42: TQRShape;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText54: TQRDBText;
    QRShape8: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel71: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRDBText28: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel72: TQRLabel;
    QRLNombreUru: TQRLabel;
    QRLHBU: TQRLabel;
    QRLNacUru: TQRLabel;
    QRLabel73: TQRLabel;
    QRLRPUru: TQRLabel;
    QRLPadre: TQRLabel;
    QRLMadre: TQRLabel;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRLabel79: TQRLabel;
    QRDBText41: TQRDBText;
    procedure QRRegHistoDepsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private
    { Private declarations }
    procedure cargarDatosPropietario();
  public
    { Public declarations }
    procedure MostrarCompPais();
    procedure SetearDataSet(ds: TIBQuery);
  end;

var
  FRepRegHistoricoDEPSPreview: TFRepRegHistoricoDEPSPreview;

implementation

Uses UPrincipal, UREPFichaAnimal, URepGeneral,uTiposGlobales;

{$R *.dfm}

procedure TFRepRegHistoricoDEPSPreview.MostrarCompPais();
begin
  if (FPrincipal.Pais = 1) then // Argentina
    begin
      QRShape9.Enabled:= false;
      QRShape10.Enabled:= false;
      QRLabel67.Enabled:= false;
      QRLabel73.Enabled:= false;
      QRLabel68.Enabled:= false;
      QRLabel72.Enabled:= false;
      QRLabel24.Enabled:= false;
      QRLHBU.Enabled:= false;
      QRLRPUru.Enabled:= false;
      QRLNacUru.Enabled:= false;
      QRLNombreUru.Enabled:= false;

      QRShape15.Enabled:= true;
      QRShape16.Enabled:= true;
      QRLabel18.Enabled:= true;
      QRLabel19.Enabled:= true;
      QRLabel20.Enabled:= true;
      QRLabel21.Enabled:= true;
      QRLNombre.Enabled:= true;
      QRLHBA.Enabled:= true;
      QRLAnio.Enabled:= true;
      QRLabel25.Enabled:= true;
      QRLabel26.Enabled:= true;

      QRLPadre.Enabled:= true;
      QRLMadre.Enabled:= true;

      QRBand3.Height:= 128;

      QRShape2.Enabled:= false;
      QRShape38.Enabled:= false;
      QRShape39.Enabled:= false;
      QRShape3.Enabled:= false;
      QRShape5.Enabled:= false;
      QRShape44.Enabled:= false;
      QRShape43.Enabled:= false;
      QRShape7.Enabled:= false;
      QRShape6.Enabled:= false;
      QRShape8.Enabled:= false;
      QRShape40.Enabled:= false;
      QRShape41.Enabled:= false;
      QRShape42.Enabled:= false;
      QRShape11.Enabled:= false;
      QRShape12.Enabled:= false;
      QRShape13.Enabled:= false;
      QRShape14.Enabled:= false;
      QRShape36.Enabled:= false;
      QRShape37.Enabled:= false;
      QRDBText29.Enabled:= false;
      QRDBText54.Enabled:= false;
      QRDBText28.Enabled:= false;
      QRDBText35.Enabled:= false;
      QRDBText36.Enabled:= false;
      QRDBText39.Enabled:= false;
      QRDBText40.Enabled:= false;
      QRDBText31.Enabled:= false;
      QRDBText30.Enabled:= false;
      QRDBText32.Enabled:= false;
      QRDBText33.Enabled:= false;
      QRDBText34.Enabled:= false;
      QRDBText38.Enabled:= false;
      QRDBText37.Enabled:= false;
      QRDBText42.Enabled:= false;
      QRDBText43.Enabled:= false;
      QRDBText44.Enabled:= false;
      QRDBText45.Enabled:= false;
      QRDBText46.Enabled:= false;
      QRDBText50.Enabled:= false;
      QRDBText49.Enabled:= false;      



      QRLabel27.Enabled:= false;
      QRLabel23.Enabled:= false;
      QRLabel71.Enabled:= false;
      QRLabel22.Enabled:= false;
      QRLabel17.Enabled:= false;
      QRLabel14.Enabled:= false;
      QRLabel2.Enabled:= false;
      QRLabel13.Enabled:= false;
      QRLabel8.Enabled:= false;
      QRLabel9.Enabled:= false;
      QRLabel10.Enabled:= false;
      QRLabel11.Enabled:= false;
      QRLabel12.Enabled:= false;
      QRLabel16.Enabled:= false;
      QRLabel15.Enabled:= false;
      QRLabel28.Enabled:= false;
      QRLabel63.Enabled:= false;
      QRLabel64.Enabled:= false;
      QRLabel65.Enabled:= false;
      QRLabel66.Enabled:= false;
      QRLabel70.Enabled:= false;
      QRLabel69.Enabled:= false;
      QRLabel74.Enabled:= false;
      QRLabel75.Enabled:= false;
      QRLabel76.Enabled:= false;
      QRLabel77.Enabled:= false;
      QRLabel78.Enabled:= false;
      QRLabel82.Enabled:= false;
      QRLabel81.Enabled:= false;
      
      QRBand2.Height:= 176;
    end
   else
    if (FPrincipal.Pais = 2) then // Uruguay
      begin
        QRShape9.Enabled:= true;
        QRShape10.Enabled:= true;
        QRLabel67.Enabled:= true;
        QRLabel73.Enabled:= true;
        QRLabel68.Enabled:= true;
        QRLabel72.Enabled:= true;
        QRLabel24.Enabled:= true;        
        QRLHBU.Enabled:= true;
        QRLRPUru.Enabled:= true;
        QRLNacUru.Enabled:= true;
        QRLNombreUru.Enabled:= true;

        QRShape15.Enabled:= false;
        QRShape16.Enabled:= false;
        QRLabel18.Enabled:= false;
        QRLabel19.Enabled:= false;
        QRLabel20.Enabled:= false;
        QRLabel21.Enabled:= false;
        QRLNombre.Enabled:= false;
        QRLHBA.Enabled:= false;
        QRLAnio.Enabled:= false;
        QRLabel25.Enabled:= false;
        QRLabel26.Enabled:= false;
        QRLPadre.Enabled:= false;
        QRLMadre.Enabled:= false;

        QRShape9.Top:= 16;
        QRShape10.Top:= 16;
        QRLabel67.Top:= 24;
        QRLabel73.Top:= 24;
        QRLabel68.Top:= 18;
        QRLabel72.Top:= 31;
        QRLabel24.Top:= 24;
        QRLHBU.Top:= 52;
        QRLRPUru.Top:= 52;
        QRLNacUru.Top:= 52;
        QRLNombreUru.Top:= 52;

        QRBand3.Height:= 128;

        QRShape17.Enabled:= false;
        QRShape19.Enabled:= false;
        QRShape20.Enabled:= false;
        QRShape21.Enabled:= false;
        QRShape22.Enabled:= false;
        QRShape23.Enabled:= false;
        QRShape24.Enabled:= false;
        QRShape25.Enabled:= false;
        QRShape26.Enabled:= false;
        QRShape27.Enabled:= false;
        QRShape28.Enabled:= false;
        QRShape29.Enabled:= false;
        QRShape30.Enabled:= false;
        QRShape31.Enabled:= false;
        QRShape32.Enabled:= false;
        QRShape33.Enabled:= false;
        QRShape34.Enabled:= false;
        QRShape35.Enabled:= false;

        QRLabel3.Enabled:= false;
        QRLabel5.Enabled:= false;
        QRLabel6.Enabled:= false;
        QRLabel7.Enabled:= false;
        QRLabel29.Enabled:= false;
        QRLabel30.Enabled:= false;
        QRLabel31.Enabled:= false;
        QRLabel32.Enabled:= false;
        QRLabel33.Enabled:= false;
        QRLabel34.Enabled:= false;
        QRLabel35.Enabled:= false;
        QRLabel36.Enabled:= false;
        QRLabel37.Enabled:= false;
        QRLabel38.Enabled:= false;
        QRLabel39.Enabled:= false;
        QRLabel40.Enabled:= false;
        QRLabel41.Enabled:= false;
        QRLabel42.Enabled:= false;
        QRLabel43.Enabled:= false;
        QRLabel44.Enabled:= false;
        QRLabel45.Enabled:= false;
        QRLabel46.Enabled:= false;
        QRLabel47.Enabled:= false;
        QRLabel48.Enabled:= false;
        QRLabel49.Enabled:= false;
        QRLabel50.Enabled:= false;
        QRLabel51.Enabled:= false;
        QRLabel52.Enabled:= false;
        QRLabel53.Enabled:= false;
        QRLabel54.Enabled:= false;
        QRLabel55.Enabled:= false;
        QRLabel56.Enabled:= false;
        QRLabel57.Enabled:= false;
        QRLabel58.Enabled:= false;
        QRLabel59.Enabled:= false;
        QRLabel60.Enabled:= false;
        QRLabel61.Enabled:= false;
        QRLabel62.Enabled:= false;

        QRDBText26.Enabled:= false;
        QRDBText27.Enabled:= false;
        QRDBText1.Enabled:= false;
        QRDBText4.Enabled:= false;
        QRDBText3.Enabled:= false;
        QRDBText5.Enabled:= false;
        QRDBText6.Enabled:= false;
        QRDBText7.Enabled:= false;
        QRDBText8.Enabled:= false;
        QRDBText9.Enabled:= false;
        QRDBText10.Enabled:= false;
        QRDBText11.Enabled:= false;
        QRDBText12.Enabled:= false;
        QRDBText13.Enabled:= false;
        QRDBText14.Enabled:= false;
        QRDBText15.Enabled:= false;
        QRDBText16.Enabled:= false;
        QRDBText17.Enabled:= false;
        QRDBText18.Enabled:= false;
        QRDBText19.Enabled:= false;
        QRDBText20.Enabled:= false;
        QRDBText21.Enabled:= false;
        QRDBText22.Enabled:= false;
        QRDBText23.Enabled:= false;
        QRDBText24.Enabled:= false;
        QRDBText25.Enabled:= false;



        QRShape2.Top:= 16;
        QRShape38.Top:= 16;
        QRShape39.Top:= 16;
        QRShape3.Top:= 17;
        QRShape5.Top:= 56;
        QRShape44.Top:= 56;
        QRShape43.Top:= 56;
        QRShape7.Top:= 56;
        QRShape6.Top:= 56;
        QRShape8.Top:= 56;
        QRShape40.Top:= 56;
        QRShape41.Top:= 77;
        QRShape42.Top:= 105;
        QRShape11.Top:= 17;
        QRShape12.Top:= 17;
        QRShape13.Top:= 17;
        QRShape14.Top:= 17;
        QRShape36.Top:= 17;
        QRShape37.Top:= 17;
        QRDBText29.Top:= 71;
        QRDBText54.Top:= 90;
        QRDBText28.Top:= 90;
        QRDBText35.Top:= 90;
        QRDBText36.Top:= 90;
        QRDBText39.Top:= 90;
        QRDBText40.Top:= 90;
        QRDBText31.Top:= 89;
        QRDBText30.Top:= 89;
        QRDBText32.Top:= 89;
        QRDBText33.Top:= 89;
        QRDBText34.Top:= 89;
        QRDBText38.Top:= 89;
        QRDBText37.Top:= 89;
        QRDBText42.Top:= 115;
        QRDBText43.Top:= 115;
        QRDBText44.Top:= 115;
        QRDBText45.Top:= 115;
        QRDBText46.Top:= 115;
        QRDBText50.Top:= 115;
        QRDBText49.Top:= 115;



        QRLabel27.Top:= 19;
        QRLabel23.Top:= 19;
        QRLabel71.Top:= 32;
        QRLabel22.Top:= 19;
        QRLabel17.Top:= 19;
        QRLabel14.Top:= 19;
        QRLabel2.Top:= 19;
        QRLabel13.Top:= 32;
        QRLabel8.Top:= 19;
        QRLabel9.Top:= 19;
        QRLabel10.Top:= 19;
        QRLabel11.Top:= 19;
        QRLabel12.Top:= 19;
        QRLabel16.Top:= 19;
        QRLabel15.Top:= 19;
        QRLabel28.Top:= 43;
        QRLabel63.Top:= 43;
        QRLabel64.Top:= 43;
        QRLabel65.Top:= 43;
        QRLabel66.Top:= 43;
        QRLabel70.Top:= 43;
        QRLabel69.Top:= 43;
        QRLabel74.Top:= 64;
        QRLabel75.Top:= 64;
        QRLabel76.Top:= 64;
        QRLabel77.Top:= 64;
        QRLabel78.Top:= 64;
        QRLabel82.Top:= 64;
        QRLabel81.Top:= 64;

        QRBand2.Height:= 176;


      end
    else
        begin
          QRShape9.Enabled:= true;
          QRShape10.Enabled:= true;
          QRLabel67.Enabled:= true;
          QRLabel73.Enabled:= true;
          QRLabel68.Enabled:= true;
          QRLabel72.Enabled:= true;
          QRLabel24.Enabled:= true;
          QRLHBU.Enabled:= true;
          QRLRPUru.Enabled:= true;
          QRLNacUru.Enabled:= true;
          QRLNombreUru.Enabled:= true;

          QRShape15.Enabled:= false;
          QRShape16.Enabled:= false;
          QRLabel18.Enabled:= false;
          QRLabel19.Enabled:= false;
          QRLabel20.Enabled:= false;
          QRLabel21.Enabled:= false;
          QRLNombre.Enabled:= false;
          QRLHBA.Enabled:= false;
          QRLAnio.Enabled:= false;
          QRLabel25.Enabled:= false;
          QRLabel26.Enabled:= false;
          QRLPadre.Enabled:= false;
          QRLMadre.Enabled:= false;

          QRShape9.Top:= 16;
          QRShape10.Top:= 16;
          QRLabel67.Top:= 24;
          QRLabel73.Top:= 24;
          QRLabel68.Top:= 18;
          QRLabel72.Top:= 31;
          QRLabel24.Top:= 24;
          QRLHBU.Top:= 52;
          QRLRPUru.Top:= 52;
          QRLNacUru.Top:= 52;
          QRLNombreUru.Top:= 52;

          QRBand3.Height:= 128;

          QRShape17.Enabled:= false;
          QRShape19.Enabled:= false;
          QRShape20.Enabled:= false;
          QRShape21.Enabled:= false;
          QRShape22.Enabled:= false;
          QRShape23.Enabled:= false;
          QRShape24.Enabled:= false;
          QRShape25.Enabled:= false;
          QRShape26.Enabled:= false;
          QRShape27.Enabled:= false;
          QRShape28.Enabled:= false;
          QRShape29.Enabled:= false;
          QRShape30.Enabled:= false;
          QRShape31.Enabled:= false;
          QRShape32.Enabled:= false;
          QRShape33.Enabled:= false;
          QRShape34.Enabled:= false;
          QRShape35.Enabled:= false;

          QRLabel3.Enabled:= false;
          QRLabel5.Enabled:= false;
          QRLabel6.Enabled:= false;
          QRLabel7.Enabled:= false;
          QRLabel29.Enabled:= false;
          QRLabel30.Enabled:= false;
          QRLabel31.Enabled:= false;
          QRLabel32.Enabled:= false;
          QRLabel33.Enabled:= false;
          QRLabel34.Enabled:= false;
          QRLabel35.Enabled:= false;
          QRLabel36.Enabled:= false;
          QRLabel37.Enabled:= false;
          QRLabel38.Enabled:= false;
          QRLabel39.Enabled:= false;
          QRLabel40.Enabled:= false;
          QRLabel41.Enabled:= false;
          QRLabel42.Enabled:= false;
          QRLabel43.Enabled:= false;
          QRLabel44.Enabled:= false;
          QRLabel45.Enabled:= false;
          QRLabel46.Enabled:= false;
          QRLabel47.Enabled:= false;
          QRLabel48.Enabled:= false;
          QRLabel49.Enabled:= false;
          QRLabel50.Enabled:= false;
          QRLabel51.Enabled:= false;
          QRLabel52.Enabled:= false;
          QRLabel53.Enabled:= false;
          QRLabel54.Enabled:= false;
          QRLabel55.Enabled:= false;
          QRLabel56.Enabled:= false;
          QRLabel57.Enabled:= false;
          QRLabel58.Enabled:= false;
          QRLabel59.Enabled:= false;
          QRLabel60.Enabled:= false;
          QRLabel61.Enabled:= false;
          QRLabel62.Enabled:= false;

          QRDBText26.Enabled:= false;
          QRDBText27.Enabled:= false;
          QRDBText1.Enabled:= false;
          QRDBText4.Enabled:= false;
          QRDBText3.Enabled:= false;
          QRDBText5.Enabled:= false;
          QRDBText6.Enabled:= false;
          QRDBText7.Enabled:= false;
          QRDBText8.Enabled:= false;
          QRDBText9.Enabled:= false;
          QRDBText10.Enabled:= false;
          QRDBText11.Enabled:= false;
          QRDBText12.Enabled:= false;
          QRDBText13.Enabled:= false;
          QRDBText14.Enabled:= false;
          QRDBText15.Enabled:= false;
          QRDBText16.Enabled:= false;
          QRDBText17.Enabled:= false;
          QRDBText18.Enabled:= false;
          QRDBText19.Enabled:= false;
          QRDBText20.Enabled:= false;
          QRDBText21.Enabled:= false;
          QRDBText22.Enabled:= false;
          QRDBText23.Enabled:= false;
          QRDBText24.Enabled:= false;
          QRDBText25.Enabled:= false;



          QRShape2.Top:= 16;
          QRShape38.Top:= 16;
          QRShape39.Top:= 16;
          QRShape3.Top:= 17;
          QRShape5.Top:= 56;
          QRShape44.Top:= 56;
          QRShape43.Top:= 56;
          QRShape7.Top:= 56;
          QRShape6.Top:= 56;
          QRShape8.Top:= 56;
          QRShape40.Top:= 56;
          QRShape41.Top:= 77;
          QRShape42.Top:= 105;
          QRShape11.Top:= 17;
          QRShape12.Top:= 17;
          QRShape13.Top:= 17;
          QRShape14.Top:= 17;
          QRShape36.Top:= 17;
          QRShape37.Top:= 17;
          QRDBText29.Top:= 71;
          QRDBText54.Top:= 90;
          QRDBText28.Top:= 90;
          QRDBText35.Top:= 90;
          QRDBText36.Top:= 90;
          QRDBText39.Top:= 90;
          QRDBText40.Top:= 90;
          QRDBText31.Top:= 89;
          QRDBText30.Top:= 89;
          QRDBText32.Top:= 89;
          QRDBText33.Top:= 89;
          QRDBText34.Top:= 89;
          QRDBText38.Top:= 89;
          QRDBText37.Top:= 89;
          QRDBText42.Top:= 115;
          QRDBText43.Top:= 115;
          QRDBText44.Top:= 115;
          QRDBText45.Top:= 115;
          QRDBText46.Top:= 115;
          QRDBText50.Top:= 115;
          QRDBText49.Top:= 115;



          QRLabel27.Top:= 19;
          QRLabel23.Top:= 19;
          QRLabel71.Top:= 32;
          QRLabel22.Top:= 19;
          QRLabel17.Top:= 19;
          QRLabel14.Top:= 19;
          QRLabel2.Top:= 19;
          QRLabel13.Top:= 32;
          QRLabel8.Top:= 19;
          QRLabel9.Top:= 19;
          QRLabel10.Top:= 19;
          QRLabel11.Top:= 19;
          QRLabel12.Top:= 19;
          QRLabel16.Top:= 19;
          QRLabel15.Top:= 19;
          QRLabel28.Top:= 43;
          QRLabel63.Top:= 43;
          QRLabel64.Top:= 43;
          QRLabel65.Top:= 43;
          QRLabel66.Top:= 43;
          QRLabel70.Top:= 43;
          QRLabel69.Top:= 43;
          QRLabel74.Top:= 64;
          QRLabel75.Top:= 64;
          QRLabel76.Top:= 64;
          QRLabel77.Top:= 64;
          QRLabel78.Top:= 64;
          QRLabel82.Top:= 64;
          QRLabel81.Top:= 64;

          QRBand2.Height:= 176;


        end
end;

procedure TFRepRegHistoricoDEPSPreview.QRRegHistoDepsBeforePrint(
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

  MostrarCompPais();

  cargarDatosPropietario();
end;

procedure TFRepRegHistoricoDEPSPreview.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if (StrToFloat(value) > 0) then
    Value:= '+' + Value;
end;

procedure TFRepRegHistoricoDEPSPreview.SetearDataSet(ds: TIBQuery);
begin
  QRRegHistoDeps.DataSet:= ds;
//argentina
  QRDBText2.DataSet:= ds;
  QRDBText26.DataSet:= ds;
  QRDBText27.DataSet:= ds;
  QRDBText1.DataSet:= ds;
  QRDBText14.DataSet:= ds;
  QRDBText4.DataSet:= ds;
  QRDBText15.DataSet:= ds;
  QRDBText3.DataSet:= ds;
  QRDBText16.DataSet:= ds;
  QRDBText5.DataSet:= ds;
  QRDBText17.DataSet:= ds;
  QRDBText6.DataSet:= ds;
  QRDBText18.DataSet:= ds;
  QRDBText7.DataSet:= ds;
  QRDBText19.DataSet:= ds;
  QRDBText8.DataSet:= ds;
  QRDBText20.DataSet:= ds;
  QRDBText9.DataSet:= ds;
  QRDBText21.DataSet:= ds;
  QRDBText10.DataSet:= ds;
  QRDBText22.DataSet:= ds;
  QRDBText11.DataSet:= ds;
  QRDBText23.DataSet:= ds;
  QRDBText12.DataSet:= ds;
  QRDBText24.DataSet:= ds;
  QRDBText13.DataSet:= ds;
  QRDBText25.DataSet:= ds;
  QRDBText41.DataSet := ds;
//uruguay
  QRDBText29.DataSet:= ds;
  QRDBText54.DataSet:= ds;
  QRDBText28.DataSet:= ds;
  QRDBText35.DataSet:= ds;
  QRDBText36.DataSet:= ds;
  QRDBText39.DataSet:= ds;
  QRDBText40.DataSet:= ds;
  QRDBText31.DataSet:= ds;
  QRDBText42.DataSet:= ds;
  QRDBText30.DataSet:= ds;
  QRDBText43.DataSet:= ds;
  QRDBText32.DataSet:= ds;
  QRDBText44.DataSet:= ds;
  QRDBText33.DataSet:= ds;
  QRDBText45.DataSet:= ds;
  QRDBText34.DataSet:= ds;
  QRDBText46.DataSet:= ds;
  QRDBText38.DataSet:= ds;
  QRDBText50.DataSet:= ds;
  QRDBText37.DataSet:= ds;
  QRDBText49.DataSet:= ds;
end;

procedure TFRepRegHistoricoDEPSPreview.cargarDatosPropietario;
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
