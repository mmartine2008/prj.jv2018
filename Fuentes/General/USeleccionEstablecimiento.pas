unit USeleccionEstablecimiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  DBCtrls, UDBLookupComboBoxAuto, DB, IBCustomDataSet, IBQuery,uTiposGlobales,
  IBStoredProc, WinXP, DataExport, DataToXLS, JvGIF, PngImage, jpeg,
  ImgList, PngImageList, JvExControls, JvLabel, JvExExtCtrls, JvImage;

type
  TFSeleccionEstablecimiento = class(TFUniversal)
    PBotones: TPanel;
    PControles: TPanel;
    LEstablecimiento: TLabel;
    DBLCBEstablecimiento: TDBLookupComboBoxAuto;
    BBAceptar: TBitBtn;
    BBCancelar: TBitBtn;
    BBAyuda: TBitBtn;
    IFondo: TImage;
    IAceptar: TImage;
    LAceptar: TLabel;
    LCancelar: TLabel;
    ICancelar: TImage;
    IAyuda: TImage;
    LAyuda: TLabel;
    IBQRazaPredEstable: TIBQuery;
    procedure BBAceptarClick(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

var
  FSeleccionEstablecimiento: TFSeleccionEstablecimiento;

implementation

{$R *.dfm}

uses UPrincipal, UMensajeHuella, UTraduccion, UDMSoftvet;

procedure TFSeleccionEstablecimiento.BBAceptarClick(Sender: TObject);
begin
  inherited;
  if (DBLCBEstablecimiento.KeyValue = FPrincipal.EstablecimientoActual) then 
     begin
       MostrarMensaje(tmError, 'El establecimiento seleccionado es el que está trabajando. Seleccione otro.');
       DBLCBEstablecimiento.SetFocus;       
     end
   else
    begin
      if (DBLCBEstablecimiento.KeyValue <> null) then begin
         begin
           FPrincipal.EstablecimientoActual := DBLCBEstablecimiento.KeyValue;

           FPrincipal.TipoActividad := ttaCabania;
           FPrincipal.MAX_ANIMALES := 5;
           FPrincipal.MAX_EVENTOS := 6;
           FPrincipal.MAX_REPORTES := 6;

            if DMSoftvet.IBQEstablecimiento.FieldValues['actividad'] = null then
            begin
              if (FPrincipal.TipoVersionLicencia = 'Estandar') or (FPrincipal.TipoVersionLicencia = 'Basico') then
              begin
                FPrincipal.TipoActividad := ttaCria;
                FPrincipal.MAX_ANIMALES := 4;
                FPrincipal.MAX_EVENTOS := 6;
                FPrincipal.MAX_REPORTES := 6;
              end
              else
              begin
                FPrincipal.TipoActividad := ttaCabania;
                FPrincipal.MAX_ANIMALES := 5;
                FPrincipal.MAX_EVENTOS := 6;
                FPrincipal.MAX_REPORTES := 6;
              end;
            end
            else
            begin
              case DMSoftvet.IBQEstablecimiento.FieldValues['actividad'] of
                1 : begin
                      FPrincipal.TipoActividad := ttaCria;
                      FPrincipal.MAX_ANIMALES := 4;
                      FPrincipal.MAX_EVENTOS := 6;
                      FPrincipal.MAX_REPORTES := 6;
                    end;
                2 : begin
                      FPrincipal.TipoActividad := ttaInvernada;
                      FPrincipal.MAX_ANIMALES := 4;
                      FPrincipal.MAX_EVENTOS := 6;
                      FPrincipal.MAX_REPORTES := 6;
                    end;
                3 : begin
                      FPrincipal.TipoActividad := ttaCabania;
                      FPrincipal.MAX_ANIMALES := 5;
                      FPrincipal.MAX_EVENTOS := 6;
                      FPrincipal.MAX_REPORTES := 6;
                    end;
                4 : begin
                      FPrincipal.TipoActividad := ttaFeedlot;
                      FPrincipal.MAX_ANIMALES := 3;
                      FPrincipal.MAX_EVENTOS := 3;
                      FPrincipal.MAX_REPORTES := 4;
                    end;
              end;
            end;  

           MostrarMensaje(tmInformacion, Traducir('Ahora usted está trabajando con el Establecimiento: ') + DBLCBEstablecimiento.Text);
           FPrincipal.VerificarAlarmasServicio;

           FPrincipal.SeleccionarRazaPredom;
         end;
        Close;
      end else begin
        MostrarMensaje(tmInformacion, 'Debe seleccionar un Establecimiento.');
        DBLCBEstablecimiento.SetFocus;
      end;
    end;  
end;

procedure TFSeleccionEstablecimiento.BBCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFSeleccionEstablecimiento.FormShow(Sender: TObject);
begin
  inherited;
  LTitulo.Caption := '';
  DBLCBEstablecimiento.KeyValue := FPrincipal.EstablecimientoActual;
end;

end.
