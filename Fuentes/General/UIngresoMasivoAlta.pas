unit UIngresoMasivoAlta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UIngresoMasivo, IBQuery, DB, WinXP, DataExport, DataToXLS,
  IBCustomDataSet, IBStoredProc, ActnList, StdCtrls, MemoAuto, ComCtrls,
  EditAuto, Buttons, ExtCtrls;

type
  TFIngresoMasivoAlta = class(TFIngresoMasivo)
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure CargarParametrosSP(auxS: String); override;
    procedure CargarArregloIndice(Encabezado: String); override;
    procedure CrearGrupo; override;
  end;

var
  FIngresoMasivoAlta: TFIngresoMasivoAlta;

implementation

uses UUniversal, UPrincipal, UNombreGrupo, UTraduccion;

{$R *.dfm}

procedure TFIngresoMasivoAlta.CargarArregloIndice(Encabezado: String);
begin
  SetLength(ArregloIndice,0);
  ArregloIndice:= nil;

  SetLength(ArregloIndice,24);
  ArregloIndice[0].indice:= devolverPosString(Encabezado,'Tipo Alta');
  ArregloIndice[0].tipo:= 'Entero';
  ArregloIndice[0].vacio:= false;
  ArregloIndice[0].limInf:= 0;
  ArregloIndice[0].limSup:= 9;
  ArregloIndice[0].largo:= 1;

  ArregloIndice[1].indice:= devolverPosString(Encabezado,'Fecha Alta');
  ArregloIndice[1].tipo:= 'Fecha';
  ArregloIndice[1].vacio:= false;

  ArregloIndice[2].indice:= devolverPosString(Encabezado,'RP');
  ArregloIndice[2].tipo:= 'Str';
  ArregloIndice[2].vacio:= false;
  ArregloIndice[2].largo:= 10;

  ArregloIndice[3].indice:= devolverPosString(Encabezado,'Senasa');
  ArregloIndice[3].tipo:= 'Str';
  ArregloIndice[3].vacio:= true;
  ArregloIndice[3].largo:= 10;

  ArregloIndice[4].indice:= devolverPosString(Encabezado,'Nombre');
  ArregloIndice[4].tipo:= 'Str';
  ArregloIndice[4].vacio:= true;
  ArregloIndice[4].largo:= 30;

  ArregloIndice[5].indice:= devolverPosString(Encabezado,'Raza');
  ArregloIndice[5].tipo:= 'Entero';
  ArregloIndice[5].vacio:= false;
  ArregloIndice[5].limInf:= 0;
  ArregloIndice[5].limSup:= 30;
  ArregloIndice[5].largo:= 2;      

  ArregloIndice[6].indice:= devolverPosString(Encabezado,'Sexo');
  ArregloIndice[6].tipo:= 'Entero';
  ArregloIndice[6].vacio:= false;
  ArregloIndice[6].limInf:= 1;
  ArregloIndice[6].limSup:= 2;
  ArregloIndice[6].largo:= 1;

  ArregloIndice[7].indice:= devolverPosString(Encabezado,'Potrero');
  ArregloIndice[7].tipo:= 'Entero';
  ArregloIndice[7].vacio:= false;
  ArregloIndice[7].limInf:= 0;
  ArregloIndice[7].limSup:= 10000;
  ArregloIndice[7].largo:= 5;

  ArregloIndice[8].indice:= devolverPosString(Encabezado,'Rodeo');
  ArregloIndice[8].tipo:= 'Entero';
  ArregloIndice[8].vacio:= false;
  ArregloIndice[8].limInf:= 0;
  ArregloIndice[8].limSup:= 10000;
  ArregloIndice[8].largo:= 5;

  ArregloIndice[9].indice:= devolverPosString(Encabezado,'Fecha Nacimiento');
  ArregloIndice[9].tipo:= 'Fecha';
  ArregloIndice[9].vacio:= false;

  ArregloIndice[10].indice:= devolverPosString(Encabezado,'DTA');
  ArregloIndice[10].tipo:= 'Str';
  ArregloIndice[10].vacio:= true;
  ArregloIndice[10].largo:= 20;

  ArregloIndice[11].indice:= devolverPosString(Encabezado,'Responsable');
  ArregloIndice[11].tipo:= 'Entero';
  ArregloIndice[11].vacio:= false;
  ArregloIndice[11].limInf:= 0;
  ArregloIndice[11].limSup:= 10000;
  ArregloIndice[11].largo:= 5;

  ArregloIndice[12].indice:= devolverPosString(Encabezado,'Peso');
  ArregloIndice[12].tipo:= 'Entero';
  ArregloIndice[12].vacio:= true;
  ArregloIndice[12].limInf:= 0;
  ArregloIndice[12].limSup:= 1500;
  ArregloIndice[12].largo:= 4;

  ArregloIndice[13].indice:= devolverPosString(Encabezado,'Categoria');
  ArregloIndice[13].tipo:= 'Entero';
  ArregloIndice[13].vacio:= false;
  ArregloIndice[13].limInf:= 1;
  ArregloIndice[13].limSup:= 6;
  ArregloIndice[13].largo:= 1;

  //exclusivos hembras
  ArregloIndice[14].indice:= devolverPosString(Encabezado,'Estado Reproductivo');
  ArregloIndice[14].tipo:= 'Entero';
  ArregloIndice[14].vacio:= false;
  ArregloIndice[14].limInf:= 0;
  ArregloIndice[14].limSup:= 5;
  ArregloIndice[14].largo:= 1;

  ArregloIndice[15].indice:= devolverPosString(Encabezado,'GDR');
  ArregloIndice[15].tipo:= 'Entero';
  ArregloIndice[15].vacio:= false;
  ArregloIndice[15].limInf:= 0;
  ArregloIndice[15].limSup:= 5;
  ArregloIndice[15].largo:= 1;

  ArregloIndice[16].indice:= devolverPosString(Encabezado,'Cantidad Partos');
  ArregloIndice[16].tipo:= 'Entero';
  ArregloIndice[16].vacio:= true;
  ArregloIndice[16].limInf:= 0;
  ArregloIndice[16].limSup:= 20;
  ArregloIndice[16].largo:= 2;
  //
  ArregloIndice[17].indice:= devolverPosString(Encabezado,'Condicion Corporal');
  ArregloIndice[17].tipo:= 'Entero';
  ArregloIndice[17].vacio:= true;
  ArregloIndice[17].limInf:= 1;
  ArregloIndice[17].limSup:= 9;
  ArregloIndice[17].largo:= 1;

  ArregloIndice[18].indice:= devolverPosString(Encabezado,'Cronologia Dentaria');
  ArregloIndice[18].tipo:= 'Entero';
  ArregloIndice[18].vacio:= false;
  ArregloIndice[18].limInf:= 0;
  ArregloIndice[18].limSup:= 9;
  ArregloIndice[18].largo:= 1;

  ArregloIndice[19].indice:= devolverPosString(Encabezado,'Precio Unitario');
  ArregloIndice[19].tipo:= 'Flotante';
  ArregloIndice[19].vacio:= true;
  ArregloIndice[19].limInf:= 0;
  ArregloIndice[19].limSup:= 99999999;
  ArregloIndice[19].largo:= 8;

  ArregloIndice[20].indice:= devolverPosString(Encabezado,'Precio Bruto');
  ArregloIndice[20].tipo:= 'Flotante';
  ArregloIndice[20].vacio:= true;
  ArregloIndice[20].limInf:= 0;
  ArregloIndice[20].limSup:= 99999999;
  ArregloIndice[20].largo:= 8;

  ArregloIndice[21].indice:= devolverPosString(Encabezado,'Gastos');
  ArregloIndice[21].tipo:= 'Flotante';
  ArregloIndice[21].vacio:= true;
  ArregloIndice[21].limInf:= 0;
  ArregloIndice[21].limSup:= 99999999;
  ArregloIndice[21].largo:= 8;

  ArregloIndice[22].indice:= devolverPosString(Encabezado,'Observaciones');
  ArregloIndice[22].tipo:= 'Str';
  ArregloIndice[22].vacio:= true;
  ArregloIndice[22].largo:= 255;

  //exclusivos machos
  ArregloIndice[23].indice:= devolverPosString(Encabezado,'Circunferencia Escrotal');
  ArregloIndice[23].tipo:= 'Entero';
  ArregloIndice[23].vacio:= true;
  ArregloIndice[23].limInf:= 0;
  ArregloIndice[23].limSup:= 60;
  ArregloIndice[23].largo:= 2;
  //
  nombreTabla:='TAB_ANIMALES';
