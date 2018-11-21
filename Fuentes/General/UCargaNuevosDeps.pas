unit UCargaNuevosDeps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  Buttons, ExtCtrls, DBCtrls, DateUtils,
  DateTimePickerAuto, EditAuto, Mask, UFrameMangazo, DataExport, DataToXLS,
  WinXP, Types, ImgList, PngImageList, JvExControls, JvLabel, PngImage, JvExExtCtrls,
  JvImage, jpeg, JvGIF, UUniversal, UClassType;

type
  TFCargaNuevosDeps = class(TFUniversal)
    PSuperior: TPanel;
    Label1: TLabel;
    PPrincipal: TPanel;
    GBGrilla: TGroupBox;
    BDBGGrilla: TBitDBGrid;
    IBQNuevos: TIBQuery;
    DSNuevos: TDataSource;
    PBotones: TPanel;
    IFondoBottom: TImage;
    ICancel: TImage;
    LCancel: TLabel;
    BBAceptar: TBitBtn;
    BBSiaTodo: TBitBtn;
    BBSi: TBitBtn;
    BBNo: TBitBtn;
    BBCancelar: TBitBtn;
    POpciones: TPanel;
    ITodosInternosOn: TImage;
    ITodosInternosOff: TImage;
    ITodosExternosOff: TImage;
    ITodosExternosOn: TImage;
    IElegirTipoAltaOn: TImage;
    IElegirTipoAltaOff: TImage;
    IIgnorarOn: TImage;
    LTodosInternos: TLabel;
    LTodosExternos: TLabel;
    LElegirAlta: TLabel;
    LIgnorar: TLabel;
    IIgnorarOff: TImage;
    IBQLimpiarNuevos: TIBQuery;
    IBQLimpiarDepsNuevos: TIBQuery;
    IBQInsertNuevos: TIBQuery;
    LGuardarSeleccionados: TLabel;
    IGuardarSeleccionados: TImage;
    IBDSNuevos: TIBDataSet;
    IBDSNuevosTIPO_ALTA: TIBStringField;
    IBDSNuevosID_RP: TIBStringField;
    IBDSNuevosID_HBA: TIBStringField;
    IBDSNuevosNOMBRE: TIBStringField;
    IBDSNuevosSEXO: TIntegerField;
    IBDSNuevosFECHA_NACIMIENTO: TDateField;
    IBDSNuevosRAZA: TIntegerField;
    IBDSNuevosCOLOR: TIntegerField;
    IBDSNuevosNOMCOLOR: TIBStringField;
    IBQSetTipoAlta: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure ITodosInternosOffClick(Sender: TObject);
    procedure ITodosExternosOffClick(Sender: TObject);
    procedure IElegirTipoAltaOffClick(Sender: TObject);
    procedure IIgnorarOffClick(Sender: TObject);
    procedure IGuardarSeleccionadosClick(Sender: TObject);
    procedure ICancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IBDSNuevosTIPO_ALTASetText(Sender: TField;
      const Text: String);
  private
    { Private declarations }
    SQLStringList: TStringList;
    procedure CargarAnimales(tipoCarga : integer);
    procedure HabilitarColumna;
    procedure LimpiarExtructurasAux;
    procedure MostrarOcultarOpciones;
    procedure CargarPickList;
  public
    { Public declarations }
    NoGuarda : boolean;
  end;

var
  FCargaNuevosDeps: TFCargaNuevosDeps;

implementation

uses UPrincipal,uTiposGlobales, UMensajeHuella;

{$R *.dfm}

procedure TFCargaNuevosDeps.FormShow(Sender: TObject);
begin
  inherited;

  IBQNuevos.Close;
  IBQNuevos.Open;
  IBQNuevos.First;

  IBDSNuevos.Close;
  IBDSNuevos.Open;
  IBDSNuevos.First;

  ITodosInternosOff.Visible := true;
  ITodosExternosOff.Visible := true;
  IElegirTipoAltaOff.Visible := true;
  IIgnorarOff.Visible := true;
  ITodosInternosOn.Visible := false;
  ITodosExternosOn.Visible := false;
  IElegirTipoAltaOn.Visible := false;
  IIgnorarOn.Visible := false;

  ICancel.Visible := true;
  LCancel.Visible := true;

  BDBGGrilla.Columns[0].ReadOnly := true;
  BDBGGrilla.Columns[1].ReadOnly := true;
  BDBGGrilla.Columns[2].ReadOnly := true;
  BDBGGrilla.Columns[3].ReadOnly := true;
  BDBGGrilla.Columns[4].ReadOnly := true;
  BDBGGrilla.Columns[5].ReadOnly := true;
  BDBGGrilla.Columns[5].Visible := false;

  NoGuarda := false;
  
end;

procedure TFCargaNuevosDeps.ITodosInternosOffClick(Sender: TObject);
begin
  inherited;

  ITodosInternosOff.Visible := not(ITodosInternosOff.Visible);
  ITodosInternosOn.Visible := not(ITodosInternosOn.Visible);

  CargarAnimales(0);

  MostrarMensaje(tmInformacion,'Los animales se cargaron correctamente.');

  Close();
end;

