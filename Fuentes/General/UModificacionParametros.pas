unit UModificacionParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, DB,
  IBCustomDataSet, IBQuery, IBUpdateSQL, DBCtrls, Mask, Contnrs,
  DatosGenericos, EditAuto, Buttons, IBStoredProc, DataExport, DataToXLS,
  WinXP, StrUtils, DateUtils, JvExControls, JvLabel, JvGIF, PngImage, jpeg,
  ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TPointerParametros = ^TArrayParametros;
  TArrayParametros = record
    clase : integer;
    tipo : integer;
    descripcion : ansistring;
  end;

  TFModificacionParametros = class(TFUniversal)
    Panel1: TPanel;
    Panel2: TPanel;
    GBParametros: TGroupBox;
    ASalir: TAction;
    IBQClasesParametros: TIBQuery;
    IBQTiposParametros: TIBQuery;
    IBQParametros: TIBQuery;
    IBUSQLParametros: TIBUpdateSQL;
    DSParametros: TDataSource;
    Panel3: TPanel;
    AAplicar: TAction;
    ACancelar: TAction;
    IBQParametrosParaGuardar: TIBQuery;
    GBDescripcionTipo: TGroupBox;
    Panel4: TPanel;
    Panel5: TPanel;
    GBDescripcionesDeParametros: TGroupBox;
    Panel6: TPanel;
    Panel7: TPanel;
    SSeparador: TSplitter;
    MDescripcionesDeParametros: TRichEdit;
    MDescripcion: TRichEdit;
    PComponentesDinamicos: TScrollBox;
    Panel8: TPanel;
    IBQValidacionesRango: TIBQuery;
    IBQParametrosDESCRIPCION: TIBStringField;
    IBQParametrosNOMBRE: TIBStringField;
    IBQParametrosVALOR: TIBStringField;
    IBQParametrosEDITABLE: TIBStringField;
    IBQParametrosID_PARAMETRO: TIntegerField;
    IBQParametrosESTABLECIMIENTO: TIntegerField;
    IBQParametrosTIPO_VALOR: TIBStringField;
    IBQParametrosVALORES_POSIBLES: TIBStringField;
    GBTiposParametros: TGroupBox;
    TVClasesTipos: TTreeView;
    IBQParametrosUNIDAD: TIBStringField;
    BBAplicar: TBitBtn;
    BBCancelar: TBitBtn;
    BBAceptar: TBitBtn;
    BBAyuda: TBitBtn;
    Image1: TImage;
    IAceptar: TImage;
    LAceptar: TLabel;
    INo: TImage;
    LNo: TLabel;
    Isi: TImage;
    LSi: TLabel;
    procedure ASalirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TVClasesTiposChange(Sender: TObject; Node: TTreeNode);
    procedure GenerarLabel( captionLabel : string);
    procedure GenerarLabelValor ( Value : string);
    procedure GenerarLabelUnidad ( Value : string);
    procedure GenerarEdit(dato : string; nombre : String);
    procedure GenerarCombo(dato : string; nombre : string; valores : string);
    procedure GenerarCheckBox(dato : string; nombre : string);
    procedure GenerarDateTimePicker(dato: string; nombre : string);
    procedure ActualizarBDLimpiarComponentes();
    procedure FormCreate(Sender: TObject);
    procedure EditChange(Sender: TObject);
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure ComboChange(Sender: TObject);
    procedure ComboCloseUp(Sender: TObject);
    procedure ComboKeyPress(Sender: TObject; var Key: Char);
    procedure ACancelarExecute(Sender: TObject);
    procedure AAplicarExecute(Sender: TObject);
    procedure DateTimePickerChange(Sender : TObject);
    procedure CheckBoxClick(Sender: TObject);
  private
    listaEtiquetas: TObjectList;
    datoGrupoCACUCO : String;
    procedure armarTreeView;
    procedure agregarTipos(clase: integer ;nodoPadre : TTreeNode);
    procedure mostrarParametros;
    function recuperarValores( tipo:string; valores:string ):string;
    procedure Habilitar(Nombre : String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FModificacionParametros: TFModificacionParametros;
  nodoPrincipal : TTreeNode;
  posX, posY : integer;
  cambios : boolean;

implementation

uses UPrincipal, UMensajeHuella, UTraduccion;

{$R *.dfm}

procedure TFModificacionParametros.ASalirExecute(Sender: TObject);
begin
  inherited;
  if (cambios) then
    begin // aplico y salgo
      FPrincipal.IBDPrincipal.ApplyUpdates([IBQParametrosParaGuardar]);
      ActualizarBDLimpiarComponentes;
      listaEtiquetas.Free;
      //FPrincipal.EstablecimientoActual := FPrincipal.EstablecimientoActual;
      //BBAceptar.SetFocus;
      close;
    end
  else
    begin  // limpio todo y salgo
      //FPrincipal.EstablecimientoActual := FPrincipal.EstablecimientoActual;
      ActualizarBDLimpiarComponentes;
      listaEtiquetas.Free;
      //BBAceptar.SetFocus;
      close;
    end;
end;

// para cargar los tipo de parametros de un clase pasada como parametro
procedure TFModificacionParametros.agregarTipos( clase: integer ;nodoPadre: TTreeNode);
var puntero : TPointerParametros;
begin
  IBQTiposParametros.Active := false;
  IBQTiposParametros.ParamByName('clase').AsInteger := clase;
  IBQTiposParametros.Active := true;
  IBQTiposParametros.First;
  while not(IBQTiposParametros.Eof) do
    begin
      new(puntero);
      puntero^.clase := clase;
      puntero^.tipo := IBQTiposParametros.FieldByName('id_tipo_parametro').AsInteger;
      puntero^.descripcion := IBQTiposParametros.FieldByName('Descripcion').AsString;
      TTreeNode.Create(TTreeNodes.Create(TVClasesTipos));
      TVClasesTipos.Items.AddChildObject(nodoPadre, IBQTiposParametros.FieldByName('nombre').AsString, puntero);
      IBQTiposParametros.Next;
    end;
end;


// para armar el arbol con las clases
procedure TFModificacionParametros.armarTreeView;
var ProximoPadre : TTreeNode;
    i : Integer;
begin
  IBQClasesParametros.Active := true;
  IBQClasesParametros.First;
  while not( IBQClasesParametros.Eof) do
    begin
      TTreeNode.Create(TTreeNodes.Create(TVClasesTipos));
      proximoPadre := TVClasesTipos.Items.AddObject(nil, IBQClasesParametros.FieldByName('nombre').AsString, nil);// agrego al arbol las clases
      agregarTipos(IBQClasesParametros.FieldByName('id_clase_parametro').Asinteger, proximoPadre);
      IBQClasesParametros.Next;
    end;
  i := 0;
  for i := 0 to TVClasesTipos.Items.Count -2 do
  begin
    TVClasesTipos.Selected := TVClasesTipos.Items[i].GetNext;
  end;
  TVClasesTipos.Selected := TVClasesTipos.TopItem;
  TVClasesTipos.Update;
  PComponentesDinamicos.Repaint;
end;

// show
procedure TFModificacionParametros.FormShow(Sender: TObject);
begin
  inherited;
  cambios := false;
  armarTreeView;
end;

// metodo que se ejecuta cada vez que se acciona sobre el treeview
procedure TFModificacionParametros.TVClasesTiposChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  if (Node.Data <> nil) then
    begin
      ActualizarBDLimpiarComponentes;
      IBQParametros.Active := false;
      IBQParametros.ParamByName('tipo').AsInteger := TPointerParametros(Node.Data)^.tipo;
      IBQParametros.ParamByName('esta').AsInteger := Fprincipal.EstablecimientoActual;
      IBQParametros.Active := true;
      MDescripcion.Lines.Clear;
      MDescripcion.Lines.Add(TPointerParametros(Node.Data)^.descripcion);
      mostrarParametros;
    end
  else
    begin
      ActualizarBDLimpiarComponentes;
      MDescripcionesDeParametros.Lines.Clear;
      MDescripcion.Lines.Clear;
    end;
end;

// este metodo hace commit de la base y saca todos los componentes del GBParametros
procedure TFModificacionParametros.ActualizarBDLimpiarComponentes;
var cont : integer;
begin
  posX := 0;
  posY := 0;
 // borro los componentes agregados dinamicamente
 for cont := listaEtiquetas.Count-1 downto 0 do
   listaEtiquetas.Delete(cont);
end;

procedure TFModificacionParametros.FormCreate(Sender: TObject);
begin
  inherited;

  listaEtiquetas := TObjectList.Create;
  IBQParametrosParaGuardar.Active := true;
end;

procedure TFModificacionParametros.GenerarCheckBox(dato : string; nombre : string);
var
  componenteCheckBox : TCheckBox;
begin
  posX := posX + 200;
  componenteCheckBox := TCheckBox.Create(GBParametros);
  with componenteCheckBox do
  begin
    Name := 'P'+nombre;
    Left := posX;
    Top := posy - 3;
    Visible := true;
    Font := PComponentesDinamicos.Font;
    Parent := PComponentesDinamicos;
    Width := 120;
    Checked := dato = 'S';
    Caption := '';
    OnClick := CheckBoxClick;
  end;
  listaEtiquetas.Add(componenteCheckBox);
end;

// genera un edit conectado al query de parametros
procedure TFModificacionParametros.GenerarEdit(dato: string; nombre : String);
var componenteEdit : TEdit;
begin
  posX := posX + 200;
  componenteEdit := TEdit.Create(GBParametros);
  with componenteEdit do
  begin
    Name := 'P'+nombre;
    MaxLength:= 6;
    Left := posx;
    top := posy - 3;
    Visible := true;
    Font := PComponentesDinamicos.Font;
    Parent := PComponentesDinamicos;
    Width := 120;
    Text := dato;
    OnChange := EditChange;
    OnExit := EditChange;
    OnKeyPress := EditKeyPress;
  end;
  listaEtiquetas.Add(componenteEdit);
end;

// metodo que genera un DateTimePicker conectado al query de parametros
procedure TFModificacionParametros.GenerarDateTimePicker(dato: string; nombre : string);
var
  componenteDateTimePicker : TDateTimePicker;
begin

  posX := posX + 200;

  componenteDateTimePicker := TDateTimePicker.Create(GBParametros);

  componenteDateTimePicker.Parent := PComponentesDinamicos;
  componenteDateTimePicker.Name := 'P'+nombre;
  componenteDateTimePicker.Left := posX;
  componenteDateTimePicker.Top := posY - 3;
  componenteDateTimePicker.Visible := true;
  componenteDateTimePicker.Font := PComponentesDinamicos.Font;
  componenteDateTimePicker.Width := 120;
  componenteDateTimePicker.Format := 'dd - MMMM';
  componenteDateTimePicker.Date := StrToDate(dato);
  componenteDateTimePicker.DateMode := dmUpDown;
  componenteDateTimePicker.OnChange := DateTimePickerChange;

  listaEtiquetas.Add(componenteDateTimePicker);
end;

//metodo que guarda los cambios de las fechas
procedure TFModificacionParametros.DateTimePickerChange(Sender : TObject);
var
  id : Integer;
  valor : String;
  fecha1, fecha2, fecha3, fecha : TDate;
  procedure PostDatos(ID : Integer; valor : String);
  begin
    try
      IBQParametrosParaGuardar.Locate('establecimiento;parametro',VarArrayOf([Fprincipal.EstablecimientoActual,ID]), [] );
      IBQParametrosParaGuardar.Edit;
      IBQParametrosParaGuardar.FieldByName('valor').AsString := valor;
      IBQParametrosParaGuardar.Post;
      cambios := true;
    except
    end;
  end;
  procedure CambiarOtrasFechas(fecha : TDate; Componente : Integer);
  var
    Comp : TComponent;
  begin
    PostDatos(Componente,DateToStr(fecha));
    Comp := GBParametros.FindComponent('P'+IntToStr(Componente));
    (Comp as TDateTimePicker).OnChange := nil;
    (Comp as TDateTimePicker).Date := fecha;
    (Comp as TDateTimePicker).OnChange := DateTimePickerChange;
  end;
begin
  if TryStrToInt(RightStr((Sender as TDateTimePicker).Name,2),id) then
  begin
    fecha := (Sender as TDateTimePicker).Date;
    valor := DateToStr(fecha);
    PostDatos(id,valor);
      case id of
        50 : begin
              fecha1 := IncMonth(fecha,6);
              fecha1 := IncDay(fecha1,-1);
              fecha2 := IncDay(fecha1,1);
              fecha3 := IncMonth(fecha1,6);
              CambiarOtrasFechas(fecha1,51);
              CambiarOtrasFechas(fecha2,52);
              CambiarOtrasFechas(fecha3,53);
             end;
        51 : begin
              fecha1 := IncMonth(fecha,-6);
              fecha1 := IncDay(fecha1,1);
              fecha2 := IncDay(fecha,1);
              fecha3 := IncMonth(fecha,6);
              CambiarOtrasFechas(fecha1,50);
              CambiarOtrasFechas(fecha2,52);
              CambiarOtrasFechas(fecha3,53);
             end;
        52 : begin
              fecha1 := IncMonth(fecha,-6);
              fecha2 := IncDay(fecha,-1);
              fecha3 := IncMonth(fecha,6);
              fecha3 := IncDay(fecha3,-1);
              CambiarOtrasFechas(fecha1,50);
              CambiarOtrasFechas(fecha2,51);
              CambiarOtrasFechas(fecha3,53);
             end;
        53 : begin
              fecha1 := IncMonth(fecha,-12);
              fecha1 := IncDay(fecha1,1);
              fecha2 := IncMonth(fecha,-6);
              fecha3 := IncDay(fecha2,1);
              CambiarOtrasFechas(fecha1,50);
              CambiarOtrasFechas(fecha2,51);
              CambiarOtrasFechas(fecha3,52);
             end;
      end;
  end;
end;

// metodo que genera el label para los parametros
procedure TFModificacionParametros.GenerarLabel(captionLabel: string);
var componenteLabel : Tlabel;
begin
  posX := 10;
  posY := posY + 25;
  ComponenteLabel := TLabel.Create(GBParametros);
  with ComponenteLabel do
  begin
    Caption := captionLabel;
    Left := posx;
    top := posy;
    Visible := true;
    Font := PComponentesDinamicos.Font;
    Parent := PComponentesDinamicos;
  end;
  listaEtiquetas.Add(ComponenteLabel);
end;


// metodo que genera los label con el valor de la base de datos de un parametro que es no editable
procedure TFModificacionParametros.GenerarLabelValor(Value: string);
var componenteLabel : Tlabel;
begin
  posX := posX + 200;
  ComponenteLabel := TLabel.Create(GBParametros);
  with ComponenteLabel do
  begin
    Caption := Value;
    Left := posx;
    top := posy;
    Visible := true;
    Font := PComponentesDinamicos.Font;
    Font.Style := [fsBold];
    Parent := PComponentesDinamicos;
  end;
  listaEtiquetas.Add(ComponenteLabel);
end;

// metodo que genera los label con el valor de la base de datos de la unidad de un parametro 
procedure TFModificacionParametros.GenerarLabelUnidad(Value: string);
var componenteLabel : Tlabel;
begin
  posX := posX + 130;
  ComponenteLabel := TLabel.Create(GBParametros);
  with ComponenteLabel do
  begin
    Caption := Value;
    Left := posx;
    top := posy;
    Visible := true;
    Font := PComponentesDinamicos.Font;
    //Font.Style := [fsBold];
    Font := PComponentesDinamicos.Font;
    Font.Color:= clGray;
    Parent := PComponentesDinamicos;
  end;
  listaEtiquetas.Add(ComponenteLabel);
end;

// metodo que se ejecuta cuando se cambia un edit de parametro
procedure TFModificacionParametros.EditChange(Sender: TObject);
var id : integer;
    valores : string;
    limiteInferior : real;
    limiteSuperior : real;
    indice : integer;
    punto_coma : integer;
    valor : string;
    valorFloat : double;
    valorInteger : integer;
begin
  inherited;
  id := StrToInt(stringReplace(Tedit(Sender).Name, 'P', '', [rfIgnoreCase]));
  IBQValidacionesRango.Close;
  IBQValidacionesRango.ParamByName('id').AsInteger := id;
  IBQValidacionesRango.Open;
  valores := IBQValidacionesRango.fieldByName('valores_posibles').AsString;
  valor := '';
  indice := 1;

  punto_coma := Pos(':',valores);

  while (indice < punto_coma) do
    begin
      valor := valor + valores[indice];
      inc(indice);
    end;
  limiteInferior := strToFloat(valor);
  valor := '';
  inc(indice);
  while (indice <= Length(valores)) do
    begin
      valor := valor + valores[indice];
      inc(indice);
    end;
  limiteSuperior := strToFloat(valor);

  if (IBQValidacionesRango.fieldByName('tipo_datos').AsString = 'I') then // valido enteros
    begin
      if (TryStrToInt(Tedit(Sender).Text,valorInteger)) then
        begin
          if ((valorInteger >= limiteInferior) and (valorInteger <limiteSuperior+1)) then
            begin
              IBQParametrosParaGuardar.Locate('establecimiento;parametro',VarArrayOf([Fprincipal.EstablecimientoActual,id]), [] );
              IBQParametrosParaGuardar.Edit;
              IBQParametrosParaGuardar.FieldByName('valor').AsInteger := valorInteger;
              IBQParametrosParaGuardar.Post;
              cambios := true;
            end
          else
            begin
              MostrarMensaje(tmError, Traducir('Error al cargar el parametro, este valor debe estar entre ')+FormatFloat('0',limiteInferior) +Traducir(' y ')+FormatFloat('0',limiteSuperior));
              Tedit(Sender).SetFocus;
            end;
        end
      else
        begin
          MostrarMensaje(tmError, 'Error al cargar el parametro, este valor debe ser entero');
          Tedit(Sender).SetFocus;
        end;
    end
  else // valido decimales
    begin
      if (TryStrToFloat(Tedit(Sender).Text,valorFloat)) then
        begin
          if ((valorFloat >= limiteInferior) and (valorFloat <limiteSuperior)) then
            begin
              IBQParametrosParaGuardar.Locate('establecimiento;parametro',VarArrayOf([Fprincipal.EstablecimientoActual,id]), [] );
              IBQParametrosParaGuardar.Edit;
              IBQParametrosParaGuardar.FieldByName('valor').AsFloat := valorFloat;
              IBQParametrosParaGuardar.Post;
              cambios := true;
            end
          else
            begin
              MostrarMensaje(tmError, Traducir('Error al cargar el parametro, este valor debe estar entre ')+FormatFloat('0,00',limiteInferior) +Traducir(' y ')+FormatFloat('0,00',limiteSuperior));
              Tedit(Sender).SetFocus;
            end;
        end
      else
        begin
          MostrarMensaje(tmError,'Error al cargar el parametro, este valor debe ser decimal');
          Tedit(Sender).SetFocus;
        end
    end;

end;



// metodo para guardar los cambios cada ves que se presiona enter
procedure TFModificacionParametros.EditKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not (key in (['0'..'9'])) and (key <> #13) and (key <> #8)) then
     key:=#0;
     
  if (key = #13) then
    Tedit(Sender).OnExit(Sender);
end;

// metodo para deshacer los cambios cuando decide cancelar 
procedure TFModificacionParametros.ACancelarExecute(Sender: TObject);
begin
  inherited;
  if (cambios) then
    if ( MostrarMensaje(tmConsulta, 'Desea deshacer los cambios?') = mrYes) then
      begin
        IBQParametrosParaGuardar.CancelUpdates;
        cambios := false;
      end;
  ActualizarBDLimpiarComponentes;
  FPrincipal.EstablecimientoActual := FPrincipal.EstablecimientoActual;
  close;
end;

// registros los cambios en la base de datos
procedure TFModificacionParametros.AAplicarExecute(Sender: TObject);
begin
  inherited;
  if (cambios) then
  begin
      FPrincipal.IBDPrincipal.ApplyUpdates([IBQParametrosParaGuardar]);
      //FPrincipal.EstablecimientoActual := FPrincipal.EstablecimientoActual;
     // cambios := false;
  end;
end;

// metodo que recorre los parametros en la base de datos y genera los componentes en el formulario
procedure TFModificacionParametros.mostrarParametros;
var id : integer;
begin
  PComponentesDinamicos.Visible := false;
  MDescripcionesDeParametros.Visible := false;
  MDescripcionesDeParametros.Lines.Clear;
  IBQParametros.First;
  MDescripcionesDeParametros.PlainText := false;
  while not(IBQParametros.Eof) do
    begin
      id := IBQParametros.fieldbyname('id_parametro').AsInteger;
      IBQParametrosParaGuardar.Locate('establecimiento;parametro',VarArrayOf([Fprincipal.EstablecimientoActual,id]), [] );
      GenerarLabel(IBQParametros.FieldByName('nombre').AsString);
      if (IBQParametros.FieldByName('editable').AsString = 'S') then

        begin
          if (IBQParametros.FieldByName('tipo_valor').AsString = 'R') then
            GenerarEdit(IBQParametrosParaGuardar.FieldByName('valor').AsString, IBQParametros.FieldByName('id_parametro').AsString);
          if (IBQParametros.FieldByName('tipo_valor').AsString = 'D') then
              GenerarDateTimePicker(IBQParametrosParaGuardar.FieldByName('valor').AsString, IBQParametros.FieldByName('id_parametro').AsString);
          if (IBQParametros.FieldByName('tipo_valor').AsString = 'C') then
              GenerarCheckBox(IBQParametrosParaGuardar.FieldByName('valor').AsString, IBQParametros.FieldByName('id_parametro').AsString);
          if (IBQParametros.FieldByName('tipo_valor').AsString = 'E') then
              GenerarCombo(IBQParametrosParaGuardar.FieldByName('valor').AsString, IBQParametros.FieldByName('id_parametro').AsString, IBQParametros.FieldByName('valores_posibles').AsString);
        end

      else
        GenerarLabelValor(IBQParametrosParaGuardar.FieldByName('valor').AsString);

      GenerarLabelUnidad(IBQParametros.FieldByName('unidad').AsString);

      MDescripcionesDeParametros.Lines.Add('                             ');
      MDescripcionesDeParametros.SelAttributes.Style := [fsbold];
      MDescripcionesDeParametros.Lines.Add(IBQParametros.FieldByName('nombre').AsString);
      MDescripcionesDeParametros.SelStart := 0;
      MDescripcionesDeParametros.SelLength := Length(IBQParametros.FieldByName('nombre').AsString);

      MDescripcionesDeParametros.SelAttributes.Style := [];
      MDescripcionesDeParametros.Lines.Add('     '+IBQParametros.FieldByName('descripcion').AsString+'. '+recuperarValores(IBQParametros.FieldByName('tipo_valor').AsString, IBQParametros.FieldByName('valores_posibles').AsString));
      MDescripcionesDeParametros.Lines.Add('  ');

      IBQParametros.Next;
    end;
  // ACA DEBERIA IR EL CODIGO PARA VOLVER AL PRINCIPIO EL CURSOR LUEGO DE MOSTRAR TODAS LAS DESCRIPCIONES
  MDescripcionesDeParametros.SelLength := 0;
  MDescripcionesDeParametros.SelStart := 0;
  MDescripcionesDeParametros.Perform( EM_SCROLLCARET, 0, 0 );
  PComponentesDinamicos.Visible := true;
  PComponentesDinamicos.Update;
  PComponentesDinamicos.Repaint;
  MDescripcionesDeParametros.Visible := true;
end;
// genero un combo cuando las opciones son finitas
procedure TFModificacionParametros.GenerarCombo(dato, nombre, valores: string);
var componenteCombo : TComboBox;
    item : string;
    indice : integer;
    aux : integer;
    Comp : TComponent;
begin
  posX := posX + 200;
  componenteCombo := TComboBox.Create(GBParametros);
  with componenteCombo do
  begin
    Name := 'P'+nombre;
    Left := posx;
    top := posy - 3;
    Visible := true;
    Font := PComponentesDinamicos.Font;
    Parent := PComponentesDinamicos;
    Width := 120;
    OnExit := ComboChange;
    OnKeyPress := ComboKeyPress;
    OnChange := ComboChange;
    OnCloseUp := ComboCloseUp;
  end;
  indice := 1;
  item := '';
  while (indice <= Length(valores)) do
    begin
      if ((valores[indice] <> ';') and (valores[indice] <> ' ')) then
        item := item + valores[indice];
      if (valores[indice] = ';') then
        begin
          if ((nombre='3') and (item='10')) then       //para la condicion corporal
          begin
            aux := StrToInt(item);
            aux := aux-1;
            item := IntToStr(aux);
          end;
          componenteCombo.Items.Add(item);
          item := '';
        end;
      inc(indice);
    end;

  if nombre = '41' then //Grupo de CACUCO
    datoGrupoCACUCO := dato;
  if ((nombre = '49') and (datoGrupoCACUCO = '3')) then
    componenteCombo.Enabled := false;

  if ((nombre='3') and (dato='10')) then
  begin
    aux := StrToInt(dato);
    aux := aux-1;
    dato := IntToStr(aux);
  end;

  componenteCombo.Text := dato;

  listaEtiquetas.Add(componenteCombo);
end;

procedure TFModificacionParametros.ComboCloseUp(Sender : TObject);
begin
  if (Sender as TComboBox).Name = 'P41' then
  begin
    datoGrupoCACUCO := (Sender as TComboBox).Text;
    Habilitar('P49');
  end;
  cambios := true;
end;

procedure TFModificacionParametros.Habilitar(Nombre : String);
var
  i : integer;
begin
  for i := 0 to listaEtiquetas.Count-1 do
    if listaEtiquetas.Items[i] is TComboBox then
      if (listaEtiquetas.Items[i] as TComboBox).Name = Nombre then
        (listaEtiquetas.Items[i] as TComboBox).Enabled := datoGrupoCACUCO = '2';
end;

// evento generico que lo pego a todos los combos
procedure TFModificacionParametros.ComboChange(Sender: TObject);
var id : integer;
    valor : string;
begin
  inherited;
  id := StrToInt(stringReplace(TComboBox(Sender).Name, 'P', '', [rfIgnoreCase]));
  IBQParametrosParaGuardar.Locate('establecimiento;parametro',VarArrayOf([Fprincipal.EstablecimientoActual,id]), [] );
  IBQParametrosParaGuardar.Edit;
  valor := TComboBox(Sender).Text;
  if (id = 3) then   //para la condicion corporal
    if (valor = '9') then valor := '10';
  if (id = 41) then
    datoGrupoCACUCO := valor;

  IBQParametrosParaGuardar.FieldByName('valor').AsVariant := valor;
  IBQParametrosParaGuardar.Post;
  cambios := true;
end;

// evento generico que le pego a todos los combos
procedure TFModificacionParametros.ComboKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

function TFModificacionParametros.recuperarValores(tipo, valores: string): string;
var valor1 : string;
    valor2 : string;
    item : string;
    indice : integer;
    punto_coma : integer;
    paso : boolean;
begin
  valor1 := '';
  valor2 := '';
  if (tipo = 'E') then
    begin
      result := 'Los valores para estos parámetros son: ';
      indice := 1;
      item := '';
      paso := true;
      while (indice <= Length(valores)) do
        begin
          if ((valores[indice] <> ';') and (valores[indice] <> ' ')) then
            item := item + valores[indice];
          if (valores[indice] = ';') then
            begin
              paso := true;
              Result := result + item;
              item := '';
            end;
          inc(indice);
          if (paso)and(indice<Length(valores)) then
            begin
              Result := result +' o ';
              paso := false;
            end;
        end;
    end
  else
    begin
      result := 'Este parámetro se debe encontrar entre estos valores: ';
      indice := 1;
      punto_coma := Pos(':',valores);
      while (indice < punto_coma) do
        begin
          valor1 := valor1 + valores[indice];
          inc(indice);
        end;
      inc(indice);
      while (indice <= Length(valores)) do
        begin
          valor2 := valor2 + valores[indice];
          inc(indice);
        end;

      Result := result + valor1+ ' y '+valor2;
    end;
  result := result +'.';  
end;

procedure TFModificacionParametros.CheckBoxClick(Sender: TObject);
var
  id : Integer;
  Comp : TComponent;
begin
  id := StrToInt(stringReplace(TComboBox(Sender).Name, 'P', '', [rfIgnoreCase]));
  IBQParametrosParaGuardar.Locate('establecimiento;parametro',VarArrayOf([Fprincipal.EstablecimientoActual,id]), [] );
  IBQParametrosParaGuardar.Edit;
  if (Sender as TCheckBox).Checked then
    IBQParametrosParaGuardar.FieldByName('valor').AsString := 'S'
  else
    IBQParametrosParaGuardar.FieldByName('valor').AsString := 'N';
  IBQParametrosParaGuardar.Post;
  if (id = 54) then
  begin
    Comp := GBParametros.FindComponent('P'+IntToStr(58));
    if Comp <> nil then
      (Comp as TComboBox).Enabled := (Sender as TCheckBox).Checked;
  end;
  cambios := true;
end;

end.
