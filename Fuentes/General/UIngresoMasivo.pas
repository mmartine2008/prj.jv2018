unit UIngresoMasivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, IBQuery, MemoAuto,
  EditAuto, Buttons;

type campo=record
              indice: Integer;
              tipo: String;
              vacio: Boolean;
              limInf: Integer;
              limSup: Integer;
              largo: Integer;
            end;

type
  TFIngresoMasivo = class(TFUniversal)
    GroupBox1: TGroupBox;
    LNombreArchivo: TLabel;
    BBAbrir: TBitBtn;
    BBEjecutar: TBitBtn;
    ENombreArchivo: TEditAuto;
    PError: TPageControl;
    TSHError: TTabSheet;
    MAErrors: TMemoAuto;
    DSIBQ_SPEventoInd: TDataSource;
    IBQSPEventoInd: TIBQuery;
    IBQRepetidos: TIBQuery;
    ODAbrir: TOpenDialog;
    IBSPCrearGrupo: TIBStoredProc;
    IBSPCrearGrupoIDNUEVOGRUPO: TIntegerField;
    procedure BBAbrirClick(Sender: TObject);
    procedure BBEjecutarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MAErrorsKeyPress(Sender: TObject; var Key: Char);
    procedure ENombreArchivoExit(Sender: TObject);
  private
    { Private declarations }

  protected
    error: boolean;
    linea: Integer;
    ArregloIndice: array of campo;
    nombreTabla: String;
    FNombreGrupo: String;    
    function  devolverString(s: String; indice: Integer): String;
    function  devolverPosString(s,palabra: String): Integer;
    Procedure GenerarInserts(var F:TextFile);

    Function FormatearContenido(campo:String; nodo:Campo): String;
    Function FormatearString(campo:String; vacio:Boolean;largo: Integer): String;
    Function FormatearInteger(campo:String; vacio:Boolean;limInf,LimSup,largo: Integer): String;// vacio permite que el campo sea vacio - 
    Function FormatearFloat(campo:String; vacio:Boolean;limInf,LimSup,largo: Integer): String;
    Function FormatearDate(campo:String; vacio:Boolean): String;
    Function EliminarCaracter(campo:String;caracter:Char): String;
    Function AgregarEspacio(s:String):String;
    function VerificarRepetidos(Campo: string; Valor: string; sentencia : string ): integer;
    function VerificarExistencia(Campo: string; Valor: string; sentencia : string;establecimiento:boolean ): integer;    
    function VerificarColumnas(nombreArchivo: String): boolean;
    Procedure MostrarErrores(mostrar: Boolean);    
    procedure CargarParametrosSP(auxS: String); virtual;
    procedure CargarArregloIndice(Encabezado: String); virtual;
    procedure CrearGrupo; virtual;

  public
    { Public declarations }
    Procedure Ejecutar(nombreArchivo:String);
  end;

var
  FIngresoMasivo: TFIngresoMasivo;

implementation

{$R *.dfm}

Uses UCartel, UPrincipal, UMensajeHuella, UNombreGrupo, UTraduccion;

procedure TFIngresoMasivo.FormShow(Sender: TObject);
begin
  inherited;
  ENombreArchivo.SetFocus;
  ENombreArchivo.Clear;
  linea:= 1;
  error:= false;
  MostrarErrores(false);
  ODAbrir.InitialDir:= ExtractFileDir(Application.ExeName);
  ENombreArchivoExit(nil);
end;

function TFIngresoMasivo.AgregarEspacio(s: String): String;
var i:Integer;
    auxS:String;
