unit UCoopropiedad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, IBQuery, WinXP,
  DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList,
  ComCtrls, ExtCtrls, Grids, DBGrids, UBDBGrid, UFrameDBSeleccion, Buttons,
  ImgList, PngImageList, JvExControls, JvLabel, JvGIF, PngImage, jpeg,
  JvExExtCtrls, JvImage;

type
  TFCoopropiedad = class(TFUniversal)
    GBCoopropiedad: TGroupBox;
    FrameSeleccion: TFrameSeleccion;
    BBAceptar: TBitBtn;
    BBSalir: TBitBtn;
    IBQUpdateAuxCoopropiedad: TIBQuery;
    IAceptar: TImage;
    ISalir: TImage;
    LAceptar: TLabel;
    LSalir: TLabel;
    IFondoBotom: TImage;
    PBottom: TPanel;
    IBQPropietarios: TIBQuery;
    IBQInsertAuxCopropiedad: TIBQuery;
    IBQDelPropietarios: TIBQuery;
    IInsertar: TImage;
    Label1: TLabel;
    IBQBorrarAuxPropietarios: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure BBSalirClick(Sender: TObject);
    procedure BBAceptarClick(Sender: TObject);
    procedure FrameSeleccionBBAgregarUnoClick(Sender: TObject);
    procedure FrameSeleccionBBAgregarTodosClick(Sender: TObject);
    procedure FrameSeleccionBBEliminarUnoClick(Sender: TObject);
    procedure FrameSeleccionBBEliminarTodosClick(Sender: TObject);
    procedure IInsertarClick(Sender: TObject);
  private
    { Private declarations }
    id_animal : Integer;
    procedure Seleccion(Sender : TObject);
    procedure BorrarPropietarios();
    function ControlarPorcentajes() : boolean;
    procedure BorrarTabAux();
  public
    procedure ActualizarPropietarios();
    procedure PasarPropietarios();
    procedure SetIDAnimal(aux: Integer);
    { Public declarations }
  end;

var
  FCoopropiedad: TFCoopropiedad;

implementation

{$R *.dfm}

uses UPrincipal,uTiposGlobales, UMensajeHuella, UABMPropietarioAnimal;

{ TFCoopropiedad }

function TFCoopropiedad.ControlarPorcentajes : boolean;
var acum, aux : integer;
begin
  acum := 0;
  aux := 0;
  FrameSeleccion.IBQSeleccionados.First;
  while not FrameSeleccion.IBQSeleccionados.Eof do
    begin
      aux := FrameSeleccion.IBQSeleccionados.FieldValues['PORCENTAJE'];
      if ( (aux = 0) or (aux < 0) ) then
      begin
        Result := FALSE;
        Exit;
      end
      else
        acum := acum + FrameSeleccion.IBQSeleccionados.FieldValues['PORCENTAJE'];
      FrameSeleccion.IBQSeleccionados.Next;
    end;
  Result := (acum = 100);
end;

procedure TFCoopropiedad.BorrarPropietarios;
begin
  IBQPropietarios.First;
  while not IBQPropietarios.Eof do
    begin
      try
        IBQDelPropietarios.Close;
        IBQDelPropietarios.ParamByName('ID_ANIMAL').AsInteger := IBQPropietarios.FieldValues['ID_ANIMAL'];
        IBQDelPropietarios.ParamByName('ID_PROPIETARIO').AsInteger := IBQPropietarios.FieldValues['ID_PROPIETARIO'];
        IBQDelPropietarios.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
      IBQPropietarios.Next;
    end;
end;

procedure TFCoopropiedad.PasarPropietarios;
begin
  IBQPropietarios.Close;
  IBQPropietarios.ParamByName('id_animal').AsInteger := id_animal;
  IBQPropietarios.Open;
  while not IBQPropietarios.Eof do
    begin
      try
        IBQInsertAuxCopropiedad.Close;
        IBQInsertAuxCopropiedad.ParamByName('ID_ANIMAL').AsInteger := id_animal;
        IBQInsertAuxCopropiedad.ParamByName('ID_PROPIETARIO').AsInteger := IBQPropietarios.FieldValues['ID_PROPIETARIO'];
        IBQInsertAuxCopropiedad.ParamByName('NOMBRE').AsString := IBQPropietarios.FieldValues['NOMBRE'];
        IBQInsertAuxCopropiedad.ParamByName('PORCENTAJE').AsInteger := IBQPropietarios.FieldValues['PORCENTAJE'];
        IBQInsertAuxCopropiedad.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
      IBQPropietarios.Next;
    end;
