unit UAbmRaza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, EditAuto, Mask, DBCtrls,
  UDBLookupComboBoxAuto, DateTimePickerAuto, UDBDateTimePickerAuto,
  DataExport, DataToXLS, WinXP, UAbmSimple, UDBEditAuto, IBUpdateSQL,
  Menus, ImgList, JvExControls, JvLabel, PngImage, jpeg, JvGIF,
  PngImageList, JvExExtCtrls, JvImage;

type
  TFABMRaza = class(TFABMSimple)
    LNombre: TLabel;
    DBECodigo: TDBEditAuto;
    DBENombre: TDBEditAuto;
    LCodigo: TLabel;
    LSinonimo: TLabel;
    DBESinonimo: TDBEditAuto;
    LDiasGestacion: TLabel;
    DBEDiasGestacion: TDBEditAuto;
    CBVisible: TCheckBox;
    IBQAbmSimpleID_RAZA: TIntegerField;
    IBQAbmSimpleCODIGO: TIBStringField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleSINONIMO: TIBStringField;
    IBQAbmSimpleDIAS_GESTACION: TIntegerField;
    IBQAbmSimpleVISIBLE: TIntegerField;
    LSubCateg: TLabel;
    DBLLBSubCateg: TDBLookupListBox;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    IBQInsertRaza: TIBQuery;
    IBQRazas: TIBQuery;
    IBQCodRazas: TIBQuery;
    procedure AcGuardarExecute(Sender: TObject);
    procedure BDBGAbmDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure BDBGAbmTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure DBLLBSubCategDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure AcCancelarExecute(Sender: TObject);
    procedure AcSalirExecute(Sender: TObject);
  private
    Borrar : Boolean;
    procedure HabilitarComponentesVersionBasica; override;
    procedure CambiarValorColumna(Column: TColumn);

    procedure AnchoAltoEstatico; override;
  protected
    procedure InsertarRegistro; override;
    procedure EditarRegistro; override;        
  public
  end;

var
  FABMRaza: TFABMRaza;

implementation

uses UPrincipal, uTiposGlobales, UDMSoftvet, UABMSubCategorias, UTraduccion, UMensajeHuella;

{$R *.dfm}

{ TFABMRaza }

procedure TFABMRaza.EditarRegistro;
begin
  inherited;
  if(IBQAbmSimple.FieldByName('visible').AsInteger = 1) then
    CBVisible.Checked:= true
   else
     CBVisible.Checked:= false;
end;

procedure TFABMRaza.AnchoAltoEstatico;
begin

  Width := 697;

end;

procedure TFABMRaza.HabilitarComponentesVersionBasica;
begin
  inherited;
  if (FPrincipal.TipoVersionLicencia = 'Basico') then
      CBVisible.Enabled:= false;
end;

procedure TFABMRaza.InsertarRegistro;
begin
  inherited;

  CBVisible.Checked:= true;
  if(CBVisible.Checked) then
    IBQAbmSimple.FieldByName('visible').AsInteger := 1
   else
     IBQAbmSimple.FieldByName('visible').AsInteger := 0
end;

procedure TFABMRaza.AcGuardarExecute(Sender: TObject);
begin
  if(CBVisible.Checked) then
    IBQAbmSimple.FieldByName('visible').AsInteger := 1
   else
     IBQAbmSimple.FieldByName('visible').AsInteger := 0;
  inherited;
  //FPrincipal.IBTPrincipal.CommitRetaining;
   DMSoftvet.IBQRaza.Close;
   DMSoftvet.IBQRaza.Open;
end;

procedure TFABMRaza.BDBGAbmDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Const
 CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
var   CheckBoxRectangle : TRect;

