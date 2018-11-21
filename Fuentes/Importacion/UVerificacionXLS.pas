unit UVerificacionXLS;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  cxControls, cxSSheet, UMensajeHuella, JvGIF, JvExControls, JvLabel,cxSSTypes, UEveAltaMasiva, UEveImportarPartosNacimientos, UEveDiagnosticoGestacion, UEveInseminacionArtificial,
  PngImage, jpeg, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TRegValores = Record
    codigo: String;
    valor: String;
  end;

  TArrValores = array of TRegValores;

  TRegHashTableItem = Record
    key: string;
    required: boolean;
    values: TArrValores;
  end;

  TArrHashTable = array of TRegHashTableItem;

  TFVerificacionXLS = class(TFUniversal)
    PTop: TPanel;
    PErrores: TPanel;
    PPlanilla: TPanel;
    GBErrores: TGroupBox;
    LBErrores: TListBox;
    SSPlanilla: TcxSpreadSheetBook;
    BVerificar: TButton;
    Label1: TLabel;
    BTerminar: TButton;
    ITerminar: TImage;
    LTerminar: TLabel;
    PBotones: TPanel;
    IFondoB2: TImage;
    {#1 INICIO 28/11/2014 Matias Rizzi}
    JvCancelar: TJvImage;
    LblCancelar: TLabel;
    {#1 FIN 28/11/2014 Matias Rizzi}
    procedure LBErroresClick(Sender: TObject);
    procedure BVerificarClick(Sender: TObject);
    procedure BTerminarClick(Sender: TObject);
    {#1 INICIO 28/11/2014 Matias Rizzi}
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvCancelarClick(Sender: TObject);
    {#1 INICIO 28/11/2014 Matias Rizzi}
  private
   // procedure ViewData;
    NomArch : TFileName;
    Evento : String;
    function searchSheetCodigos: integer;
    procedure cargarCodigos;

    procedure iniciaVerificacion(out FilaFinal: integer; out filaIni: integer);
    function VerificaFechas(FilaFinal: integer; filaIni: integer) : Boolean;
    function VerificarCodigos(FilaFinal: integer; filaIni: integer) : Boolean;
    function VerificaRPS(FilaFinal: integer; filaIni: integer) : Boolean;

    procedure SetColorAlerta(celda: TcxSSCellObject);

    function VerificarEvento : Boolean;
    function extractSimbolFromMultiByteChar(Text: PAnsiChar): Char;
    function clearMultiByteChar(Text: String): String;

//-----------------------------------------------------------------------------------------------------------------------
//-------------------------Alta masiva

    procedure VerificarConsistenciasAltaMasiva;

    procedure VerificarEdadesAltaMasiva(fechaNacHijo, fechaNacProgenitor, tipoprogenitor: string; col, fil:integer);

    function DiferenciaDeEdadAltaMasiva(fechaNacAnim, fechaAltaAnim : TDateTime) : integer;

    procedure VerificarObligatoriosAltaMasiva(fil : integer);

    function VerificacionAdicional : Boolean;

//-----------------------------------------------------------------------------------------------------------------------
//-------------------------Partos y nacimientos

    procedure VerificarConsistenciasPartosNacimientos;

    procedure VerificarObligatoriosPartosNacimientos(fil : integer);

//-----------------------------------------------------------------------------------------------------------------------
//-------------------------Diagnostico de gestacion

    procedure VerificarConsistenciasDiagnosticoGestacion;

    procedure VerificarObligatoriosDiagnosticoGestacion(fil : integer);

//-----------------------------------------------------------------------------------------------------------------------
//-------------------------Inseminacion artificial

    procedure VerificarConsistenciasInseminacionArtificial;

//    procedure VerificarObligatoriosInseminacionArtificial(fil : integer);

//-----------------------------------------------------------------------------------------------------------------------


  protected
    tablaCodigos: TArrHashTable;
    function getValor(key: String): TArrValores;
    function esRequerido(key: String): Boolean;
    function verificarDatos(pagina: integer; col: integer; fila: integer; colname: string): Boolean;
    procedure seleccionarCelda(col: integer; fil: integer);
  public
    {#1 INICIO 28/11/2014 Matias Rizzi}
    salir_ok : Boolean;
    {#1 FIN 28/11/2014 Matias Rizzi}
    Resultado : TModalResult;
    procedure LoadFile(arch: String);
    procedure SaveFile(arch: String);
    function VerificarPlanilla : Boolean;

  published
    constructor Create(Owner : TComponent; archivo :TFileName; TipoEve : String);reintroduce;
  end;

  TCelda = class(TObject)
  private
    col: integer;
    fil: integer;
  public
    function getCol: integer;
    function getFil: integer;
  published
    constructor Create(col: integer; fil: integer);reintroduce;
  end;

var
  FVerificacionXLS: TFVerificacionXLS;
  FilaInicial, FilaFinal : integer;
  hayErrores : boolean;

implementation

uses
  StrUtils, UPrincipal, cxSSStyles;

{$R *.dfm}

constructor TCelda.Create(col: integer; fil: integer);
begin
  inherited Create();
  self.col := col;
  self.fil := fil;
end;

function TCelda.getCol() :integer;
begin
  Result := self.col;
end;

function TCelda.getFil() :integer;
begin
  Result := self.fil;
end;

procedure TFVerificacionXLS.LoadFile(arch: String);
begin

  SSPlanilla.LoadFromFile(arch);

  cargarCodigos;

end;

constructor TFVerificacionXLS.Create(Owner : TComponent; archivo : TFileName; TipoEve : String);
begin
  inherited Create(Owner);
  Evento := TipoEve;
  NomArch := archivo;
  LoadFile(NomArch);
  ModalResult := mrNo;
  {#1 INICIO 28/11/2014 Matias Rizzi}
  LblCancelar.Visible:=FALSE;
  JvCancelar.Visible:=FALSE;
  {#2 INICIO 02/12/2014 Matias Rizzi}
  if ((self.Owner.Owner is TFEveDiagnosticoGestacion)
      OR (self.Owner.Owner is TFEveAltaMasiva)) then
  {#2 FIN 02/12/2014 Matias Rizzi}
    BEGIN
      LblCancelar.Visible:=TRUE;
      JvCancelar.Visible:=TRUE;
    END;
  {#1 FIN 28/11/2014 Matias Rizzi}
end;

function TFVerificacionXLS.searchSheetCodigos : integer;
var
  page: integer;
begin
  Result := -1;
  for page := 0 to SSPlanilla.PageCount-1 do
  begin
    if (LowerCase(SSPlanilla.Pages[page].Caption) = 'codigos') or  (LowerCase(SSPlanilla.Pages[page].Caption) = 'codigo') then
    begin
      Result := page;
      break;
    end;
  end;
end;

function TFVerificacionXLS.getValor(key: String): TArrValores;
var
  pos,len,Concat: integer;
  clave : String;
  aux: TArrValores;
  lenaux,index: integer;
begin
  Result := nil;
  Concat := 0;
  clave := clearMultiByteChar(key);
  if (LowerCase(clave) = 'condicion corporal') then
  begin
    clave := 'Condicion_1_9';
    Concat := 1;
  end;
  Clave := StringReplace(Clave,'*','',[]);
  len := Length(tablaCodigos);
  if (AnsiContainsStr(LowerCase(Clave),'raza')) then
    Clave := 'raza';
  for pos := 0 to len-1 do
  begin
    if (LowerCase(tablaCodigos[pos].key) = LowerCase(Clave)) then
    begin
      aux := tablaCodigos[pos].values;
      Result := aux;
      break;
    end;
  end;
  if (Concat = 1) then
  begin
    clave := 'Condicion_1_5';
    clave := StringReplace(clave,'*','',[]);
    for pos := pos to len-1 do
    begin
      if (LowerCase(tablaCodigos[pos].key) = LowerCase(Clave)) then
      begin
        lenaux := Length(aux);
        SetLength(aux,lenaux+Length(tablaCodigos[pos].values));
        for index := 0 to Length(tablaCodigos[pos].values)-1 do
        begin
          aux[lenaux] := tablaCodigos[pos].values[index];
          lenaux := lenaux+1;
        end;
        Result := aux;
        break;
      end;
    end;
  end;
end;

function TFVerificacionXLS.esRequerido(key: string): Boolean;
var
  pos,len: integer;
  clave : String;
begin
  Result := false;
  clave := clearMultiByteChar(key);
  clave := StringReplace(clave,'*','',[]);
  len := Length(tablaCodigos);
  for pos := 0 to len-1 do
  begin
    if (LowerCase(tablaCodigos[pos].key) = LowerCase(Clave)) then
    begin
      Result := tablaCodigos[pos].required;
      break;
    end;
  end;
end;

procedure TFVerificacionXLS.cargarCodigos;
var
  codigos,fil, indice, indvalues: integer;
  key: string;
begin
  codigos := searchSheetCodigos();
  indice := -1;
  if (codigos > -1) then
  begin
    SSPlanilla.ActivePage := codigos;
    With SSPlanilla.ActiveSheet do
    begin
      for fil := 1 to RowCount-2 do
      begin
         if (GetCellObject(0,fil).Text <> '') then
         begin
             indice := indice+1;
             indvalues := 0;
             SetLength(tablaCodigos,indice+1);
             SetLength(tablaCodigos[indice].values,indvalues+1);
             tablaCodigos[indice].values[indvalues].codigo := GetCellObject(1,fil).Text;
             tablaCodigos[indice].values[indvalues].valor := GetCellObject(2,fil).Text;
             key := clearMultiByteChar(GetCellObject(0,fil).Text);
             if (PosEx('*',key,0) > 0) then
             begin
              tablaCodigos[indice].required := true;
              key := StringReplace(key,'*','',[]);
             end;
             tablaCodigos[indice].key := key;
             indvalues := indvalues+1;
         end
         else
         begin
          SetLength(tablaCodigos[indice].values,indvalues+1);
          tablaCodigos[indice].values[indvalues].codigo := GetCellObject(1,fil).Text;
          tablaCodigos[indice].values[indvalues].valor := GetCellObject(2,fil).Text;
          indvalues := indvalues+1;
         end;
      end;
    end;
  end;
  SSPlanilla.ActivePage := 0;
end;

function TFVerificacionXLS.verificarDatos(pagina: integer; col: integer; fila: integer; colname: string): Boolean;
var
  texto: String;
  valores: TArrValores;
  pos: integer;
begin
  Result := False;
  SSPlanilla.ActivePage := pagina;
  texto := SSPlanilla.ActiveSheet.GetCellObject(col,fila).Text;
  valores := getValor(colname);

  pos := 0;
  while (pos < Length(valores)) and (not Result) do
  begin
    if ((LowerCase(valores[pos].codigo) = LowerCase(texto)) and (texto <> '')) or ((LowerCase(valores[pos].valor) = LowerCase(texto)) and (texto <> '')) or ((texto = '') and (not esRequerido(colname))) then
    begin
      Result := true;
    end;
    pos := pos+1;
  end;

end;

procedure TFVerificacionXLS.seleccionarCelda(col,fil: integer);
var
  APoint: TPoint;
begin
  APoint.X := col;
  APoint.Y := fil;
  with SSPlanilla.ActiveSheet do
  begin
    SelectCell(APoint.X,APoint.Y);
    if not PtInRect(Corners, ActiveCell) then
      Corners := Rect(ActiveCell.X-1,ActiveCell.Y-1,ActiveCell.X+1,ActiveCell.Y+1);
  end;
end;

procedure TFVerificacionXLS.SaveFile(arch: String);
begin

  SSPlanilla.SaveToFile(arch);

end;

procedure TFVerificacionXLS.LBErroresClick(Sender: TObject);
var
  celda: TCelda;
begin
  inherited;
  if (LBErrores.ItemIndex <> -1) then
  begin
    celda := TCelda(LBErrores.Items.Objects[LBErrores.ItemIndex]);
    if celda <> nil then
    begin
      seleccionarCelda(celda.getCol(),celda.getFil());
    end;
  end;
end;

function TFVerificacionXLS.VerificarCodigos(FilaFinal: integer; filaIni: integer) : Boolean;
var
  columna, fila, filaFin, totalFilas, totalAnimales, f, c : integer;
  termina, finfila : boolean;
  colNombre, aux : String;
  celda : TCelda;
  R : TRect;
begin

  termina := true;

  for columna := 0 to SSPlanilla.Pages[0].ColumnCount-1 do
  begin
    ColNombre := SSPlanilla.ActiveSheet.GetCellObject(columna,filaIni-1).Text;
    if getValor(colNombre) <> nil then
      for fila := filaIni to FilaFinal-1 do
      begin
        if not VerificarDatos(SSPlanilla.ActivePage,columna,fila,colNombre) then
        begin
          celda := TCelda.Create(columna,fila);
          LBErrores.AddItem('Error de código en la columna: '+IntToStr(columna+1)+ ', fila: '+IntToStr(fila+1)+'. Causa del error: ('+SSPlanilla.ActiveSheet.GetCellObject(columna,fila).Text+')',celda);
          SetColorAlerta(SSPlanilla.ActiveSheet.GetCellObject(columna,fila));          
          termina := false;
        end;

      end;

  end;

  if FPrincipal.FuncExcel then
    if (VerificacionAdicional) then
        termina := false;

  Result := termina;
end;

function TFVerificacionXLS.VerificarEvento : Boolean;
var
  s1,s2 : String;
  res : boolean;
begin
  inherited;
  s1 := lowercase(Evento);
  s2 := lowercase(SSPlanilla.Pages[0].GetCellObject(0,0).Text);
  if (ansipos(s1,s2)<>0) or (ansipos(s2,s1)<>0) then
    res:=true
  else
    res:=false;
  res := ((s1 = 'importación de partos y nacimientos') and (s2 = 'planilla de partos y nacimientos')) or res;
  VerificarEvento := res;
end;

{#1 INICIO 28/11/2014 Matias Rizzi}
{#2 INICIO 02/12/2014 Matias Rizzi}
function TFVerificacionXLS.VerificarPlanilla : Boolean;
var
  empieza, res : Boolean;
  cond1, cond2, cond3 : Boolean;
  FilaFinal, filaIni: integer;
begin
  if ((self.Owner.Owner is TFEveDiagnosticoGestacion)
      OR (self.Owner.Owner is TFEveAltaMasiva)) then
  BEGIN
    salir_ok := FALSE;
    res := false;
  END;
  if VerificarEvento then
  begin
    // Separo en variables, para que chequee todo
    iniciaVerificacion(FilaFinal, filaIni);
    cond1 := VerificarCodigos(FilaFinal, filaIni);
    cond2 := VerificaFechas(FilaFinal, filaIni);
    cond3 := VerificaRPS(FilaFinal, filaIni);
    if cond1 and cond2 and cond3 then
      begin
        res := TRUE;
        if ((self.Owner.Owner is TFEveDiagnosticoGestacion)
            OR (self.Owner.Owner is TFEveAltaMasiva)) then
          BEGIN
            PTop.Visible := FALSE;
            PErrores.Visible := FALSE;
            SSPlanilla.Height:= 371 + 190;
            SSPlanilla.Update;
            ModalResult := mrOk;
          END;
      END
    ELSE
      BEGIN
        res := FALSE;
        if ((self.Owner.Owner is TFEveDiagnosticoGestacion)
        OR (self.Owner.Owner is TFEveAltaMasiva)) then
          begin
            PTop.Visible := TRUE;
            PErrores.Visible := TRUE;
            GBErrores.Height:= 371;
          end;
      END;
    END
  else
    begin
      MostrarMensaje(tmError,'El documento no corresponde a este tipo de evento. Por favor verifique el archivo');
      res := false;
      if ((self.Owner.Owner is TFEveDiagnosticoGestacion)
          OR (self.Owner.Owner is TFEveAltaMasiva)) then
          ModalResult := mrCancel
        else
          ModalResult := mrNo;
      salir_ok:=FALSE;
      Close;
    end;

  Result := res;
end;
{#2 FIN 02/12/2014 Matias Rizzi}
{#1 FIN 28/11/2014 Matias Rizzi}

procedure TFVerificacionXLS.BVerificarClick(Sender: TObject);
var
    FilaFinal, filaIni: integer;
begin
  inherited;
  iniciaVerificacion(FilaFinal, filaIni);
  if VerificarCodigos(FilaFinal, filaIni) then
    MostrarMensaje(tmInformacion,'Se solucionaron todos los errores de códigos. Ahora continuara la importación de datos');
end;

{#1 INICIO 28/11/2014 Matias Rizzi}
procedure TFVerificacionXLS.BTerminarClick(Sender: TObject);
var
    FilaFinal, filaIni: integer;
begin
  inherited;
  //iniciaVerificacion(FilaFinal, filaIni);
  {#2 INICIO 02/12/2014 Matias Rizzi}
  if ((self.Owner.Owner is TFEveDiagnosticoGestacion)
      OR (self.Owner.Owner is TFEveAltaMasiva)) then
  {#2 FIN 02/12/2014 Matias Rizzi}
    BEGIN
      IF VerificarPlanilla THEN
        BEGIN
          SaveFile(NomArch);
          ModalResult:=mrOk;
          salir_ok := TRUE;
          Close;
        END;
    END
  ELSE
    BEGIN
      iniciaVerificacion(FilaFinal, filaIni);
      if VerificarCodigos(FilaFinal, filaIni) then
        Resultado := mrOk
      else
        Resultado := mrNo;
      SaveFile(NomArch);
      Close;
    END;
end;
{#1 FIN 28/11/2014 Matias Rizzi}
// Descompone un caracter en 2 partes y retorna solo el caracter, quitando acentos y otros posibles agregados.
function TFVerificacionXLS.extractSimbolFromMultiByteChar(Text: PAnsiChar): Char;
var
  Buffer: Char;
  Size: Integer;
begin
  Size := MultiByteToWideChar(0,0,Text,-1,nil,0);
  if (Size > 0) then
  begin
    MultiByteToWideChar(0 ,MB_COMPOSITE , Text,-1, @Buffer, Size);
    result:=Buffer;
  end;
end;

//Recorre una cadena caracter a caracter, descomponiendolo y retornando solo el caracter limpio.
function TFVerificacionXLS.clearMultiByteChar(Text: String): String;
var
  i: Integer;
begin
  result:='';
  for I := 1 to Length(Text) do
    Result:=Result+extractSimbolFromMultiByteChar(PAnsiChar(AnsiString(text[i])));
end;

function TFVerificacionXLS.VerificacionAdicional : Boolean;
begin
 hayErrores := false;

  {if (self.Owner.Owner is TFEveAltaMasiva) then
      VerificarConsistenciasAltaMasiva;

  if (self.Owner.Owner is TFEveImportarPartosNacimientos) then
      VerificarConsistenciasPartosNacimientos;

  if (self.Owner.Owner is TFEveDiagnosticoGestacion) then
      VerificarConsistenciasDiagnosticoGestacion;

  if (self.Owner.Owner is TFEveInseminacionArtificial) then
      VerificarConsistenciasInseminacionArtificial;}

  Result := hayErrores;

end;



//-----------------------------------------------------------------------------------------------------------------------
//--------------------------------------------CHEQUEOS PARA LAS DISTINTAS PLANILLAS--------------------------------------


//--------------------------ALTA MASIVA

procedure TFVerificacionXLS.VerificarConsistenciasAltaMasiva;
var fil, cantFilas, difer, edadAnimal : integer;
    celda : TCelda;
    fecha : string;
    fechaAlta, fechaNac : TDateTime;
    f1, f2 : boolean;
begin

      fil := FilaInicial;
      while fil < (FilaFinal) do
      begin

         VerificarObligatoriosAltaMasiva(fil);

//-------------------- Chequeo Fecha de alta menor que fecha nacimiento

         if ((SSPlanilla.ActiveSheet.GetCellObject(1,fil).Text <> '') and (SSPlanilla.ActiveSheet.GetCellObject(3,fil).Text <> '') ) then
         begin
           f1 := TryStrToDate(SSPlanilla.ActiveSheet.GetCellObject(1,fil).Text,fechaAlta);
           f2 := TryStrToDate(SSPlanilla.ActiveSheet.GetCellObject(3,fil).Text,fechaNac);

           if f1 and f2 then
           begin
             if (fechaAlta < fechaNac) then
             begin
                 hayErrores := true;
                 celda := TCelda.Create(1,fil);
                 LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. La fecha de alta del animal debe ser menor o igual que la fecha de nacimiento.',celda);
             end;
           end
           else
           begin
            if not f1 then
            begin
              hayErrores := true;
              celda := TCelda.Create(1,fil);
              LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. El formato de la fecha no es correcto. Formato (dd/mm/aaaa)',celda);
            end;
            if not f2 then
            begin
              hayErrores := true;
              celda := TCelda.Create(3,fil);
              LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. El formato de la fecha no es correcto. Formato (dd/mm/aaaa)',celda);
            end;
           end;
         end;

//--------------------- Chequeo edad con la madre biologica
         if (SSPlanilla.ActiveSheet.GetCellObject(42,fil).Text <> '') then
            if (SSPlanilla.ActiveSheet.GetCellObject(34,fil).Text <> '') then //Tiene Rp la madre biologica
              if (SSPlanilla.ActiveSheet.GetCellObject(34,fil).Text = SSPlanilla.ActiveSheet.GetCellObject(0,fil).Text) then //Verifico Rp de madre e hijo
              begin
                 hayErrores := true;
                 celda := TCelda.Create(34,fil);
                 LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. EL Rp del animal y el de su madre biológica son iguales.',celda);
              end
              else
                  VerificarEdadesAltaMasiva(SSPlanilla.ActiveSheet.GetCellObject(3,fil).Text, SSPlanilla.ActiveSheet.GetCellObject(42,fil).Text, 'Madre biológica',42,fil);

//--------------------- Chequeo edad con la madre receptora interna
         if (SSPlanilla.ActiveSheet.GetCellObject(44,fil).Text = 'INTERNA') then
            if (SSPlanilla.ActiveSheet.GetCellObject(43,fil).Text <> '') then //Tiene Rp la madre receptora
              if (SSPlanilla.ActiveSheet.GetCellObject(43,fil).Text = SSPlanilla.ActiveSheet.GetCellObject(0,fil).Text) then //MIsmo Rp
              begin
                   hayErrores := true;
                   celda := TCelda.Create(43,fil);
                   LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. EL Rp del animal y el de su madre receptora son iguales.',celda);
              end
              else
                 if ((SSPlanilla.ActiveSheet.GetCellObject(51,fil).Text <> '') and f2) then
                    VerificarEdadesAltaMasiva(SSPlanilla.ActiveSheet.GetCellObject(3,fil).Text, SSPlanilla.ActiveSheet.GetCellObject(51,fil).Text, 'Madre receptora interna',51,fil);

//--------------------- Chequeo edad con el padre interno
         if (SSPlanilla.ActiveSheet.GetCellObject(53,fil).Text = 'INTERNO') then
            if (SSPlanilla.ActiveSheet.GetCellObject(52,fil).Text <> '') then //Tiene Rp el padre
              if (SSPlanilla.ActiveSheet.GetCellObject(52,fil).Text = SSPlanilla.ActiveSheet.GetCellObject(0,fil).Text) then // MIsmo Rp
              begin
                   hayErrores := true;
                   celda := TCelda.Create(52,fil);
                   LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. EL Rp del animal y el de su padre son iguales.',celda);
              end
              else
                 if ((SSPlanilla.ActiveSheet.GetCellObject(60,fil).Text <> '') and f2) then
                    VerificarEdadesAltaMasiva(SSPlanilla.ActiveSheet.GetCellObject(3,fil).Text, SSPlanilla.ActiveSheet.GetCellObject(60,fil).Text, 'Padre',60,fil);

//--------------------- Chequeo de categorias
      if ((SSPlanilla.ActiveSheet.GetCellObject(3,fil).Text <> '') and (SSPlanilla.ActiveSheet.GetCellObject(1,fil).Text <> '')) then
         if ((SSPlanilla.ActiveSheet.GetCellObject(4,fil).Text = 'TERNERO') or (SSPlanilla.ActiveSheet.GetCellObject(4,fil).Text = 'NOVILLO') or (SSPlanilla.ActiveSheet.GetCellObject(4,fil).Text = 'TERNERA') or (SSPlanilla.ActiveSheet.GetCellObject(4,fil).Text = 'VAQUILLONA')) then
         begin
            if f1 and f2 then
            begin
              difer := DiferenciaDeEdadAltaMasiva(StrToDateTime(SSPlanilla.ActiveSheet.GetCellObject(3,fil).Text),StrToDateTime(SSPlanilla.ActiveSheet.GetCellObject(1,fil).Text));
              edadAnimal := difer div 30;
              if (difer <> -1) then
                if (difer > 270) then  //270 son 9 meses
                begin
                     hayErrores := true;
                     celda := TCelda.Create(4,fil);
                     LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Categoria seleccionada erronea. La edad del animal es de ' + inttostr(edadAnimal) + ' meses. Supera los 9 meses necesarios para categoria: Ternero, Novillo, Ternera o Vaquillona.',celda);
                end;
              end;
         end
         else
         begin
            if f1 and f2 then
            begin
              difer := DiferenciaDeEdadAltaMasiva(StrToDateTime(SSPlanilla.ActiveSheet.GetCellObject(3,fil).Text),StrToDateTime(SSPlanilla.ActiveSheet.GetCellObject(1,fil).Text));
              edadAnimal := difer div 30;
              if (difer <> -1) then
                if (difer < 270) then
                begin
                     hayErrores := true;
                     celda := TCelda.Create(4,fil);
                     LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Categoria seleccionada erronea. La edad del animal es de ' + inttostr(edadAnimal) + ' meses. No supera los 9 meses de edad para categoria: Vaca, Toro.',celda);
                end;
            end;
         end;
{
       if (SSPlanilla.ActiveSheet.GetCellObject(19,fil).Text <> '') then
       begin
         if (SSPlanilla.ActiveSheet.GetCellObject(4,fil).Text = 'VAQUILLONA') then
            if (SSPlanilla.ActiveSheet.GetCellObject(19,fil).Text > '0') then
            begin
                 hayErrores := true;
                 celda := TCelda.Create(19,fil);
                 LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. La cantidad de partos para una Vaquillona debe ser igual a cero.',celda);
            end;

         if (SSPlanilla.ActiveSheet.GetCellObject(4,fil).Text = 'VACA') then
            if (SSPlanilla.ActiveSheet.GetCellObject(19,fil).Text = '0') or (SSPlanilla.ActiveSheet.GetCellObject(19,fil).Text = '') then
            begin
                 hayErrores := true;
                 celda := TCelda.Create(19,fil);
                 LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. La cantidad de partos para una Vaca debe ser distinta de cero.',celda);
            end;

         if ((SSPlanilla.ActiveSheet.GetCellObject(4,fil).Text = 'TERNERO') or (SSPlanilla.ActiveSheet.GetCellObject(4,fil).Text = 'NOVILLO') or (SSPlanilla.ActiveSheet.GetCellObject(4,fil).Text = 'TORO')) then
         begin
            if (SSPlanilla.ActiveSheet.GetCellObject(19,fil).Text <> '') then
               if (SSPlanilla.ActiveSheet.GetCellObject(19,fil).Text > '0') then
                begin
                     hayErrores := true;
                     celda := TCelda.Create(19,fil);
                     LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. La cantidad de partos para un Macho debe ser cero.',celda);
                end;

            if (SSPlanilla.ActiveSheet.GetCellObject(18,fil).Text <> '') then
               if (SSPlanilla.ActiveSheet.GetCellObject(18,fil).Text <> 'NO DEFINIDO') then
               begin
                    hayErrores := true;
                    celda := TCelda.Create(18,fil);
                    LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. El dato no corresponde a un animal Macho.',celda);
               end;

         end;      }

      fil := fil + 1;
    end;
end;



procedure TFVerificacionXLS.VerificarEdadesAltaMasiva(fechaNacHijo, fechaNacProgenitor, tipoprogenitor : string; col, fil : integer);
var fecNacHijo, fecNacProgenitor : TDateTime;
    celda : TCelda;
    f1, f2 : Boolean;
begin
    f1 := TryStrToDate(fechaNacProgenitor,fecNacProgenitor);
    f2 := TryStrToDate(fechaNacHijo,fecNacHijo);

    if f1 and f2 then
    begin

     if (fechaNacHijo <> '') then
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
    end
    else
    begin
      hayErrores := true;
    end
end;


function TFVerificacionXLS.DiferenciaDeEdadAltaMasiva(fechaNacAnim, fechaAltaAnim : TDateTime) : integer;
var diferencia : integer;
begin

     diferencia := -1;
     if (fechaAltaAnim <= fechaNacAnim) then
       diferencia := Trunc(fechaNacAnim - fechaAltaAnim); //La diferencia me la da en dias

     result := diferencia;
end;

procedure TFVerificacionXLS.VerificarObligatoriosAltaMasiva(fil : integer);
var celda : TCelda;
begin


//-------------------- Chequeo Rp obligatorios
         if (SSPlanilla.ActiveSheet.GetCellObject(0,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(0,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta Rp del animal',celda);
         end;

//-------------------- Chequeo Fecha de alta
         if (SSPlanilla.ActiveSheet.GetCellObject(1,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(1,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta fecha de alta del animal',celda);
         end;

//-------------------- Chequeo Tipo de alta
         if (SSPlanilla.ActiveSheet.GetCellObject(2,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(2,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta tipo de alta del animal',celda);
         end;

//-------------------- Chequeo Fecha nacimiento
         if (SSPlanilla.ActiveSheet.GetCellObject(3,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(3,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta fecha de nacimiento del animal',celda);
         end;

//-------------------- Chequeo categoria
         if (SSPlanilla.ActiveSheet.GetCellObject(4,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(4,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta categoria del animal',celda);
         end;

//-------------------- Chequeo Raza
         if (SSPlanilla.ActiveSheet.GetCellObject(5,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(5,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta raza del animal',celda);
         end;
end;


//-----------------------------------------------------------------------------------------------------------------------
//---------------------PARTOS Y NACIMIENTOS

procedure TFVerificacionXLS.VerificarConsistenciasPartosNacimientos;
var fil : integer;
begin
      fil := FilaInicial;
      while fil < (FilaFinal) do
      begin

         VerificarObligatoriosPartosNacimientos(fil);

         inc(fil);

      end;
end;

procedure TFVerificacionXLS.VerificarObligatoriosPartosNacimientos(fil : integer);
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
         if (GetCellObject(2,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(2,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + ' columna: ' + inttostr(3) + '. Falta fecha de nacimiento del animal.',celda);
         end;

//-------------------- Chequeo Sexo
         if (GetCellObject(3,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(3,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta sexo del animal.',celda);
         end;

//-------------------- Chequeo Vivo
         if (GetCellObject(4,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(4,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta estado de nacimiento del animal(Vivo/Muerto).',celda);
         end;

//-------------------- Chequeo Rp Madre
         if (GetCellObject(7,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(7,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta Rp de la Madre.',celda);
         end
         else
            if (GetCellObject(0,fil).Text = GetCellObject(7,fil).Text) then //Rp madre igual al del hijo
            begin
               hayErrores := true;
               celda := TCelda.Create(7,fil);
               LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. El Rp de la Madre y el de su Hijo son iguales.',celda);
            end;

//-------------------- Chequeo Categoria
         if (GetCellObject(8,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(8,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta categoria del animal.',celda);
         end;

//-------------------- Chequeo tipo parto
         if (GetCellObject(10,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(10,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta especificar Tipo de parto.',celda);
         end;
    end;
end;

//-----------------------------------------------------------------------------------------------------------------------
//-------------------------- DIAGNOSTICO DE GESTACION


procedure TFVerificacionXLS.VerificarConsistenciasDiagnosticoGestacion;
var cantFilas, fil : integer;
    celda : TCelda;
begin
 //   cantFilas := CantidadAnimalesCargados(FilaInicial);
    cantFilas := cantFilas + FilaInicial;

    With SSPlanilla.ActiveSheet do
    begin

//-------------------- Chequeo Fecha inicio servicio
         if (GetCellObject(1,1).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(1,1);
             LBErrores.AddItem('Error en fila: ' + inttostr(2) + '. Falta fecha de inicio del servicio.',celda);
         end;

//-------------------- Chequeo Fecha fin servicio
         if (GetCellObject(1,2).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(1,2);
             LBErrores.AddItem('Error en fila: ' + inttostr(3) + '. Falta fecha de fin del servicio.',celda);
         end;


       fil := FilaInicial;
       while fil < (FilaFinal) do
       begin

          VerificarObligatoriosDiagnosticoGestacion(fil);

          if (( GetCellObject(1,1).Text <> '') and (GetCellObject(1,2).Text <> '')) then
          begin
            if (StrToDateTime(GetCellObject(1,1).Text) > StrToDateTime(GetCellObject(1,2).Text)) then
            begin
                hayErrores := true;
                celda := TCelda.Create(1,1);
                LBErrores.AddItem('Error en fila: ' + inttostr(2) + '. Valor incorrecto para fecha de inicio de servicio. Esta debe ser anterior a la fecha de fin, o bien la fecha de fin es incorrecta.',celda);
            end;

            if ( StrToDateTime(GetCellObject(1,fil).Text) < StrToDateTime(GetCellObject(1,2).Text) ) then
            begin
               hayErrores := true;
               celda := TCelda.Create(1,fil);
               LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Valor incorrecto para fecha de tacto. Esta debe ser posterior a la fecha de fin del servicio, o bien la fecha de fin es incorrecta.',celda);
            end;
          end;

          if (GetCellObject(5,fil).Text <> '') then //Chequeo que si tiene dias de gestacion, este dentro de los parametros correcto, y que ademas este preñada.
            if ((GetCellObject(5,fil).Text <= '0') or (GetCellObject(5,fil).Text > '296')) then
            begin
                 hayErrores := true;
                 celda := TCelda.Create(5,fil);
                 LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Los días de gestación de la hembra no son correctos.',celda);
            end
            else
            begin
                 if ((GetCellObject(4,fil).Text <> 'PREÑADA') and (GetCellObject(4,fil).Text <> 'PR')) then
                 begin
                      hayErrores := true;
                      celda := TCelda.Create(4,fil);
                      LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. La cantidad de días de gestación es mayor a cero, por lo tanto se requiere que esté preñada.',celda);
                 end;
            end;
            inc(fil);
       end;
    end;
end;

procedure TFVerificacionXLS.VerificarObligatoriosDiagnosticoGestacion(fil : integer);
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
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta fecha de tacto.',celda);
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

{//-------------------- Chequeo Preñez por IATF
         if (GetCellObject(5,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(5,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta especificar SI o NO.',celda);
         end;  }

    end;
end;


//-----------------------------------------------------------------------------------------------------------------------
//--------------------------------------------IATF


procedure TFVerificacionXLS.VerificarConsistenciasInseminacionArtificial;
var cantFilas, fil : integer;
    celda : TCelda;
begin

    cantFilas := cantFilas + FilaInicial;

    With SSPlanilla.ActiveSheet do
    begin

      fil := FilaInicial;
      while fil < (FilaFinal) do
      begin

//-------------------- Chequeo Rp
         if (GetCellObject(0,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(0,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta Rp del animal.',celda);
         end;

//-------------------- Chequeo Fecha inseminacion
         if (GetCellObject(2,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(2,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta fecha de inseminación.',celda);
         end;

//-------------------- Chequeo Categoria
         if (GetCellObject(4,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(4,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta categoria del animal.',celda);
         end;

//-------------------- Chequeo Toro
         if (GetCellObject(7,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(7,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta identificar Toro.',celda);
         end;

//-------------------- Chequeo Dosis
         if (GetCellObject(8,fil).Text = '') then
         begin
             hayErrores := true;
             celda := TCelda.Create(8,fil);
             LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. Falta cantidad de dosis de inseminación.',celda);
         end
         else
             if (GetCellObject(8,fil).Text = '0') then
             begin
                 hayErrores := true;
                 celda := TCelda.Create(8,fil);
                 LBErrores.AddItem('Error en fila: ' + inttostr(fil+1) + '. La cantidad de dosis debe ser mayor a cero.',celda);
             end;

         inc(fil);
      end;
    end;
end;

function TFVerificacionXLS.VerificaFechas(FilaFinal: integer; filaIni: integer) : Boolean;
var
  columna, fila, totalFilas : integer;
  texto, colNombre : String;
  celda : TCelda;
  Value: TDateTime;
  termina: boolean;
begin
  termina := true;

  for columna := 0 to SSPlanilla.Pages[0].ColumnCount-1 do
  begin
    ColNombre := SSPlanilla.ActiveSheet.GetCellObject(columna,filaIni-1).Text;
    if (AnsiPos('FECHA', UpperCase(trim(ColNombre))) <> 0) then
    begin
      for fila := filaIni to FilaFinal-1 do
      begin
        texto := SSPlanilla.ActiveSheet.GetCellObject(columna, fila).Text;
        if (Trim(texto) <> '') and (not (TryStrToDate(texto, Value) or TryStrToDateTime(texto, Value))) then
        begin
          celda := TCelda.Create(columna, fila);
          LBErrores.AddItem('Error de formato de fecha en la columna: '+IntToStr(columna+1)+
          ', fila: '+IntToStr(fila+1)+
          '. Causa del error: ('+SSPlanilla.ActiveSheet.GetCellObject(columna,fila).Text+')',celda);
          SetColorAlerta(SSPlanilla.ActiveSheet.GetCellObject(columna,fila));

          termina := false;
        end
      end;
    end;
  end;

  if FPrincipal.FuncExcel then
    if (VerificacionAdicional) then
        termina := false;

  Result := termina;
end;

function TFVerificacionXLS.VerificaRPS(FilaFinal: integer; filaIni: integer) : Boolean;
var
  columna, fila, fila2 : integer;
  RP_pivote, RP_control, colNombre : String;
  encontroUno, termina: boolean;
begin
  {#1 INICIO 28/11/2014 Matias Rizzi}
  {#2 INICIO 02/12/2014 Matias Rizzi}
  if ((self.Owner.Owner is TFEveDiagnosticoGestacion)
      OR (self.Owner.Owner is TFEveAltaMasiva)) then
    termina:=TRUE;
  {#2 FIN 02/12/2014 Matias Rizzi}
  {#1 FIN 28/11/2014 Matias Rizzi}
  encontroUno := false;
  for columna := 0 to SSPlanilla.Pages[0].ColumnCount-1 do
  begin
    ColNombre := SSPlanilla.ActiveSheet.GetCellObject(columna,filaIni-1).Text;
    if (AnsiPos('RP*', UpperCase(trim(ColNombre))) <> 0) then
    begin
      for fila := filaIni to FilaFinal-1 do
      begin
        RP_pivote := SSPlanilla.ActiveSheet.GetCellObject(columna, fila).Text;

        for fila2 := filaIni to FilaFinal-1 do
        begin
          RP_control := SSPlanilla.ActiveSheet.GetCellObject(columna, fila2).Text;
          if (fila <>fila2) then
          begin
              if RP_pivote = RP_control then
              begin
                  encontroUno := true;
                  SetColorAlerta(SSPlanilla.ActiveSheet.GetCellObject(columna, fila2));
              end;
          end;

        end;
      end;
      if (encontroUno) then
      begin
        LBErrores.AddItem('Encontro RP repetidos',nil);
        termina := false;
      end

    end;
  end;

  if FPrincipal.FuncExcel then
    if (VerificacionAdicional) then
        termina := false;

  Result := termina;

end;



procedure TFVerificacionXLS.iniciaVerificacion(out FilaFinal: integer; out filaIni: integer);
var
  columna, fila, filaFin, totalFilas, f, c : integer;
  empieza, termina, finfila : boolean;
  texto, colNombre, aux : String;

begin
  LBErrores.Clear;

  termina := true;
  empieza := false;
  finfila := false;
  SSPlanilla.ActivePage := 0;
  filaIni := 0;
  totalFilas := SSPlanilla.ActiveSheet.RowCount;
  // Busca la fila inicial, salteando las generales
  while (not empieza) and (filaIni <= totalFilas) do
  begin
    if (UpperCase(SSPlanilla.ActiveSheet.GetCellObject(0,filaIni).Text) = 'RP*') or
      (UpperCase(SSPlanilla.ActiveSheet.GetCellObject(0,filaIni).Text) = UpperCase('RP Animal*')) or
      (UpperCase(SSPlanilla.ActiveSheet.GetCellObject(0,filaIni).Text) = UpperCase('RP (Ternero)*')) or
      (UpperCase(SSPlanilla.ActiveSheet.GetCellObject(0,filaIni).Text) = UpperCase('RP Receptora*')) then
      empieza := true;
    Inc(filaIni);
  end;

  FilaInicial := filaini;

  if (not empieza) then
  begin
    termina := false;
    MostrarMensaje(tmError,'La planilla no se encuentra actualizada. Por favor utilice una planilla actualizada');
    raise Exception.Create('La planilla no se encuentra actualizada. Por favor utilice una planilla actualizada');
    exit;
  end;

  filaFin := filaIni;
  while not finfila do
  begin
    if ((UpperCase(SSPlanilla.ActiveSheet.GetCellObject(0,filaFin).Text) = '') and (UpperCase(SSPlanilla.ActiveSheet.GetCellObject(1,filaFin).Text) = '') and (UpperCase(SSPlanilla.ActiveSheet.GetCellObject(2,filaFin).Text) = '') and (UpperCase(SSPlanilla.ActiveSheet.GetCellObject(0,filaFin).Text) = '')) then
    begin
      finfila := true;
      break;
    end;
    Inc(filaFin);
  end;

  FilaFinal := filaFin;
end;

procedure TFVerificacionXLS.SetColorAlerta(celda: TcxSSCellObject);
begin
    // 5 es amarillo
    celda.Style.Brush.BackgroundColor := 5;
end;

{#1 INICIO 28/11/2014 Matias Rizzi}
procedure TFVerificacionXLS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  {#2 INICIO 02/12/2014 Matias Rizzi}
  if ((self.Owner.Owner is TFEveDiagnosticoGestacion)
     OR (self.Owner.Owner is TFEveAltaMasiva)) then
  {#2 FIN 02/12/2014 Matias Rizzi}
    BEGIN
      if salir_ok then
        ModalResult:=mrOk
      else
        ModalResult:=mrNo;
    END;
end;

procedure TFVerificacionXLS.JvCancelarClick(Sender: TObject);
begin
  inherited;
  salir_ok := FALSE;
  Close;
end;
{#1 FIN 28/11/2014 Matias Rizzi}

end.
