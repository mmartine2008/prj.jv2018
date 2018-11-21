unit UVerificacionDiagnosticoDeGestacionXLS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UVerificacionXLS, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  cxControls, cxSSheet, StdCtrls, ExtCtrls, JvGIF;

type
  TFVerificacionDiagnosticoDeGestacionXLS = class(TFVerificacionXLS)

  private
    { Private declarations }

    procedure VerificarConsistencias;

    procedure VerificarObligatorios(fil : integer);

  public
    function VerificacionAdicional : Boolean; override;
  end;

var
  FVerificacionDiagnosticoDeGestacionXLS: TFVerificacionDiagnosticoDeGestacionXLS;
  hayErrores : Boolean;

implementation

{$R *.dfm}

procedure TFVerificacionDiagnosticoDeGestacionXLS.VerificarConsistencias;
var cantFilas, fil : integer;
    celda : TCelda;
begin
    cantFilas := CantidadAnimalesCargados(FilaInicial);
    cantFilas := cantFilas + FilaInicial;

    With SSPlanilla.ActiveSheet do
    begin

//-------------------- Chequeo Fecha inicio
         if (GetCellObject(1,1).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(1,1);
             LBErrores.AddItem('Error en fila: ' + inttostr(2) + '. Falta fecha de inicio del diagnóstico.',celda);
         end;

//-------------------- Chequeo Fecha fin
         if (GetCellObject(1,2).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(1,2);
             LBErrores.AddItem('Error en fila: ' + inttostr(3) + '. Falta fecha de fin del diagnóstico. Si se tratase de inseminación artificial, la fecha de inicio y de fin pueden ser iguales. En otro caso deben ser diferentes',celda);
         end;


      for fil := FilaInicial to cantFilas - 1 do
      begin

          VerificarObligatorios(fil);

          if (GetCellObject(5,fil).Text = 'SI') then //SI es preñez por IATF
          begin
              if ( GetCellObject(6,fil).Text = '') then
              begin
                   hayErrores := true;
                   celda := TCelda.Create(6,fil);
                   LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Se requiere una fecha de IATF.',celda);
              end;

              if ((GetCellObject(4,fil).Text <> 'VACIA') and (GetCellObject(4,fil).Text <> 'PREÑADA')) then
              begin
                   hayErrores := true;
                   celda := TCelda.Create(4,fil);
                   LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Valor incorrecto para Estado reproductivo. Debe elegir entre Vacia o Preñada',celda);
              end;
          end
          else
          begin //SI NO es preñez por IATF, debo chequear las fechas de inicio y fin del servicio
              if ( GetCellObject(1,1).Text >= GetCellObject(1,2).Text ) then
              begin
                   hayErrores := true;
                   celda := TCelda.Create(1,1);
                   LBErrores.AddItem('Error en fila: ' + inttostr(2) + '. Valor incorrecto para fecha de inicio de servicio. Esta debe ser anterior a la fecha de fin, o bien la fecha de fin es incorrecta.',celda);
              end;

              if ( GetCellObject(1,fil).Text < GetCellObject(1,2).Text ) then
              begin
                   hayErrores := true;
                   celda := TCelda.Create(1,fil);
                   LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Valor incorrecto para fecha de diagnostico. Esta debe ser posterior a la fecha de fin del servicio, o bien la fecha de fin es incorrecta.',celda);
              end;
          end;

          if (GetCellObject(7,fil).Text <> '') then //Chequeo que si tiene dias de gestacion, este dentro de los parametros correcto, y que ademas este preñada.
            if ((GetCellObject(7,fil).Text <= '0') or (GetCellObject(7,fil).Text > '284')) then
            begin
                 hayErrores := true;
                 celda := TCelda.Create(7,fil);
                 LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Los días de gestación de una hembra deben ser mayores a cero y menores o iguales a 284.',celda);
            end
            else
            begin
                 if (GetCellObject(4,fil).Text <> 'PREÑADA') then
                 begin
                      hayErrores := true;
                      celda := TCelda.Create(4,fil);
                      LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. La cantidad de días de gestación es mayor a cero, por lo tanto se requiere que esté preñada.',celda);
                 end;
            end;
      end;
    end;
end;

procedure TFVerificacionDiagnosticoDeGestacionXLS.VerificarObligatorios(fil : integer);
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

//-------------------- Chequeo Fecha de alta
         if (GetCellObject(1,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(1,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta fecha de diagnóstico.',celda);
         end;

//-------------------- Chequeo Categoria
         if (GetCellObject(3,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(3,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta categoría del animal.',celda);
         end;

//-------------------- Chequeo Estado reproductivo
         if (GetCellObject(4,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(4,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta estado reproductivo del animal',celda);
         end;

//-------------------- Chequeo Preñez por IATF
         if (GetCellObject(5,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(5,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta especificar SI o NO.',celda);
         end;

    end;
end;


function TFVerificacionDiagnosticoDeGestacionXLS.VerificacionAdicional : Boolean;
begin
  hayErrores := false;
  VerificarConsistencias;
  Result := hayErrores;
end;               

end.