begin
  inherited;
  if Column.FieldName = 'VISIBLE' then
  begin
    BDBGAbm.Canvas.FillRect(Rect);
    CheckBoxRectangle.Left := Rect.Left + 2;
    CheckBoxRectangle.Right := Rect.Right - 2;
    CheckBoxRectangle.Top := Rect.Top + 2;
    CheckBoxRectangle.Bottom := Rect.Bottom - 2;
    if Column.Field.Value = 1 then
      DrawFrameControl(BDBGAbm.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[true])
    else
      DrawFrameControl(BDBGAbm.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[false]);
  end;
end;

procedure TFABMRaza.CambiarValorColumna(Column: TColumn);
begin

  Column.Field.DataSet.Edit;

  if(Column.Field.AsInteger = 0)then
    Column.Field.AsInteger := 1
  else
    Column.Field.AsInteger := 0;

  Column.Field.DataSet.Post;
  try
    IBQAbmSimple.ApplyUpdates;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFABMRaza.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if((Column.FieldName = 'VISIBLE') and not (BDBGAbm.ColumnByField('NOMBRE').Field.AsString = 'NO DEFINIDA')) then
    CambiarValorColumna(Column);
end;

procedure TFABMRaza.BDBGAbmTitleClick(Column: TColumn);
begin
  inherited;
  if  Column.FieldName = 'VISIBLE' then
  begin
    if Borrar then
    begin
        Column.Title.Caption := Traducir('Visible (Marcar Todos)');
        BDBGAbm.DataSource.DataSet.First;
        while not (BDBGAbm.DataSource.DataSet.Eof) do
        begin
           if (BDBGAbm.ColumnByField('NOMBRE').Field.AsString <> 'NO DEFINIDA') then
           begin
              BDBGAbm.ColumnByField('VISIBLE').Field.DataSet.Edit;
              BDBGAbm.ColumnByField('VISIBLE').Field.AsInteger := 0;
              BDBGAbm.ColumnByField('VISIBLE').Field.DataSet.Post;
           end;
              BDBGAbm.DataSource.DataSet.Next;
         end;
        BDBGAbm.DataSource.DataSet.First;
    end
    else
    begin
        Column.Title.Caption := Traducir('Visible (Desmarcar Todos)');
        BDBGAbm.DataSource.DataSet.First;
        while not (BDBGAbm.DataSource.DataSet.Eof) do
        begin
            BDBGAbm.ColumnByField('VISIBLE').Field.DataSet.Edit;
            BDBGAbm.ColumnByField('VISIBLE').Field.AsInteger := 1;
            BDBGAbm.ColumnByField('VISIBLE').Field.DataSet.Post;
            BDBGAbm.DataSource.DataSet.Next;
        end;
        BDBGAbm.DataSource.DataSet.First;
    end;
    Borrar := not Borrar;
    try
      IBQAbmSimple.ApplyUpdates;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;
end;

procedure TFABMRaza.FormCreate(Sender: TObject);
begin
  inherited;
  Borrar := true;

  BDBGAbm.DataSource.DataSet.Open;

  BDBGAbm.DataSource.DataSet.First;
  while not (BDBGAbm.DataSource.DataSet.Eof) do
  begin
    if (BDBGAbm.ColumnByField('NOMBRE').Field.AsString = 'NO DEFINIDA') then
    begin
       BDBGAbm.ColumnByField('VISIBLE').Field.DataSet.Edit;
       BDBGAbm.ColumnByField('VISIBLE').Field.AsInteger := 1;
       BDBGAbm.ColumnByField('VISIBLE').Field.DataSet.Post;
    end;
    BDBGAbm.DataSource.DataSet.Next;
  end;
    BDBGAbm.DataSource.DataSet.First;
end;

