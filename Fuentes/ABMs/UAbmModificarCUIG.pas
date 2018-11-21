unit UAbmModificarCUIG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, IBQuery, Menus, DB,
  ImgList, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls,
  UPrincipal, EditAuto, Mask, DBCtrls, UDBEditAuto, UMensajeHuella,
  JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls,
  JvImage;

type
  TFABMModificarCUIG = class(TFABMSimple)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEACUIG: TDBEditAuto;
    DBEAUltimoIdent: TDBEditAuto;
    CBActivar: TCheckBox;
    IBQVerificar: TIBQuery;
    Label5: TLabel;
    procedure IBQAbmSimpleBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure DBEACUIGChange(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
  private
    CUIGViejo : String;
    procedure Parametros();
    function ExisteCUIG(CUIGNuevo : String) : Boolean;
  public
    { Public declarations }
  end;

var
  FABMModificarCUIG: TFABMModificarCUIG;

implementation

uses UFunctions;

{$R *.dfm}

procedure TFABMModificarCUIG.IBQAbmSimpleBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  IBQAbmSimple.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
end;

procedure TFABMModificarCUIG.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := true;
  PermiteInsertar := true;
end;

procedure TFABMModificarCUIG.AcGuardarExecute(Sender: TObject);
begin
  if not(CheckFormatoCUIGEncabezado(DBEACUIG.Text)) then
     begin
      MostrarMensaje(tmError, 'CUIG Inválido. El formato tiene que ser de dos letras seguidas de tres números por ejemplo "AA001".');
      DBEACUIG.SetFocus;
     end
   else
    if (Length(DBEAUltimoIdent.Text)>0) and (Length(DBEAUltimoIdent.Text)<4) then
       begin
        MostrarMensaje(tmError, 'Identificador Inválido. No cumple el formato de SENASA.');
        DBEAUltimoIdent.SetFocus;
       end
     else
      if ((DBEAUltimoIdent.Text <> '') and not(CheckFormatoCUIGUltimoIdent(DBEAUltimoIdent.Text))) then
        begin
         MostrarMensaje(tmError, 'Identificador Inválido. El formato tiene que ser de una letra seguida de tres números por ejemplo "A001".');
         DBEAUltimoIdent.SetFocus;
        end
      else
        if ((CUIGViejo = '') and (not ExisteCUIG(DBEACUIG.Text))) then
          MostrarMensaje(tmError, 'Ya Existe ese CUIG en el Establecimiento')
        else
         begin
          Parametros();
          inherited;
         end;
end;

procedure TFABMModificarCUIG.AcEditarExecute(Sender: TObject);
var
  activo : integer;
begin
  if not(IBQAbmSimple.IsEmpty) then
  begin
    CUIGViejo := DBEACUIG.Text;
    IBQVerificar.Close;
    IBQVerificar.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQVerificar.ParamByName('enc').AsString := DBEACUIG.Text;
    IBQVerificar.Open;
    activo := IBQVerificar.fieldByName('activo').AsInteger;
    if activo=1 then
      CBActivar.Checked := true
    else
      CBActivar.Checked := false;
    inherited;
    Parametros();
  end;
end;

procedure TFABMModificarCUIG.Parametros();
begin
  IBQAbmSimple.FieldValues['ESTABLECIMIENTO'] := FPrincipal.EstablecimientoActual;
  if (DBEAUltimoIdent.Text = '') then
    DSAbmSimple.DataSet.FieldByName('ULTIMO_IDENTIFICADOR').AsString := 'A000';
  if CBActivar.Checked then
    DSAbmSimple.DataSet.FieldByName('ACTIVO').AsInteger := 1
  else
    DSAbmSimple.DataSet.FieldByName('ACTIVO').AsInteger := 0;
end;

function TFABMModificarCUIG.ExisteCUIG(CUIGNuevo : String) : Boolean;
begin
  IBQVerificar.Close;
  IBQVerificar.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQVerificar.ParamByName('enc').AsString := CUIGNuevo;
  IBQVerificar.Open;
  Result := IBQVerificar.IsEmpty;
end;

procedure TFABMModificarCUIG.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  CUIGViejo := '';
end;

procedure TFABMModificarCUIG.DBEACUIGChange(Sender: TObject);
begin
  inherited;
  BBGuardar.Enabled:= CheckFormatoCUIGEncabezado(DBEACUIG.Text);
end;

procedure TFABMModificarCUIG.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_CUIG'];
end;

procedure TFABMModificarCUIG.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

end.