end;

procedure TFCoopropiedad.ActualizarPropietarios;
begin
  FrameSeleccion.IBQSeleccionados.Close;
  FrameSeleccion.IBQSeleccionados.Open;
  FrameSeleccion.IBQDisponibles.Close;
  FrameSeleccion.IBQDisponibles.Open;
end;

procedure TFCoopropiedad.FormCreate(Sender: TObject);
begin
  BorrarTabAux;
  FrameSeleccion.OnSelectItem := Seleccion;
end;

procedure TFCoopropiedad.Seleccion(Sender: TObject);
begin
  FrameSeleccion.IBQSeleccionados.Insert;
  FrameSeleccion.IBQSeleccionados.FieldByName('id_animal').Value := 0;//aca poner el animal
  FrameSeleccion.IBQSeleccionados.FieldByName('id_propietario').Value := FrameSeleccion.IBQDisponibles.FieldValues['id_propietario'];
  FrameSeleccion.IBQSeleccionados.FieldByName('nombre').Value := FrameSeleccion.IBQDisponibles.FieldValues['nombre'];
  FrameSeleccion.IBQSeleccionados.FieldByName('porcentaje').Value := 0;
end;

procedure TFCoopropiedad.BorrarTabAux;
begin
  try
    IBQBorrarAuxPropietarios.Close;
    IBQBorrarAuxPropietarios.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFCoopropiedad.BBSalirClick(Sender: TObject);
begin
  inherited;
  BorrarTabAux;
  close();
end;

procedure TFCoopropiedad.BBAceptarClick(Sender: TObject);
begin
  inherited;
  if (not(ControlarPorcentajes)) then
        MostrarMensaje(tmError,'Controle los porcentajes asignados')
      else
        begin
  if (MostrarMensaje(tmConsulta, 'Desea aplicar los valores de porcentaje de coopropiedad?') = mrYes)then
    begin
        try
          BorrarPropietarios();
          FrameSeleccion.IBQSeleccionados.First;
          while not FrameSeleccion.IBQSeleccionados.Eof do
            begin
              IBQUpdateAuxCoopropiedad.Close;
              IBQUpdateAuxCoopropiedad.ParamByName('id_animal').AsInteger:= FrameSeleccion.IBQSeleccionados.FieldByName('id_animal').AsInteger;
              IBQUpdateAuxCoopropiedad.ParamByName('id_propietario').AsInteger:= FrameSeleccion.IBQSeleccionados.FieldByName('id_propietario').AsInteger;
              IBQUpdateAuxCoopropiedad.ParamByName('porcentaje').AsFloat:= FrameSeleccion.IBQSeleccionados.FieldByName('porcentaje').AsInteger;
              IBQUpdateAuxCoopropiedad.Open;
              FrameSeleccion.IBQSeleccionados.Next;
            end;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
      end;
    FPrincipal.IBDPrincipal.ApplyUpdates([FrameSeleccion.IBQSeleccionados]);
    Close();
  end;
end;

procedure TFCoopropiedad.SetIDAnimal(aux: Integer);
begin
  id_animal := aux;
end;

procedure TFCoopropiedad.FrameSeleccionBBAgregarUnoClick(Sender: TObject);
begin
  inherited;
  FrameSeleccion.OnSelectItem := Seleccion;
  FrameSeleccion.BBAgregarUnoClick(Sender);
end;

procedure TFCoopropiedad.FrameSeleccionBBAgregarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccion.OnSelectItem := Seleccion;
  FrameSeleccion.BBAgregarTodosClick(Sender);
end;

procedure TFCoopropiedad.FrameSeleccionBBEliminarUnoClick(Sender: TObject);
begin
  inherited;
  FrameSeleccion.OnSelectItem := Seleccion;
  FrameSeleccion.BBEliminarUnoClick(Sender);
end;

procedure TFCoopropiedad.FrameSeleccionBBEliminarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccion.OnSelectItem := Seleccion;
  FrameSeleccion.BBEliminarTodosClick(Sender);
end;

procedure TFCoopropiedad.IInsertarClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
      FPrincipal.AbrirFormNormal(TFABMPropietarioAnimal.Create(Self));
  BorrarTabAux();
  PasarPropietarios();
  ActualizarPropietarios();
end;

end.
