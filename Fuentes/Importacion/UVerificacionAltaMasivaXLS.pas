unit UVerificacionAltaMasivaXLS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UVerificacionXLS, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  cxControls, cxSSheet, StdCtrls, ExtCtrls, JvGIF;

type
  TFVerificacionAltaMasivaXLS = class(TFVerificacionXLS)

  private
    { Private declarations }
    procedure VerificarConsistencias;

    procedure VerificarEdades(fechaNacHijo, fechaNacProgenitor, tipoprogenitor: string; col, fil:integer);

    function DiferenciaDeEdad(fechaNacAnim, fechaAltaAnim : TDateTime) : integer;

    procedure VerificarObligatorios(fil : integer);

//    function DeteccionConversionDeFechas(fecha : string) : string;

//    procedure AcomodarFecha(col, fil : integer);

  public
//    function VerificacionAdicional : Boolean; override;
    { Public declarations }
  end;

var
  FVerificacionAltaMasivaXLS: TFVerificacionAltaMasivaXLS;
  hayErrores : Boolean;


implementation

{$R *.dfm}

procedure TFVerificacionAltaMasivaXLS.VerificarConsistencias;
var fil, cantFilas, difer, edadAnimal : integer;
    celda : TCelda;
    fecha : string;
begin
  //  cantFilas := CantidadAnimalesCargados(FilaInicial);
    cantFilas := cantFilas + FilaInicial;

    With SSPlanilla.ActiveSheet do
    begin
      for fil := FilaInicial to cantFilas - 1 do
      begin

         VerificarObligatorios(fil);

