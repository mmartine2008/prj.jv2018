unit USelectorRazasPredom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, Buttons, PngImage, jpeg,
  Grids, DBGrids, UBDBGrid, JvExExtCtrls, JvImage;

type
  TFSelectorRazasPredom = class(TFUniversal)
    PSuperior: TPanel;
    PCliente: TPanel;
    PBotones: TPanel;
    IFondoBottom: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    BBAceptar: TBitBtn;
    BBSiaTodo: TBitBtn;
    BBSi: TBitBtn;
    BBNo: TBitBtn;
    BBCancelar: TBitBtn;
    IAceptar: TImage;
    LAceptar: TLabel;
    GBRazasDisponibles: TGroupBox;
    GroupBox2: TGroupBox;
    BDBGRazasDisponibles: TBitDBGrid;
    BDBGRazasPredom: TBitDBGrid;
    IBQRazasDisponibles: TIBQuery;
    DSRazasDisponibles: TDataSource;
    DSRazasPredomSeleccionadas: TDataSource;
    IBQRazasPredomSeleccionadas: TIBQuery;
    PCentral: TPanel;
    BtnAgregarRaza: TButton;
    BtnSacarRaza: TButton;
    IBQInsertAuxRaza: TIBQuery;
    IBQDeleteAuxRaza: TIBQuery;
    IBQLimpiarAuxiliar: TIBQuery;
    IBQRazasElegidas: TIBQuery;
    IBQInsertarRazaPredom: TIBQuery;
    IBQDeleteRazasPredom: TIBQuery;
    IBQInicializarPredom: TIBQuery;
    procedure BtnAgregarRazaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSacarRazaClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure IAceptarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ActualizarLosQuery;
    procedure GuardarRazasPredom;
    procedure Inicializar;
    procedure LimpiarCerrar;
  public
    { Public declarations }
    TipoCarga : integer;
  end;

var
  FSelectorRazasPredom: TFSelectorRazasPredom;

implementation

uses UPrincipal,uTiposGlobales, UMensajeHuella;

{$R *.dfm}

procedure TFSelectorRazasPredom.Inicializar;
begin

     IBQInicializarPredom.Close;
     IBQInicializarPredom.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
     IBQInicializarPredom.Open;

     if (IBQInicializarPredom.RecordCount > 0) then
     begin
          IBQInicializarPredom.First;

          while not(IBQInicializarPredom.Eof) do
          begin
                try
                   IBQInsertAuxRaza.Close;
                   IBQInsertAuxRaza.ParamByName('raza').AsInteger := IBQInicializarPredom.FieldValues['raza_elegida'];
                   IBQInsertAuxRaza.Open;

                   FPrincipal.IBTPrincipal.CommitRetaining;
                except
                   FPrincipal.IBTPrincipal.RollbackRetaining;
                end;

                IBQInicializarPredom.Next;
          end;
     end;

end;

procedure TFSelectorRazasPredom.LimpiarCerrar;
begin

  try
     IBQLimpiarAuxiliar.Close;
     IBQLimpiarAuxiliar.Open;

     FPrincipal.IBTPrincipal.CommitRetaining;
  except
     FPrincipal.IBTPrincipal.RollbackRetaining;
  end;

  Close();
  
end;

procedure TFSelectorRazasPredom.GuardarRazasPredom;
begin

    IBQRazasElegidas.Close;
    IBQRazasElegidas.Open;

    if (IBQRazasElegidas.RecordCount > 0) then
    begin

        try
           IBQDeleteRazasPredom.Close;
           IBQDeleteRazasPredom.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQDeleteRazasPredom.Open;

           FPrincipal.IBTPrincipal.CommitRetaining;

           IBQRazasElegidas.First;
           while not(IBQRazasElegidas.Eof) do
           begin
               try
                  IBQInsertarRazaPredom.Close;
                  IBQInsertarRazaPredom.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
                  IBQInsertarRazaPredom.ParamByName('raza_predom').AsInteger := 0;
                  IBQInsertarRazaPredom.ParamByName('raza_elegida').AsInteger := IBQRazasElegidas.FieldValues['raza'];
                  IBQInsertarRazaPredom.Open;

                  FPrincipal.IBTPrincipal.CommitRetaining;
               except
                  FPrincipal.IBTPrincipal.RollbackRetaining;
               end;
               IBQRazasElegidas.Next;
           end;
           
        except
           FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
    end;

