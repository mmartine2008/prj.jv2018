unit UDatosSiembra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, DBCtrls, UDBLookupComboBoxAuto, Mask,
  UDBEditAuto, jpeg, PngImage, IBUpdateSQL, ImgList, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFDatosSiembra = class(TFUniversal)
    PBottom: TPanel;
    PTop: TPanel;
    Pcli: TPanel;
    LPotrero: TLabel;
    DBLCBAPotreros: TDBLookupComboBoxAuto;
    IBQPotreros: TIBQuery;
    DSPotreros: TDataSource;
    IBQDatosSiembra: TIBQuery;
    DSDatosSiembra: TDataSource;
    DBEFechaSiembra: TDBEditAuto;
    IBQCodigoSiembra: TIBQuery;
    DSCodSiembra: TDataSource;
    IBQDatosSiembraID_DATO: TIntegerField;
    IBQDatosSiembraPOTRERO: TIntegerField;
    IBQDatosSiembraESTABLECIMIENTO: TIntegerField;
    IBQDatosSiembraSIEMBRA: TIntegerField;
    IBQDatosSiembraPRODUCCION: TFloatField;
    IBQDatosSiembraFECHA_SIEMBRA: TDateField;
    IBQDatosSiembraFECHA_COSECHA: TDateField;
    IBQDatosSiembraNOM_SIEMBRA: TStringField;
    DBEFechaCosecha: TDBEditAuto;
    DBLCBATipoSiembra: TDBLookupComboBoxAuto;
    DBEAProduccion: TDBEditAuto;
    Label1: TLabel;
    Label2: TLabel;
    LTipoSiembra: TLabel;
    Label4: TLabel;
    IBUDatosAgricolas: TIBUpdateSQL;
    IAceptar: TImage;
    LAceptar: TLabel;
    ICancelar: TImage;
    LCancelar: TLabel;
    Image1: TImage;
    IAgregar: TImage;
    LAgregar: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure IAceptarClick(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
    procedure DBLCBAPotrerosCloseUp(Sender: TObject);
    procedure LTipoSiembraClick(Sender: TObject);
    procedure LTipoSiembraMouseEnter(Sender: TObject);
    procedure LTipoSiembraMouseLeave(Sender: TObject);
    procedure IBQDatosSiembraBeforePost(DataSet: TDataSet);
    procedure IAgregarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDatosSiembra: TFDatosSiembra;

implementation

{$R *.dfm}

uses
  UPrincipal, UABMDatosSiembra;

procedure TFDatosSiembra.FormCreate(Sender: TObject);
begin
  inherited;
  IBQCodigoSiembra.Close;
  IBQCodigoSiembra.Open;
  IBQPotreros.Close;
  IBQPotreros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotreros.Open;
  IBQPotreros.Last;
  IBQPotreros.First;
end;

procedure TFDatosSiembra.IAceptarClick(Sender: TObject);
begin
  inherited;
  FPrincipal.IBDPrincipal.ApplyUpdates([IBQDatosSiembra]);
  Close;
end;

procedure TFDatosSiembra.ICancelarClick(Sender: TObject);
begin
  inherited;
  IBQDatosSiembra.CancelUpdates;
  Close;
end;

procedure TFDatosSiembra.DBLCBAPotrerosCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBAPotreros.KeyValue <> null then
  begin
    Pcli.Visible := true;
    IBQDatosSiembra.Close;
    IBQDatosSiembra.ParamByName('pot').AsInteger := DBLCBAPotreros.KeyValue;
    IBQDatosSiembra.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDatosSiembra.Open;
  end;
end;

procedure TFDatosSiembra.LTipoSiembraClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AbrirFormNormal(TFABMDatosSiembra.Create(self));
    IBQCodigoSiembra.Close;
    IBQCodigoSiembra.Open;
  end;
end;

procedure TFDatosSiembra.LTipoSiembraMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LTipoSiembra.Font.Color:= $00606C02;
      LTipoSiembra.Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFDatosSiembra.LTipoSiembraMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LTipoSiembra.Font.Color:= clWindowText;
      LTipoSiembra.Font.Style:= [fsUnderline];
  end;
end;

procedure TFDatosSiembra.IBQDatosSiembraBeforePost(DataSet: TDataSet);
begin
  inherited;
  IBQDatosSiembra.FieldValues['establecimiento'] := FPrincipal.EstablecimientoActual;
  IBQDatosSiembra.FieldValues['potrero'] := DBLCBAPotreros.KeyValue;
end;

procedure TFDatosSiembra.IAgregarClick(Sender: TObject);
begin
  inherited;
  IBQDatosSiembra.Insert;
end;

end.
