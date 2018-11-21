unit URepReferenciasPesosPrecios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  Buttons, DateTimePickerAuto, DBCtrls, UDBLookupComboBoxAuto, EditAuto,
  JvExExtCtrls, JvExtComponent, JvRollOut, JvExControls, JvLabel, JvGIF,
  ImgList, PngImageList, pngimage, JvImage;

type
  TFRepReferenciasPesosPrecios = class(TFUniversal)
    PPanel: TPanel;
    PBoton: TPanel;
    GroupBox1: TGroupBox;
    BBAceptar: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    IBQUpdateUltimoRefCat: TIBQuery;
    IBQUpdateDatosTabPesoPrecioCat: TIBQuery;
    IBQInsertDatosTabPesoPrecioCat: TIBQuery;
    IBQDatosTabPesoPrecioCatSalidas: TIBQuery;
    DSDatosTabPesoPrecioCatSalidas: TDataSource;
    DSQFechaTabPesoPrecioCatSalidas: TDataSource;
    IBQFechaTabPesoPrecioCatSalidas: TIBQuery;
    DSNombreReferenciaSalidas: TDataSource;
    IBQNombreReferenciaSalidas: TIBQuery;
    IBQDeleteDatosTabPesoPrecioCat: TIBQuery;
    DSDatosTabPesoPrecioCatEntradas: TDataSource;
    IBQDatosTabPesoPrecioCatEntradas: TIBQuery;
    DSQFechaTabPesoPrecioCatEntradas: TDataSource;
    IBQFechaTabPesoPrecioCatEntradas: TIBQuery;
    DSNombreReferenciaEntradas: TDataSource;
    IBQNombreReferenciaEntradas: TIBQuery;
    DSDatosTabPesoPrecioCatExistenciaFinal: TDataSource;
    IBQDatosTabPesoPrecioCatExistenciaFinal: TIBQuery;
    DSQFechaTabPesoPrecioCatExistenciaFinal: TDataSource;
    IBQFechaTabPesoPrecioCatExistenciaFinal: TIBQuery;
    DSNombreReferenciaExistenciaFinal: TDataSource;
    IBQNombreReferenciaExistenciaFinal: TIBQuery;
    BBSalir: TBitBtn;
    DSDatosTabPesoPrecioCatExistenciaInicial: TDataSource;
    IBQDatosTabPesoPrecioCatExistenciaInicial: TIBQuery;
    DSQFechaTabPesoPrecioCatExistenciaInicial: TDataSource;
    IBQFechaTabPesoPrecioCatExistenciaInicial: TIBQuery;
    DSNombreReferenciaExistenciaInicial: TDataSource;
    IBQNombreReferenciaExistenciaInicial: TIBQuery;
    IBQTABREFCAT: TIBQuery;
    Panel3: TPanel;
    JvSalidas: TJvRollOut;
    GBSalidas: TGroupBox;
    Shape20: TShape;
    Shape21: TShape;
    Shape39: TShape;
    Shape38: TShape;
    Shape40: TShape;
    Shape41: TShape;
    Shape42: TShape;
    Shape43: TShape;
    LTernerosSalidas: TLabel;
    LTernerasSalidas: TLabel;
    LVaquillonasSalidas: TLabel;
    LTorosSalidas: TLabel;
    LNovillosSalidas: TLabel;
    LVacasSalidas: TLabel;
    Label56: TLabel;
    Label55: TLabel;
    Label54: TLabel;
    Label53: TLabel;
    Label46: TLabel;
    LReferenciasSalidas: TLabel;
    Label37: TLabel;
    EAPesoPromVaquillonasSalidas: TEditAuto;
    EAPesoPromTernerasSalidas: TEditAuto;
    EAPesoPromTernerosSalidas: TEditAuto;
    EAPrecioPromTernerosSalidas: TEditAuto;
    EAPrecioPromTernerasSalidas: TEditAuto;
    EAPrecioPromVaquillonasSalidas: TEditAuto;
    EAPesoPromVacasSalidas: TEditAuto;
    EAPesoPromNovillosSalidas: TEditAuto;
    EAPesoPromTorosSalidas: TEditAuto;
    EAPrecioPromTorosSalidas: TEditAuto;
    EAPrecioPromNovillosSalidas: TEditAuto;
    EAPrecioPromVacasSalidas: TEditAuto;
    DBLCBAFechaTabPesoPrecioCatSalidas: TDBLookupComboBoxAuto;
    DTPAFechaReferenciaSalidas: TDateTimePickerAuto;
    BBNuevaSalidas: TBitBtn;
    BBModificarSalidas: TBitBtn;
    BBEliminarSalidas: TBitBtn;
    EANombreSalidas: TEditAuto;
    DBLCBANombreReferenciaSalidas: TDBLookupComboBoxAuto;
    Panel4: TPanel;
    JvEntradas: TJvRollOut;
    GBEntradas: TGroupBox;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    LTernerosEntradas: TLabel;
    LTernerasEntradas: TLabel;
    LVaquillonasEntradas: TLabel;
    LTorosEntradas: TLabel;
    LNovillosEntradas: TLabel;
    LVacasEntradas: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    LReferenciasEntradas: TLabel;
    Label13: TLabel;
    EAPesoPromVaquillonasEntradas: TEditAuto;
    EAPesoPromTernerasEntradas: TEditAuto;
    EAPesoPromTernerosEntradas: TEditAuto;
    EAPrecioPromTernerosEntradas: TEditAuto;
    EAPrecioPromTernerasEntradas: TEditAuto;
    EAPrecioPromVaquillonasEntradas: TEditAuto;
    EAPesoPromVacasEntradas: TEditAuto;
    EAPesoPromNovillosEntradas: TEditAuto;
    EAPesoPromTorosEntradas: TEditAuto;
    EAPrecioPromTorosEntradas: TEditAuto;
    EAPrecioPromNovillosEntradas: TEditAuto;
    EAPrecioPromVacasEntradas: TEditAuto;
    DBLCBAFechaTabPesoPrecioCatEntradas: TDBLookupComboBoxAuto;
    DTPAFechaReferenciaEntradas: TDateTimePickerAuto;
    BBNuevaEntradas: TBitBtn;
    BBModificarEntradas: TBitBtn;
    BBEliminarEntradas: TBitBtn;
    EANombreEntradas: TEditAuto;
    DBLCBANombreReferenciaEntradas: TDBLookupComboBoxAuto;
    Panel5: TPanel;
    JvExistenciaFinal: TJvRollOut;
    GBExistenciaFinal: TGroupBox;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    LTernerosExistenciaFinal: TLabel;
    LTernerasExistenciaFinal: TLabel;
    LVaquillonasExistenciaFinal: TLabel;
    LTorosExistenciaFinal: TLabel;
    LNovillosExistenciaFinal: TLabel;
    LVacasExistenciaFinal: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    LReferenciasExistenciaFinal: TLabel;
    Label19: TLabel;
    EAPesoPromVaquillonasExistenciaFinal: TEditAuto;
    EAPesoPromTernerasExistenciaFinal: TEditAuto;
    EAPesoPromTernerosExistenciaFinal: TEditAuto;
    EAPrecioPromTernerosExistenciaFinal: TEditAuto;
    EAPrecioPromTernerasExistenciaFinal: TEditAuto;
    EAPrecioPromVaquillonasExistenciaFinal: TEditAuto;
    EAPesoPromVacasExistenciaFinal: TEditAuto;
    EAPesoPromNovillosExistenciaFinal: TEditAuto;
    EAPesoPromTorosExistenciaFinal: TEditAuto;
    EAPrecioPromTorosExistenciaFinal: TEditAuto;
    EAPrecioPromNovillosExistenciaFinal: TEditAuto;
    EAPrecioPromVacasExistenciaFinal: TEditAuto;
    DBLCBAFechaTabPesoPrecioCatExistenciaFinal: TDBLookupComboBoxAuto;
    DTPAFechaReferenciaExistenciaFinal: TDateTimePickerAuto;
    BBNuevaExistenciaFinal: TBitBtn;
    BBModificarExistenciaFinal: TBitBtn;
    BBEliminarExistenciaFinal: TBitBtn;
    EANombreExistenciaFinal: TEditAuto;
    DBLCBANombreReferenciaExistenciaFinal: TDBLookupComboBoxAuto;
    Panel6: TPanel;
    JvExistenciaInicial: TJvRollOut;
    GBExistenciaInicial: TGroupBox;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    LTernerosExistenciaInicial: TLabel;
    LTernerasExistenciaInicial: TLabel;
    LVaquillonasExistenciaInicial: TLabel;
    LTorosExistenciaInicial: TLabel;
    LNovillosExistenciaInicial: TLabel;
    LVacasExistenciaInicial: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    LReferenciasExistenciaInicial: TLabel;
    Label25: TLabel;
    EAPesoPromVaquillonasExistenciaInicial: TEditAuto;
    EAPesoPromTernerasExistenciaInicial: TEditAuto;
    EAPesoPromTernerosExistenciaInicial: TEditAuto;
    EAPrecioPromTernerosExistenciaInicial: TEditAuto;
    EAPrecioPromTernerasExistenciaInicial: TEditAuto;
    EAPrecioPromVaquillonasExistenciaInicial: TEditAuto;
    EAPesoPromVacasExistenciaInicial: TEditAuto;
    EAPesoPromNovillosExistenciaInicial: TEditAuto;
    EAPesoPromTorosExistenciaInicial: TEditAuto;
    EAPrecioPromTorosExistenciaInicial: TEditAuto;
    EAPrecioPromNovillosExistenciaInicial: TEditAuto;
    EAPrecioPromVacasExistenciaInicial: TEditAuto;
    DBLCBAFechaTabPesoPrecioCatExistenciaInicial: TDBLookupComboBoxAuto;
    DTPAFechaReferenciaExistenciaInicial: TDateTimePickerAuto;
    BBNuevaExistenciaInicial: TBitBtn;
    BBModificarExistenciaInicial: TBitBtn;
    BBEliminarExistenciaInicial: TBitBtn;
    EANombreExistenciaInicial: TEditAuto;
    DBLCBANombreReferenciaExistenciaInicial: TDBLookupComboBoxAuto;
    Label1: TLabel;
    procedure BBNuevaSalidasClick(Sender: TObject);
    procedure BBModificarSalidasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLCBAFechaTabPesoPrecioCatSalidasCloseUp(Sender: TObject);
    procedure EAPesoPromExit(Sender: TObject);
    procedure EAPesoPromKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBANombreReferenciaSalidasCloseUp(Sender: TObject);
    procedure BBEliminarSalidasClick(Sender: TObject);
    procedure BBNuevaEntradasClick(Sender: TObject);
    procedure BBModificarEntradasClick(Sender: TObject);
    procedure BBEliminarEntradasClick(Sender: TObject);
    procedure DBLCBAFechaTabPesoPrecioCatEntradasCloseUp(Sender: TObject);
    procedure DBLCBANombreReferenciaEntradasCloseUp(Sender: TObject);
    procedure BBNuevaExistenciaFinalClick(Sender: TObject);
    procedure BBModificarExistenciaFinalClick(Sender: TObject);
    procedure BBEliminarExistenciaFinalClick(Sender: TObject);
    procedure DBLCBAFechaTabPesoPrecioCatExistenciaFinalCloseUp(
      Sender: TObject);
    procedure DBLCBANombreReferenciaExistenciaFinalCloseUp(
      Sender: TObject);
    procedure BBNuevaExistenciaInicialClick(Sender: TObject);
    procedure BBModificarExistenciaInicialClick(Sender: TObject);
    procedure BBEliminarExistenciaInicialClick(Sender: TObject);
    procedure DBLCBAFechaTabPesoPrecioCatExistenciaInicialCloseUp(
      Sender: TObject);
    procedure DBLCBANombreReferenciaExistenciaInicialCloseUp(
      Sender: TObject);
    procedure BBSalirClick(Sender: TObject);
    procedure BBAceptarClick(Sender: TObject);
  private
    { Private declarations }
    insertar: Integer; //0 nada - 1 insertar - 2 modificar
    tipoReferencia: String;

    procedure CargarFechaTabPrecioPesoCatSalidas();
    procedure CargarFechaTabPrecioPesoCatEntradas();
    procedure CargarFechaTabPrecioPesoCatExistenciaFinal();
    procedure CargarFechaTabPrecioPesoCatExistenciaInicial();
    procedure CargarNombreReferenciaSalidas();
    procedure CargarNombreReferenciaEntradas();
    procedure CargarNombreReferenciaExistenciaFinal();
    procedure CargarNombreReferenciaExistenciaInicial();
    procedure CargarDatosTabPrecioPesoCatSalidas();
    procedure CargarDatosTabPrecioPesoCatEntradas();
    procedure CargarDatosTabPrecioPesoCatExistenciaFinal();
    procedure CargarDatosTabPrecioPesoCatExistenciaInicial();
    procedure ClearReferenciasFechaTabPrecioPesoCatSalidas();
    procedure ClearReferenciasFechaTabPrecioPesoCatEntradas();
    procedure ClearReferenciasFechaTabPrecioPesoCatExistenciaFinal();
    procedure ClearReferenciasFechaTabPrecioPesoCatExistenciaInicial();
    procedure HabilitarCamposReferenciaSalidas(habilitar: boolean);
    procedure HabilitarCamposReferenciaEntradas(habilitar: boolean);
    procedure HabilitarCamposReferenciaExistenciaFinal(habilitar: boolean);
    procedure HabilitarCamposReferenciaExistenciaInicial(habilitar: boolean);

    procedure InsertDatosTabPesoPrecioCatParam(fecha: TDateTime; nombre, tipo:String; establecimiento: Integer; pesoternero,
                                               precioternero, pesonovillo, precionovillo, pesotoro, preciotoro, pesoternera,
                                               precioternera, pesovaquillona, preciovaquillona, pesovaca, preciovaca: String);

    procedure InsertDatosTabPesoPrecioCat();
    procedure UpdateDatosTabPesoPrecioCatParam(fecha: TDateTime; nombre, tipo:String; establecimiento: Integer; pesoternero,
                                               precioternero, pesonovillo, precionovillo, pesotoro, preciotoro, pesoternera,
                                               precioternera, pesovaquillona, preciovaquillona, pesovaca, preciovaca: String;
                                               idtabrefcat:Integer);

    procedure UpdateDatosTabPesoPrecioCat();

    procedure DeleteDatosTabPesoPrecioCatParam(idtabrefcat, idtabrefpesoprecioparam, establecimiento:Integer);

    procedure DeleteDatosTabPesoPrecioCat();
    procedure InicializarEditPesoPrecio();
    procedure CargarUltimos();

  public
    { Public declarations }
  end;

