unit UNDOServicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, StdCtrls, ExtCtrls, IBQuery, DB,
  IBCustomDataSet, IBStoredProc, Buttons, Grids, DBGrids, UBDBGrid, UDMSoftvet,
  WinXP, DataExport, DataToXLS, EditAuto,UREPFichaAnimal, UMangaAnimalesServicio,
  ImgList, DBCtrls, UDBLookupComboBoxAuto, DateTimePickerAuto, DateUtils, StrUtils,
  JvExControls, JvLabel, JvGIF, PngImage, JvExExtCtrls, JvImage, jpeg,
  PngImageList ;

const
  MAX_PARAMETROS = 4;

type
  TRegFiltro = record
    SQL: String;
    NomPar1, NomPar2: String;
    Param1, Param2: Variant;
    EnUso: Boolean;
    Tipo: TVarType;
  end;

  TFUndoServicios = class(TFUniversal)
    BDBGSemen: TBitDBGrid;
    PBotones: TPanel;
    PGrilla: TPanel;
    DSServicio: TDataSource;
    BDBGServicios: TBitDBGrid;
    IBSPUndoServicio: TIBStoredProc;
    IBQListadoServicios: TIBQuery;
    DSListadoServicios: TDataSource;
    GroupBox1: TGroupBox;
    IBSPEliminarInseminacion: TIBStoredProc;
    IBQListadoServiciosID_SERVICIO: TIntegerField;
    IBQListadoServiciosNOMBRE_SERVICIO: TIBStringField;
    IBQListadoServiciosGRUPO: TIntegerField;
    IBQListadoServiciosFECHA_INICIO: TDateField;
    IBQListadoServiciosFECHA_FIN: TDateField;
    IBQListadoServiciosFECHA_FIN_ESTIMADA: TDateField;
    IBQListadoServiciosPOTRERO: TIntegerField;
    IBQListadoServiciosTIPO_SERVICIO: TIBStringField;
    IBQListadoServiciosRP_INT: TIBStringField;
    IBQListadoServiciosNOM_TORO: TIBStringField;
    IBQListadoServiciosID_MADRE: TIntegerField;
    IBQListadoServiciosID_PADRE: TIntegerField;
    IBQListadoServiciosEXTERNO: TIBStringField;
    ILServicio: TImageList;
    GroupBox2: TGroupBox;
    EANombreServ: TEditAuto;
    DBLCBATipoServ: TDBLookupComboBoxAuto;
    CBTipo: TCheckBox;
    CBNombre: TCheckBox;
    DTPAHasta: TDateTimePickerAuto;
    DTPADesde: TDateTimePickerAuto;
    LDesde: TLabel;
    CBFecha: TCheckBox;
    LHasta: TLabel;
    IBQTiposServicios: TIBQuery;
    DSTiposServicio: TDataSource;
    EARP: TEditAuto;
    CBRP: TCheckBox;
    CBNombreToro: TCheckBox;
    EAToro: TEditAuto;
    BBEliminar: TBitBtn;
    BBAyuda: TBitBtn;
    BBSalir: TBitBtn;
    IFondoB: TImage;
    JvIAyuda: TJvImage;
    LAyuda: TLabel;
    IEliminar: TImage;
    LEliminar: TLabel;
    JvSalir: TJvImage;
    LSalir: TLabel;
    procedure BBSalirClick(Sender: TObject);
    procedure BBEliminarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DSServicioDataChange(Sender: TObject; Field: TField);
    procedure EARPChange(Sender: TObject);
    procedure EAToroChange(Sender: TObject);
    procedure IBQListadoServiciosAfterOpen(DataSet: TDataSet);
    procedure BDBGServiciosDblClick(Sender: TObject);
    procedure BDBGServiciosKeyPress(Sender: TObject; var Key: Char);
    procedure BDBGServiciosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure CBFechaClick(Sender: TObject);
    procedure CBTipoClick(Sender: TObject);
    procedure CBNombreClick(Sender: TObject);
    procedure DTPADesdeChange(Sender: TObject);
    procedure DTPAHastaChange(Sender: TObject);
    procedure DBLCBATipoServCloseUp(Sender: TObject);
    procedure EANombreServChange(Sender: TObject);
    procedure CBRPClick(Sender: TObject);
    procedure CBNombreToroClick(Sender: TObject);
    procedure IBQTiposServiciosAfterOpen(DataSet: TDataSet);
    procedure BDBGServiciosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDBGServiciosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDBGServiciosCellClick(Column: TColumn);
  private
    apretado: boolean;
    ind:integer;
    Parametros : Array [0..MAX_PARAMETROS] of TRegFiltro;
    procedure InicParametros;
    procedure AbrirQueryGrilla;
    procedure ArmarSQL;
  public
  end;