end;

procedure TFIngresoMasivoAlta.CargarParametrosSP(auxS: String);
var auxString, auxString2: String;
begin
    auxString:= devolverString(auxS,ArregloIndice[0].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[0]);
    IBQSPEventoInd.ParamByName('TIPO_ALTA').AsInteger := StrToInt(auxString);

    auxString:= devolverString(auxS,ArregloIndice[1].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[1]);
    IBQSPEventoInd.ParamByName('FECHA_EVENTO').AsDate := StrToDate(auxString);

    auxString:= devolverString(auxS,ArregloIndice[2].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[2]);
    IBQSPEventoInd.ParamByName('ID_RP').AsString := auxString;

    if (VerificarRepetidos('ID_RP',auxString, 'select count(*) as cantidad from TAB_ANIMALES ')>0) then
      begin
        MostrarErrores(true);
        MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. Ya existe el Identificador asignado: RP = ')+auxString);
        error:= true;
      end;
    auxString:= devolverString(auxS,ArregloIndice[3].indice);
    auxString2:= auxString;
    if (Length(auxString) = 10) then
      StrLCopy(PAnsiChar(auxString2),PAnsiChar(auxString),9);
    auxString2:= FormatearContenido(auxString2,ArregloIndice[3]);

    if ((StrComp(PChar(auxString2),PChar('')) <> 0)) then
     begin
      if (VerificarRepetidos('ID_SENASA',auxString2, 'select count(*) as cantidad from TAB_ANIMALES ')>0) then
        begin
          MostrarErrores(true);
          MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. Ya existe el Identificador asignado: SENASA = ')+auxString2);
          error:= true;
        end
       else
          IBQSPEventoInd.ParamByName('ID_SENASA').AsString := auxString2;
      end
    else
        IBQSPEventoInd.ParamByName('ID_SENASA').AsString := auxString2;

    auxString:= devolverString(auxS,ArregloIndice[4].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[4]);
    if ((StrComp(PChar(auxString),PChar('')) <> 0)) then
      IBQSPEventoInd.ParamByName('NOMBRE').AsString := auxString
     else
        IBQSPEventoInd.ParamByName('NOMBRE').AsString := IBQSPEventoInd.ParamByName('ID_RP').AsString;

    auxString:= devolverString(auxS,ArregloIndice[5].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[5]);
    if (VerificarExistencia('ID_RAZA',auxString, 'select count(*) as cantidad from COD_RAZAS ',false)=0) then
      begin
        MostrarErrores(true);
        MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. La raza ')+ auxString +Traducir( ' no existe.'));
        error:= true;
      end
     else
       IBQSPEventoInd.ParamByName('RAZA').AsInteger := StrToInt(auxString);

    auxString:= devolverString(auxS,ArregloIndice[6].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[6]);
    IBQSPEventoInd.ParamByName('SEXO').AsString := auxString;

    auxString:= devolverString(auxS,ArregloIndice[7].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[7]);
    if (VerificarExistencia('ID_POTRERO',auxString, 'select count(*) as cantidad from TAB_POTREROS ',true)=0) then
      begin
        MostrarErrores(true);
        MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. El Potrero ')+ auxString + Traducir(' no existe.'));
        error:= true;
      end
     else
       IBQSPEventoInd.ParamByName('POTRERO').AsInteger := StrToInt(auxString);

    auxString:= devolverString(auxS,ArregloIndice[8].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[8]);
    if (VerificarExistencia('ID_RODEO',auxString, 'select count(*) as cantidad from TAB_RODEOS ',true)=0) then
      begin
        MostrarErrores(true);
        MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. El Rodeo ')+ auxString + Traducir(' no existe.'));
        error:= true;
      end
     else
       IBQSPEventoInd.ParamByName('RODEO').AsInteger := StrToInt(auxString);

    auxString:= devolverString(auxS,ArregloIndice[9].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[9]);
    IBQSPEventoInd.ParamByName('FECHA_NACIMIENTO').AsDate := StrToDate(auxString);

    auxString:= devolverString(auxS,ArregloIndice[10].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[10]);
    IBQSPEventoInd.ParamByName('DTA').AsString := auxString;

    auxString:= devolverString(auxS,ArregloIndice[11].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[11]);
    if (VerificarExistencia('ID_EMPLEADO',auxString, 'select count(*) as cantidad from TAB_EMPLEADOS ',true)=0) then
      begin
        MostrarErrores(true);
        MAErrors.Lines.Add('Error en Línea ' + IntToStr(linea+1) + '. El Responsable '+ auxString + ' no existe.');
        error:= true;
      end
     else
       IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := StrToInt(auxString);

    auxString:= devolverString(auxS,ArregloIndice[12].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[12]);
    if ((StrComp(PChar(auxString),PChar('')) = 0)) then
      begin
        IBQSPEventoInd.ParamByName('PESO').Value := null;
        IBQSPEventoInd.ParamByName('DIASPESO').Value := null;
      end
     else
       begin
         IBQSPEventoInd.ParamByName('PESO').AsInteger := StrToInt(auxString);
         IBQSPEventoInd.ParamByName('DIASPESO').AsString := 'G';
       end;

    auxString:= devolverString(auxS,ArregloIndice[13].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[13]);
    IBQSPEventoInd.ParamByName('CATEGORIA').AsInteger := StrToInt(auxString);

    if (IBQSPEventoInd.ParamByName('SEXO').AsString = '2') then
      begin
        auxString:= devolverString(auxS,ArregloIndice[14].indice);
        auxString:= FormatearContenido(auxString,ArregloIndice[14]);
        if (VerificarExistencia('ID_ESTADO_REPRODUCTIVO',auxString, 'select count(*) as cantidad from COD_ESTADOS_REPRODUCTIVOS ',false)=0) then
          begin
            MostrarErrores(true);
            MAErrors.Lines.Add('Error en Línea ' + IntToStr(linea+1) + '. El Estado Reproductivo '+ auxString + ' no existe.');
            error:= true;
          end
         else
            IBQSPEventoInd.ParamByName('ESTADO_REPRODUCTIVO').AsInteger := StrToInt(auxString);

        auxString:= devolverString(auxS,ArregloIndice[15].indice);
        auxString:= FormatearContenido(auxString,ArregloIndice[15]);
        if (VerificarExistencia('ID_GDR',auxString, 'select count(*) as cantidad from COD_GDR ',false)=0) then
          begin
            MostrarErrores(true);
            MAErrors.Lines.Add('Error en Línea ' + IntToStr(linea+1) + '. El GDR '+ auxString + ' no existe.');
            error:= true;
          end
         else
             IBQSPEventoInd.ParamByName('GDR').AsInteger := StrToInt(auxString);

        auxString:= devolverString(auxS,ArregloIndice[16].indice);
        auxString:= FormatearContenido(auxString,ArregloIndice[16]);
        if ((StrComp(PChar(auxString),PChar('')) = 0)) then
          IBQSPEventoInd.ParamByName('ESTADO_LACTACION').Value := null
         else
            IBQSPEventoInd.ParamByName('ESTADO_LACTACION').AsInteger := StrToInt(auxString);
      end;
    auxString:= devolverString(auxS,ArregloIndice[17].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[17]);

    if ((StrComp(PChar(auxString),PChar('')) <> 0)) then
     begin
      if (VerificarExistencia('ID_CONDICION_CORPORAL',auxString, 'select count(*) as cantidad from COD_CONDICIONES_CORPORALES ', false)=0) then
        begin
          MostrarErrores(true);
          MAErrors.Lines.Add('Error en Línea ' + IntToStr(linea+1) + '. La condición corporal '+ auxString + ' no existe.');
          error:= true;
        end
       else
          IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := auxString;
     end;

    auxString:= devolverString(auxS,ArregloIndice[18].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[18]);
    if (VerificarExistencia('ID_CRONOLOGIA_DENTARIA',auxString, 'select count(*) as cantidad from COD_CRONOLOGIAS_DENTARIAS ',false)=0) then
      begin
        MostrarErrores(true);
        MAErrors.Lines.Add('Error en Línea ' + IntToStr(linea+1) + '. La cronología dentaria '+ auxString + ' no existe.');
        error:= true;
      end
     else
       IBQSPEventoInd.ParamByName('CRONOLOGIA_DENTARIA').AsInteger := StrToInt(auxString);

    auxString:= devolverString(auxS,ArregloIndice[19].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[19]);
    if ((StrComp(PChar(auxString),PChar('')) = 0)) then
      IBQSPEventoInd.ParamByName('PRECIO_UNITARIO').asFloat := 0
     else
       IBQSPEventoInd.ParamByName('PRECIO_UNITARIO').asFloat := StrToFloat(auxString);

    auxString:= devolverString(auxS,ArregloIndice[20].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[20]);
    if ((StrComp(PChar(auxString),PChar('')) = 0)) then
      IBQSPEventoInd.ParamByName('PRECIO_BRUTO').AsFloat := 0
     else
        IBQSPEventoInd.ParamByName('PRECIO_BRUTO').AsFloat := StrToFloat(auxString);

    auxString:= devolverString(auxS,ArregloIndice[21].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[21]);
    if ((StrComp(PChar(auxString),PChar('')) = 0)) then
      IBQSPEventoInd.ParamByName('GASTOS').AsFloat := 0
     else
        IBQSPEventoInd.ParamByName('GASTOS').AsFloat := StrToFloat(auxString);

    auxString:= devolverString(auxS,ArregloIndice[22].indice);
    auxString:= FormatearContenido(auxString,ArregloIndice[22]);
    IBQSPEventoInd.ParamByName('OBSERVACION').AsString := auxString;

    if (IBQSPEventoInd.ParamByName('SEXO').AsString = '1') then
      begin
        auxString:= devolverString(auxS,ArregloIndice[23].indice);
        auxString:= FormatearContenido(auxString,ArregloIndice[23]);
        IBQSPEventoInd.ParamByName('CIRCUNFERENCIA_ESCROTAL').AsString := auxString;

        IBQSPEventoInd.ParamByName('GDR').AsInteger := 0;
      end;

    IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
    IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger :=FPrincipal.UsuarioActual;
    IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDate := now;
    IBQSPEventoInd.ParamByName('DISPARADOR').Value := null;
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').AsInteger;
end;


procedure TFIngresoMasivoAlta.CrearGrupo;
var v: TFNombredelGrupo;
begin
  inherited;
  v := TFNombredelGrupo.Create(self);
  v.ENombreGrupo.Text := PTitulo.Caption + ' ' + DateToStr(now);
  v.ShowModal;
  FNombreGrupo := v.ENombreGrupo.Text;
  IBSPCrearGrupo.ParamByName('ESTABLECIMIENTO').Value :=FPrincipal.EstablecimientoActual;
  IBSPCrearGrupo.ParamByName('NOMBREGRUPO').Value := FNombreGrupo;
  IBSPCrearGrupo.ParamByName('DESCRIPCIONGRUPO').Value := 'Creación del evento '+ FNombreGrupo;
  IBSPCrearGrupo.ParamByName('TIPO').Value :='S';
  IBSPCrearGrupo.ParamByName('TIPO_EVENTO').Value := 2;// sacarlo de eve simple el tipo de evento
  IBSPCrearGrupo.ExecProc;
end;

end.