var
  FRepReferenciasPesosPrecios: TFRepReferenciasPesosPrecios;

implementation

{$R *.dfm}

Uses UPrincipal, UDMSoftvet, UMensajeHuella, UTraduccion;

procedure TFRepReferenciasPesosPrecios.BBNuevaSalidasClick(Sender: TObject);
begin
  inherited;
  tipoReferencia:= 'SALIDAS';
  if (insertar = 0) then  //de nada a insertar
    begin
      insertar:= 1;
      LReferenciasSalidas.Visible:= false;
      DBLCBAFechaTabPesoPrecioCatSalidas.Visible:= false;
      EANombreSalidas.Visible:= true;
      EANombreSalidas.Text:= '';
      EANombreSalidas.SetFocus;
      DBLCBANombreReferenciaSalidas.Visible:= false;
      DTPAFechaReferenciaSalidas.Visible:= true;
      DTPAFechaReferenciaSalidas.Date:= Now();
      BBNuevaSalidas.Caption:= Traducir('Confirmar');
      BBModificarSalidas.Caption:= Traducir('Cancelar');
      BBModificarSalidas.Enabled:= true;
      BBEliminarSalidas.Enabled:= false;
      ClearReferenciasFechaTabPrecioPesoCatSalidas();
      HabilitarCamposReferenciaSalidas(true);
      InicializarEditPesoPrecio();
      EAPesoPromTernerosSalidas.SetFocus;
      GBEntradas.Enabled:= false;
      GBExistenciaFinal.Enabled:= false;
      GBExistenciaInicial.Enabled:= false;
      GroupBox1.Enabled:= false;
    end
   else
     if (insertar = 1) then      // de insertar a nada  cuando confirmo la inserción
       begin
         if (Trim(EANombreSalidas.Text) <> '') then
           begin
             insertar:= 0;
             LReferenciasSalidas.Visible:= true;
             DBLCBAFechaTabPesoPrecioCatSalidas.Visible:= true;

             EANombreSalidas.Visible:= false;
             DBLCBANombreReferenciaSalidas.Visible:= true;
             BBNuevaSalidas.Caption:= Traducir('Nueva');
             BBModificarSalidas.Caption:= Traducir('Modificar');
             BBEliminarSalidas.Enabled:= true;
    {         IBQVerificarFechaTabPesoPrecioCat.Close;
             IBQVerificarFechaTabPesoPrecioCat.ParamByName('FECHA').AsDate:= DTPAFechaReferencia.Date;
             IBQVerificarFechaTabPesoPrecioCat.ParamByName('ESTABLECIMIENTO').AsInteger:= FPrincipal.EstablecimientoActual;
             IBQVerificarFechaTabPesoPrecioCat.Open;
             if (IBQVerificarFechaTabPesoPrecioCat.IsEmpty) then    }
             InsertDatosTabPesoPrecioCat();
             DTPAFechaReferenciaSalidas.Visible:= false;
            {  else
                 MostrarMensaje(tmError, 'Existe una fecha con datos cargados. Elija otra fecha.');}
             DBLCBAFechaTabPesoPrecioCatSalidasCloseUp(nil);
             HabilitarCamposReferenciaSalidas(false);
             GBEntradas.Enabled:= true;
             GBExistenciaFinal.Enabled:= true;
             GBExistenciaInicial.Enabled:= true;
             GroupBox1.Enabled:= true;
           end
         else
            begin
              MostrarMensaje(tmError, 'Debe completar con un nombre.');
              EANombreSalidas.SetFocus;
            end;
       end
      else
        if (insertar = 2) then    // de modificar a nada  cuando confirmo la modificacion
          begin
             if (Trim(EANombreSalidas.Text) <> '') then
               begin
                  insertar:= 0;
                  BBNuevaSalidas.Caption:= Traducir('Nueva');
                  BBModificarSalidas.Caption:= Traducir('Modificar');
                  BBEliminarSalidas.Enabled:= true;
                  EANombreSalidas.Visible:= false;
                  DBLCBANombreReferenciaSalidas.Visible:= true;
                  UpdateDatosTabPesoPrecioCat();
                  HabilitarCamposReferenciaSalidas(false);
                  GBEntradas.Enabled:= true;
                  GBExistenciaFinal.Enabled:= true;
                  GBExistenciaInicial.Enabled:= true;
                  GroupBox1.Enabled:= true; 
               end
             else
                begin
                  MostrarMensaje(tmError, 'Debe completar con un nombre.');
                  EANombreSalidas.SetFocus;
                end;
          end;
end;

procedure TFRepReferenciasPesosPrecios.BBModificarSalidasClick(Sender: TObject);
begin
  inherited;
  tipoReferencia:= 'SALIDAS';
  if (insertar = 0) then
    begin
      insertar:= 2;
      LReferenciasSalidas.Visible:= true;
      DBLCBAFechaTabPesoPrecioCatSalidas.Visible:= true;
      DTPAFechaReferenciaSalidas.Visible:= false;
      BBNuevaSalidas.Caption:= Traducir('Confirmar');
      BBModificarSalidas.Caption:= Traducir('Cancelar');
      BBEliminarSalidas.Enabled:= false;
      EANombreSalidas.Visible:= true;
      DBLCBANombreReferenciaSalidas.Visible:= false;
      EANombreSalidas.Text:= IBQNombreReferenciaSalidas.fieldbyname('nombre').AsString;
      HabilitarCamposReferenciaSalidas(true);
      EAPesoPromTernerosSalidas.SetFocus;
      GBEntradas.Enabled:= false;
      GBExistenciaFinal.Enabled:= false;
      GBExistenciaInicial.Enabled:= false;
      GroupBox1.Enabled:= false;
    end
   else
     begin
       insertar:= 0;
       LReferenciasSalidas.Visible:= True;
       DBLCBAFechaTabPesoPrecioCatSalidas.Visible:= True;
       DTPAFechaReferenciaSalidas.Visible:= false;
       BBNuevaSalidas.Caption:= Traducir('Nueva');
       BBModificarSalidas.Caption:= Traducir('Modificar');
       BBModificarSalidas.Enabled:= false;
       BBEliminarSalidas.Enabled:= true;
       EANombreSalidas.Text:= '';
       EANombreSalidas.Visible:= false;
       DBLCBANombreReferenciaSalidas.Visible:= true;
       HabilitarCamposReferenciaSalidas(false);
       DBLCBAFechaTabPesoPrecioCatSalidasCloseUp(nil);
       GBEntradas.Enabled:= true;
       GBExistenciaFinal.Enabled:= true;
       GBExistenciaInicial.Enabled:= true;
       GroupBox1.Enabled:= true;        
     end;
end;

procedure TFRepReferenciasPesosPrecios.ClearReferenciasFechaTabPrecioPesoCatSalidas;
begin
      EAPesoPromTernerosSalidas.Clear;
      EAPesoPromTernerasSalidas.Clear;
      EAPesoPromVaquillonasSalidas.Clear;
      EAPesoPromVacasSalidas.Clear;
      EAPesoPromNovillosSalidas.Clear;
      EAPesoPromTorosSalidas.Clear;

      EAPrecioPromTernerosSalidas.Clear;
      EAPrecioPromTernerasSalidas.Clear;
      EAPrecioPromVaquillonasSalidas.Clear;
      EAPrecioPromVacasSalidas.Clear;
      EAPrecioPromNovillosSalidas.Clear;
      EAPrecioPromTorosSalidas.Clear;
end;

procedure TFRepReferenciasPesosPrecios.ClearReferenciasFechaTabPrecioPesoCatEntradas;
begin
      EAPesoPromTernerosEntradas.Clear;
      EAPesoPromTernerasEntradas.Clear;
      EAPesoPromVaquillonasEntradas.Clear;
      EAPesoPromVacasEntradas.Clear;
      EAPesoPromNovillosEntradas.Clear;
      EAPesoPromTorosEntradas.Clear;

      EAPrecioPromTernerosEntradas.Clear;
      EAPrecioPromTernerasEntradas.Clear;
      EAPrecioPromVaquillonasEntradas.Clear;
      EAPrecioPromVacasEntradas.Clear;
      EAPrecioPromNovillosEntradas.Clear;
      EAPrecioPromTorosEntradas.Clear;
end;

procedure TFRepReferenciasPesosPrecios.ClearReferenciasFechaTabPrecioPesoCatExistenciaFinal;
begin
      EAPesoPromTernerosExistenciaFinal.Clear;
      EAPesoPromTernerasExistenciaFinal.Clear;
      EAPesoPromVaquillonasExistenciaFinal.Clear;
      EAPesoPromVacasExistenciaFinal.Clear;
      EAPesoPromNovillosExistenciaFinal.Clear;
      EAPesoPromTorosExistenciaFinal.Clear;

      EAPrecioPromTernerosExistenciaFinal.Clear;
      EAPrecioPromTernerasExistenciaFinal.Clear;
      EAPrecioPromVaquillonasExistenciaFinal.Clear;
      EAPrecioPromVacasExistenciaFinal.Clear;
      EAPrecioPromNovillosExistenciaFinal.Clear;
      EAPrecioPromTorosExistenciaFinal.Clear;
end;


procedure TFRepReferenciasPesosPrecios.ClearReferenciasFechaTabPrecioPesoCatExistenciaInicial;
begin
      EAPesoPromTernerosExistenciaInicial.Clear;
      EAPesoPromTernerasExistenciaInicial.Clear;
      EAPesoPromVaquillonasExistenciaInicial.Clear;
      EAPesoPromVacasExistenciaInicial.Clear;
      EAPesoPromNovillosExistenciaInicial.Clear;
      EAPesoPromTorosExistenciaInicial.Clear;

      EAPrecioPromTernerosExistenciaInicial.Clear;
      EAPrecioPromTernerasExistenciaInicial.Clear;
      EAPrecioPromVaquillonasExistenciaInicial.Clear;
      EAPrecioPromVacasExistenciaInicial.Clear;
      EAPrecioPromNovillosExistenciaInicial.Clear;
      EAPrecioPromTorosExistenciaInicial.Clear;
end;


procedure TFRepReferenciasPesosPrecios.FormShow(Sender: TObject);
begin
  inherited;
  CargarFechaTabPrecioPesoCatSalidas();
  CargarFechaTabPrecioPesoCatEntradas();
  CargarFechaTabPrecioPesoCatExistenciaFinal();
  CargarFechaTabPrecioPesoCatExistenciaInicial();

  CargarUltimos();
  
  DBLCBAFechaTabPesoPrecioCatSalidasCloseUp(nil);

  DBLCBAFechaTabPesoPrecioCatEntradasCloseUp(nil);

  DBLCBAFechaTabPesoPrecioCatExistenciaFinalCloseUp(nil);

  DBLCBAFechaTabPesoPrecioCatExistenciaInicialCloseUp(nil);

  DTPAFechaReferenciaSalidas.Top:= LReferenciasSalidas.Top;
  DTPAFechaReferenciaSalidas.Left:= LReferenciasSalidas.Left;
  DTPAFechaReferenciaSalidas.Visible:= false;
  EANombreSalidas.Visible:= false;

  DTPAFechaReferenciaEntradas.Top:= LReferenciasEntradas.Top;
  DTPAFechaReferenciaEntradas.Left:= LReferenciasEntradas.Left;
  DTPAFechaReferenciaEntradas.Visible:= false;
  EANombreEntradas.Visible:= false;

  DTPAFechaReferenciaExistenciaFinal.Top:= LReferenciasExistenciaFinal.Top;
  DTPAFechaReferenciaExistenciaFinal.Left:= LReferenciasExistenciaFinal.Left;
  DTPAFechaReferenciaExistenciaFinal.Visible:= false;
  EANombreExistenciaFinal.Visible:= false;

  DTPAFechaReferenciaExistenciaInicial.Top:= LReferenciasExistenciaInicial.Top;
  DTPAFechaReferenciaExistenciaInicial.Left:= LReferenciasExistenciaInicial.Left;
  DTPAFechaReferenciaExistenciaInicial.Visible:= false;
  EANombreExistenciaInicial.Visible:= false;

  insertar:= 0;
  HabilitarCamposReferenciaSalidas(false);
  HabilitarCamposReferenciaEntradas(false);
  HabilitarCamposReferenciaExistenciaFinal(false);
  HabilitarCamposReferenciaExistenciaInicial(false);
  tipoReferencia:= '';