var
  FUndoServicios: TFUndoServicios;
  SQLGeneral : String;
implementation

uses UPrincipal,uTiposGlobales, UMensajeHuella;

{$R *.dfm}

procedure TFUndoServicios.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFUndoServicios.BBEliminarClick(Sender: TObject);
var
  i: integer;
begin
  inherited;

  if (BDBGServicios.SelectedRows.Count > 0) then
  begin
    if (MostrarMensaje(tmConsulta, 'Esta Seguro de Eliminar los Servicios seleccionados?') = mrYes) then
    begin
      with BDBGServicios.DataSource.DataSet do
        for i := 0 to BDBGServicios.SelectedRows.Count -1 do
        begin
          GotoBookmark(pointer(BDBGServicios.SelectedRows.Items[i]));
          if BDBGServicios.DataSource.DataSet.FieldValues['TIPO_SERVICIO'] = 'INSEMINACIÓN ARTIFICIAL' then
          begin
//            if (MostrarMensaje(tmConsulta, 'Esta Seguro que Desea Eliminar la Inseminación de ese Animal ?') = mrYes)then
              try
                IBSPEliminarInseminacion.Close;
                IBSPEliminarInseminacion.ParamByName('RPANIMAL').AsString := BDBGServicios.DataSource.DataSet.FieldValues['RP_INT'];
                IBSPEliminarInseminacion.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
                IBSPEliminarInseminacion.ParamByName('SERVICIO').AsInteger := BDBGServicios.DataSource.DataSet.FieldValues['ID_SERVICIO'];
                IBSPEliminarInseminacion.ExecProc;
                FPrincipal.IBTPrincipal.CommitRetaining;
              except
                MostrarMensaje(tmError, 'La Inseminación no pudo ser Eliminada');
                FPrincipal.IBTPrincipal.RollbackRetaining;
              end;
          end
        else
        begin
//          if (MostrarMensaje(tmConsulta, 'Esta Seguro de Eliminar el Servicio ?') = mrYes)then
            try
              IBSPUndoServicio.Close;
              IBSPUndoServicio.ParamByName('ID_SERVICIO').AsInteger := BDBGServicios.DataSource.DataSet.FieldValues['ID_SERVICIO'];
              IBSPUndoServicio.ExecProc;
              FPrincipal.IBTPrincipal.CommitRetaining;
            except
              MostrarMensaje(tmError, 'El Servicio no pudo ser Eliminado ');
              FPrincipal.IBTPrincipal.RollbackRetaining;
            end;
        end;
       end;
    end;
    AbrirQueryGrilla;
  end
  else
    MostrarMensaje(tmError, 'Debe seleccionar al menos un servicio a eliminar ');
end;

procedure TFUndoServicios.AbrirQueryGrilla;
var
  I : Integer;
begin
  ArmarSQL;
  IBQListadoServicios.Close;
  IBQListadoServicios.SQL.Clear;
  IBQListadoServicios.SQL.Add(SQLGeneral);
  IBQListadoServicios.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  for I := 0 to MAX_PARAMETROS do
    if Parametros[I].EnUso then
    begin
      IBQListadoServicios.ParamByName(Parametros[I].NomPar1).Value := VarAsType(Parametros[I].Param1,Parametros[I].Tipo);
      if Parametros[I].NomPar2 <> '-' then
        IBQListadoServicios.ParamByName(Parametros[I].NomPar2).Value := VarAsType(Parametros[I].Param2,Parametros[I].Tipo);
    end;
  IBQListadoServicios.Open;
end;

procedure TFUndoServicios.ArmarSQL;
var
  I : Integer;
begin
  SQLGeneral := 'SELECT * FROM LISTADO_SERVICIOS(:esta)';
  for I := 0 to MAX_PARAMETROS do
    if Parametros[I].EnUso then
    begin
      if AnsiContainsStr(SQLGeneral,'WHERE') then
        SQLGeneral := SQLGeneral +' AND '+Parametros[I].SQL
      else
        SQLGeneral := SQLGeneral +' WHERE '+Parametros[I].SQL;
    end;
end;

