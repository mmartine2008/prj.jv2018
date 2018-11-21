unit UModificacionDosisPrecioSemen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, ImgList, PngImageList, IBQuery, WinXP,
  DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList,
  ComCtrls, JvExControls, JvLabel, ExtCtrls, JvGIF, Buttons, PngImage, jpeg,
  JvExStdCtrls, JvEdit, JvExExtCtrls, JvImage;

type                                             
  TFModificacionDosisPrecioSemen = class(TFUniversal)
    GBSuper: TGroupBox;
    GBCentral: TGroupBox;
    IBQDatosAnimalInterno: TIBQuery;
    IBQDatosAnimalExterno: TIBQuery;
    LNombre: TLabel;
    LNombreValue: TLabel;
    LApodo: TLabel;
    LApodoValue: TLabel;
    LRp: TLabel;
    LRpValue: TLabel;
    LHba: TLabel;
    LHbaValue: TLabel;
    LAba: TLabel;
    LAbaValue: TLabel;
    LFechaNac: TLabel;
    LFechaNacValue: TLabel;
    LRaza: TLabel;
    LRazaValue: TLabel;
    LColor: TLabel;
    LColorValue: TLabel;
    LTipoRegistro: TLabel;
    LTipoRegistroValue: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    IBQRazas: TIBQuery;
    IBQColor: TIBQuery;
    IBQSubcategoria: TIBQuery;
    PBotones: TPanel;
    IFondoB: TImage;
    ITerminar: TImage;
    LTerminar: TLabel;
    LCancelar: TLabel;
    ICancelar: TImage;
    BBCancelar: TBitBtn;
    BBAceptar: TBitBtn;
    BBAyuda: TBitBtn;
    LDosis: TLabel;
    LPrecioDosis: TLabel;
    DTPFechaModif: TDateTimePicker;
    LFecha: TLabel;
    LDosisActuales: TLabel;
    LDosisActualesValue: TLabel;
    LPrecioDosisActual: TLabel;
    LPrecioDosisActualValue: TLabel;
    JvEDosis: TJvEdit;
    JvEPrecio: TJvEdit;
    IBQModificarDatos: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvEPrecioExit(Sender: TObject);
    procedure JvEPrecioKeyPress(Sender: TObject; var Key: Char);
    procedure ITerminarClick(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_animal : integer;
    tipo_animal : string;
    dosis_actuales : integer;
    precio_actual : double;
  end;

var
  FModificacionDosisPrecioSemen: TFModificacionDosisPrecioSemen;

implementation

uses uTiposGlobales,UPrincipal;

{$R *.dfm}

procedure TFModificacionDosisPrecioSemen.FormCreate(Sender: TObject);
begin
  inherited;

  LHba.Visible := false;
  LHbaValue.Visible := false;
  LAba.Visible := false;
  LAbaValue.Visible := false;

end;

procedure TFModificacionDosisPrecioSemen.FormShow(Sender: TObject);
begin
  inherited;

  DTPFechaModif.Date := Now();

  LDosisActualesValue.Caption := IntToStr(dosis_actuales);
  LPrecioDosisActualValue.Caption := '$ '+FloatToStr(precio_actual);

  JvEDosis.Text := IntToStr(dosis_actuales);
  JvEPrecio.Text := FloatToStr(precio_actual);

  LRpValue.Caption := '-';
  LNombreValue.Caption := '-';
  LApodoValue.Caption := '-';
  LRazaValue.Caption := '-';
  LTipoRegistroValue.Caption := '-';
  LColorValue.Caption := '-';
  LFechaNacValue.Caption := '-';

  if (id_animal <> -1) then
  begin
      if (tipo_animal = 'INTERNO') then
      begin
           IBQDatosAnimalInterno.Close;
           IBQDatosAnimalInterno.ParamByName('id').AsInteger := id_animal;
           IBQDatosAnimalInterno.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQDatosAnimalInterno.Open;

           IBQColor.Close;
           IBQColor.ParamByName('color').AsInteger := IBQDatosAnimalInterno.FieldValues['color'];
           IBQColor.Open;

           IBQRazas.Close;
           IBQRazas.ParamByName('raza').AsInteger := IBQDatosAnimalInterno.FieldValues['raza'];
           IBQRazas.Open;

           IBQSubcategoria.Close;
           IBQSubcategoria.ParamByName('subcategoria').AsInteger := IBQDatosAnimalInterno.FieldValues['subcategoria'];
           IBQSubcategoria.Open;

           if (IBQDatosAnimalInterno.FieldValues['id_rp'] <> null) then
             LRpValue.Caption := IBQDatosAnimalInterno.FieldValues['id_rp'];

           if (IBQDatosAnimalInterno.FieldValues['nombre'] <> null) then
             LNombreValue.Caption := IBQDatosAnimalInterno.FieldValues['nombre'];

           if (IBQDatosAnimalInterno.FieldValues['apodo'] <> null) then
             LApodoValue.Caption := IBQDatosAnimalInterno.FieldValues['apodo'];

           if (IBQRazas.FieldValues['sinonimo'] <> null) then
             LRazaValue.Caption := IBQRazas.FieldValues['sinonimo'];

           if (IBQSubcategoria.FieldValues['sinonimo'] <> null) then
             LTipoRegistroValue.Caption := IBQSubcategoria.FieldValues['sinonimo'];

           if (IBQColor.FieldValues['nombre'] <> null) then
             LColorValue.Caption := IBQColor.FieldValues['nombre'];

           if (IBQDatosAnimalInterno.FieldValues['fecha_nacimiento'] <> null) then
             LFechaNacValue.Caption := IBQDatosAnimalInterno.FieldValues['fecha_nacimiento'];

           if ((IBQDatosAnimalInterno.FieldValues['raza'] = 2) or (IBQDatosAnimalInterno.FieldValues['raza'] = 3) or (IBQDatosAnimalInterno.FieldValues['raza'] = 29)) then
           begin
              if (IBQDatosAnimalInterno.FieldValues['id_hba'] <> null) then
              begin
                  LHba.Visible := true;
                  LHbaValue.Visible := true;
                  LHbaValue.Caption := IBQDatosAnimalInterno.FieldValues['id_hba'];
              end;
           end;

           if ((IBQDatosAnimalInterno.FieldValues['raza'] = 10) or (IBQDatosAnimalInterno.FieldValues['raza'] = 11) or (IBQDatosAnimalInterno.FieldValues['raza'] = 12) or (IBQDatosAnimalInterno.FieldValues['raza'] = 28) or (IBQDatosAnimalInterno.FieldValues['raza'] = 30)) then
           begin
              if (IBQDatosAnimalInterno.FieldValues['id_pc'] <> null) then
              begin
                  LAba.Visible := true;
                  LAbaValue.Visible := true;
                  LAbaValue.Caption := IBQDatosAnimalInterno.FieldValues['id_pc'];
              end;
           end;
      end;

      if (tipo_animal = 'EXTERNO') then
      begin
           IBQDatosAnimalExterno.Close;
           IBQDatosAnimalExterno.ParamByName('id').AsInteger := id_animal;
           IBQDatosAnimalExterno.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQDatosAnimalExterno.Open;

           IBQColor.Close;
           IBQColor.ParamByName('color').AsInteger := IBQDatosAnimalExterno.FieldValues['color'];
           IBQColor.Open;

           IBQRazas.Close;
           IBQRazas.ParamByName('raza').AsInteger := IBQDatosAnimalExterno.FieldValues['raza'];
           IBQRazas.Open;

       {    IBQSubcategoria.Close;
           IBQSubcategoria.ParamByName('subcategoria').AsInteger := IBQDatosAnimalExterno.FieldValues['subcategoria'];
           IBQSubcategoria.Open;       }

           if (IBQDatosAnimalExterno.FieldValues['id_rp'] <> null) then
             LRpValue.Caption := IBQDatosAnimalExterno.FieldValues['id_rp'];

           if (IBQDatosAnimalExterno.FieldValues['nombre'] <> null) then
             LNombreValue.Caption := IBQDatosAnimalExterno.FieldValues['nombre'];

           if (IBQDatosAnimalExterno.FieldValues['apodo'] <> null) then
             LApodoValue.Caption := IBQDatosAnimalExterno.FieldValues['apodo'];

           if (IBQRazas.FieldValues['sinonimo'] <> null) then
             LRazaValue.Caption := IBQRazas.FieldValues['sinonimo'];

      //     if (IBQSubcategoria.FieldValues['sinonimo'] <> null) then
             LTipoRegistroValue.Caption := '';

           if (IBQColor.FieldValues['nombre'] <> null) then
             LColorValue.Caption := IBQColor.FieldValues['nombre'];

           if (IBQDatosAnimalExterno.FieldValues['fecha_nacimiento'] <> null) then
             LFechaNacValue.Caption := IBQDatosAnimalExterno.FieldValues['fecha_nacimiento'];

           if ((IBQDatosAnimalExterno.FieldValues['raza'] = 2) or (IBQDatosAnimalExterno.FieldValues['raza'] = 3) or (IBQDatosAnimalExterno.FieldValues['raza'] = 29)) then
           begin
              if (IBQDatosAnimalExterno.FieldValues['id_hba'] <> null) then
              begin
                  LHba.Visible := true;
                  LHbaValue.Visible := true;
                  LHbaValue.Caption := IBQDatosAnimalExterno.FieldValues['id_hba'];
              end;
           end;

           if ((IBQDatosAnimalExterno.FieldValues['raza'] = 10) or (IBQDatosAnimalExterno.FieldValues['raza'] = 11) or (IBQDatosAnimalExterno.FieldValues['raza'] = 12) or (IBQDatosAnimalExterno.FieldValues['raza'] = 28) or (IBQDatosAnimalExterno.FieldValues['raza'] = 30)) then
           begin
              if (IBQDatosAnimalExterno.FieldValues['id_pc'] <> null) then
              begin
                  LAba.Visible := true;
                  LAbaValue.Visible := true;
                  LAbaValue.Caption := IBQDatosAnimalExterno.FieldValues['id_pc'];
              end;
           end;
      end;
  end;

end;

procedure TFModificacionDosisPrecioSemen.JvEPrecioExit(Sender: TObject);
begin
  inherited;
  if (JvEPrecio.Text = '') then
      JvEPrecio.Text := FormatFloat('###0.00',0);
end;

procedure TFModificacionDosisPrecioSemen.JvEPrecioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = '.') then
    Key := ',';

  if (pos(',',TJvEdit(Sender).Text)=0) then
  begin
      if not (key in ['0'..'9',',',#8,#13]) then key:=#0;
  end
  else
    if not (key in ['0'..'9',#8,#13]) then key:=#0;

end;

procedure TFModificacionDosisPrecioSemen.ITerminarClick(Sender: TObject);
var dosis_aux : integer;
    precio_aux : double;
begin
  inherited;

  dosis_aux := StrToInt(JvEDosis.Text);
  precio_aux := StrToFloat(JvEPrecio.Text);

  if ((dosis_aux = dosis_actuales) and (precio_aux <> precio_actual)) then
  begin
        //modificar precio
        try
          IBQModificarDatos.Close;
          IBQModificarDatos.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
          IBQModificarDatos.ParamByName('id_animal').AsInteger := id_animal;
          IBQModificarDatos.ParamByName('fecha').AsDate := DTPFechaModif.Date;
          IBQModificarDatos.ParamByName('dosis').AsInteger := dosis_aux;
          IBQModificarDatos.ParamByName('precio').AsFloat := precio_aux;
          IBQModificarDatos.ParamByName('tipo_cambio').AsInteger := 1;
          IBQModificarDatos.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
  end;

  if ((dosis_aux <> dosis_actuales) and (precio_aux = precio_actual)) then
  begin
        //modificar dosis
        try
          IBQModificarDatos.Close;
          IBQModificarDatos.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
          IBQModificarDatos.ParamByName('id_animal').AsInteger := id_animal;
          IBQModificarDatos.ParamByName('fecha').AsDate := DTPFechaModif.Date;
          IBQModificarDatos.ParamByName('dosis').AsInteger := dosis_aux;
          IBQModificarDatos.ParamByName('precio').AsFloat := precio_aux;
          IBQModificarDatos.ParamByName('tipo_cambio').AsInteger := 2;
          IBQModificarDatos.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
  end;

  if ((dosis_aux <> dosis_actuales) and (precio_aux <> precio_actual)) then
  begin
        //modificar precio y dosis
        try
          IBQModificarDatos.Close;
          IBQModificarDatos.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
          IBQModificarDatos.ParamByName('id_animal').AsInteger := id_animal;
          IBQModificarDatos.ParamByName('fecha').AsDate := DTPFechaModif.Date;
          IBQModificarDatos.ParamByName('dosis').AsInteger := dosis_aux;
          IBQModificarDatos.ParamByName('precio').AsFloat := precio_aux;
          IBQModificarDatos.ParamByName('tipo_cambio').AsInteger := 3;
          IBQModificarDatos.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
  end;

  Close();
end;

procedure TFModificacionDosisPrecioSemen.ICancelarClick(Sender: TObject);
begin
  inherited;

  Close();
end;

end.