end;

procedure TFRepReferenciasPesosPrecios.HabilitarCamposReferenciaSalidas(
  habilitar: boolean);
begin
      EAPesoPromTernerosSalidas.Enabled:= habilitar;
      EAPrecioPromTernerosSalidas.Enabled:= habilitar;
      EAPesoPromTernerasSalidas.Enabled:= habilitar;
      EAPrecioPromTernerasSalidas.Enabled:= habilitar;
      EAPesoPromVaquillonasSalidas.Enabled:= habilitar;
      EAPrecioPromVaquillonasSalidas.Enabled:= habilitar;
      EAPesoPromVacasSalidas.Enabled:= habilitar;
      EAPrecioPromVacasSalidas.Enabled:= habilitar;
      EAPesoPromNovillosSalidas.Enabled:= habilitar;
      EAPrecioPromNovillosSalidas.Enabled:= habilitar;
      EAPesoPromTorosSalidas.Enabled:= habilitar;
      EAPrecioPromTorosSalidas.Enabled:= habilitar;
      DBLCBAFechaTabPesoPrecioCatSalidas.Enabled:= not habilitar;
end;


procedure TFRepReferenciasPesosPrecios.HabilitarCamposReferenciaEntradas(
  habilitar: boolean);
begin
      EAPesoPromTernerosEntradas.Enabled:= habilitar;
      EAPrecioPromTernerosEntradas.Enabled:= habilitar;
      EAPesoPromTernerasEntradas.Enabled:= habilitar;
      EAPrecioPromTernerasEntradas.Enabled:= habilitar;
      EAPesoPromVaquillonasEntradas.Enabled:= habilitar;
      EAPrecioPromVaquillonasEntradas.Enabled:= habilitar;
      EAPesoPromVacasEntradas.Enabled:= habilitar;
      EAPrecioPromVacasEntradas.Enabled:= habilitar;
      EAPesoPromNovillosEntradas.Enabled:= habilitar;
      EAPrecioPromNovillosEntradas.Enabled:= habilitar;
      EAPesoPromTorosEntradas.Enabled:= habilitar;
      EAPrecioPromTorosEntradas.Enabled:= habilitar;
      DBLCBAFechaTabPesoPrecioCatEntradas.Enabled:= not habilitar;
end;

procedure TFRepReferenciasPesosPrecios.HabilitarCamposReferenciaExistenciaFinal(
  habilitar: boolean);
begin
      EAPesoPromTernerosExistenciaFinal.Enabled:= habilitar;
      EAPrecioPromTernerosExistenciaFinal.Enabled:= habilitar;
      EAPesoPromTernerasExistenciaFinal.Enabled:= habilitar;
      EAPrecioPromTernerasExistenciaFinal.Enabled:= habilitar;
      EAPesoPromVaquillonasExistenciaFinal.Enabled:= habilitar;
      EAPrecioPromVaquillonasExistenciaFinal.Enabled:= habilitar;
      EAPesoPromVacasExistenciaFinal.Enabled:= habilitar;
      EAPrecioPromVacasExistenciaFinal.Enabled:= habilitar;
      EAPesoPromNovillosExistenciaFinal.Enabled:= habilitar;
      EAPrecioPromNovillosExistenciaFinal.Enabled:= habilitar;
      EAPesoPromTorosExistenciaFinal.Enabled:= habilitar;
      EAPrecioPromTorosExistenciaFinal.Enabled:= habilitar;
      DBLCBAFechaTabPesoPrecioCatExistenciaFinal.Enabled:= not habilitar;
end;

procedure TFRepReferenciasPesosPrecios.HabilitarCamposReferenciaExistenciaInicial(
  habilitar: boolean);
begin
      EAPesoPromTernerosExistenciaInicial.Enabled:= habilitar;
      EAPrecioPromTernerosExistenciaInicial.Enabled:= habilitar;
      EAPesoPromTernerasExistenciaInicial.Enabled:= habilitar;
      EAPrecioPromTernerasExistenciaInicial.Enabled:= habilitar;
      EAPesoPromVaquillonasExistenciaInicial.Enabled:= habilitar;
      EAPrecioPromVaquillonasExistenciaInicial.Enabled:= habilitar;
      EAPesoPromVacasExistenciaInicial.Enabled:= habilitar;
      EAPrecioPromVacasExistenciaInicial.Enabled:= habilitar;
      EAPesoPromNovillosExistenciaInicial.Enabled:= habilitar;
      EAPrecioPromNovillosExistenciaInicial.Enabled:= habilitar;
      EAPesoPromTorosExistenciaInicial.Enabled:= habilitar;
      EAPrecioPromTorosExistenciaInicial.Enabled:= habilitar;
      DBLCBAFechaTabPesoPrecioCatExistenciaInicial.Enabled:= not habilitar;
end;

procedure TFRepReferenciasPesosPrecios.InicializarEditPesoPrecio;
begin
  if (tipoReferencia = 'SALIDAS') then
    begin
      EAPesoPromTernerosSalidas.Text:= '0';
      EAPrecioPromTernerosSalidas.Text:= '0';
      EAPesoPromTernerasSalidas.Text:= '0';
      EAPrecioPromTernerasSalidas.Text:= '0';
      EAPesoPromNovillosSalidas.Text:= '0';
      EAPrecioPromNovillosSalidas.Text:= '0';
      EAPesoPromVaquillonasSalidas.Text:= '0';
      EAPrecioPromVaquillonasSalidas.Text:= '0';
      EAPesoPromVacasSalidas.Text:= '0';
      EAPrecioPromVacasSalidas.Text:= '0';
      EAPesoPromTorosSalidas.Text:= '0';
      EAPrecioPromTorosSalidas.Text:= '0';
   end
  else
    if (tipoReferencia = 'ENTRADAS') then
      begin
        EAPesoPromTernerosEntradas.Text:= '0';
        EAPrecioPromTernerosEntradas.Text:= '0';
        EAPesoPromTernerasEntradas.Text:= '0';
        EAPrecioPromTernerasEntradas.Text:= '0';
        EAPesoPromNovillosEntradas.Text:= '0';
        EAPrecioPromNovillosEntradas.Text:= '0';
        EAPesoPromVaquillonasEntradas.Text:= '0';
        EAPrecioPromVaquillonasEntradas.Text:= '0';
        EAPesoPromVacasEntradas.Text:= '0';
        EAPrecioPromVacasEntradas.Text:= '0';
        EAPesoPromTorosEntradas.Text:= '0';
        EAPrecioPromTorosEntradas.Text:= '0';
     end
    else
      if (tipoReferencia = 'EXISTENCIAFINAL') then
        begin
          EAPesoPromTernerosExistenciaFinal.Text:= '0';
          EAPrecioPromTernerosExistenciaFinal.Text:= '0';
          EAPesoPromTernerasExistenciaFinal.Text:= '0';
          EAPrecioPromTernerasExistenciaFinal.Text:= '0';
          EAPesoPromNovillosExistenciaFinal.Text:= '0';
          EAPrecioPromNovillosExistenciaFinal.Text:= '0';
          EAPesoPromVaquillonasExistenciaFinal.Text:= '0';
          EAPrecioPromVaquillonasExistenciaFinal.Text:= '0';
          EAPesoPromVacasExistenciaFinal.Text:= '0';
          EAPrecioPromVacasExistenciaFinal.Text:= '0';
          EAPesoPromTorosExistenciaFinal.Text:= '0';
          EAPrecioPromTorosExistenciaFinal.Text:= '0';
       end
      else
        if (tipoReferencia = 'EXISTENCIAINICIAL') then
          begin
            EAPesoPromTernerosExistenciaInicial.Text:= '0';
            EAPrecioPromTernerosExistenciaInicial.Text:= '0';
            EAPesoPromTernerasExistenciaInicial.Text:= '0';
            EAPrecioPromTernerasExistenciaInicial.Text:= '0';
            EAPesoPromNovillosExistenciaInicial.Text:= '0';
            EAPrecioPromNovillosExistenciaInicial.Text:= '0';
            EAPesoPromVaquillonasExistenciaInicial.Text:= '0';
            EAPrecioPromVaquillonasExistenciaInicial.Text:= '0';
            EAPesoPromVacasExistenciaInicial.Text:= '0';
            EAPrecioPromVacasExistenciaInicial.Text:= '0';
            EAPesoPromTorosExistenciaInicial.Text:= '0';
            EAPrecioPromTorosExistenciaInicial.Text:= '0';
         end;
end;

procedure TFRepReferenciasPesosPrecios.CargarFechaTabPrecioPesoCatSalidas;
begin
  ClearReferenciasFechaTabPrecioPesoCatSalidas();
  IBQFechaTabPesoPrecioCatSalidas.Close;
  IBQFechaTabPesoPrecioCatSalidas.ParamByName('ESTA').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQFechaTabPesoPrecioCatSalidas.ParamByName('TIPO').AsString:= 'SALIDAS';
  IBQFechaTabPesoPrecioCatSalidas.Open;
  DMSoftvet.IBQAfterOpen(IBQFechaTabPesoPrecioCatSalidas);
  IBQFechaTabPesoPrecioCatSalidas.First;
  DBLCBAFechaTabPesoPrecioCatSalidas.KeyValue:= IBQFechaTabPesoPrecioCatSalidas.fieldbyname('FECHA').AsDateTime;
//  CargarDatosTabPrecioPesoCat();
//  BBModificar.Enabled:= not IBQFechaTabPesoPrecioCat.IsEmpty
end;

procedure TFRepReferenciasPesosPrecios.CargarFechaTabPrecioPesoCatEntradas;
begin
  ClearReferenciasFechaTabPrecioPesoCatEntradas();
  IBQFechaTabPesoPrecioCatEntradas.Close;
  IBQFechaTabPesoPrecioCatEntradas.ParamByName('ESTA').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQFechaTabPesoPrecioCatEntradas.ParamByName('TIPO').AsString:= 'ENTRADAS';
  IBQFechaTabPesoPrecioCatEntradas.Open;
  DMSoftvet.IBQAfterOpen(IBQFechaTabPesoPrecioCatEntradas);
  IBQFechaTabPesoPrecioCatEntradas.First;
  DBLCBAFechaTabPesoPrecioCatEntradas.KeyValue:= IBQFechaTabPesoPrecioCatEntradas.fieldbyname('FECHA').AsDateTime;
//  CargarDatosTabPrecioPesoCat();
//  BBModificar.Enabled:= not IBQFechaTabPesoPrecioCat.IsEmpty
end;

procedure TFRepReferenciasPesosPrecios.CargarFechaTabPrecioPesoCatExistenciaFinal;
begin
  ClearReferenciasFechaTabPrecioPesoCatExistenciaFinal();
  IBQFechaTabPesoPrecioCatExistenciaFinal.Close;
  IBQFechaTabPesoPrecioCatExistenciaFinal.ParamByName('ESTA').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQFechaTabPesoPrecioCatExistenciaFinal.ParamByName('TIPO').AsString:= 'EXISTENCIAFINAL';
  IBQFechaTabPesoPrecioCatExistenciaFinal.Open;
  DMSoftvet.IBQAfterOpen(IBQFechaTabPesoPrecioCatExistenciaFinal);
  IBQFechaTabPesoPrecioCatExistenciaFinal.First;
  DBLCBAFechaTabPesoPrecioCatExistenciaFinal.KeyValue:= IBQFechaTabPesoPrecioCatExistenciaFinal.fieldbyname('FECHA').AsDateTime;
//  CargarDatosTabPrecioPesoCat();
//  BBModificar.Enabled:= not IBQFechaTabPesoPrecioCat.IsEmpty
end;

procedure TFRepReferenciasPesosPrecios.CargarFechaTabPrecioPesoCatExistenciaInicial;
begin
  ClearReferenciasFechaTabPrecioPesoCatExistenciaInicial();
  IBQFechaTabPesoPrecioCatExistenciaInicial.Close;
  IBQFechaTabPesoPrecioCatExistenciaInicial.ParamByName('ESTA').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQFechaTabPesoPrecioCatExistenciaInicial.ParamByName('TIPO').AsString:= 'EXISTENCIAINICIAL';
  IBQFechaTabPesoPrecioCatExistenciaInicial.Open;
  DMSoftvet.IBQAfterOpen(IBQFechaTabPesoPrecioCatExistenciaInicial);
  IBQFechaTabPesoPrecioCatExistenciaInicial.First;
  DBLCBAFechaTabPesoPrecioCatExistenciaInicial.KeyValue:= IBQFechaTabPesoPrecioCatExistenciaInicial.fieldbyname('FECHA').AsDateTime;
//  CargarDatosTabPrecioPesoCat();
//  BBModificar.Enabled:= not IBQFechaTabPesoPrecioCat.IsEmpty
end;