begin
  auxS:='';
  for i:=1 to Length(s) do
    if (i <> Length(s)) then
      if ((s[i]=#9) and (s[i+1]=#9)) then
        begin
          auxS:=auxS + s[i];
          auxS:=auxS + ' ';
        end
       else
          auxS:=auxS + s[i]
    else
      if (s[Length(s)]=#9) then
        auxS:=auxS + #9 + ' '
       else
        auxS:=auxS + s[Length(s)];
  result:= auxS;
end;

function TFIngresoMasivo.devolverString(s: String;
  indice: Integer): String;
var sl:TStringList;

begin
   if indice <> -1 then
    begin
     if(strcomp(pchar(s),pchar(''))) <> 0 then
       begin
        sl:=TStringList.Create();
        ExtractStrings([#9],[],PAnsiChar(s),sl);
        if sl.Count = 1 then
          result:=s
        else
          if (indice < sl.Count) then
            result:=sl.Strings[indice]
           else
             result:='';
        FreeAndNil(sl);     
       end
     else
      result:=s;
   end
  else
    result:='';
end;

function TFIngresoMasivo.devolverPosString(s, palabra: String): Integer;
var sl:TStringList;
begin
    if(strcomp(pchar(s),pchar(''))) <> 0 then
      begin
       sl:=TStringList.Create();
       ExtractStrings([#9],[],PAnsiChar(s),sl);

       result:=sl.IndexOf(palabra);
       FreeAndNil(sl);
      end
     else
      begin
        result:= -1;
      end;
    if (result = -1) then
      begin
        MostrarErrores(true);
        MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea) + Traducir('. Formato de columna no válido. El nombre de columna debe ser ')+ palabra +Traducir('. Verifique e intente nuevamente.'));
        error:= true;
      end;
end;

procedure TFIngresoMasivo.Ejecutar(nombreArchivo: String);
var F: TextFile;
    S: String;
begin
  if FileExists(nombreArchivo) then
    begin
      linea:= 1;
      error:= false;
      AssignFile(F, nombreArchivo);
      Reset(F);
      Readln(F, S);
      //CargarArregloIndice(S);
      if not(error) then
        GenerarInserts(F);
      CloseFile(F);
    end;
end;

procedure TFIngresoMasivo.CargarArregloIndice(Encabezado: String);
begin
  // Deben implementarlo los hijos
end;

procedure TFIngresoMasivo.GenerarInserts(var F: TextFile);
var S, auxS:String;
    cartel: TCartel;
    msje: String;
begin
   Readln(F, S);
   CrearGrupo;
{   cartel:= TCartel.getInstance();
   msje:= 'Cargando registros a la BD desde '+ ExtractFileName(ENombreArchivo.Text)+' ...';
   cartel.abrircartel(msje);
 }
   while (not (EOF(F)) and ((StrComp(PChar(S),PChar('')) <> 0)) and not(error)) do
     begin
      auxS:= AgregarEspacio(s);
      CargarParametrosSP(auxS);
      if not(error) then
       begin
         IBQSPEventoInd.Active:=true;
         IBQSPEventoInd.Active:=false;
       end;  
      Readln(F, S);
      inc(linea);
     end;
  { cartel.cerrarcartel();
   cartel.FreeInstance();}
    if not(error) then
      begin
        MostrarErrores(false);
        FPrincipal.IBTPrincipal.CommitRetaining;
        MostrarMensaje(tmInformacion, 'Los animales han sido dados de alta');
        self.Close;
        //ATerminar.Enabled := false;
      end
     else
       begin
         MostrarErrores(true);
         FPrincipal.IBTPrincipal.RollbackRetaining;
         MostrarMensaje(tmError, 'Los animales no han sido dados de alta. Verifique su archivo e intentelo nuevamente.');
       end;
end;

function TFIngresoMasivo.FormatearString(campo: String; vacio:Boolean;largo: Integer): String;
begin
  //result:= ''''+campo+'''';
  campo:=trim(campo);
  if ((StrComp(PChar(campo),PChar('')) = 0)) then
    begin
     if (vacio) then
       result:= UpperCase(campo)
      else
        begin
          result:='invalido';
          MostrarErrores(true);
          MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. Entero ')+ campo +Traducir(' no puede ser vacío. Verifique e intente nuevamente.'));
          error:= true;
        end
    end
   else
    if (Length(campo)> largo) then
      begin
        result:='invalido';
        MostrarErrores(true);
        MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. Campo ')+ campo +Traducir(' más largo de lo permitido. Verifique e intente nuevamente.'));
        error:= true;
      end
     else
       result:= UpperCase(campo);
end;

function TFIngresoMasivo.FormatearInteger(campo: String; vacio:Boolean;limInf,LimSup,largo: Integer): String;
var cp:Integer;
begin
    campo:=trim(campo);     
    if ((StrComp(PChar(campo),PChar('')) = 0)) then
     begin
       if (vacio) then
         result:= campo
        else
          begin
            result:='invalido';
            MostrarErrores(true);
            MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. Entero ')+ campo +Traducir(' no puede ser vacío. Verifique e intente nuevamente.'));
            error:= true;
          end
     end
    else
      begin
        try
          begin
           if (Length(campo)> largo) then
              begin
                result:='invalido';
                MostrarErrores(true);
                MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. Entero ')+ campo +Traducir(' más largo de lo permitido. Verifique e intente nuevamente.'));
                error:= true;
              end
             else
               begin
                  cp:= StrToInt(EliminarCaracter(campo,'.'));
                  if ((cp < limInf) or (cp > limSup)) then
                    begin
                      result:='invalido';
                      MostrarErrores(true);
                      MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. Entero ')+ campo +Traducir(' fuera del límite de lo permitido. Verifique e intente nuevamente.'));
                      error:= true;
                    end
                   else
                    result:= IntToStr(cp);
               end;
           end;
         except
             begin
              result:='invalido';
              MostrarErrores(true);
              MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. Formato de Entero ')+ campo +Traducir(' no válido. Verifique e intente nuevamente.'));
              error:= true;
             end;
          end;
       end;
end;

function TFIngresoMasivo.FormatearFloat(campo: String; vacio:Boolean;limInf,LimSup,largo: Integer): String;
var cp: Extended;
begin
    campo:=trim(campo);
    if ((StrComp(PChar(campo),PChar('')) = 0)) then
     begin
       if (vacio) then
         result:= campo
        else
          begin
            result:='invalido';
            MostrarErrores(true);
            MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) +Traducir( '. Entero ')+ campo +Traducir(' no puede ser vacío. Verifique e intente nuevamente.'));
            error:= true;
          end
     end
    else
      begin
        try
          if (Length(campo)> largo) then
              begin
                result:='invalido';
                MostrarErrores(true);
                MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. Flotante ')+ campo +Traducir(' más largo de lo permitido. Verifique e intente nuevamente.'));
                error:= true;
              end
            else
             begin
              cp:= StrToFloat(EliminarCaracter(campo,'.'));
              if ((cp < limInf) or (cp > limSup)) then
                begin
                  result:='invalido';
                  MostrarErrores(true);
                  MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. Flotante ')+ campo +Traducir(' fuera del límite de lo permitido. Verifique e intente nuevamente.'));
                  error:= true;
                end
               else
                 begin
                    DecimalSeparator:='.';
                    result:=FloatToStr(cp);
                    DecimalSeparator:=',';
                 end;
             end;
           except
            begin
              result:='invalido';
              MostrarErrores(true);
              MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. Formato de Flotante ')+ campo +Traducir(' no válido. Verifique e intente nuevamente.'));
              error:= true;
            end;
       end;
      end;
end;

function TFIngresoMasivo.FormatearDate(campo: String; vacio:Boolean): String;
var d:TDateTime;
    auxCampo: String;
begin
    campo:=trim(campo);
    if ((StrComp(PChar(campo),PChar('')) = 0)) then
     begin
       if (vacio) then
         result:= campo
        else
          begin
            result:='invalido';
            MostrarErrores(true);
            MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. Fecha ')+ campo +Traducir(' no puede ser vacío. Verifique e intente nuevamente.'));
            error:= true;
          end
      end
     else
         begin
          if (((strcomp(pchar(campo),pchar('00/00/0000'))) = 0) or ((strcomp(pchar(campo),pchar('00.00.0000'))) = 0) or (Length(campo) <> 10)) then
            begin
              result:='invalido';
              MostrarErrores(true);
              MAErrors.Lines.Add(Traducir('Error en Línea ') + IntToStr(linea+1) + Traducir('. Formato de Fecha ')+ campo +Traducir(' no válido. Verifique e intente nuevamente.'));
              error:= true;
            end
          else
            begin
             auxCampo:=campo;
             auxCampo[3]:='/';
             auxCampo[6]:='/';
             d:=StrToDate(auxCampo);
             //ShortDateFormat:='mm/dd/yyyy';
             //result:= FormatearString(DateToStr(d));
             //ShortDateFormat:='dd/mm/yyyy';
             result:= auxCampo;
            end;
         end;
end;

function TFIngresoMasivo.EliminarCaracter(campo: String; caracter: Char): String;
var i: Integer;
    auxCampo: String;
begin
  auxCampo:='';
  for i:=1 to Length(campo) do
    if (campo[i]<>caracter) then
      auxCampo:=auxCampo + campo[i];

  result:= auxCampo
end;

function TFIngresoMasivo.FormatearContenido(campo: String; nodo:Campo): String;
begin
  if (StrComp(PChar(nodo.tipo),PChar('Entero')) = 0) then
    Result:= FormatearInteger(campo,nodo.vacio,nodo.limInf,nodo.limSup,nodo.largo)
   else
    if (StrComp(PChar(nodo.tipo),PChar('Str')) = 0) then
      Result:= FormatearString(campo,nodo.vacio,nodo.largo)
     else
      if (StrComp(PChar(nodo.tipo),PChar('Flotante')) = 0) then
        Result:= FormatearFloat(campo,nodo.vacio,nodo.limInf,nodo.limSup,nodo.largo)
       else
        if (StrComp(PChar(nodo.tipo),PChar('Fecha')) = 0) then
          Result:= FormatearDate(campo,nodo.vacio);
end;

procedure TFIngresoMasivo.BBAbrirClick(Sender: TObject);
begin
  if (ODAbrir.Execute) then
    begin
      ENombreArchivo.Text:= ODAbrir.FileName;
      ENombreArchivoExit(nil);
    end;
end;

procedure TFIngresoMasivo.BBEjecutarClick(Sender: TObject);
begin
  Ejecutar(ENombreArchivo.Text);
end;

function TFIngresoMasivo.VerificarRepetidos(Campo, Valor,
  sentencia: string): integer;
begin
  IBQRepetidos.Close;
  IBQRepetidos.SQL.Text := sentencia;
  IBQRepetidos.SQL.Add('where '+Campo+'= '''+valor+''' and establecimiento = ' + IntToStr(FPrincipal.EstablecimientoActual));
  IBQRepetidos.Open;
  result := IBQRepetidos.FieldValues['cantidad'];
end;

procedure TFIngresoMasivo.MostrarErrores(mostrar: Boolean);
begin
   PError.Visible:= mostrar;
   if (mostrar) then
     begin
       self.Height:= 367;
     end
    else
        begin
          MAErrors.Clear;
          self.Height:= 157;
        end;
end;

procedure TFIngresoMasivo.CargarParametrosSP(auxS: String);
begin
  // Deben implementarlo los hijos
end;

procedure TFIngresoMasivo.CrearGrupo;
begin
  // Deben implementarlo los hijos
end;

procedure TFIngresoMasivo.MAErrorsKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key:= #0;
end;

procedure TFIngresoMasivo.ENombreArchivoExit(Sender: TObject);
begin
  inherited;
  if (FileExists(ENombreArchivo.Text)) then
    begin
     if (VerificarColumnas(ENombreArchivo.Text)) then
       BBEjecutar.Enabled:= True
      else
        BBEjecutar.Enabled:= false;
    end
   else
      BBEjecutar.Enabled:= false;
end;

function TFIngresoMasivo.VerificarColumnas(nombreArchivo: String): boolean;
var F: TextFile;
    S: String;
begin
      linea:= 1;
      error:= false;
      MostrarErrores(false);
      AssignFile(F, nombreArchivo);
      Reset(F);
      Readln(F, S);
      CargarArregloIndice(S);
      CloseFile(F);
      result:= not error;
      if not(result) then
        SBUniversal.Panels.Items[0].Text:='Formato Incorrecto'
       else
          SBUniversal.Panels.Items[0].Text:='Formato Correcto';
end;

function TFIngresoMasivo.VerificarExistencia(Campo, Valor,
  sentencia: string; establecimiento: boolean): integer;
begin
  IBQRepetidos.Close;
  IBQRepetidos.SQL.Text := sentencia;
  if (establecimiento) then
    IBQRepetidos.SQL.Add('where '+Campo+'= '''+valor+''' and establecimiento = ' + IntToStr(FPrincipal.EstablecimientoActual))
   else
      IBQRepetidos.SQL.Add('where '+Campo+'= '''+valor+'''');
  IBQRepetidos.Open;
  result := IBQRepetidos.FieldValues['cantidad'];
end;

end.