//-------------------- Chequeo Fecha de alta menor que fecha nacimiento
         if (GetCellObject(1,fil).Text > GetCellObject(3,fil).Text) then
         begin
             hayErrores := true;
             celda := TCelda.Create(1,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. La fecha de alta del animal debe ser menor o igual que la fecha de nacimiento.',celda);
         end;

//--------------------- Chequeo edad con la madre biologica
         if (GetCellObject(42,fil).Text <> '') then
            if (GetCellObject(34,fil).Text <> '') then //Tiene Rp la madre biologica
              if (GetCellObject(34,fil).Text = GetCellObject(0,fil).Text) then //Verifico Rp de madre e hijo
              begin
                 hayErrores := true;
                 celda := TCelda.Create(34,fil);
                 LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. EL Rp del animal y el de su madre biológica son iguales.',celda);
              end
              else
                  VerificarEdades(GetCellObject(3,fil).Text, GetCellObject(42,fil).Text, 'Madre biológica',42,fil);

//--------------------- Chequeo edad con la madre receptora interna
         if (GetCellObject(44,fil).Text = 'INTERNA') then
            if (GetCellObject(43,fil).Text <> '') then //Tiene Rp la madre receptora
              if (GetCellObject(43,fil).Text = GetCellObject(0,fil).Text) then //MIsmo Rp
              begin
                   hayErrores := true;
                   celda := TCelda.Create(43,fil);
                   LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. EL Rp del animal y el de su madre receptora son iguales.',celda);
              end
              else
                 if (GetCellObject(51,fil).Text <> '') then
                    VerificarEdades(GetCellObject(3,fil).Text, GetCellObject(51,fil).Text, 'Madre receptora interna',51,fil);

//--------------------- Chequeo edad con el padre interno
         if (GetCellObject(53,fil).Text = 'INTERNO') then
            if (GetCellObject(52,fil).Text <> '') then //Tiene Rp el padre
              if (GetCellObject(52,fil).Text = GetCellObject(0,fil).Text) then // MIsmo Rp
              begin
                   hayErrores := true;
                   celda := TCelda.Create(52,fil);
                   LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. EL Rp del animal y el de su padre son iguales.',celda);
              end
              else
                 if (GetCellObject(60,fil).Text <> '') then
                    VerificarEdades(GetCellObject(3,fil).Text, GetCellObject(60,fil).Text, 'Padre',60,fil);

//--------------------- Chequeo de categorias
      if ((GetCellObject(3,fil).Text <> '') and (GetCellObject(1,fil).Text <> '')) then
         if ((GetCellObject(4,fil).Text = 'TERNERO') or (GetCellObject(4,fil).Text = 'NOVILLO') or (GetCellObject(4,fil).Text = 'TERNERA') or (GetCellObject(4,fil).Text = 'VAQUILLONA')) then
         begin
            difer := DiferenciaDeEdad(StrToDateTime(GetCellObject(3,fil).Text),StrToDateTime(GetCellObject(1,fil).Text));
            edadAnimal := difer div 30;
            if (difer <> -1) then
              if (difer > 270) then  //270 son 9 meses
              begin
                   hayErrores := true;
                   celda := TCelda.Create(4,fil);
                   LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Categoria seleccionada erronea. La edad del animal es de ' + inttostr(edadAnimal) + ' meses. Supera los 9 meses necesarios para categoria: Ternero, Novillo, Ternera o Vaquillona.',celda);
              end;
         end
         else
         begin
            difer := DiferenciaDeEdad(StrToDateTime(GetCellObject(3,fil).Text),StrToDateTime(GetCellObject(1,fil).Text));
            edadAnimal := difer div 30;
            if (difer <> -1) then
              if (difer < 270) then
              begin
                   hayErrores := true;
                   celda := TCelda.Create(4,fil);
                   LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Categoria seleccionada erronea. La edad del animal es de ' + inttostr(edadAnimal) + ' meses. No supera los 9 meses de edad para categoria: Vaca, Toro.',celda);
              end;
         end;

         if (GetCellObject(4,fil).Text = 'VAQUILLONA') then
            if (GetCellObject(20,fil).Text > '0') then
            begin
                 hayErrores := true;
                 celda := TCelda.Create(20,fil);
                 LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. La cantidad de partos para una Vaquillona debe ser igual a cero.',celda);
            end;

         if (GetCellObject(4,fil).Text = 'VACA') then
            if (GetCellObject(19,fil).Text = '0') or (GetCellObject(19,fil).Text = '') then
            begin
                 hayErrores := true;
                 celda := TCelda.Create(19,fil);
                 LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. La cantidad de partos para una Vaca debe ser distinta de cero.',celda);
            end;

         if ((GetCellObject(4,fil).Text = 'TERNERO') or (GetCellObject(4,fil).Text = 'NOVILLO') or (GetCellObject(4,fil).Text = 'TORO')) then
         begin
            if (GetCellObject(19,fil).Text <> '') then
               if (GetCellObject(19,fil).Text > '0') then
                begin
                     hayErrores := true;
                     celda := TCelda.Create(19,fil);
                     LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. La cantidad de partos para un Macho debe ser cero.',celda);
                end;

            if (GetCellObject(18,fil).Text <> '') then
               if (GetCellObject(18,fil).Text <> 'NO DEFINIDO') then
               begin
                    hayErrores := true;
                    celda := TCelda.Create(18,fil);
                    LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. El dato no corresponde a un animal Macho.',celda);
               end;

         end;

      end;
    end;
end;



procedure TFVerificacionAltaMasivaXLS.VerificarEdades(fechaNacHijo, fechaNacProgenitor, tipoprogenitor : string; col, fil : integer);
var fecNacHijo, fecNacProgenitor : TDateTime;
    celda : TCelda;
begin
      celda := TCelda.Create(col,fil);

      if ((tipoprogenitor = 'Madre biológica') or (tipoprogenitor = 'Madre receptora interna')) then
      begin
          fecNacProgenitor := StrToDateTime(fechaNacProgenitor); //Paso el dato de string a fecha
          fecNacProgenitor := IncMonth(fecNacProgenitor,24);  //Incremento la fecha de nacimiento de la madre para comparar luego

          fecNacHijo := StrToDateTime(fechaNacHijo); //Paso el dato de string a fecha

          if (fecNacHijo < fecNacProgenitor) then//Fecha nacimiento del animal menor de lo permitido
          begin
               hayErrores := true;
               LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. La fecha de nacimiento del animal debe ser como mínimo de 24 meses posterior a la fecha de nacimiento de su ' + tipoprogenitor + '.',celda);
          end;
      end
      else
      begin
          fecNacProgenitor := StrToDateTime(fechaNacProgenitor); //Paso el dato de string a fecha
          fecNacProgenitor := IncMonth(fecNacProgenitor,15);  //Incremento la fecha de nacimiento del padre para comparar luego

          fecNacHijo := StrToDateTime(fechaNacHijo); //Paso el dato de string a fecha

          if (fecNacHijo < fecNacProgenitor) then//Fecha nacimiento del animal menor de lo permitido
          begin
               hayErrores := true;
               LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. La fecha de nacimiento del animal debe ser como mínimo de 15 meses posterior a la fecha de nacimiento de su ' + tipoprogenitor + '.',celda);
          end;
      end;
end;


function TFVerificacionAltaMasivaXLS.DiferenciaDeEdad(fechaNacAnim, fechaAltaAnim : TDateTime) : integer;
var diferencia : integer;
begin

     diferencia := -1;
     if (fechaAltaAnim <= fechaNacAnim) then
       diferencia := Trunc(fechaNacAnim - fechaAltaAnim); //La diferencia me la da en dias

     result := diferencia;
end;

procedure TFVerificacionAltaMasivaXLS.VerificarObligatorios(fil : integer);
var celda : TCelda;
begin

    With SSPlanilla.ActiveSheet do
    begin

//-------------------- Chequeo Rp obligatorios
         if (GetCellObject(0,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(0,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta Rp del animal',celda);
         end;

//-------------------- Chequeo Fecha de alta
         if (GetCellObject(1,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(1,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta fecha de alta del animal',celda);
         end;

//-------------------- Chequeo Tipo de alta
         if (GetCellObject(2,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(2,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta tipo de alta del animal',celda);
         end;

//-------------------- Chequeo Fecha nacimiento
         if (GetCellObject(3,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(3,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta fecha de nacimiento del animal',celda);
         end;

//-------------------- Chequeo categoria
         if (GetCellObject(4,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(4,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta categoria del animal',celda);
         end;

//-------------------- Chequeo Raza
         if (GetCellObject(5,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(5,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta raza del animal',celda);
         end;

    end;
end;

{
function TFVerificacionAltaMasivaXLS.DeteccionConversionDeFechas(fecha : string) : string;
var cadena, dia, mes, anio : string;
    i, limite : integer;
    error : boolean;
begin

    error := false;

    cadena := fecha;

    i := 1;
    while ((cadena[i] <> '/') and (cadena[i] <> '-')) do
    begin
      dia := dia + cadena[i];
      inc(i);
    end;

    if cadena[i] = '-' then
        error := true;
    if (length(dia) = 1) then
        //dia := '0' + dia;
        error := true;

    inc(i);
    while ((cadena[i] <> '/') and (cadena[i] <> '-')) do
    begin
      mes := mes + cadena[i];
      inc(i);
    end;

    if cadena[i] = '-' then
        error := true;
    if ((length(mes) < 2) and (mes[1] >= '0') and (mes[1] <= '9')) then
//        mes := '0'+ mes
          error := true
    else
      if (length(mes) > 2) then
      begin
        if (mes[1] = 'ENERO') or (mes[1] = 'Enero') or (mes[1] = 'enero') or (mes[1] = 'Ene') or (mes[1] = 'ene') or (mes[1] = 'ENE') then
            //mes := '01'
            error := true
        else
            if (mes[1] = 'FEBRERO') or (mes[1] = 'Febrero') or (mes[1] = 'febrero') or (mes[1] = 'feb') or (mes[1] = 'Feb') or (mes[1] = 'FEB') then
                //mes := '02'
                error := true
            else
                if (mes = 'MARZO') or (mes = 'Marzo') or (mes = 'Mar') or (mes = 'MAR') or (mes[1] = 'marzo') or (mes[1] = 'mar') then
                    //mes := '03'
                    error := true
                else
                    if (mes = 'ABRIL') or (mes = 'Abril') or (mes = 'Abr') or (mes = 'ABR') or (mes[1] = 'abril') or (mes[1] = 'abr') then
                        //mes := '04'
                        error := true
                    else
                        if (mes = 'MAYO') or (mes = 'Mayo') or (mes = 'May') or (mes = 'MAY') or (mes[1] = 'mayo') or (mes[1] = 'may') then
                            //mes := '05'
                            error := true
                        else
                            if (mes = 'JUNIO') or (mes = 'Junio') or (mes = 'Jun') or (mes = 'JUN') or (mes[1] = 'junio') or (mes[1] = 'jun') then
                                //mes := '06'
                                error := true
                            else
                                if (mes = 'JULIO') or (mes = 'Julio') or (mes = 'Jul') or (mes = 'JUL') or (mes[1] = 'julio') or (mes[1] = 'jul') then
                                    //mes := '07'
                                    error := true
                                else
                                    if (mes = 'AGOSTO') or (mes = 'Agosto') or (mes = 'Ago') or (mes = 'AGO') or (mes[1] = 'agosto') or (mes[1] = 'ago') then
                                        //mes := '08'
                                        error := true
                                    else
                                        if (mes[1] = 'SEPTIEMBRE') or (mes[1] = 'SETIEMBRE') or (mes[1] = 'septiembre') or (mes[1] = 'setiembre') or (mes[1] = 'Sep') or (mes[1] = 'Se') or (mes[1] = 'sep') or (mes[1] = 'se') or (mes[1] = 'SEP') or (mes[1] = 'SE') then
                                            //mes := '09'
                                            error := true
                                        else
                                            if (mes[1] = 'OCTUBRE') or (mes[1] = 'Octubre') or (mes[1] = 'octubre') or (mes[1] = 'OCT') or (mes[1] = 'Oct') or (mes[1] = 'oct') then
                                                //mes := '10'
                                                error := true
                                            else
                                                if (mes[1] = 'NOVIEMBRE') or (mes[1] = 'Noviembre') or (mes[1] = 'noviembre') or (mes[1] = 'NOV') or (mes[1] = 'Nov') or (mes[1] = 'nov') then
                                                    //mes := '11'
                                                    error := true
                                                else
                                                    if (mes[1] = 'DICIEMBRE') or (mes[1] = 'Diciembre') or (mes[1] = 'diciembre') or (mes[1] = 'DIC') or (mes[1] = 'Dic') or (mes[1] = 'dic') then
                                                        //mes := '12'
                                                        error := true
                                                    else
                                                        error := true;

    end;

    inc(i);
    limite := i + 4;
    while i < limite do
    begin
      anio := anio + cadena[i];
      inc(i);
    end;

    if (length(anio) = 2) then error := true;
{      if (anio[1] <> '9') then
          anio := '20' + anio
      else
          anio := '19' + anio;
}
{    if error then
        result := ''
    else
        result := cadena;

//    result := dia + '/' + mes + '/' + anio;

end;


procedure TFVerificacionAltaMasivaXLS.AcomodarFecha(col, fil : integer);
var fecha : string;
    celda : TCelda;
begin
         fecha := DeteccionConversionDeFechas(SSPlanilla.ActiveSheet.GetCellObject(col,fil).Text);

         if ( fecha =  '') then
         begin
              celda := TCelda.Create(col,fil);
              LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. El formato de la fecha ingresada tiene errores.',celda);
         end;
{         else
         begin
             SSPlanilla.ActiveSheet.
             olecon.OleObject.application.cells [1,1]. Value;
             SSPlanilla.ActiveSheet.   //GetCellObject(col,fil).Text := fecha;
         end;}{
end;           }
 {
function TFVerificacionAltaMasivaXLS.VerificacionAdicional : Boolean;
begin
  hayErrores := false;
  VerificarConsistencias;
  Result := hayErrores;
end;}                       
end.