procedure TFRepReferenciasPesosPrecios.CargarNombreReferenciaSalidas;
begin
//  ClearReferenciasFechaTabPrecioPesoCat();
  IBQNombreReferenciaSalidas.Close;
  IBQNombreReferenciaSalidas.ParamByName('ESTA').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQNombreReferenciaSalidas.ParamByName('TIPO').AsString:= 'SALIDAS';
  IBQNombreReferenciaSalidas.ParamByName('FECHA').AsDateTime:= IBQFechaTabPesoPrecioCatSalidas.FieldByName('FECHA').AsDateTime;
  IBQNombreReferenciaSalidas.Open;
  DMSoftvet.IBQAfterOpen(IBQNombreReferenciaSalidas);
  IBQNombreReferenciaSalidas.First;
  DBLCBANombreReferenciaSalidas.KeyValue:= IBQNombreReferenciaSalidas.fieldbyname('ID_TAB_REF_CAT').AsString;
  CargarDatosTabPrecioPesoCatSalidas();
  BBModificarSalidas.Enabled:= not IBQFechaTabPesoPrecioCatSalidas.IsEmpty;
  BBEliminarSalidas.Enabled:= not IBQFechaTabPesoPrecioCatSalidas.IsEmpty
end;

procedure TFRepReferenciasPesosPrecios.CargarNombreReferenciaEntradas;
begin
//  ClearReferenciasFechaTabPrecioPesoCat();
  IBQNombreReferenciaEntradas.Close;
  IBQNombreReferenciaEntradas.ParamByName('ESTA').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQNombreReferenciaEntradas.ParamByName('TIPO').AsString:= 'ENTRADAS';
  IBQNombreReferenciaEntradas.ParamByName('FECHA').AsDateTime:= IBQFechaTabPesoPrecioCatEntradas.FieldByName('FECHA').AsDateTime;
  IBQNombreReferenciaEntradas.Open;
  DMSoftvet.IBQAfterOpen(IBQNombreReferenciaEntradas);
  IBQNombreReferenciaEntradas.First;
  DBLCBANombreReferenciaEntradas.KeyValue:= IBQNombreReferenciaEntradas.fieldbyname('ID_TAB_REF_CAT').AsString;
  CargarDatosTabPrecioPesoCatEntradas();
  BBModificarEntradas.Enabled:= not IBQFechaTabPesoPrecioCatEntradas.IsEmpty;
  BBEliminarEntradas.Enabled:= not IBQFechaTabPesoPrecioCatEntradas.IsEmpty
end;


procedure TFRepReferenciasPesosPrecios.CargarNombreReferenciaExistenciaFinal;
begin
//  ClearReferenciasFechaTabPrecioPesoCat();
  IBQNombreReferenciaExistenciaFinal.Close;
  IBQNombreReferenciaExistenciaFinal.ParamByName('ESTA').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQNombreReferenciaExistenciaFinal.ParamByName('TIPO').AsString:= 'EXISTENCIAFINAL';
  IBQNombreReferenciaExistenciaFinal.ParamByName('FECHA').AsDateTime:= IBQFechaTabPesoPrecioCatExistenciaFinal.FieldByName('FECHA').AsDateTime;
  IBQNombreReferenciaExistenciaFinal.Open;
  DMSoftvet.IBQAfterOpen(IBQNombreReferenciaExistenciaFinal);
  IBQNombreReferenciaExistenciaFinal.First;
  DBLCBANombreReferenciaExistenciaFinal.KeyValue:= IBQNombreReferenciaExistenciaFinal.fieldbyname('ID_TAB_REF_CAT').AsString;
  CargarDatosTabPrecioPesoCatExistenciaFinal();
  BBModificarExistenciaFinal.Enabled:= not IBQFechaTabPesoPrecioCatExistenciaFinal.IsEmpty;
  BBEliminarExistenciaFinal.Enabled:= not IBQFechaTabPesoPrecioCatExistenciaFinal.IsEmpty
end;

procedure TFRepReferenciasPesosPrecios.CargarNombreReferenciaExistenciaInicial;
begin
//  ClearReferenciasFechaTabPrecioPesoCat();
  IBQNombreReferenciaExistenciaInicial.Close;
  IBQNombreReferenciaExistenciaInicial.ParamByName('ESTA').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQNombreReferenciaExistenciaInicial.ParamByName('TIPO').AsString:= 'EXISTENCIAINICIAL';
  IBQNombreReferenciaExistenciaInicial.ParamByName('FECHA').AsDateTime:= IBQFechaTabPesoPrecioCatExistenciaInicial.FieldByName('FECHA').AsDateTime;
  IBQNombreReferenciaExistenciaInicial.Open;
  DMSoftvet.IBQAfterOpen(IBQNombreReferenciaExistenciaInicial);
  IBQNombreReferenciaExistenciaInicial.First;
  DBLCBANombreReferenciaExistenciaInicial.KeyValue:= IBQNombreReferenciaExistenciaInicial.fieldbyname('ID_TAB_REF_CAT').AsString;
  CargarDatosTabPrecioPesoCatExistenciaInicial();
  BBModificarExistenciaInicial.Enabled:= not IBQFechaTabPesoPrecioCatExistenciaInicial.IsEmpty;
  BBEliminarExistenciaInicial.Enabled:= not IBQFechaTabPesoPrecioCatExistenciaInicial.IsEmpty
end;

procedure TFRepReferenciasPesosPrecios.CargarDatosTabPrecioPesoCatSalidas;
begin
  IBQDatosTabPesoPrecioCatSalidas.Close;
  IBQDatosTabPesoPrecioCatSalidas.ParamByName('id_tab_ref_cat').AsInteger:= IBQNombreReferenciaSalidas.fieldbyname('id_tab_ref_cat').AsInteger;
  IBQDatosTabPesoPrecioCatSalidas.Open;
  IBQDatosTabPesoPrecioCatSalidas.First;

  while not(IBQDatosTabPesoPrecioCatSalidas.Eof) do
    begin
        case IBQDatosTabPesoPrecioCatSalidas.FieldByName('categoria').AsInteger of
          1 : begin
                 EAPesoPromTernerosSalidas.Text:= FormatFloat('###0.00',IBQDatosTabPesoPrecioCatSalidas.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromTernerosSalidas.Text:= FloatToStr(IBQDatosTabPesoPrecioCatSalidas.FieldByName('PRECIOPROM').AsFloat);
              end;
          2 : begin
                 EAPesoPromNovillosSalidas.Text:= FormatFloat('###0.00',IBQDatosTabPesoPrecioCatSalidas.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromNovillosSalidas.Text:= FormatFloat('###0.00',IBQDatosTabPesoPrecioCatSalidas.FieldByName('PRECIOPROM').AsFloat);
              end;
          3 : begin
                 EAPesoPromTorosSalidas.Text:= FormatFloat('###0.00',IBQDatosTabPesoPrecioCatSalidas.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromTorosSalidas.Text:= FormatFloat('###0.00',IBQDatosTabPesoPrecioCatSalidas.FieldByName('PRECIOPROM').AsFloat);
              end;
          4 : begin
                 EAPesoPromTernerasSalidas.Text:= FormatFloat('###0.00',IBQDatosTabPesoPrecioCatSalidas.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromTernerasSalidas.Text:= FormatFloat('###0.00',IBQDatosTabPesoPrecioCatSalidas.FieldByName('PRECIOPROM').AsFloat);
              end;
          5 : begin
                 EAPesoPromVaquillonasSalidas.Text:= FormatFloat('###0.00',IBQDatosTabPesoPrecioCatSalidas.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromVaquillonasSalidas.Text:= FormatFloat('###0.00',IBQDatosTabPesoPrecioCatSalidas.FieldByName('PRECIOPROM').AsFloat);
              end;
          6 : begin
                 EAPesoPromVacasSalidas.Text:= FormatFloat('###0.00',IBQDatosTabPesoPrecioCatSalidas.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromVacasSalidas.Text:= FormatFloat('###0.00',IBQDatosTabPesoPrecioCatSalidas.FieldByName('PRECIOPROM').AsFloat);
              end;
          end;
       IBQDatosTabPesoPrecioCatSalidas.Next;
    end;
end;


procedure TFRepReferenciasPesosPrecios.CargarDatosTabPrecioPesoCatEntradas;
begin
  IBQDatosTabPesoPrecioCatEntradas.Close;
  IBQDatosTabPesoPrecioCatEntradas.ParamByName('id_tab_ref_cat').AsInteger:= IBQNombreReferenciaEntradas.fieldbyname('id_tab_ref_cat').AsInteger;
  IBQDatosTabPesoPrecioCatEntradas.Open;
  IBQDatosTabPesoPrecioCatEntradas.First;

  while not(IBQDatosTabPesoPrecioCatEntradas.Eof) do
    begin
        case IBQDatosTabPesoPrecioCatEntradas.FieldByName('categoria').AsInteger of
          1 : begin
                 EAPesoPromTernerosEntradas.Text:= FloatToStr(IBQDatosTabPesoPrecioCatEntradas.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromTernerosEntradas.Text:= FloatToStr(IBQDatosTabPesoPrecioCatEntradas.FieldByName('PRECIOPROM').AsFloat);
              end;
          2 : begin
                 EAPesoPromNovillosEntradas.Text:= FloatToStr(IBQDatosTabPesoPrecioCatEntradas.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromNovillosEntradas.Text:= FloatToStr(IBQDatosTabPesoPrecioCatEntradas.FieldByName('PRECIOPROM').AsFloat);
              end;
          3 : begin
                 EAPesoPromTorosEntradas.Text:= FloatToStr(IBQDatosTabPesoPrecioCatEntradas.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromTorosEntradas.Text:= FloatToStr(IBQDatosTabPesoPrecioCatEntradas.FieldByName('PRECIOPROM').AsFloat);
              end;
          4 : begin
                 EAPesoPromTernerasEntradas.Text:= FloatToStr(IBQDatosTabPesoPrecioCatEntradas.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromTernerasEntradas.Text:= FloatToStr(IBQDatosTabPesoPrecioCatEntradas.FieldByName('PRECIOPROM').AsFloat);
              end;
          5 : begin
                 EAPesoPromVaquillonasEntradas.Text:= FloatToStr(IBQDatosTabPesoPrecioCatEntradas.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromVaquillonasEntradas.Text:= FloatToStr(IBQDatosTabPesoPrecioCatEntradas.FieldByName('PRECIOPROM').AsFloat);
              end;
          6 : begin
                 EAPesoPromVacasEntradas.Text:= FloatToStr(IBQDatosTabPesoPrecioCatEntradas.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromVacasEntradas.Text:= FloatToStr(IBQDatosTabPesoPrecioCatEntradas.FieldByName('PRECIOPROM').AsFloat);
              end;
          end;
       IBQDatosTabPesoPrecioCatEntradas.Next;
    end;
end;

procedure TFRepReferenciasPesosPrecios.CargarDatosTabPrecioPesoCatExistenciaFinal;
begin
  IBQDatosTabPesoPrecioCatExistenciaFinal.Close;
  IBQDatosTabPesoPrecioCatExistenciaFinal.ParamByName('id_tab_ref_cat').AsInteger:= IBQNombreReferenciaExistenciaFinal.fieldbyname('id_tab_ref_cat').AsInteger;
  IBQDatosTabPesoPrecioCatExistenciaFinal.Open;
  IBQDatosTabPesoPrecioCatExistenciaFinal.First;

  while not(IBQDatosTabPesoPrecioCatExistenciaFinal.Eof) do
    begin
        case IBQDatosTabPesoPrecioCatExistenciaFinal.FieldByName('categoria').AsInteger of
          1 : begin
                 EAPesoPromTernerosExistenciaFinal.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaFinal.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromTernerosExistenciaFinal.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaFinal.FieldByName('PRECIOPROM').AsFloat);
              end;
          2 : begin
                 EAPesoPromNovillosExistenciaFinal.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaFinal.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromNovillosExistenciaFinal.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaFinal.FieldByName('PRECIOPROM').AsFloat);
              end;
          3 : begin
                 EAPesoPromTorosExistenciaFinal.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaFinal.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromTorosExistenciaFinal.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaFinal.FieldByName('PRECIOPROM').AsFloat);
              end;
          4 : begin
                 EAPesoPromTernerasExistenciaFinal.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaFinal.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromTernerasExistenciaFinal.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaFinal.FieldByName('PRECIOPROM').AsFloat);
              end;
          5 : begin
                 EAPesoPromVaquillonasExistenciaFinal.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaFinal.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromVaquillonasExistenciaFinal.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaFinal.FieldByName('PRECIOPROM').AsFloat);
              end;
          6 : begin
                 EAPesoPromVacasExistenciaFinal.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaFinal.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromVacasExistenciaFinal.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaFinal.FieldByName('PRECIOPROM').AsFloat);
              end;
          end;
       IBQDatosTabPesoPrecioCatExistenciaFinal.Next;
    end;
end;


procedure TFRepReferenciasPesosPrecios.CargarDatosTabPrecioPesoCatExistenciaInicial;
begin
  IBQDatosTabPesoPrecioCatExistenciaInicial.Close;
  IBQDatosTabPesoPrecioCatExistenciaInicial.ParamByName('id_tab_ref_cat').AsInteger:= IBQNombreReferenciaExistenciaInicial.fieldbyname('id_tab_ref_cat').AsInteger;
  IBQDatosTabPesoPrecioCatExistenciaInicial.Open;
  IBQDatosTabPesoPrecioCatExistenciaInicial.First;

  while not(IBQDatosTabPesoPrecioCatExistenciaInicial.Eof) do
    begin
        case IBQDatosTabPesoPrecioCatExistenciaInicial.FieldByName('categoria').AsInteger of
          1 : begin
                 EAPesoPromTernerosExistenciaInicial.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaInicial.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromTernerosExistenciaInicial.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaInicial.FieldByName('PRECIOPROM').AsFloat);
              end;
          2 : begin
                 EAPesoPromNovillosExistenciaInicial.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaInicial.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromNovillosExistenciaInicial.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaInicial.FieldByName('PRECIOPROM').AsFloat);
              end;
          3 : begin
                 EAPesoPromTorosExistenciaInicial.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaInicial.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromTorosExistenciaInicial.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaInicial.FieldByName('PRECIOPROM').AsFloat);
              end;
          4 : begin
                 EAPesoPromTernerasExistenciaInicial.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaInicial.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromTernerasExistenciaInicial.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaInicial.FieldByName('PRECIOPROM').AsFloat);
              end;
          5 : begin
                 EAPesoPromVaquillonasExistenciaInicial.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaInicial.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromVaquillonasExistenciaInicial.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaInicial.FieldByName('PRECIOPROM').AsFloat);
              end;
          6 : begin
                 EAPesoPromVacasExistenciaInicial.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaInicial.FieldByName('PESOPROM').AsFloat);
                 EAPrecioPromVacasExistenciaInicial.Text:= FloatToStr(IBQDatosTabPesoPrecioCatExistenciaInicial.FieldByName('PRECIOPROM').AsFloat);
              end;
          end;
       IBQDatosTabPesoPrecioCatExistenciaInicial.Next;
    end;
