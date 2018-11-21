unit UUniversalPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, Buttons, RpBase, RpFiler, RpRender,
  RpRenderCanvas, RpRenderPreview, RpDefine, RpRave, IBQuery, WinXP,
  DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList,
  ComCtrls, ExtCtrls, RpRenderPrinter, RpRenderPDF, RpSystem,UMensajeHuella,
  shellapi, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, IdMessage,USendEmail,UPrincipal,URepGeneral;

type
  TFUniversalPreview = class(TFUniversal)
    RvPrInfGralGest: TRvProject;
    RvRenderPreview: TRvRenderPreview;
    RvNDRWriter: TRvNDRWriter;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    TBZoom: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    ScrollBox1: TScrollBox;
    RvRenderPrinter1: TRvRenderPrinter;
    RvRenderPDF1: TRvRenderPDF;
    BitBtn2: TBitBtn;
    SDPDF: TSaveDialog;
    BitBtn3: TBitBtn;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    IBQEstab: TIBQuery;
    IBQEstabNOMBRE: TIBStringField;
    IBQEstabID_ESTABLECIMIENTO: TIntegerField;
    IBQEstabDIRECCION: TIBStringField;
    IBQEstabTELEFONO: TIBStringField;
    IBQEstabEMAIL: TIBStringField;
    IBQEstabURL: TIBStringField;
    IBQEstabPROPIETARIO: TIBStringField;
    IBQEstabRENSPA: TIBStringField;
    IBQEstabPAIS: TIntegerField;
    IBQPropietario: TIBQuery;
    IBQPropietarioID_PROPIETARIO: TIntegerField;
    IBQPropietarioNOMBRE: TIBStringField;
    IBQPropietarioEMPRESA: TIBStringField;
    IBQPropietarioDIRECCION: TIBStringField;
    IBQPropietarioTELEFONO: TIBStringField;
    IBQPropietarioCELULAR: TIBStringField;
    IBQPropietarioEMAIL: TIBStringField;
    IBQPropietarioURL: TIBStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TBZoomChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    RepName: String;
    procedure setParams();
  public
    procedure setReportName(n: string);
  end;

var
  FUniversalPreview: TFUniversalPreview;
  NDRStrem : TMemoryStream;

implementation

{$R *.dfm}

procedure TFUniversalPreview.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if RvNDRWriter.ShowPrintDialog then
    RvRenderPrinter1.Render(RvNDRWriter.FileName);
end;

procedure TFUniversalPreview.FormCreate(Sender: TObject);
begin
  inherited;
  Label2.Caption := IntToStr(50+(10*TBZoom.Position))+' %';
end;

procedure TFUniversalPreview.TBZoomChange(Sender: TObject);
begin
  inherited;
  if (TBZoom.Position >= 0) and (TBZoom.Position <= 10) then
  begin
    RvRenderPreview.ZoomFactor := 50+(10*TBZoom.Position);
  Label2.Caption := IntToStr(50+(10*TBZoom.Position))+' %';
  end;
end;

procedure TFUniversalPreview.setReportName(n: string);
begin
  self.RepName := n;
end;

procedure TFUniversalPreview.FormShow(Sender: TObject);
begin
  inherited;
  RvPrInfGralGest.Open;
  RvPrInfGralGest.SelectReport(self.RepName,False);
  setParams;
  RvPrInfGralGest.Execute();
  RvRenderPreview.Render(RvNDRWriter.FileName);
  RvPrInfGralGest.Close;
end;

procedure TFUniversalPreview.setParams;
var
  renglonAbajo1,renglonAbajo2: string;
begin
  IBQEstab.ParamByName('id_estab').Value := FPrincipal.EstablecimientoActual;
  IBQEstab.Open;
  RvPrInfGralGest.ClearParams;
  RvPrInfGralGest.SetParam('Titulo',self.PTitulo.Caption);
  RvPrInfGralGest.SetParam('Establecimiento',FPrincipal.NombreEstablecimiento);
  RvPrInfGralGest.SetParam('Propietario',IBQEstabPROPIETARIO.AsString);
  IBQEstab.Close;
  IBQPropietario.Open;
  RvPrInfGralGest.SetParam('Empresa', IBQPropietarioEMPRESA.AsString);
  renglonAbajo1 := '';
  renglonAbajo2 := '';
  if (FPrincipal.TipoVersion = TVveterinario) then
  begin
    RvPrInfGralGest.SetParam('Veterinario',FPrincipal.Renspa);
  end;

  if IBQPropietarioDIRECCION.AsString <> '' then
    renglonAbajo1 := renglonAbajo1+IBQPropietarioDIRECCION.AsString+' - ';
  if IBQPropietarioTELEFONO.AsString <> '' then
    renglonAbajo1 := renglonAbajo1+IBQPropietarioTELEFONO.AsString+' - ';
  if IBQPropietarioCELULAR.AsString <> '' then
    renglonAbajo1 := renglonAbajo1+IBQPropietarioCELULAR.AsString;
  if IBQPropietarioEMAIL.AsString <> '' then
    renglonAbajo2 := renglonAbajo2+IBQPropietarioEMAIL.AsString+' - ';
  if IBQPropietarioURL.AsString <> '' then
    renglonAbajo2 := renglonAbajo2+IBQPropietarioURL.AsString;
  IBQPropietario.Close;

  RvPrInfGralGest.SetParam('RenglonAbajo1',renglonAbajo1);
  RvPrInfGralGest.SetParam('RenglonAbajo2',renglonAbajo2);
end;


procedure TFUniversalPreview.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if SDPDF.Execute then
  begin
    RvRenderPDF1.OutputFileName := SDPDF.FileName;
    RvRenderPDF1.Render(RvNDRWriter.FileName);
    MostrarMensaje(tmInformacion,'El archivo se ha guardado correctamente');
  end;

end;

procedure TFUniversalPreview.BitBtn3Click(Sender: TObject);
var
  attach: TIdAttachment;
  filename: string;
  FSE: TFSendEmail;
begin
  inherited;
  filename := 'Reporte.pdf';
  FSE := TFSendEmail.Create(self);
  FSE.LAttachments.Caption := filename;
  FSE.ShowModal;
  if (FSE.result) then
  begin
    RvRenderPDF1.OutputFileName := 'C:\Proyecto\softvet\Sistema\Objetos\'+filename;
    RvRenderPDF1.Render(RvNDRWriter.FileName);
    with IdMessage1 do
    begin
      Subject := FSE.ESubject.Text;
      Body.Text := FSE.MBody.Text;
      From.Name := 'ACA VA EL EMAIL DEL EMISOR!!!!!!';
      From.Address := 'pepe@softhuella.com.ar';
      Sender.Address := 'sac@softhuella.com.ar';
      Recipients.EMailAddresses := Trim(FSE.MemoTo.Text);
      CCList.EMailAddresses := Trim(FSE.MemoCC.Text);
      BccList.EMailAddresses := Trim(FSE.MemoCCO.Text);
    end;
    attach := TIdAttachment.Create(IdMessage1.MessageParts,'C:\Proyecto\softvet\Sistema\Objetos\reporte.pdf');
    IdSMTP1.Connect();
    IdSMTP1.Send(IdMessage1);
    IdSMTP1.Disconnect;
    attach.Free;
    IdMessage1.Free;
    IdSMTP1.Free;
  end;
  FSE.Destroy;
end;

end.
