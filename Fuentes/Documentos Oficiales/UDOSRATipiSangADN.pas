unit UDOSRATipiSangADN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, DBCtrls, UDBLookupComboBoxAuto, StdCtrls, ComCtrls,
  IBQuery, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc,
  ActnList, ExtCtrls, UFrameDBSeleccion, Grids, DBGrids, UBDBGrid, EditAuto,
  Buttons, UDOSRATipiSangADNPreview, UFrameMangazo, JvGIF, PngImage, jpeg,
  JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFDOSRATipiSangADN = class(TFUniversal)
    PCDatos: TPageControl;
    TSDatos: TTabSheet;
    TSCertificado: TTabSheet;
    ScrollBox1: TScrollBox;
    Shape5: TShape;
    Label14: TLabel;
    Shape1: TShape;
    Label16: TLabel;
    Label17: TLabel;
    BDBGTipiADN: TBitDBGrid;
    IBDSTipiADN: TIBDataSet;
    IBQREPTipiADN: TIBQuery;
    DSTipiADN: TDataSource;
    ESolicitante: TEdit;
    EDireccion: TEdit;
    Mangazo1: TMangazo;
    Label1: TLabel;
    CBTipi: TCheckBox;
    CBADN: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ETEEstablecimiento: TEdit;
    Label7: TLabel;
    ETEAdministrativo: TEdit;
    Label11: TLabel;
    ENroCriador: TEdit;
    Label12: TLabel;
    ENroCuentaCorriente: TEdit;
    Label13: TLabel;
    ENroSocio: TEdit;
    DSREPTipiADN: TDataSource;
    IBQDelAuxEventos: TIBQuery;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    Label19: TLabel;
    ISig: TImage;
    Iant: TImage;
    Lant: TLabel;
    LSig: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure PCDatosChange(Sender: TObject);
    procedure BBSalirClick(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure BBSiguienteClick(Sender: TObject);
    procedure BBAnteriorClick(Sender: TObject);
    procedure Mangazo1IBQSeleccionadosAfterPost(DataSet: TDataSet);
    procedure Mangazo1IBQSeleccionadosAfterDelete(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Mangazo1IBuscarAnimalClick(Sender: TObject);
  private
    procedure BorrarAuxiliares;
    procedure Seleccionar(Sender : TObject);
    procedure ArmarPreview(F : TFDOSRATipiSangADNPreview);
    procedure BorrarAuxEventos;
  public

  end;

var
  FDOSRATipiSangADN: TFDOSRATipiSangADN;

implementation

uses
  UPrincipal, UDMSoftvet, UCartel;

{$R *.dfm}

procedure TFDOSRATipiSangADN.FormCreate(Sender: TObject);
begin
  inherited;
  Mangazo1.IBQSeleccionados.Close;
  Mangazo1.IBQSeleccionados.Open;
  Mangazo1.ConJoin := true;
  Mangazo1.SQLBasico := 'select ta.id_animal, ta.id_rp, ta.id_senasa, cr.sinonimo as raza, ta.nombre from tab_animales ta join cod_razas cr on ta.raza = cr.id_raza where ta.establecimiento = :establecimiento and id_animal not in (select id_animal from aux_animales)';
  Mangazo1.PasarParametros(0,0);
  Mangazo1.RBTodasClick(nil);
end;

procedure TFDOSRATipiSangADN.Seleccionar(Sender : TObject);
begin
  Mangazo1.IBQSeleccionados.Insert;
  Mangazo1.IBQSeleccionados.FieldByName('ID_ANIMAL').Value := Mangazo1.IBQDisponibles.FieldValues['ID_ANIMAL'];
  Mangazo1.IBQSeleccionados.FieldByName('ID_RP').Value := Mangazo1.IBQDisponibles.FieldValues['ID_RP'];
  Mangazo1.IBQSeleccionados.FieldByName('ID_SENASA').Value := Mangazo1.IBQDisponibles.FieldValues['ID_SENASA'];
  Mangazo1.IBQSeleccionados.FieldByName('RAZA').Value := Mangazo1.IBQDisponibles.FieldValues['RAZA'];
  Mangazo1.IBQSeleccionados.FieldByName('NOMBRE').Value := Mangazo1.IBQDisponibles.FieldValues['NOMBRE'];  
  Mangazo1.IBQSeleccionados.FieldByName('ID_AUX').Value := 1;
end;

procedure TFDOSRATipiSangADN.BorrarAuxiliares;
begin
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFDOSRATipiSangADN.PCDatosChange(Sender: TObject);
begin
  inherited;
  BBImprimirReporte.Enabled := PCDatos.ActivePage = TSCertificado;
end;

procedure TFDOSRATipiSangADN.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFDOSRATipiSangADN.BBImprimirReporteClick(
  Sender: TObject);
var
  F : TFDOSRATipiSangADNPreview;
  C : TCartel;
begin
  inherited;
  C := TCartel.getInstance;
  C.abrircartel('Generando Certificado de Tipificación Sanguinea y ADN');
  F := TFDOSRATipiSangADNPreview.Create(nil);
  ArmarPreview(F);
  C.cerrarcartel;
  C.FreeInstance;
  F.ShowModal;
  F.Destroy;
end;

procedure TFDOSRATipiSangADN.ArmarPreview(F : TFDOSRATipiSangADNPreview);
begin
  F.QRLSolicitante.Caption:= ESolicitante.Text;
  F.QRLDireccion.Caption:= EDireccion.Text;
  F.QRLTEEstab.Caption:= ETEEstablecimiento.Text;
  F.QRLTEAdmin.Caption:= ETEAdministrativo.Text;
  F.QRLCriador.Caption:= ENroCriador.Text;
  F.QRLCC.Caption:= ENroCuentaCorriente.Text;
  F.QRLSocio.Caption:= ENroSocio.Text;

  F.QRLCheckTipi.Enabled:= CBTipi.Checked;
  F.QRLCheckADN.Enabled:= CBADN.Checked;
end;

procedure TFDOSRATipiSangADN.BBSiguienteClick(Sender: TObject);
begin
  inherited;
  //BBSiguiente.Enabled := false;
  //BBAnterior.Enabled := true;
  LSig.Enabled := false;
  ISig.Enabled := false;
  Lant.Enabled := true;
  Iant.Enabled := true;

  if PCDatos.ActivePage = TSDatos then
    begin
      PCDatos.ActivePage := TSCertificado;
      BorrarAuxEventos;
    try
      IBQREPTipiADN.Close;
      IBQREPTipiADN.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
      IBQREPTipiADN.Open;      
      IBDSTipiADN.Close;
      IBDSTipiADN.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
     except
      FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
    end;
  PCDatosChange(nil);
end;

procedure TFDOSRATipiSangADN.BBAnteriorClick(Sender: TObject);
begin
  inherited;
  //BBSiguiente.Enabled := true;
  //BBAnterior.Enabled := false;
  LSig.Enabled := true;
  ISig.Enabled := true;
  Lant.Enabled := false;
  Iant.Enabled := false;
  
  if PCDatos.ActivePage = TSCertificado then
    PCDatos.ActivePage := TSDatos;
  PCDatosChange(nil);
end;

procedure TFDOSRATipiSangADN.Mangazo1IBQSeleccionadosAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  Mangazo1.IBQSeleccionadosAfterPost(DataSet);
  TSCertificado.TabVisible := not DataSet.IsEmpty;
  //BBSiguiente.Enabled := not DataSet.IsEmpty;
  LSig.Enabled := not DataSet.IsEmpty;
  ISig.Enabled := not DataSet.IsEmpty;
end;

procedure TFDOSRATipiSangADN.Mangazo1IBQSeleccionadosAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  Mangazo1.IBQSeleccionadosAfterPost(DataSet);
  TSCertificado.TabVisible := not DataSet.IsEmpty;
  //BBSiguiente.Enabled := not DataSet.IsEmpty;
  LSig.Enabled := not DataSet.IsEmpty;
  ISig.Enabled := not DataSet.IsEmpty;
end;

procedure TFDOSRATipiSangADN.FormShow(Sender: TObject);
begin
  inherited;
  PCDatos.ActivePage:= TSDatos;
end;

procedure TFDOSRATipiSangADN.BorrarAuxEventos;
begin
  try
    IBQDelAuxEventos.Close;
    IBQDelAuxEventos.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFDOSRATipiSangADN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  BorrarAuxiliares();
end;

procedure TFDOSRATipiSangADN.Mangazo1IBuscarAnimalClick(Sender: TObject);
begin
  inherited;
  Mangazo1.IBuscarAnimalClick(Sender);

end;

end.