end;


procedure TFRepReferenciasPesosPrecios.InsertDatosTabPesoPrecioCatParam(
  fecha: TDateTime;nombre, tipo:String; establecimiento: Integer; pesoternero,
  precioternero, pesonovillo, precionovillo, pesotoro, preciotoro, pesoternera,
  precioternera, pesovaquillona, preciovaquillona, pesovaca, preciovaca: String);
begin
    IBQInsertDatosTabPesoPrecioCat.ParamByName('fecha').AsDateTime:= fecha;

    IBQInsertDatosTabPesoPrecioCat.ParamByName('nombre').AsString:= nombre;
    IBQInsertDatosTabPesoPrecioCat.ParamByName('tipo').AsString:= tipo;

    IBQInsertDatosTabPesoPrecioCat.ParamByName('establecimiento').AsInteger:= establecimiento;
    if ((trim(pesoternero) <> '') or (trim(precioternero) <> '') or
        (trim(pesonovillo) <> '') or (trim(precionovillo) <> '') or
        (trim(pesotoro) <> '') or (trim(preciotoro) <> '') or
        (trim(pesoternera) <> '') or (trim(precioternera) <> '') or
        (trim(pesovaquillona) <> '') or (trim(preciovaquillona) <> '') or
        (trim(pesovaca) <> '') or (trim(preciovaca) <> ''))  then
      begin
        if (trim(pesoternero) <> '') then
          IBQInsertDatosTabPesoPrecioCat.ParamByName('pesoternero').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(pesoternero))))
         else
            IBQInsertDatosTabPesoPrecioCat.ParamByName('pesoternero').AsFloat:= 0;

        if (trim(precioternero) <> '') then
          IBQInsertDatosTabPesoPrecioCat.ParamByName('precioternero').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(precioternero))))
         else
            IBQInsertDatosTabPesoPrecioCat.ParamByName('precioternero').AsFloat:= 0;


        if (trim(pesonovillo) <> '') then
          IBQInsertDatosTabPesoPrecioCat.ParamByName('pesonovillo').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(pesonovillo))))
         else
            IBQInsertDatosTabPesoPrecioCat.ParamByName('pesonovillo').AsFloat:= 0;

        if (trim(precionovillo) <> '') then
          IBQInsertDatosTabPesoPrecioCat.ParamByName('precionovillo').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(precionovillo))))
         else
            IBQInsertDatosTabPesoPrecioCat.ParamByName('precionovillo').AsFloat:= 0;

        if (trim(pesotoro) <> '') then
          IBQInsertDatosTabPesoPrecioCat.ParamByName('pesotoro').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(pesotoro))))
         else
            IBQInsertDatosTabPesoPrecioCat.ParamByName('pesotoro').AsFloat:= 0;

        if (trim(preciotoro) <> '') then
          IBQInsertDatosTabPesoPrecioCat.ParamByName('preciotoro').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(preciotoro))))
         else
            IBQInsertDatosTabPesoPrecioCat.ParamByName('preciotoro').AsFloat:= 0;

        if (trim(pesoternera) <> '') then
          IBQInsertDatosTabPesoPrecioCat.ParamByName('pesoternera').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(pesoternera))))
         else
            IBQInsertDatosTabPesoPrecioCat.ParamByName('pesoternera').AsFloat:= 0;

        if (trim(precioternera) <> '') then
          IBQInsertDatosTabPesoPrecioCat.ParamByName('precioternera').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(precioternera))))
         else
            IBQInsertDatosTabPesoPrecioCat.ParamByName('precioternera').AsFloat:= 0;

        if (trim(pesovaquillona) <> '') then
          IBQInsertDatosTabPesoPrecioCat.ParamByName('pesovaquillona').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(pesovaquillona))))
         else
            IBQInsertDatosTabPesoPrecioCat.ParamByName('pesovaquillona').AsFloat:= 0;

        if (trim(preciovaquillona) <> '') then
          IBQInsertDatosTabPesoPrecioCat.ParamByName('preciovaquillona').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(preciovaquillona))))
         else
            IBQInsertDatosTabPesoPrecioCat.ParamByName('preciovaquillona').AsFloat:= 0;

        if (trim(pesovaca) <> '') then
          IBQInsertDatosTabPesoPrecioCat.ParamByName('pesovaca').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(pesovaca))))
         else
            IBQInsertDatosTabPesoPrecioCat.ParamByName('pesovaca').AsFloat:= 0;

        if (trim(preciovaca) <> '') then
          IBQInsertDatosTabPesoPrecioCat.ParamByName('preciovaca').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(preciovaca))))
         else
            IBQInsertDatosTabPesoPrecioCat.ParamByName('preciovaca').AsFloat:= 0;



        IBQInsertDatosTabPesoPrecioCat.ExecSQL;
      end;
end;

procedure TFRepReferenciasPesosPrecios.InsertDatosTabPesoPrecioCat;
begin
  try
    if (tipoReferencia = 'SALIDAS') then
      begin
        InsertDatosTabPesoPrecioCatParam(DTPAFechaReferenciaSalidas.DateTime,EANombreSalidas.Text,tipoReferencia,FPrincipal.EstablecimientoActual,
                                         EAPesoPromTernerosSalidas.Text, EAPrecioPromTernerosSalidas.Text, EAPesoPromNovillosSalidas.Text, EAPrecioPromNovillosSalidas.Text,
                                         EAPesoPromTorosSalidas.Text, EAPrecioPromTorosSalidas.Text, EAPesoPromTernerasSalidas.Text, EAPrecioPromTernerasSalidas.Text,
                                         EAPesoPromVaquillonasSalidas.Text, EAPrecioPromVaquillonasSalidas.Text,EAPesoPromVacasSalidas.Text, EAPrecioPromVacasSalidas.Text);
                                         
        CargarFechaTabPrecioPesoCatSalidas();
      end
     else
        if (tipoReferencia = 'ENTRADAS') then
          begin
            InsertDatosTabPesoPrecioCatParam(DTPAFechaReferenciaEntradas.DateTime,EANombreEntradas.Text,tipoReferencia,FPrincipal.EstablecimientoActual,
                                             EAPesoPromTernerosEntradas.Text, EAPrecioPromTernerosEntradas.Text, EAPesoPromNovillosEntradas.Text, EAPrecioPromNovillosEntradas.Text,
                                             EAPesoPromTorosEntradas.Text, EAPrecioPromTorosEntradas.Text, EAPesoPromTernerasEntradas.Text, EAPrecioPromTernerasEntradas.Text,
                                             EAPesoPromVaquillonasEntradas.Text, EAPrecioPromVaquillonasEntradas.Text,EAPesoPromVacasEntradas.Text, EAPrecioPromVacasEntradas.Text);

            CargarFechaTabPrecioPesoCatEntradas();
          end
         else
            if (tipoReferencia = 'EXISTENCIAFINAL') then
              begin
                InsertDatosTabPesoPrecioCatParam(DTPAFechaReferenciaExistenciaFinal.DateTime,EANombreExistenciaFinal.Text,tipoReferencia,FPrincipal.EstablecimientoActual,
                                                 EAPesoPromTernerosExistenciaFinal.Text, EAPrecioPromTernerosExistenciaFinal.Text, EAPesoPromNovillosExistenciaFinal.Text, EAPrecioPromNovillosExistenciaFinal.Text,
                                                 EAPesoPromTorosExistenciaFinal.Text, EAPrecioPromTorosExistenciaFinal.Text, EAPesoPromTernerasExistenciaFinal.Text, EAPrecioPromTernerasExistenciaFinal.Text,
                                                 EAPesoPromVaquillonasExistenciaFinal.Text, EAPrecioPromVaquillonasExistenciaFinal.Text,EAPesoPromVacasExistenciaFinal.Text, EAPrecioPromVacasExistenciaFinal.Text);

                CargarFechaTabPrecioPesoCatExistenciaFinal();
              end
             else
                if (tipoReferencia = 'EXISTENCIAINICIAL') then
                  begin
                    InsertDatosTabPesoPrecioCatParam(DTPAFechaReferenciaExistenciaInicial.DateTime,EANombreExistenciaInicial.Text,tipoReferencia,FPrincipal.EstablecimientoActual,
                                                     EAPesoPromTernerosExistenciaInicial.Text, EAPrecioPromTernerosExistenciaInicial.Text, EAPesoPromNovillosExistenciaInicial.Text, EAPrecioPromNovillosExistenciaInicial.Text,
                                                     EAPesoPromTorosExistenciaInicial.Text, EAPrecioPromTorosExistenciaInicial.Text, EAPesoPromTernerasExistenciaInicial.Text, EAPrecioPromTernerasExistenciaInicial.Text,
                                                     EAPesoPromVaquillonasExistenciaInicial.Text, EAPrecioPromVaquillonasExistenciaInicial.Text,EAPesoPromVacasExistenciaInicial.Text, EAPrecioPromVacasExistenciaInicial.Text);

                    CargarFechaTabPrecioPesoCatExistenciaInicial();
                  end;


    FPrincipal.IBTPrincipal.CommitRetaining;
  except on e:exception do
     FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFRepReferenciasPesosPrecios.UpdateDatosTabPesoPrecioCatParam(
  fecha: TDateTime;nombre, tipo:String; establecimiento: Integer; pesoternero,
  precioternero, pesonovillo, precionovillo, pesotoro, preciotoro, pesoternera,
  precioternera, pesovaquillona, preciovaquillona, pesovaca, preciovaca: String;idtabrefcat: Integer);
begin
    IBQUpdateDatosTabPesoPrecioCat.ParamByName('fecha').AsDateTime:= fecha;

    IBQUpdateDatosTabPesoPrecioCat.ParamByName('nombre').AsString:= nombre;
    IBQUpdateDatosTabPesoPrecioCat.ParamByName('tipo').AsString:= tipo;
    IBQUpdateDatosTabPesoPrecioCat.ParamByName('IDTABREFCAT').AsInteger:= idtabrefcat;

    IBQUpdateDatosTabPesoPrecioCat.ParamByName('establecimiento').AsInteger:= establecimiento;
    if ((trim(pesoternero) <> '') or (trim(precioternero) <> '') or
        (trim(pesonovillo) <> '') or (trim(precionovillo) <> '') or
        (trim(pesotoro) <> '') or (trim(preciotoro) <> '') or
        (trim(pesoternera) <> '') or (trim(precioternera) <> '') or
        (trim(pesovaquillona) <> '') or (trim(preciovaquillona) <> '') or
        (trim(pesovaca) <> '') or (trim(preciovaca) <> ''))  then
      begin
        if (trim(pesoternero) <> '') then
          IBQUpdateDatosTabPesoPrecioCat.ParamByName('pesoternero').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(pesoternero))))
         else
            IBQUpdateDatosTabPesoPrecioCat.ParamByName('pesoternero').AsFloat:= 0;

        if (trim(precioternero) <> '') then
          IBQUpdateDatosTabPesoPrecioCat.ParamByName('precioternero').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(precioternero))))
         else
            IBQUpdateDatosTabPesoPrecioCat.ParamByName('precioternero').AsFloat:= 0;


        if (trim(pesonovillo) <> '') then
          IBQUpdateDatosTabPesoPrecioCat.ParamByName('pesonovillo').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(pesonovillo))))
         else
            IBQUpdateDatosTabPesoPrecioCat.ParamByName('pesonovillo').AsFloat:= 0;

        if (trim(precionovillo) <> '') then
          IBQUpdateDatosTabPesoPrecioCat.ParamByName('precionovillo').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(precionovillo))))
         else
            IBQUpdateDatosTabPesoPrecioCat.ParamByName('precionovillo').AsFloat:= 0;

        if (trim(pesotoro) <> '') then
          IBQUpdateDatosTabPesoPrecioCat.ParamByName('pesotoro').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(pesotoro))))
         else
            IBQUpdateDatosTabPesoPrecioCat.ParamByName('pesotoro').AsFloat:= 0;

        if (trim(preciotoro) <> '') then
          IBQUpdateDatosTabPesoPrecioCat.ParamByName('preciotoro').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(preciotoro))))
         else
            IBQUpdateDatosTabPesoPrecioCat.ParamByName('preciotoro').AsFloat:= 0;

        if (trim(pesoternera) <> '') then
          IBQUpdateDatosTabPesoPrecioCat.ParamByName('pesoternera').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(pesoternera))))
         else
            IBQUpdateDatosTabPesoPrecioCat.ParamByName('pesoternera').AsFloat:= 0;

        if (trim(precioternera) <> '') then
          IBQUpdateDatosTabPesoPrecioCat.ParamByName('precioternera').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(precioternera))))
         else
            IBQUpdateDatosTabPesoPrecioCat.ParamByName('precioternera').AsFloat:= 0;

        if (trim(pesovaquillona) <> '') then
          IBQUpdateDatosTabPesoPrecioCat.ParamByName('pesovaquillona').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(pesovaquillona))))
         else
            IBQUpdateDatosTabPesoPrecioCat.ParamByName('pesovaquillona').AsFloat:= 0;

        if (trim(preciovaquillona) <> '') then
          IBQUpdateDatosTabPesoPrecioCat.ParamByName('preciovaquillona').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(preciovaquillona))))
         else
            IBQUpdateDatosTabPesoPrecioCat.ParamByName('preciovaquillona').AsFloat:= 0;

        if (trim(pesovaca) <> '') then
          IBQUpdateDatosTabPesoPrecioCat.ParamByName('pesovaca').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(pesovaca))))
         else
            IBQUpdateDatosTabPesoPrecioCat.ParamByName('pesovaca').AsFloat:= 0;

        if (trim(preciovaca) <> '') then
          IBQUpdateDatosTabPesoPrecioCat.ParamByName('preciovaca').AsFloat:= StrToFloat(FormatFloat('###0.00',StrToFloat(trim(preciovaca))))
         else
            IBQUpdateDatosTabPesoPrecioCat.ParamByName('preciovaca').AsFloat:= 0;



        IBQUpdateDatosTabPesoPrecioCat.ExecSQL;
      end;