procedure TFCargaNuevosDeps.ITodosExternosOffClick(Sender: TObject);
begin
  inherited;

  ITodosExternosOff.Visible := not(ITodosExternosOff.Visible);
  ITodosExternosOn.Visible := not(ITodosExternosOn.Visible);

  CargarAnimales(1);

  MostrarMensaje(tmInformacion,'Los animales se cargaron correctamente.');

  Close();
end;

procedure TFCargaNuevosDeps.IElegirTipoAltaOffClick(Sender: TObject);
begin
  inherited;

  IElegirTipoAltaOff.Visible := not(IElegirTipoAltaOff.Visible);
  IElegirTipoAltaOn.Visible := not(IElegirTipoAltaOn.Visible);

  HabilitarColumna;
  MostrarOcultarOpciones;
end;

procedure TFCargaNuevosDeps.IIgnorarOffClick(Sender: TObject);
begin
  inherited;

  IIgnorarOff.Visible := not(IIgnorarOff.Visible);
  IIgnorarOn.Visible := not(IIgnorarOn.Visible);

  CargarAnimales(-1);

  MostrarMensaje(tmInformacion,'Los animales no han sido cargados.');

  NoGuarda := true;

  Close();
end;

procedure TFCargaNuevosDeps.HabilitarColumna;
begin
     BDBGGrilla.Columns[5].Visible := true;
     BDBGGrilla.Columns[5].ReadOnly := false;
end;

procedure TFCargaNuevosDeps.CargarAnimales(tipoCarga : integer);
begin

     if (tipoCarga = -1) then //Ignorar nuevos
     begin
          LimpiarExtructurasAux;
     end;

     if (tipoCarga = 0) then  //Alta de animales internos
     begin
          try
            IBQInsertNuevos.Close;
            IBQInsertNuevos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
            IBQInsertNuevos.ParamByName('tipo').AsString := 'I';
            IBQInsertNuevos.Open;

            FPrincipal.IBTPrincipal.CommitRetaining;
          except
            FPrincipal.IBTPrincipal.RollbackRetaining;
          end;
     end;

     if (tipoCarga = 1) then  //Alta de animales externos
     begin
          try
            IBQInsertNuevos.Close;
            IBQInsertNuevos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
            IBQInsertNuevos.ParamByName('tipo').AsString := 'E';
            IBQInsertNuevos.Open;

            FPrincipal.IBTPrincipal.CommitRetaining;
          except
            FPrincipal.IBTPrincipal.RollbackRetaining;
          end;
     end;
     
end;

procedure TFCargaNuevosDeps.LimpiarExtructurasAux;
begin
    try
      IBQLimpiarDepsNuevos.Close;
      IBQLimpiarDepsNuevos.Open;

      IBQLimpiarNuevos.Close;
      IBQLimpiarNuevos.Open;

      FPrincipal.IBTPrincipal.CommitRetaining;

    except

      FPrincipal.IBTPrincipal.RollbackRetaining;

    end;
end;

procedure TFCargaNuevosDeps.IGuardarSeleccionadosClick(Sender: TObject);
begin
  inherited;

  CargarAnimales(0);

  MostrarMensaje(tmInformacion,'Los animales se cargaron correctamente.');

  Close();
end;

procedure TFCargaNuevosDeps.MostrarOcultarOpciones;
begin
      ITodosExternosOff.Visible := false;
      ITodosExternosOn.Visible := false;
      LTodosExternos.Visible := false;

      ITodosInternosOff.Visible := false;
      ITodosInternosOn.Visible := false;
      LTodosInternos.Visible := false;

      IElegirTipoAltaOff.Visible := false;
      IElegirTipoAltaOn.Visible := false;
      LElegirAlta.Visible := false;

      IIgnorarOff.Visible := false;
      IIgnorarOn.Visible := false;
      LIgnorar.Visible := false;

      IGuardarSeleccionados.Visible := true;
      LGuardarSeleccionados.Visible := true;
      IGuardarSeleccionados.Top := 184;
      LGuardarSeleccionados.Top := 188;
end;

procedure TFCargaNuevosDeps.ICancelClick(Sender: TObject);
begin
  inherited;

  NoGuarda := true;
  LimpiarExtructurasAux;
  Close();
end;

procedure TFCargaNuevosDeps.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  LimpiarExtructurasAux;
end;

procedure TFCargaNuevosDeps.CargarPickList;
begin
    SQLStringList.AddObject('TIPO_ALTA',TObject(BDBGGrilla.Columns[5].PickList));
end;

procedure TFCargaNuevosDeps.IBDSNuevosTIPO_ALTASetText(Sender: TField; const Text: String);
var v : string;
begin
  inherited;

  if (Text = 'INTERNO') then
  begin
      Sender.DataSet.Edit;
      Sender.AsString := 'INTERNO';
      v := 'I';
  end;

  if (Text = 'EXTERNO') then
  begin
      Sender.DataSet.Edit;
      Sender.AsString := 'EXTERNO';
      v := 'E';
  end;

      try
          IBQSetTipoAlta.Close;
          IBQSetTipoAlta.ParamByName('tipo').AsString := v;
          IBQSetTipoAlta.ParamByName('rp').AsString := IBDSNuevosID_RP.Value;
          IBQSetTipoAlta.Open;

          FPrincipal.IBTPrincipal.CommitRetaining;
      except
          FPrincipal.IBTPrincipal.RollbackRetaining;
      end;    
  
end;

end.
