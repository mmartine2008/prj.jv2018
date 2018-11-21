unit UVerificacionPartosNacimientosXLS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UVerificacionXLS, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  cxControls, cxSSheet, StdCtrls, ExtCtrls, JvGIF;

type
  TFVerificacionPartosNacimientosXLS = class(TFVerificacionXLS)
  private
    { Private declarations }
    procedure VerificarConsistencias;

    procedure VerificarObligatorios(fil : integer);
  public
    { Public declarations }
    function VerificacionAdicional : Boolean; override;
  end;

var
  FVerificacionPartosNacimientosXLS: TFVerificacionPartosNacimientosXLS;
  hayErrores : boolean;

implementation

{$R *.dfm}

procedure TFVerificacionPartosNacimientosXLS.VerificarConsistencias;
var cantFilas, fil : integer;
    celda : TCelda;
begin
    cantFilas := CantidadAnimalesCargados(FilaInicial);
    cantFilas := cantFilas + FilaInicial;

    With SSPlanilla.ActiveSheet do
    begin
      for fil := FilaInicial to cantFilas - 1 do
      begin

         VerificarObligatorios(fil);

      end;
    end;

end;

procedure TFVerificacionPartosNacimientosXLS.VerificarObligatorios(fil : integer);
var celda : TCelda;
begin

    With SSPlanilla.ActiveSheet do
    begin

//-------------------- Chequeo Rp obligatorios
         if (GetCellObject(0,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(0,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta Rp del animal.',celda);
         end;

//-------------------- Chequeo Fecha de nacimiento
         if (GetCellObject(1,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(1,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + ' columna: ' + inttostr(2) + '. Falta fecha de nacimiento del animal.',celda);
         end;

//-------------------- Chequeo Sexo
         if (GetCellObject(2,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(2,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta sexo del animal.',celda);
         end;

//-------------------- Chequeo Vivo
         if (GetCellObject(3,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(3,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta estado de nacimiento del animal(Vivo/Muerto).',celda);
         end;

//-------------------- Chequeo Rp Madre
         if (GetCellObject(5,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(5,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta Rp de la Madre.',celda);
         end
         else
            if (GetCellObject(0,fil).Text = GetCellObject(5,fil).Text) then //Rp madre igual al del hijo
            begin
               hayErrores := true;
               celda := TCelda.Create(5,fil);
               LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. El Rp de la Madre y el de su Hijo son iguales.',celda);
            end;

//-------------------- Chequeo Categoria
         if (GetCellObject(6,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(6,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta categoria del animal.',celda);
         end;

//-------------------- Chequeo tipo parto
         if (GetCellObject(8,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(8,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta especificar Tipo de parto.',celda);
         end;    
    end;
end;


function TFVerificacionPartosNacimientosXLS.VerificacionAdicional : Boolean;
begin
  hayErrores := false;
  VerificarConsistencias;
  Result := hayErrores;
end;


end.