end;

procedure TFRepReferenciasPesosPrecios.UpdateDatosTabPesoPrecioCat;
var idaux: Integer;
begin
  try
    if (tipoReferencia = 'SALIDAS') then
      begin
        UpdateDatosTabPesoPrecioCatParam(DTPAFechaReferenciaSalidas.DateTime,EANombreSalidas.Text,tipoReferencia,FPrincipal.EstablecimientoActual,
                                         EAPesoPromTernerosSalidas.Text, EAPrecioPromTernerosSalidas.Text, EAPesoPromNovillosSalidas.Text, EAPrecioPromNovillosSalidas.Text,
                                         EAPesoPromTorosSalidas.Text, EAPrecioPromTorosSalidas.Text, EAPesoPromTernerasSalidas.Text, EAPrecioPromTernerasSalidas.Text,
                                         EAPesoPromVaquillonasSalidas.Text, EAPrecioPromVaquillonasSalidas.Text,EAPesoPromVacasSalidas.Text, EAPrecioPromVacasSalidas.Text,
                                         IBQNombreReferenciaSalidas.fieldbyname('id_tab_ref_cat').AsInteger);

        idaux:= IBQNombreReferenciaSalidas.fieldbyname('ID_TAB_REF_CAT').AsInteger;
        CargarNombreReferenciaSalidas();
        DBLCBANombreReferenciaSalidas.KeyValue:= idaux;
        DBLCBANombreReferenciaSalidasCloseUp(nil);
      end
     else
        if (tipoReferencia = 'ENTRADAS') then
          begin
            UpdateDatosTabPesoPrecioCatParam(DTPAFechaReferenciaEntradas.DateTime,EANombreEntradas.Text,tipoReferencia,FPrincipal.EstablecimientoActual,
                                             EAPesoPromTernerosEntradas.Text, EAPrecioPromTernerosEntradas.Text, EAPesoPromNovillosEntradas.Text, EAPrecioPromNovillosEntradas.Text,
                                             EAPesoPromTorosEntradas.Text, EAPrecioPromTorosEntradas.Text, EAPesoPromTernerasEntradas.Text, EAPrecioPromTernerasEntradas.Text,
                                             EAPesoPromVaquillonasEntradas.Text, EAPrecioPromVaquillonasEntradas.Text,EAPesoPromVacasEntradas.Text, EAPrecioPromVacasEntradas.Text,
                                             IBQNombreReferenciaEntradas.fieldbyname('id_tab_ref_cat').AsInteger);

            idaux:= IBQNombreReferenciaEntradas.fieldbyname('ID_TAB_REF_CAT').AsInteger;
            CargarNombreReferenciaEntradas();
            DBLCBANombreReferenciaEntradas.KeyValue:= idaux;
            DBLCBANombreReferenciaEntradasCloseUp(nil);
          end
         else
            if (tipoReferencia = 'EXISTENCIAFINAL') then
              begin
                UpdateDatosTabPesoPrecioCatParam(DTPAFechaReferenciaExistenciaFinal.DateTime,EANombreExistenciaFinal.Text,tipoReferencia,FPrincipal.EstablecimientoActual,
                                                 EAPesoPromTernerosExistenciaFinal.Text, EAPrecioPromTernerosExistenciaFinal.Text, EAPesoPromNovillosExistenciaFinal.Text, EAPrecioPromNovillosExistenciaFinal.Text,
                                                 EAPesoPromTorosExistenciaFinal.Text, EAPrecioPromTorosExistenciaFinal.Text, EAPesoPromTernerasExistenciaFinal.Text, EAPrecioPromTernerasExistenciaFinal.Text,
                                                 EAPesoPromVaquillonasExistenciaFinal.Text, EAPrecioPromVaquillonasExistenciaFinal.Text,EAPesoPromVacasExistenciaFinal.Text, EAPrecioPromVacasExistenciaFinal.Text,
                                                 IBQNombreReferenciaExistenciaFinal.fieldbyname('id_tab_ref_cat').AsInteger);

                idaux:= IBQNombreReferenciaExistenciaFinal.fieldbyname('ID_TAB_REF_CAT').AsInteger;
                CargarNombreReferenciaExistenciaFinal();
                DBLCBANombreReferenciaExistenciaFinal.KeyValue:= idaux;
                DBLCBANombreReferenciaExistenciaFinalCloseUp(nil);
              end
             else
                if (tipoReferencia = 'EXISTENCIAINICIAL') then
                  begin
                    UpdateDatosTabPesoPrecioCatParam(DTPAFechaReferenciaExistenciaInicial.DateTime,EANombreExistenciaInicial.Text,tipoReferencia,FPrincipal.EstablecimientoActual,
                                                     EAPesoPromTernerosExistenciaInicial.Text, EAPrecioPromTernerosExistenciaInicial.Text, EAPesoPromNovillosExistenciaInicial.Text, EAPrecioPromNovillosExistenciaInicial.Text,
                                                     EAPesoPromTorosExistenciaInicial.Text, EAPrecioPromTorosExistenciaInicial.Text, EAPesoPromTernerasExistenciaInicial.Text, EAPrecioPromTernerasExistenciaInicial.Text,
                                                     EAPesoPromVaquillonasExistenciaInicial.Text, EAPrecioPromVaquillonasExistenciaInicial.Text,EAPesoPromVacasExistenciaInicial.Text, EAPrecioPromVacasExistenciaInicial.Text,
                                                     IBQNombreReferenciaExistenciaInicial.fieldbyname('id_tab_ref_cat').AsInteger);

                    idaux:= IBQNombreReferenciaExistenciaInicial.fieldbyname('ID_TAB_REF_CAT').AsInteger;
                    CargarNombreReferenciaExistenciaInicial();
                    DBLCBANombreReferenciaExistenciaInicial.KeyValue:= idaux;
                    DBLCBANombreReferenciaExistenciaInicialCloseUp(nil);
                  end;

    FPrincipal.IBTPrincipal.CommitRetaining;
  except on e:exception do
     FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFRepReferenciasPesosPrecios.DeleteDatosTabPesoPrecioCatParam(
  idtabrefcat, idtabrefpesoprecioparam, establecimiento: Integer);
begin

    IBQDeleteDatosTabPesoPrecioCat.ParamByName('IDTABREFCAT').AsInteger:= idtabrefcat;
    IBQDeleteDatosTabPesoPrecioCat.ParamByName('IDTABREFPESOPRECIOPARAM').AsInteger:= idtabrefpesoprecioparam;

    IBQDeleteDatosTabPesoPrecioCat.ParamByName('establecimiento').AsInteger:= establecimiento;

    IBQDeleteDatosTabPesoPrecioCat.ExecSQL;

end;

procedure TFRepReferenciasPesosPrecios.DeleteDatosTabPesoPrecioCat;
begin
  try
    if (tipoReferencia = 'SALIDAS') then
      begin
        DeleteDatosTabPesoPrecioCatParam(IBQNombreReferenciaSalidas.fieldbyname('id_tab_ref_cat').AsInteger,
                                         IBQDatosTabPesoPrecioCatSalidas.fieldbyname('ID_TAB_REF_PESO_PRECIO').AsInteger,
                                         FPrincipal.EstablecimientoActual);

        CargarFechaTabPrecioPesoCatSalidas();
        DBLCBAFechaTabPesoPrecioCatSalidasCloseUp(nil);
      end
     else
        if (tipoReferencia = 'ENTRADAS') then
          begin
            DeleteDatosTabPesoPrecioCatParam(IBQNombreReferenciaEntradas.fieldbyname('id_tab_ref_cat').AsInteger,
                                             IBQDatosTabPesoPrecioCatEntradas.fieldbyname('ID_TAB_REF_PESO_PRECIO').AsInteger,
                                             FPrincipal.EstablecimientoActual);

            CargarFechaTabPrecioPesoCatEntradas();
            DBLCBAFechaTabPesoPrecioCatEntradasCloseUp(nil);
          end
         else
            if (tipoReferencia = 'EXISTENCIAFINAL') then
              begin
                DeleteDatosTabPesoPrecioCatParam(IBQNombreReferenciaExistenciaFinal.fieldbyname('id_tab_ref_cat').AsInteger,
                                                 IBQDatosTabPesoPrecioCatExistenciaFinal.fieldbyname('ID_TAB_REF_PESO_PRECIO').AsInteger,
                                                 FPrincipal.EstablecimientoActual);

                CargarFechaTabPrecioPesoCatExistenciaFinal();
                DBLCBAFechaTabPesoPrecioCatExistenciaFinalCloseUp(nil);
              end
             else
                if (tipoReferencia = 'EXISTENCIAINICIAL') then
                  begin
                    DeleteDatosTabPesoPrecioCatParam(IBQNombreReferenciaExistenciaInicial.fieldbyname('id_tab_ref_cat').AsInteger,
                                                     IBQDatosTabPesoPrecioCatExistenciaInicial.fieldbyname('ID_TAB_REF_PESO_PRECIO').AsInteger,
                                                     FPrincipal.EstablecimientoActual);

                    CargarFechaTabPrecioPesoCatExistenciaInicial();
                    DBLCBAFechaTabPesoPrecioCatExistenciaInicialCloseUp(nil);
                  end;

    FPrincipal.IBTPrincipal.CommitRetaining;
  except on e:exception do
     FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;



procedure TFRepReferenciasPesosPrecios.DBLCBAFechaTabPesoPrecioCatSalidasCloseUp(
  Sender: TObject);
begin
  inherited;
  ClearReferenciasFechaTabPrecioPesoCatSalidas();
  //CargarDatosTabPrecioPesoCat();
  CargarNombreReferenciaSalidas();
end;

procedure TFRepReferenciasPesosPrecios.EAPesoPromExit(Sender: TObject);
begin
  if (Trim(TEditAuto(Sender).Text) = '' ) then
    TEditAuto(Sender).Text:= '0';
end;