end;

procedure TFSelectorRazasPredom.ActualizarLosQuery;
begin

     IBQRazasPredomSeleccionadas.Close;
     IBQRazasPredomSeleccionadas.Open;
     IBQRazasPredomSeleccionadas.Last;
     IBQRazasPredomSeleccionadas.First;


     IBQRazasDisponibles.Close;
     IBQRazasDisponibles.Open;
     IBQRazasDisponibles.Last;
     IBQRazasDisponibles.First;

     BtnAgregarRaza.SetFocus;

     if (IBQRazasPredomSeleccionadas.RecordCount > 0) then
     begin
          IAceptar.Visible := true;
          LAceptar.Visible := true;

          BtnSacarRaza.Enabled := true;
     end
     else
     begin
          IAceptar.Visible := false;
          LAceptar.Visible := false;

          BtnSacarRaza.Enabled := false;
     end;

     if (IBQRazasDisponibles.RecordCount > 0) then
        BtnAgregarRaza.Enabled := true
     else
        BtnAgregarRaza.Enabled := false;

end;

procedure TFSelectorRazasPredom.BtnAgregarRazaClick(Sender: TObject);
var i:integer;
begin
  if BDBGRazasDisponibles.SelectedRows.Count > 0 then
  begin
    with BDBGRazasDisponibles.DataSource.DataSet do
    for i:=0 to BDBGRazasDisponibles.SelectedRows.Count-1 do
    begin
        GotoBookmark(pointer(BDBGRazasDisponibles.SelectedRows.Items[i]));

        try
           IBQInsertAuxRaza.Close;
           IBQInsertAuxRaza.ParamByName('raza').AsInteger := BDBGRazasDisponibles.DataSource.DataSet.FieldValues['id_raza'];
           IBQInsertAuxRaza.Open;

           FPrincipal.IBTPrincipal.CommitRetaining;
        except
           FPrincipal.IBTPrincipal.RollbackRetaining;
        end;

    end;
    BDBGRazasDisponibles.SelectedRows.Clear;
    ActualizarLosQuery;
  end;

end;

procedure TFSelectorRazasPredom.FormShow(Sender: TObject);
begin
  inherited;

  if (TipoCarga = 1) then // Ya esta creado el establecimiento
  begin
    Inicializar;
    ActualizarLosQuery;
  end;

  if (TipoCarga = 0) then // No esta creado el establecimiento
  begin
    ActualizarLosQuery;
  end;

end;

procedure TFSelectorRazasPredom.BtnSacarRazaClick(Sender: TObject);
var i:integer;
begin
  if BDBGRazasPredom.SelectedRows.Count > 0 then
  begin
    with BDBGRazasPredom.DataSource.DataSet do
    for i:=0 to BDBGRazasPredom.SelectedRows.Count-1 do
    begin
        GotoBookmark(pointer(BDBGRazasPredom.SelectedRows.Items[i]));

        try
           IBQDeleteAuxRaza.Close;
           IBQDeleteAuxRaza.ParamByName('ra').AsInteger := BDBGRazasPredom.DataSource.DataSet.FieldValues['id_raza'];
           IBQDeleteAuxRaza.Open;

           FPrincipal.IBTPrincipal.CommitRetaining;
        except
           FPrincipal.IBTPrincipal.RollbackRetaining;
        end;

    end;
    BDBGRazasPredom.SelectedRows.Clear;
    ActualizarLosQuery;
  end;

end;

procedure TFSelectorRazasPredom.ISalirClick(Sender: TObject);
begin
  inherited;

  LimpiarCerrar;
end;

procedure TFSelectorRazasPredom.IAceptarClick(Sender: TObject);
begin
  inherited;

  MostrarMensaje(tmInformacion,'Los datos han sido guardados.');

  if (TipoCarga = 1) then
  begin
    GuardarRazasPredom;

    LimpiarCerrar;
  end;

  if (TipoCarga = 0) then
    Close();
  
end;

end.
