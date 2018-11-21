unit UEveAborto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, DBCtrls, UDBLookupComboBoxAuto,
  DateTimePickerAuto, WinXP, DataExport, DataToXLS, EditAuto, ImgList,
  PngImageList, JvExControls, JvLabel, PngImage, JvExExtCtrls, JvImage,
  jpeg, JvGIF, JvComponentBase, JvBalloonHint, xmldom, XMLIntf, msxmldom,
  XMLDoc, Menus;

type
  TFEveAborto = class(TFEveSimple)
    LFecha: TLabel;
    LObservador: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    CBAObservador: TDBLookupComboBoxAuto;
    DBLCBATipoAborto: TDBLookupComboBoxAuto;
    Label1: TLabel;
    IBQSPEventoIndID_EVENTO_GENERADO: TIntegerField;
    CBAplicarDiagnostico: TCheckBox;
    IBDSActualizacionAborto: TIBDataSet;
    IBDSSimpleV8: TIBStringField;
    IBDSSimpleV10: TIBStringField;
    IBDSSimpleV7: TIBStringField;
    IBDSSimpleV6: TIBStringField;
    IBDSSimpleV5: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleV9: TIBStringField;
    IBDSSimpleV11: TIBStringField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleV1: TIBStringField;
    IBDSSimpleV2: TIBStringField;
    IBDSSimpleNOMBRE: TIBStringField;
    IBDSSimpleV3: TIBStringField;
    IBDSSimpleV4: TIBStringField;
    IBDSSimpleI1: TIntegerField;
    IBDSSimpleI2: TIntegerField;
    IBDSSimpleI3: TIntegerField;
    IBDSSimpleD1: TDateField;
    IBDSSimpleD2: TDateField;
    IBDSSimpleD3: TDateField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleID_AUX_EVENTO: TIntegerField;
    IBDSSimpleI4: TIntegerField;
    IBDSSimpleI5: TIntegerField;
    IBDSSimpleI6: TIntegerField;
    IBDSSimpleI7: TIntegerField;
    IBDSSimpleI8: TIntegerField;
    IBDSSimpleI9: TIntegerField;
    IBDSSimpleVUNO1: TIBStringField;
    IBDSSimpleVUNO2: TIBStringField;
    IBDSSimpleVUNO3: TIBStringField;
    IBDSSimpleVUNO4: TIBStringField;
    IBDSSimpleVUNO5: TIBStringField;
    IBDSSimpleVUNO6: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    IBDSSimpleH1: TTimeField;
    IBDSSimpleV12: TIBStringField;
    IBDSSimpleF1: TFloatField;
    IBDSSimpleF2: TFloatField;
    IBDSSimpleF3: TFloatField;
    IBDSSimpleF4: TFloatField;
    IBDSSimpleF5: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BDiagnosticaClick(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PCBasicoChange(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LObservadorClick(Sender: TObject);
    procedure LObservadorMouseEnter(Sender: TObject);
    procedure LObservadorMouseLeave(Sender: TObject);
  private
    FConDiagnostico: boolean;
    procedure SetConDiagnostico(const Value: boolean);
  protected
    procedure TerminarIndividual; override;
    procedure CargarParametrosRN; override;
    procedure CargarParametrosSP; override;
    property ConDiagnostico : boolean read FConDiagnostico write SetConDiagnostico;
  public
    { Public declarations }
  end;

var
  FEveAborto: TFEveAborto;
  executeDiagnostico : boolean;


implementation

{$R *.dfm}
uses
  UEveUniversal, UPrincipal, UDMSoftvet, DateUtils,UEveDiagnosticoEnfermedad,
  UEveTratamiento, UABMEmpleados;

(*
  Carga los parametros necesarios para las Reglas de Negocio Asociadas al evento
*)
procedure TFEveAborto.CargarParametrosRN;
begin
  inherited;
  IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
  IBQSPRN.ParamByName('FECHA').AsDate := DTPAFecha.DateTime;
end;

(*
  carga los parametros de la grilla detalle para el SP de insercion correspondiente
*)
procedure TFEveAborto.CargarParametrosSP;
begin
  inherited;
  IBQSPEventoInd.ParamByName('FECHA').Value := DTPAFecha.GetDato;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IDAnimal;
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := CBAObservador.GetDato;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value :=NOW;
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := Null;
  IBQSPEventoInd.ParamByName('TIPO').Value := DBLCBATipoAborto.GetDato;
{  if(CBAplicarDiagnostico.Checked)then
     IBQSPEventoInd.ParamByName('DIAGNOSTICA').Value := 'S'
  else}
    IBQSPEventoInd.ParamByName('DIAGNOSTICA').Value := 'N'

end;

procedure TFEveAborto.FormCreate(Sender: TObject);
begin
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  FConDiagnostico:= True;
  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, nombre, apodo from VIS_ABORTO ';
  inherited;
end;

procedure TFEveAborto.FormShow(Sender: TObject);
begin
  inherited;
  DTPAFecha.Date := DateOf(Now);
//  DTPAFecha.MaxDate:= now;
  CBAplicarDiagnostico.Visible := false;
  if (ModoEve = meIndividual) and (FConDiagnostico) then
    CBAplicarDiagnostico.Visible := true;
  MSimple.PasarParametros(2,0); //cambie codigo

end;

procedure TFEveAborto.BDiagnosticaClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFEveDiagnosticoEnfermedad, FEveDiagnosticoEnfermedad);
  FEveDiagnosticoEnfermedad.EventoDisparador := self.EventoGenerado;
  FEveDiagnosticoEnfermedad.ModoEve := meIndividual;
  FEveDiagnosticoEnfermedad.IDAnimal := IDAnimal;
  FEveDiagnosticoEnfermedad.ConManga := false;
  FEveDiagnosticoEnfermedad.IDAnimal := IDAnimal;
  FEveDiagnosticoEnfermedad.ShowModal;
  // actualizo la tabla del diagnostico de enfermedad cuando termino bien
  if (FEveDiagnosticoEnfermedad.BBTerminar.ModalResult = 1) then begin
    FPrincipal.IBTPrincipal.CommitRetaining;
  end
end;

procedure TFEveAborto.SetConDiagnostico(const Value: boolean);
begin
  FConDiagnostico := Value;
end;

procedure TFEveAborto.ATerminarExecute(Sender: TObject);
begin
  inherited ATerminarExecute(Sender); // ejecuto el terminar de eveSimple
  if (PuedeTerminar) then
  begin
    if (CBAplicarDiagnostico.Checked) then // Si Diagnostica
      begin
        Application.CreateForm(TFEveDiagnosticoEnfermedad, FEveDiagnosticoEnfermedad);
        FEveDiagnosticoEnfermedad.EventoDisparador := self.EventoGenerado;
        FEveDiagnosticoEnfermedad.ModoEve := meIndividual;
        FEveDiagnosticoEnfermedad.IDAnimal := IDAnimal;
        FEveDiagnosticoEnfermedad.ConManga := false;
        FEveDiagnosticoEnfermedad.ShowModal;
        if (FEveDiagnosticoEnfermedad.ModalResult = 1) then // actualizo la tabla del diagnostico de enfermedad cuando termino bien
        begin
            IBDSActualizacionAborto.Close;
            IBDSActualizacionAborto.ParamByName('id_evento').AsInteger := self.EventoGenerado;
            IBDSActualizacionAborto.Open;
            {IBDSActualizacionAborto.Edit;
            IBDSActualizacionAborto.FieldByName('diagnostica').AsString := 'S';
            IBDSActualizacionAborto.Post;}
            FPrincipal.IBTPrincipal.CommitRetaining;
         end
      end;
  end;
end;

procedure TFEveAborto.TerminarIndividual;
begin
  inherited TerminarIndividual;
  if PuedeTerminar then
    EventoGenerado := IBQSPEventoInd.FieldValues['id_evento_generado'];
end;

procedure TFEveAborto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if ((self.BBTerminar.ModalResult <> 1) and (executeTratamiento)) then
    FPrincipal.IBTPrincipal.RollbackRetaining;
end;

procedure TFEveAborto.PCBasicoChange(Sender: TObject);
begin
  inherited;
  if (ModoEve = meIndividual) and (FConDiagnostico) then
    CBAplicarDiagnostico.Visible := true;


end;

procedure TFEveAborto.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
    fecha.Date:=now;
end;


procedure TFEveAborto.LObservadorClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMEmpleados.Create(self));
      DMSoftvet.IBQResponsable.Close;
      DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQResponsable.Open;
    end;
  cambiarCB(CBAObservador,nroID);
end;

procedure TFEveAborto.LObservadorMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= $00606C02;
      LObservador.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAborto.LObservadorMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= clWindowText;
      LObservador.Font.Style:= [fsUnderline];
    end;  
end;

end.