procedure TFRepReferenciasPesosPrecios.EAPesoPromKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
{  if (Key = '.') then
    Key := ',';    }
  if ((not (key in (['0'..'9','+','-',',',' ','.'])) or (Length(TEditAuto(Sender).Text) >= 6)) and (key <> #8)) then key:=#0;

  if (key = '.') then
    key:= ',';
//  if (pos(',',TEditAuto(Sender).Text)=0) then
//    begin
      if not (key in ['0'..'9',#8,',']) then key:=#0;
//    end
//  else if not (key in ['0'..'9',#8]) then key:=#0;
end;

procedure TFRepReferenciasPesosPrecios.DBLCBANombreReferenciaSalidasCloseUp(
  Sender: TObject);
begin
  inherited;
  ClearReferenciasFechaTabPrecioPesoCatSalidas();
  CargarDatosTabPrecioPesoCatSalidas();
end;

procedure TFRepReferenciasPesosPrecios.BBEliminarSalidasClick(Sender: TObject);
begin
  inherited;
  tipoReferencia:= 'SALIDAS';
  If (MostrarMensaje(tmConsulta, '¿Está seguro que desea eliminar la referencia '+DBLCBANombreReferenciaSalidas.Text+'?.') = mrYes) then
    DeleteDatosTabPesoPrecioCat();
end;


//**************Entradas*******************

procedure TFRepReferenciasPesosPrecios.BBNuevaEntradasClick(
  Sender: TObject);
begin
  inherited;
  tipoReferencia:= 'ENTRADAS';
  if (insertar = 0) then  //de nada a insertar
    begin
      insertar:= 1;
      LReferenciasEntradas.Visible:= false;
      DBLCBAFechaTabPesoPrecioCatEntradas.Visible:= false;
      EANombreEntradas.Visible:= true;
      EANombreEntradas.Text:= '';
      EANombreEntradas.SetFocus;
      DBLCBANombreReferenciaEntradas.Visible:= false;
      DTPAFechaReferenciaEntradas.Visible:= true;
      DTPAFechaReferenciaEntradas.Date:= Now();
      BBNuevaEntradas.Caption:= Traducir('Confirmar');
      BBModificarEntradas.Caption:= Traducir('Cancelar');
      BBModificarEntradas.Enabled:= true;
      BBEliminarEntradas.Enabled:= false;
      ClearReferenciasFechaTabPrecioPesoCatEntradas();
      HabilitarCamposReferenciaEntradas(true);
      InicializarEditPesoPrecio();
      EAPesoPromTernerosEntradas.SetFocus;
      GBSalidas.Enabled:= false;
      GBExistenciaFinal.Enabled:= false;
      GBExistenciaInicial.Enabled:= false;
      GroupBox1.Enabled:= false;
    end
   else
     if (insertar = 1) then      // de insertar a nada  cuando confirmo la inserción
       begin
         if (Trim(EANombreEntradas.Text) <> '') then
           begin
             insertar:= 0;
             LReferenciasEntradas.Visible:= true;
             DBLCBAFechaTabPesoPrecioCatEntradas.Visible:= true;

             EANombreEntradas.Visible:= false;
             DBLCBANombreReferenciaEntradas.Visible:= true;
             BBNuevaEntradas.Caption:= Traducir('Nueva');
             BBModificarEntradas.Caption:= Traducir('Modificar');
             BBEliminarEntradas.Enabled:= true;
    {         IBQVerificarFechaTabPesoPrecioCat.Close;
             IBQVerificarFechaTabPesoPrecioCat.ParamByName('FECHA').AsDate:= DTPAFechaReferencia.Date;
             IBQVerificarFechaTabPesoPrecioCat.ParamByName('ESTABLECIMIENTO').AsInteger:= FPrincipal.EstablecimientoActual;
             IBQVerificarFechaTabPesoPrecioCat.Open;
             if (IBQVerificarFechaTabPesoPrecioCat.IsEmpty) then    }
             InsertDatosTabPesoPrecioCat();
             DTPAFechaReferenciaEntradas.Visible:= false;
            {  else
                 MostrarMensaje(tmError, 'Existe una fecha con datos cargados. Elija otra fecha.');}
             DBLCBAFechaTabPesoPrecioCatEntradasCloseUp(nil);
             HabilitarCamposReferenciaEntradas(false);
             GBSalidas.Enabled:= true;
             GBExistenciaFinal.Enabled:= true;
             GBExistenciaInicial.Enabled:= true;
             GroupBox1.Enabled:= true;
           end
         else
            begin
              MostrarMensaje(tmError, 'Debe completar con un nombre.');
              EANombreEntradas.SetFocus;
            end;
       end
      else
        if (insertar = 2) then    // de modificar a nada  cuando confirmo la modificacion
          begin
             if (Trim(EANombreEntradas.Text) <> '') then
               begin
                  insertar:= 0;
                  BBNuevaEntradas.Caption:= Traducir('Nueva');
                  BBModificarEntradas.Caption:= Traducir('Modificar');
                  BBEliminarEntradas.Enabled:= true;
                  EANombreEntradas.Visible:= false;
                  DBLCBANombreReferenciaEntradas.Visible:= true;
                  UpdateDatosTabPesoPrecioCat();
                  HabilitarCamposReferenciaEntradas(false);
                  GBSalidas.Enabled:= true;
                  GBExistenciaFinal.Enabled:= true;
                  GBExistenciaInicial.Enabled:= true;
                  GroupBox1.Enabled:= true;
                  
                  BBAceptar.Enabled:= true;
                  BBSalir.Enabled:= true;
               end
             else
                begin
                  MostrarMensaje(tmError, 'Debe completar con un nombre.');
                  EANombreEntradas.SetFocus;
                end;
          end;
end;

procedure TFRepReferenciasPesosPrecios.BBModificarEntradasClick(
  Sender: TObject);
begin
  inherited;
  tipoReferencia:= 'ENTRADAS';
  if (insertar = 0) then
    begin
      insertar:= 2;
      LReferenciasEntradas.Visible:= true;
      DBLCBAFechaTabPesoPrecioCatEntradas.Visible:= true;
      DTPAFechaReferenciaEntradas.Visible:= false;
      BBNuevaEntradas.Caption:= Traducir('Confirmar');
      BBModificarEntradas.Caption:= Traducir('Cancelar');
      BBEliminarEntradas.Enabled:= false;
      EANombreEntradas.Visible:= true;
      DBLCBANombreReferenciaEntradas.Visible:= false;
      EANombreEntradas.Text:= IBQNombreReferenciaEntradas.fieldbyname('nombre').AsString;
      HabilitarCamposReferenciaEntradas(true);
      EAPesoPromTernerosEntradas.SetFocus;
      GBSalidas.Enabled:= false;
      GBExistenciaFinal.Enabled:= false;
      GBExistenciaInicial.Enabled:= false;
      GroupBox1.Enabled:= false;
    end
   else
     begin
       insertar:= 0;
       LReferenciasEntradas.Visible:= True;
       DBLCBAFechaTabPesoPrecioCatEntradas.Visible:= True;
       DTPAFechaReferenciaEntradas.Visible:= false;
       BBNuevaEntradas.Caption:= Traducir('Nueva');
       BBModificarEntradas.Caption:= Traducir('Modificar');
       BBModificarEntradas.Enabled:= false;
       BBEliminarEntradas.Enabled:= true;
       EANombreEntradas.Text:= '';
       EANombreEntradas.Visible:= false;
       DBLCBANombreReferenciaEntradas.Visible:= true;
       HabilitarCamposReferenciaEntradas(false);
       DBLCBAFechaTabPesoPrecioCatEntradasCloseUp(nil);
       GBSalidas.Enabled:= true;
       GBExistenciaFinal.Enabled:= true;
       GBExistenciaInicial.Enabled:= true;
       GroupBox1.Enabled:= true; 
     end;
end;

procedure TFRepReferenciasPesosPrecios.BBEliminarEntradasClick(
  Sender: TObject);
begin
  inherited;
  tipoReferencia:= 'ENTRADAS';
  If (MostrarMensaje(tmConsulta, '¿Está seguro que desea eliminar la referencia '+DBLCBANombreReferenciaEntradas.Text+'?.') = mrYes) then
    DeleteDatosTabPesoPrecioCat();
end;

procedure TFRepReferenciasPesosPrecios.DBLCBAFechaTabPesoPrecioCatEntradasCloseUp(
  Sender: TObject);
begin
  inherited;
  ClearReferenciasFechaTabPrecioPesoCatEntradas();
  //CargarDatosTabPrecioPesoCat();
  CargarNombreReferenciaEntradas();
end;

procedure TFRepReferenciasPesosPrecios.DBLCBANombreReferenciaEntradasCloseUp(
  Sender: TObject);
begin
  inherited;
  ClearReferenciasFechaTabPrecioPesoCatEntradas();
  CargarDatosTabPrecioPesoCatEntradas();
end;


//********EXISTENCIAFINAL
procedure TFRepReferenciasPesosPrecios.BBNuevaExistenciaFinalClick(
  Sender: TObject);
begin
  inherited;
  tipoReferencia:= 'EXISTENCIAFINAL';
  if (insertar = 0) then  //de nada a insertar
    begin
      insertar:= 1;
      LReferenciasExistenciaFinal.Visible:= false;
      DBLCBAFechaTabPesoPrecioCatExistenciaFinal.Visible:= false;
      EANombreExistenciaFinal.Visible:= true;
      EANombreExistenciaFinal.Text:= '';
      EANombreExistenciaFinal.SetFocus;
      DBLCBANombreReferenciaExistenciaFinal.Visible:= false;
      DTPAFechaReferenciaExistenciaFinal.Visible:= true;
      DTPAFechaReferenciaExistenciaFinal.Date:= Now();
      BBNuevaExistenciaFinal.Caption:= Traducir('Confirmar');
      BBModificarExistenciaFinal.Caption:= Traducir('Cancelar');
      BBModificarExistenciaFinal.Enabled:= true;
      BBEliminarExistenciaFinal.Enabled:= false;
      ClearReferenciasFechaTabPrecioPesoCatExistenciaFinal();
      HabilitarCamposReferenciaExistenciaFinal(true);
      InicializarEditPesoPrecio();
      EAPesoPromTernerosExistenciaFinal.SetFocus;
      GBEntradas.Enabled:= false;
      GBSalidas.Enabled:= false;
      GBExistenciaInicial.Enabled:= false;
      GroupBox1.Enabled:= false;
    end
   else
     if (insertar = 1) then      // de insertar a nada  cuando confirmo la inserción
       begin
         if (Trim(EANombreExistenciaFinal.Text) <> '') then
           begin
             insertar:= 0;
             LReferenciasExistenciaFinal.Visible:= true;
             DBLCBAFechaTabPesoPrecioCatExistenciaFinal.Visible:= true;

             EANombreExistenciaFinal.Visible:= false;
             DBLCBANombreReferenciaExistenciaFinal.Visible:= true;
             BBNuevaExistenciaFinal.Caption:= Traducir('Nueva');
             BBModificarExistenciaFinal.Caption:= Traducir('Modificar');
             BBEliminarExistenciaFinal.Enabled:= true;
    {         IBQVerificarFechaTabPesoPrecioCat.Close;
             IBQVerificarFechaTabPesoPrecioCat.ParamByName('FECHA').AsDate:= DTPAFechaReferencia.Date;
             IBQVerificarFechaTabPesoPrecioCat.ParamByName('ESTABLECIMIENTO').AsInteger:= FPrincipal.EstablecimientoActual;
             IBQVerificarFechaTabPesoPrecioCat.Open;
             if (IBQVerificarFechaTabPesoPrecioCat.IsEmpty) then    }
             InsertDatosTabPesoPrecioCat();
             DTPAFechaReferenciaExistenciaFinal.Visible:= false;
            {  else
                 MostrarMensaje(tmError, 'Existe una fecha con datos cargados. Elija otra fecha.');}
             DBLCBAFechaTabPesoPrecioCatExistenciaFinalCloseUp(nil);
             HabilitarCamposReferenciaExistenciaFinal(false);
             GBEntradas.Enabled:= true;
             GBSalidas.Enabled:= true;
             GBExistenciaInicial.Enabled:= true;
             GroupBox1.Enabled:= true;
           end
         else
            begin
              MostrarMensaje(tmError, 'Debe completar con un nombre.');
              EANombreExistenciaFinal.SetFocus;
            end;
       end
      else
        if (insertar = 2) then    // de modificar a nada  cuando confirmo la modificacion
          begin
             if (Trim(EANombreExistenciaFinal.Text) <> '') then
               begin
                  insertar:= 0;
                  BBNuevaExistenciaFinal.Caption:= Traducir('Nueva');
                  BBModificarExistenciaFinal.Caption:= Traducir('Modificar');
                  BBEliminarExistenciaFinal.Enabled:= true;
                  EANombreExistenciaFinal.Visible:= false;
                  DBLCBANombreReferenciaExistenciaFinal.Visible:= true;
                  UpdateDatosTabPesoPrecioCat();
                  HabilitarCamposReferenciaExistenciaFinal(false);
                  GBEntradas.Enabled:= true;
                  GBSalidas.Enabled:= true;
                  GBExistenciaInicial.Enabled:= true;
                  GroupBox1.Enabled:= true; 
               end
             else
                begin
                  MostrarMensaje(tmError, 'Debe completar con un nombre.');
                  EANombreExistenciaFinal.SetFocus;
                end;
          end;
end;

procedure TFRepReferenciasPesosPrecios.BBModificarExistenciaFinalClick(
  Sender: TObject);
begin
  inherited;
  tipoReferencia:= 'EXISTENCIAFINAL';
  if (insertar = 0) then
    begin
      insertar:= 2;
      LReferenciasExistenciaFinal.Visible:= true;
      DBLCBAFechaTabPesoPrecioCatExistenciaFinal.Visible:= true;
      DTPAFechaReferenciaExistenciaFinal.Visible:= false;
      BBNuevaExistenciaFinal.Caption:= Traducir('Confirmar');
      BBModificarExistenciaFinal.Caption:= Traducir('Cancelar');
      BBEliminarExistenciaFinal.Enabled:= false;
      EANombreExistenciaFinal.Visible:= true;
      DBLCBANombreReferenciaExistenciaFinal.Visible:= false;
      EANombreExistenciaFinal.Text:= IBQNombreReferenciaExistenciaFinal.fieldbyname('nombre').AsString;
      HabilitarCamposReferenciaExistenciaFinal(true);
      EAPesoPromTernerosExistenciaFinal.SetFocus;
      GBSalidas.Enabled:= false;
      GBExistenciaInicial.Enabled:= false;
      GBEntradas.Enabled:= false;
      GroupBox1.Enabled:= false;
    end
   else
     begin
       insertar:= 0;
       LReferenciasExistenciaFinal.Visible:= True;
       DBLCBAFechaTabPesoPrecioCatExistenciaFinal.Visible:= True;
       DTPAFechaReferenciaExistenciaFinal.Visible:= false;
       BBNuevaExistenciaFinal.Caption:= Traducir('Nueva');
       BBModificarExistenciaFinal.Caption:= Traducir('Modificar');
       BBModificarExistenciaFinal.Enabled:= false;
       BBEliminarExistenciaFinal.Enabled:= true;
       EANombreExistenciaFinal.Text:= '';
       EANombreExistenciaFinal.Visible:= false;
       DBLCBANombreReferenciaExistenciaFinal.Visible:= true;
       HabilitarCamposReferenciaExistenciaFinal(false);
       DBLCBAFechaTabPesoPrecioCatExistenciaFinalCloseUp(nil);
       GBSalidas.Enabled:= true;
       GBExistenciaInicial.Enabled:= true;
       GBEntradas.Enabled:= true;
       GroupBox1.Enabled:= true; 
     end;
end;

procedure TFRepReferenciasPesosPrecios.BBEliminarExistenciaFinalClick(
  Sender: TObject);
begin
  inherited;
  tipoReferencia:= 'EXISTENCIAFINAL';
  If (MostrarMensaje(tmConsulta, Traducir('¿Está seguro que desea eliminar la referencia ')+DBLCBANombreReferenciaExistenciaFinal.Text+'?.') = mrYes) then
    DeleteDatosTabPesoPrecioCat();
end;

procedure TFRepReferenciasPesosPrecios.DBLCBAFechaTabPesoPrecioCatExistenciaFinalCloseUp(
  Sender: TObject);
begin
  inherited;
  ClearReferenciasFechaTabPrecioPesoCatExistenciaFinal();
  //CargarDatosTabPrecioPesoCat();
  CargarNombreReferenciaExistenciaFinal();
end;

procedure TFRepReferenciasPesosPrecios.DBLCBANombreReferenciaExistenciaFinalCloseUp(
  Sender: TObject);
begin
  inherited;
  ClearReferenciasFechaTabPrecioPesoCatExistenciaFinal();
  CargarDatosTabPrecioPesoCatExistenciaFinal();
end;


//*********************EXISTENCIAINICIAL
procedure TFRepReferenciasPesosPrecios.BBNuevaExistenciaInicialClick(
  Sender: TObject);
begin
  inherited;
  tipoReferencia:= 'EXISTENCIAINICIAL';
  if (insertar = 0) then  //de nada a insertar
    begin
      insertar:= 1;
      LReferenciasExistenciaInicial.Visible:= false;
      DBLCBAFechaTabPesoPrecioCatExistenciaInicial.Visible:= false;
      EANombreExistenciaInicial.Visible:= true;
      EANombreExistenciaInicial.Text:= '';
      EANombreExistenciaInicial.SetFocus;
      DBLCBANombreReferenciaExistenciaInicial.Visible:= false;
      DTPAFechaReferenciaExistenciaInicial.Visible:= true;
      DTPAFechaReferenciaExistenciaInicial.Date:= Now();
      BBNuevaExistenciaInicial.Caption:= Traducir('Confirmar');
      BBModificarExistenciaInicial.Caption:= Traducir('Cancelar');
      BBModificarExistenciaInicial.Enabled:= true;
      BBEliminarExistenciaInicial.Enabled:= false;
      ClearReferenciasFechaTabPrecioPesoCatExistenciaInicial();
      HabilitarCamposReferenciaExistenciaInicial(true);
      InicializarEditPesoPrecio();
      EAPesoPromTernerosExistenciaInicial.SetFocus;
      GBEntradas.Enabled:= false;
      GBExistenciaFinal.Enabled:= false;
      GBSalidas.Enabled:= false;
      GroupBox1.Enabled:= false;
    end
   else
     if (insertar = 1) then      // de insertar a nada  cuando confirmo la inserción
       begin
         if (Trim(EANombreExistenciaInicial.Text) <> '') then
           begin
             insertar:= 0;
             LReferenciasExistenciaInicial.Visible:= true;
             DBLCBAFechaTabPesoPrecioCatExistenciaInicial.Visible:= true;

             EANombreExistenciaInicial.Visible:= false;
             DBLCBANombreReferenciaExistenciaInicial.Visible:= true;
             BBNuevaExistenciaInicial.Caption:= Traducir('Nueva');
             BBModificarExistenciaInicial.Caption:= Traducir('Modificar');
             BBEliminarExistenciaInicial.Enabled:= true;
    {         IBQVerificarFechaTabPesoPrecioCat.Close;
             IBQVerificarFechaTabPesoPrecioCat.ParamByName('FECHA').AsDate:= DTPAFechaReferencia.Date;
             IBQVerificarFechaTabPesoPrecioCat.ParamByName('ESTABLECIMIENTO').AsInteger:= FPrincipal.EstablecimientoActual;
             IBQVerificarFechaTabPesoPrecioCat.Open;
             if (IBQVerificarFechaTabPesoPrecioCat.IsEmpty) then    }
             InsertDatosTabPesoPrecioCat();
             DTPAFechaReferenciaExistenciaInicial.Visible:= false;
            {  else
                 MostrarMensaje(tmError, 'Existe una fecha con datos cargados. Elija otra fecha.');}
             DBLCBAFechaTabPesoPrecioCatExistenciaInicialCloseUp(nil);
             HabilitarCamposReferenciaExistenciaInicial(false);
             GBEntradas.Enabled:= true;
             GBExistenciaFinal.Enabled:= true;
             GBSalidas.Enabled:= true;
             GroupBox1.Enabled:= true;
           end
         else
            begin
              MostrarMensaje(tmError, 'Debe completar con un nombre.');
              EANombreExistenciaInicial.SetFocus;
            end;
       end
      else
        if (insertar = 2) then    // de modificar a nada  cuando confirmo la modificacion
          begin
             if (Trim(EANombreExistenciaInicial.Text) <> '') then
               begin
                  insertar:= 0;
                  BBNuevaExistenciaInicial.Caption:= Traducir('Nueva');
                  BBModificarExistenciaInicial.Caption:= Traducir('Modificar');
                  BBEliminarExistenciaInicial.Enabled:= true;
                  EANombreExistenciaInicial.Visible:= false;
                  DBLCBANombreReferenciaExistenciaInicial.Visible:= true;
                  UpdateDatosTabPesoPrecioCat();
                  HabilitarCamposReferenciaExistenciaInicial(false);
                  GBEntradas.Enabled:= true;
                  GBExistenciaFinal.Enabled:= true;
                  GBSalidas.Enabled:= true;
                  GroupBox1.Enabled:= true; 
               end
             else
                begin
                  MostrarMensaje(tmError, 'Debe completar con un nombre.');
                  EANombreExistenciaInicial.SetFocus;
                end;
          end;
end;

procedure TFRepReferenciasPesosPrecios.BBModificarExistenciaInicialClick(
  Sender: TObject);
begin
  inherited;
  tipoReferencia:= 'EXISTENCIAINICIAL';
  if (insertar = 0) then
    begin
      insertar:= 2;
      LReferenciasExistenciaInicial.Visible:= true;
      DBLCBAFechaTabPesoPrecioCatExistenciaInicial.Visible:= true;
      DTPAFechaReferenciaExistenciaInicial.Visible:= false;
      BBNuevaExistenciaInicial.Caption:= Traducir('Confirmar');
      BBModificarExistenciaInicial.Caption:= Traducir('Cancelar');
      BBEliminarExistenciaInicial.Enabled:= false;
      EANombreExistenciaInicial.Visible:= true;
      DBLCBANombreReferenciaExistenciaInicial.Visible:= false;
      EANombreExistenciaInicial.Text:= IBQNombreReferenciaExistenciaInicial.fieldbyname('nombre').AsString;
      HabilitarCamposReferenciaExistenciaInicial(true);
      EAPesoPromTernerosExistenciaInicial.SetFocus;
      GBSalidas.Enabled:= false;
      GBExistenciaFinal.Enabled:= false;
      GBEntradas.Enabled:= false;
      GroupBox1.Enabled:= false;
    end
   else
     begin
       insertar:= 0;
       LReferenciasExistenciaInicial.Visible:= True;
       DBLCBAFechaTabPesoPrecioCatExistenciaInicial.Visible:= True;
       DTPAFechaReferenciaExistenciaInicial.Visible:= false;
       BBNuevaExistenciaInicial.Caption:= Traducir('Nueva');
       BBModificarExistenciaInicial.Caption:= Traducir('Modificar');
       BBModificarExistenciaInicial.Enabled:= false;
       BBEliminarExistenciaInicial.Enabled:= true;
       EANombreExistenciaInicial.Text:= '';
       EANombreExistenciaInicial.Visible:= false;
       DBLCBANombreReferenciaExistenciaInicial.Visible:= true;
       HabilitarCamposReferenciaExistenciaInicial(false);
       DBLCBAFechaTabPesoPrecioCatExistenciaInicialCloseUp(nil);
       GBSalidas.Enabled:= true;
       GBExistenciaFinal.Enabled:= true;
       GBEntradas.Enabled:= true;
       GroupBox1.Enabled:= true; 
     end;
end;

procedure TFRepReferenciasPesosPrecios.BBEliminarExistenciaInicialClick(
  Sender: TObject);
begin
  inherited;
  tipoReferencia:= 'EXISTENCIAINICIAL';
  If (MostrarMensaje(tmConsulta, '¿Está seguro que desea eliminar la referencia '+DBLCBANombreReferenciaExistenciaInicial.Text+'?.') = mrYes) then
    DeleteDatosTabPesoPrecioCat();
end;

procedure TFRepReferenciasPesosPrecios.DBLCBAFechaTabPesoPrecioCatExistenciaInicialCloseUp(
  Sender: TObject);
begin
  inherited;
  ClearReferenciasFechaTabPrecioPesoCatExistenciaInicial();
  //CargarDatosTabPrecioPesoCat();
  CargarNombreReferenciaExistenciaInicial();
end;

procedure TFRepReferenciasPesosPrecios.DBLCBANombreReferenciaExistenciaInicialCloseUp(
  Sender: TObject);
begin
  inherited;
  ClearReferenciasFechaTabPrecioPesoCatExistenciaInicial();
  CargarDatosTabPrecioPesoCatExistenciaInicial();
end;

procedure TFRepReferenciasPesosPrecios.BBSalirClick(Sender: TObject);
begin
  inherited;
  close();
end;

procedure TFRepReferenciasPesosPrecios.BBAceptarClick(Sender: TObject);
begin
  inherited;

  try
    IBQUpdateUltimoRefCat.ParamByName('IDTABREFCATSALIDAS').AsInteger:= IBQNombreReferenciaSalidas.fieldbyname('ID_TAB_REF_CAT').AsInteger;
    IBQUpdateUltimoRefCat.ParamByName('IDTABREFCATENTRADAS').AsInteger:= IBQNombreReferenciaEntradas.fieldbyname('ID_TAB_REF_CAT').AsInteger;
    IBQUpdateUltimoRefCat.ParamByName('IDTABREFCATEF').AsInteger:= IBQNombreReferenciaExistenciaFinal.fieldbyname('ID_TAB_REF_CAT').AsInteger;
    IBQUpdateUltimoRefCat.ParamByName('IDTABREFCATEI').AsInteger:= IBQNombreReferenciaExistenciaInicial.fieldbyname('ID_TAB_REF_CAT').AsInteger;

    IBQUpdateUltimoRefCat.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;

    IBQUpdateUltimoRefCat.ExecSQL;
    FPrincipal.IBTPrincipal.CommitRetaining;
    close;
  except on e:exception do
     FPrincipal.IBTPrincipal.RollbackRetaining;
  end;


end;

procedure TFRepReferenciasPesosPrecios.CargarUltimos;
begin
  try
    IBQTABREFCAT.Close;
    IBQTABREFCAT.ParamByName('Establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
    IBQTABREFCAT.Open;

    IBQTABREFCAT.First;
    while not(IBQTABREFCAT.Eof) do
      begin
        if (IBQTABREFCAT.fieldbyname('tipo').AsString = 'SALIDAS') then
          begin
               DBLCBAFechaTabPesoPrecioCatSalidas.KeyValue:= IBQTABREFCAT.fieldbyname('FECHA').AsDateTime;
               DBLCBANombreReferenciaSalidas.KeyValue:= IBQTABREFCAT.fieldbyname('ID_TAB_REF_CAT').AsString;
          end
         else
            if (IBQTABREFCAT.fieldbyname('tipo').AsString = 'ENTRADAS') then
              begin
                 DBLCBAFechaTabPesoPrecioCatEntradas.KeyValue:= IBQTABREFCAT.fieldbyname('FECHA').AsDateTime;
                 DBLCBANombreReferenciaEntradas.KeyValue:= IBQTABREFCAT.fieldbyname('ID_TAB_REF_CAT').AsString;
              end
             else
                if (IBQTABREFCAT.fieldbyname('tipo').AsString = 'EXISTENCIAFINAL') then
                  begin
                     DBLCBAFechaTabPesoPrecioCatExistenciaFinal.KeyValue:= IBQTABREFCAT.fieldbyname('FECHA').AsDateTime;
                     DBLCBANombreReferenciaExistenciaFinal.KeyValue:= IBQTABREFCAT.fieldbyname('ID_TAB_REF_CAT').AsString;
                  end
                 else
                  if (IBQTABREFCAT.fieldbyname('tipo').AsString = 'EXISTENCIAINICIAL') then
                    begin
                       DBLCBAFechaTabPesoPrecioCatExistenciaInicial.KeyValue:= IBQTABREFCAT.fieldbyname('FECHA').AsDateTime;
                       DBLCBANombreReferenciaExistenciaInicial.KeyValue:= IBQTABREFCAT.fieldbyname('ID_TAB_REF_CAT').AsString;
                    end;
         IBQTABREFCAT.Next;
      end;
  except on e:exception do
     
  end;

end;

end.