procedure TFABMRaza.AcEditarExecute(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQSubCategoriaRaza.Close;
  DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').AsInteger := IBQAbmSimple.FieldValues['id_raza'];
  DMSoftvet.IBQSubCategoriaRaza.Open;

end;

procedure TFABMRaza.DBLLBSubCategDblClick(Sender: TObject);
var
  F : TFABMSubCategorias;
begin
  inherited;
  if not (Owner is TFABMSubCategorias) then
  begin
    F := TFABMSubCategorias.Create(self);
    F.IBQAbmSimple.Close;
    F.IBQAbmSimple.Open;
    F.IBQAbmSimple.Locate('id_subcategoria',DMSoftvet.IBQSubCategoriaRaza.FieldValues['id_subcategoria'],[]);
    //F.Estado := eaEditar;
    F.AcEditarExecute(nil);
    F.BBGuardar.Visible := true;
    F.ShowModal();
    F.Destroy;
  end;
end;

procedure TFABMRaza.SpeedButton1Click(Sender: TObject);
var
  F : TFABMSubCategorias;
begin
  inherited;
  if not (Owner is TFABMSubCategorias) then
  begin
    F := TFABMSubCategorias.Create(self);
    F.IBQAbmSimple.Close;
    F.IBQAbmSimple.Open;
    //F.IBQAbmSimple.Locate('id_subcategoria',DMSoftvet.IBQSubCategoriaRaza.FieldValues['id_subcategoria'],[]);
    //F.Estado := eaEditar;
    IBQInsertRaza.Close;
    IBQInsertRaza.ParamByName('id_raza').AsInteger := IBQAbmSimple.FieldValues['id_raza'];
    IBQInsertRaza.ParamByName('raza').AsString := IBQAbmSimple.FieldValues['nombre'];
    IBQInsertRaza.ParamByName('id_sub').asInteger := F.IBQAbmSimple.FieldValues['id_subcategoria'];
    IBQInsertRaza.Open;
    F.ActualizarRazas;
    F.AcInsertarExecute(nil);
    F.BBGuardar.Visible := true;
    F.ShowModal();
    F.Destroy;

    DMSoftvet.IBQSubCategoriaRaza.Close;
    DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').AsInteger := IBQAbmSimple.FieldValues['id_raza'];
    DMSoftvet.IBQSubCategoriaRaza.Open;
  end;
end;

procedure TFABMRaza.AcCancelarExecute(Sender: TObject);
begin
  inherited;

  FormResize(self);

  AnchoAltoEstatico;
end;

procedure TFABMRaza.AcSalirExecute(Sender: TObject);

begin
  inherited;

//  confirmaReinicio := false;

{  BDBGAbm.DataSource.DataSet.First;
  while not (BDBGAbm.DataSource.DataSet.Eof) do
  begin
    if ((BDBGAbm.ColumnByField('NOMBRE').Field.AsString = 'BRAFORD') or
        (BDBGAbm.ColumnByField('NOMBRE').Field.AsString = 'BRANGUS COLORADO') or
        (BDBGAbm.ColumnByField('NOMBRE').Field.AsString = 'BRANGUS NEGRO')) then
    begin
       if (BDBGAbm.ColumnByField('VISIBLE').Field.AsInteger = 1) then
          confirmaReinicio := true;
    end;
    BDBGAbm.DataSource.DataSet.Next;
  end;
}           {
  IBQCodRazas.Close;
  IBQCodRazas.Open;
  IBQCodRazas.First;

  AssignFile( F, ExtractFilePath( Application.ExeName ) + 'hvfr.cfg' );
  Rewrite( F );

  if (confirmaReinicio) then
  begin
      while not(IBQCodRazas.Eof) do
      begin

        v := IBQCodRazas.FieldValues['id_raza'];

        WriteLn( F, IntToStr(v)+',1' );

        IBQCodRazas.Next;
      end;
  end
  else
  begin
      while not(IBQCodRazas.Eof) do
      begin

        v := IBQCodRazas.FieldValues['id_raza'];

        WriteLn( F, IntToStr(v)+',0' );

        IBQCodRazas.Next;
      end;
  end;

  CloseFile( F );

  MostrarMensaje(tmInformacion,'Para que los cambios tengan efecto, el programa deberá ser reiniciado. Por lo tanto Huella se cerrará.');
  RearmarArchivoRazasVisibles;
  Application.Terminate;    }

end;


end.
