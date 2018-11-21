unit UCoopropiedad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, IBQuery, WinXP,
  DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList,
  ComCtrls, ExtCtrls, Grids, DBGrids, UBDBGrid, UFrameDBSeleccion, Buttons;

type
  TFCoopropiedad = class(TFUniversal)
    GroupBox2: TGroupBox;
    GBCoopropiedad: TGroupBox;
    FrameSeleccion: TFrameSeleccion;
    BBAceptar: TBitBtn;
    BBSalir: TBitBtn;
    IBQUpdateAuxCoopropiedad: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure BBSalirClick(Sender: TObject);
    procedure BBAceptarClick(Sender: TObject);
  private
    { Private declarations }
    id_animal : Integer;
    procedure ActualizarPropietarios();
    procedure Seleccion(Sender : TObject);    
  public
    procedure SetIDAnimal(idanimal: Integer);
    { Public declarations }
  end;

var
  FCoopropiedad: TFCoopropiedad;

implementation

{$R *.dfm}

uses UPrincipal, UMensajeHuella;

{ TFCoopropiedad }

procedure TFCoopropiedad.ActualizarPropietarios;
begin
  FrameSeleccion.IBQSeleccionados.Close;
  FrameSeleccion.IBQSeleccionados.Open;
  FrameSeleccion.IBQDisponibles.Close;
  FrameSeleccion.IBQDisponibles.Open;
end;

procedure TFCoopropiedad.FormCreate(Sender: TObject);
begin
  inherited;
  FrameSeleccion.OnSelectItem := Seleccion;  
  ActualizarPropietarios();
end;

procedure TFCoopropiedad.Seleccion(Sender: TObject);
begin
  FrameSeleccion.IBQSeleccionados.Insert;
  FrameSeleccion.IBQSeleccionados.FieldByName('id_animal').Value := 0;//aca poner el animal
  FrameSeleccion.IBQSeleccionados.FieldByName('id_propietario').Value := FrameSeleccion.IBQDisponibles.FieldValues['id_propietario'];
  FrameSeleccion.IBQSeleccionados.FieldByName('nombre').Value := FrameSeleccion.IBQDisponibles.FieldValues['nombre'];
  FrameSeleccion.IBQSeleccionados.FieldByName('porcentaje').Value := 0;
end;

procedure TFCoopropiedad.BBSalirClick(Sender: TObject);
begin
  inherited;
{  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;}  
  close();
end;

procedure TFCoopropiedad.BBAceptarClick(Sender: TObject);
begin
  inherited;
  if (MostrarMensaje(tmConsulta, 'Desea aplicar los valores de porcentaje de coopropiedad?') = mrYes)then
   begin
      try
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

  FPrincipal.IBDPrincipal.ApplyUpdates([FrameSeleccion.IBQSeleccionados]);
  Close();
  end;
end;

procedure TFCoopropiedad.SetIDAnimal(idanimal: Integer);
begin
  id_animal:= idanimal;
end;

end.