procedure TFUndoServicios.InicParametros;
begin
  Parametros[0].EnUso := false;
  Parametros[0].Tipo := varDate;
  Parametros[0].Param1 := null;
  Parametros[0].Param2 := null;
  Parametros[0].NomPar1 := 'DESDE';
  Parametros[0].NomPar2 := 'HASTA';
  Parametros[0].SQL := ' FECHA_INICIO BETWEEN :DESDE AND :HASTA ';
  Parametros[1].EnUso := false;
  Parametros[1].Tipo := varInteger;
  Parametros[1].Param1 := 0;
  Parametros[1].Param2 := null;
  Parametros[1].NomPar1 := 'TIPO';
  Parametros[1].NomPar2 := '-';
  Parametros[1].SQL := ' ID_TIPO_SERV = :TIPO ';
  Parametros[2].EnUso := false;
  Parametros[2].Tipo := varString;
  Parametros[2].Param1 := '';
  Parametros[2].Param2 := null;
  Parametros[2].NomPar1 := 'NOMBRE';
  Parametros[2].NomPar2 := '-';
  Parametros[2].SQL := ' NOMBRE_SERVICIO LIKE :NOMBRE ';
  Parametros[3].EnUso := false;
  Parametros[3].Tipo := varString;
  Parametros[3].Param1 := '';
  Parametros[3].Param2 := null;
  Parametros[3].NomPar1 := 'RP';
  Parametros[3].NomPar2 := '-';
  Parametros[3].SQL := ' RP_INT LIKE :RP ';
  Parametros[4].EnUso := false;
  Parametros[4].Tipo := varString;
  Parametros[4].Param1 := '';
  Parametros[4].Param2 := null;
  Parametros[4].NomPar1 := 'NOMBRE_TORO';
  Parametros[4].NomPar2 := '-';
  Parametros[4].SQL := ' NOM_TORO LIKE :NOMBRE_TORO ';
end;

procedure TFUndoServicios.FormShow(Sender: TObject);
begin
  inherited;
  IBQTiposServicios.Close;
  IBQTiposServicios.Open;
  DTPADesde.Date := IncYear(Today(),-1);
  DTPAHasta.Date := Today();
  InicParametros;
  AbrirQueryGrilla;
  //BBEliminar.Enabled := (not BDBGServicios.DataSource.DataSet.IsEmpty);
  LEliminar.Enabled := (not BDBGServicios.DataSource.DataSet.IsEmpty);
  IEliminar.Enabled := (not BDBGServicios.DataSource.DataSet.IsEmpty);
end;

procedure TFUndoServicios.DSServicioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  //BBEliminar.Enabled := (not BDBGServicios.DataSource.DataSet.IsEmpty);
  LEliminar.Enabled := (not BDBGServicios.DataSource.DataSet.IsEmpty);
  IEliminar.Enabled := (not BDBGServicios.DataSource.DataSet.IsEmpty);
end;

procedure TFUndoServicios.IBQListadoServiciosAfterOpen(DataSet: TDataSet);
begin
  inherited;
 // BBEliminar.Enabled := not (DataSet.IsEmpty);
 LEliminar.Enabled := not (DataSet.IsEmpty);
 IEliminar.Enabled := not (DataSet.IsEmpty);
end;

procedure TFUndoServicios.BDBGServiciosDblClick(Sender: TObject);
var
  F : TFAnimalesServicio;
  F1 : TFREPFichaAnimal;
begin
  inherited;
  if (BDBGServicios.SelectedIndex = BDBGServicios.ColumnByField('RP_INT').Index) then
  begin
    if not(IBQListadoServicios.IsEmpty) then
    begin
      if IBQListadoServicios.FieldByName('id_madre').Value = null then
      begin
        F := TFAnimalesServicio.Create(self,IBQListadoServicios.FieldValues['ID_SERVICIO']);
        F.ShowModal;
        F.Destroy;
        AbrirQueryGrilla;
      end
      else
      begin
        F1 := TFREPFichaAnimal.Create(self);
        F1.animal := IBQListadoServicios.FieldByName('id_madre').Value;
        F1.ShowModal;
        F1.Destroy;
      end;
    end;
  end
  else
  begin
    if (BDBGServicios.SelectedIndex = BDBGServicios.ColumnByField('NOM_TORO').Index) then
    begin
      if not(IBQListadoServicios.eof) then
      begin
      if IBQListadoServicios.FieldByName('externo').Value = 'N' then
      begin
        F1 := TFREPFichaAnimal.Create(self);
        F1.animal := IBQListadoServicios.FieldByName('id_padre').Value;
        F1.ShowModal;
        F1.Destroy;
      end
      else
        MostrarMensaje(tmAdvertencia, 'No se puede mostrar la ficha de un animal externo.');
    end;
  end
  end;
end;

procedure TFUndoServicios.BDBGServiciosKeyPress(Sender: TObject;
  var Key: Char);
begin
 if(key=#13) then
  BDBGServiciosDblClick(nil);
end;

procedure TFUndoServicios.BDBGServiciosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  dato : Variant;
  bitmap : TBitmap;
begin
  inherited;
  if (Column.FieldName = 'RP_INT') then
  begin
    dato := IBQListadoServicios.FieldValues['RP_INT'];
    if dato = '-----' then
    begin
      bitmap := TBitmap.Create;
      ILServicio.GetBitmap(0,bitmap);
      BDBGServicios.Canvas.Draw((Rect.Right div 2)-10,Rect.TopLeft.Y,bitmap);
    end;
  end;
end;

procedure TFUndoServicios.CBFechaClick(Sender: TObject);
begin
  inherited;
  LDesde.Enabled := CBFecha.Checked;
  LHasta.Enabled := CBFecha.Checked;
  DTPADesde.Enabled := CBFecha.Checked;
  DTPAHasta.Enabled := CBFecha.Checked;
  Parametros[0].EnUso := CBFecha.Checked;
  Parametros[0].Param1 := DTPADesde.Date;
  Parametros[0].Param2 := DTPAHasta.Date;
  AbrirQueryGrilla;
end;

procedure TFUndoServicios.CBTipoClick(Sender: TObject);
begin
  inherited;
  DBLCBATipoServ.Enabled := CBTipo.Checked;
  Parametros[1].EnUso := CBTipo.Checked;
  AbrirQueryGrilla;
end;

procedure TFUndoServicios.CBNombreClick(Sender: TObject);
begin
  inherited;
  EANombreServ.Enabled := CBNombre.Checked;
  Parametros[2].EnUso := CBNombre.Checked;
  AbrirQueryGrilla;
end;

procedure TFUndoServicios.CBRPClick(Sender: TObject);
begin
  inherited;
  EARP.Enabled := CBRP.Checked;
  Parametros[3].EnUso := CBRP.Checked;
  AbrirQueryGrilla;
end;

procedure TFUndoServicios.CBNombreToroClick(Sender: TObject);
begin
  inherited;
  EAToro.Enabled := CBNombreToro.Checked;
  Parametros[4].EnUso := CBNombreToro.Checked;
  AbrirQueryGrilla;
end;

procedure TFUndoServicios.DTPADesdeChange(Sender: TObject);
begin
  inherited;
  Parametros[0].Param1 := DTPADesde.Date;
  AbrirQueryGrilla;
end;

procedure TFUndoServicios.DTPAHastaChange(Sender: TObject);
begin
  inherited;
  Parametros[0].Param2 := DTPAHasta.Date;
  AbrirQueryGrilla;
end;

procedure TFUndoServicios.DBLCBATipoServCloseUp(Sender: TObject);
begin
  inherited;
  Parametros[1].Param1 := DBLCBATipoServ.KeyValue;
  AbrirQueryGrilla;
end;

procedure TFUndoServicios.EANombreServChange(Sender: TObject);
begin
  inherited;
  Parametros[2].Param1 := EANombreServ.Text+'%';
  AbrirQueryGrilla;
end;

procedure TFUndoServicios.EARPChange(Sender: TObject);
begin
  inherited;
  Parametros[3].Param1 := EARP.Text+'%';
  AbrirQueryGrilla;
end;

procedure TFUndoServicios.EAToroChange(Sender: TObject);
begin
  inherited;
  Parametros[4].Param1 := EAToro.Text+'%';
  AbrirQueryGrilla;
end;

procedure TFUndoServicios.IBQTiposServiciosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQTiposServicios.Last;
  IBQTiposServicios.First;
end;

procedure TFUndoServicios.BDBGServiciosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //inherited;
  apretado:=false;
  if Key in [VK_SHIFT] then
    begin
    ind:= BDBGServicios.DataSource.DataSet.RecNo;
    apretado:=true;
    end;

end;

procedure TFUndoServicios.BDBGServiciosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
  if Key in [VK_SHIFT] then
    begin
    ind:=0;
    apretado:=false;
    end;

end;

procedure TFUndoServicios.BDBGServiciosCellClick(Column: TColumn);
var
  i: integer;
begin
//  inherited;
  if apretado then
    begin
    BDBGServicios.SelectedRows.CurrentRowSelected:=true;
    for i:=0 to Abs(ind-BDBGServicios.DataSource.DataSet.RecNo) do
       begin
       BDBGServicios.SelectedRows.CurrentRowSelected:=true;
       if BDBGServicios.DataSource.DataSet.RecNo<ind then
          BDBGServicios.DataSource.DataSet.Next;
       if BDBGServicios.DataSource.DataSet.RecNo>ind then
          BDBGServicios.DataSource.DataSet.Prior;
       end;
    end;

end;

end.

