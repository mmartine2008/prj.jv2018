unit UEveRecursoForrajero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DBCtrls, UDBLookupComboBoxAuto, ComCtrls,
  DateTimePickerAuto, StdCtrls, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ExtCtrls, Grids, DBGrids, UBDBGrid, MemoAuto, UFrameMangazo,
  Buttons, DataExport, DataToXLS, WinXP, EditAuto, JvExExtCtrls,
  JvExtComponent, JvRollOut, ImgList, PngImageList, JvExControls, JvLabel,
  PngImage, JvImage, jpeg, JvGIF, JvComponentBase, JvBalloonHint, xmldom,
  XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveRecursoForrajero = class(TFEveSimple)
    IBQRecursoF: TIBQuery;
    DSRecursoF: TDataSource;
    JvDatosPotrero: TJvRollOut;
    GBDatosComunes: TGroupBox;
    Label1: TLabel;
    DBLCBAPotrero: TDBLookupComboBoxAuto;
    JVEventos: TJvRollOut;
    GBEventos: TGroupBox;
    LFecha: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    LResponsable: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    Label2: TLabel;
    DBLCBARecursoF: TDBLookupComboBoxAuto;
    JVFichaPotrero: TJvRollOut;
    GBFichaPotrero: TGroupBox;
    CBModificacionSuperficie: TCheckBox;
    EASuperficie: TEditAuto;
    Lha: TLabel;
    CBCambioRecursoForrajero: TCheckBox;
    CBAsignacionHectareas: TCheckBox;
    EACantidadha: TEditAuto;
    Lha2: TLabel;
    CBAsignacionPotrero: TComboBox;
    LCantidadha: TLabel;
    CBTratamientosPotreros: TCheckBox;
    DBLCBATratamientosPotreros: TDBLookupComboBoxAuto;
    IBQPotrerosTratamientos: TIBQuery;
    DSPotrerosTratamientos: TDataSource;
    CBMedicionMateriaSeca: TCheckBox;
    EAMateriaSeca: TEditAuto;
    LKgMsHa: TLabel;
    CBAnalisisSuelo: TCheckBox;
    MAnalisisSuelos: TMemo;
    CBProdReservasForrajeras: TCheckBox;
    DBLCBAReservasForrajeras: TDBLookupComboBoxAuto;
    IBQCodReservasForrajeras: TIBQuery;
    DSCodReservasForrajeras: TDataSource;
    LSupTotal: TLabel;
    LSupGanadera: TLabel;
    LSupAgricola: TLabel;
    LRecursoForrajeroActual: TLabel;
    LValorSupTotal: TLabel;
    LValorSupGanadera: TLabel;
    LValorSupAgricola: TLabel;
    LValorRecursoForrajeroActual: TLabel;
    LTerneros: TLabel;
    LTerneras: TLabel;
    LVaquillonas: TLabel;
    LVacas: TLabel;
    LNovillos: TLabel;
    LToros: TLabel;
    LCantTerneros: TLabel;
    LCantTerneras: TLabel;
    LCantVaquillonas: TLabel;
    LCantVacas: TLabel;
    LCantNovillos: TLabel;
    LCantToros: TLabel;
    LCabTerneros: TLabel;
    LCabTerneras: TLabel;
    LCabVaquillonas: TLabel;
    LCabVacas: TLabel;
    LCabNovillos: TLabel;
    LCabToros: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label8: TLabel;
    Label9: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    IBQStockPotrero: TIBQuery;
    DSStockPotrero: TDataSource;
    BDBGAnimales: TBitDBGrid;
    DSRepFichaPotrero: TDataSource;
    IBQRepFichaPotrero: TIBQuery;
    EACantidadReservas: TEditAuto;
    LCantidadReservas: TLabel;
    CBUnidadesReservas: TComboBox;
    Lcabhatotal: TLabel;
    LValorcabhatotal: TLabel;
    IBQEliminarEventoPotrero: TIBQuery;
    IBQEliminarEventoPotreroMJE: TIBStringField;
    AEliminar: TAction;
    LProduccionReservasForrajeras: TLabel;
    LTratamientos: TLabel;
    Label3: TLabel;
    BBImprimirReporte: TBitBtn;
    IPreview: TImage;
    LPreliminar: TLabel;
    JvIEliminar: TJvImage;
    LEliminar: TLabel;
    BEliminar: TBitBtn;
    PParaEliminar: TPanel;
    PExistencia: TPanel;
    DBExistencia: TDBGrid;
    IBQGetStockPotNuevo: TIBQuery;
    DSGetStockPotNuevo: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure IBQRecursoFAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure CBModificacionSuperficieClick(Sender: TObject);
    procedure CBAsignacionHectareasClick(Sender: TObject);
    procedure CBTratamientosPotrerosClick(Sender: TObject);
    procedure CBAnalisisSueloClick(Sender: TObject);
    procedure CBMedicionMateriaSecaClick(Sender: TObject);
    procedure CBCambioRecursoForrajeroClick(Sender: TObject);
    procedure CBProdReservasForrajerasClick(Sender: TObject);
    procedure DBLCBAPotreroCloseUp(Sender: TObject);
    procedure EASuperficieKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EACantidadhaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBAsignacionPotreroKeyPress(Sender: TObject; var Key: Char);
    procedure CBUnidadesReservasKeyPress(Sender: TObject; var Key: Char);
    procedure EASuperficieKeyPress(Sender: TObject; var Key: Char);
    procedure EASuperficieExit(Sender: TObject);
    procedure CBAsignacionPotreroChange(Sender: TObject);
    procedure EACantidadhaChange(Sender: TObject);
    procedure AEliminarExecute(Sender: TObject);
    procedure IBQRepFichaPotreroAfterOpen(DataSet: TDataSet);
    procedure LProduccionReservasForrajerasClick(Sender: TObject);
    procedure LProduccionReservasForrajerasMouseEnter(Sender: TObject);
    procedure LProduccionReservasForrajerasMouseLeave(Sender: TObject);
    procedure LTratamientosClick(Sender: TObject);
    procedure LTratamientosMouseEnter(Sender: TObject);
    procedure LTratamientosMouseLeave(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure EASuperficieChange(Sender: TObject);
  private
    { Private declarations }
    hectareasGanaderia, hectareasAgricultura: Double;
    function SeleccionoCheckBox():boolean;
    function PuedeTerminar():Boolean;
    procedure CargarStockPotrero();
    procedure CargarFichaPotrero();
    procedure ActualizarHectareasGanAgric();
  protected
    Procedure CargarParametrosSP;override;
    procedure completarCampos;override;

  public
    { Public declarations }
  end;

var
  FEveRecursoForrajero: TFEveRecursoForrajero;

implementation

{$R *.dfm}

uses UDMSoftvet, UPrincipal, UABMEmpleados, UABMPotreros, UABMSimple,
     UABMRecursosForrajeros, UMensajeHuella, UABMReservasForrajeras,
     UABMPotrerosTratamientos, UEveUniversal, UREPFichaPotreroPreview, UTraduccion;

{ TFEveRecursoForrajero }

procedure TFEveRecursoForrajero.CargarParametrosSP;
begin
  inherited;

 IBQSPEventoInd.ParamByName('FECHA').AsDate  := DTPAFecha.Date;
 IBQSPEventoInd.ParamByName('OBSERVACION').AsString  := MAObservacion.Text;
 IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
 IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger  := DBLCBAResponsable.KeyValue;
 IBQSPEventoInd.ParamByName('POTRERO').AsInteger  := DBLCBAPotrero.KeyValue;



 if (CBModificacionSuperficie.Checked) then
   begin
    IBQSPEventoInd.ParamByName('SUPERFICIETOTAL').AsFloat  := StrToFloat(EASuperficie.Text);
    IBQSPEventoInd.ParamByName('SUPERFICIEGANADERA').AsFloat  := hectareasGanaderia;
    IBQSPEventoInd.ParamByName('SUPERFICIEAGRICOLA').AsFloat  := hectareasAgricultura;
   end
  else
    begin
     IBQSPEventoInd.ParamByName('SUPERFICIETOTAL').Value  := null;
     IBQSPEventoInd.ParamByName('SUPERFICIEGANADERA').Value  := null;
     IBQSPEventoInd.ParamByName('SUPERFICIEAGRICOLA').Value  := null;
    end;

 if (CBCambioRecursoForrajero.Checked) then
    IBQSPEventoInd.ParamByName('RECURSO').AsInteger  := DBLCBARecursoF.KeyValue
   else
     IBQSPEventoInd.ParamByName('RECURSO').Value  := null;

 if (CBTratamientosPotreros.Checked) then
   IBQSPEventoInd.ParamByName('TRATAMIENTO').AsInteger  := DBLCBATratamientosPotreros.KeyValue
  else
    IBQSPEventoInd.ParamByName('TRATAMIENTO').Value  := null;

 if (CBMedicionMateriaSeca.Checked) then
   IBQSPEventoInd.ParamByName('MATERIASECA').AsFloat  := StrToFloat(EAMateriaSeca.Text)
  else
    IBQSPEventoInd.ParamByName('MATERIASECA').Value  := null;

 if (CBAnalisisSuelo.Checked) then
   IBQSPEventoInd.ParamByName('OBSERVACIOANALISISSUELO').AsString  := MAnalisisSuelos.Text
  else
    IBQSPEventoInd.ParamByName('OBSERVACIOANALISISSUELO').Value  := null;

 if (CBProdReservasForrajeras.Checked) then
   begin
    IBQSPEventoInd.ParamByName('RESERVAFORRAJERAS').AsInteger  := DBLCBAReservasForrajeras.KeyValue;
    IBQSPEventoInd.ParamByName('CANTIDADRESERVA').AsFloat:= StrToFloat(EACantidadReservas.Text);
    IBQSPEventoInd.ParamByName('UNIDADRESERVA').AsString:= CBUnidadesReservas.Text;
   end
  else
    begin
     IBQSPEventoInd.ParamByName('RESERVAFORRAJERAS').Value:= null;
     IBQSPEventoInd.ParamByName('CANTIDADRESERVA').Value:= null;
     IBQSPEventoInd.ParamByName('UNIDADRESERVA').Value:= null;
    end;

  IBQSPEventoInd.ParamByName('VISIBLE').Value := 1;
end;

procedure TFEveRecursoForrajero.FormCreate(Sender: TObject);
begin
  inherited;
  IBQRecursoF.Close;
  IBQRecursoF.Open;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQPotrero.close;
  DMSoftvet.IBQPotrero.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;
  hectareasGanaderia:= 0;
  hectareasAgricultura:= 0;
  DBLCBAPotrero.KeyValue:= 0;
  DBLCBAPotreroCloseUp(nil);
  AsignarValoresDefecto;
  DTPAFecha.Date:= now();
end;

procedure TFEveRecursoForrajero.IBQRecursoFAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFEveRecursoForrajero.FormShow(Sender: TObject);
begin
  inherited;
  
//  DTPAFecha.MaxDate:= now;

  //CargarFichaPotrero();
  if IdPotreroMapa > 0 then
  begin
    DBLCBAPotrero.KeyValue := IdPotreroMapa;
    DBLCBAPotreroCloseUp(nil);
  end;

  DBLCBAResponsable.KeyValue:= 0;
  ATerminar.Enabled:= false;
end;

procedure TFEveRecursoForrajero.ATerminarExecute(Sender: TObject);
begin
  ClearErrores();
  if (SeleccionoCheckBox) then
    begin
      if (PuedeTerminar) then
        inherited;
    end
   else
     MostrarMensaje(tmError, 'No hay ningún evento seleccionado.');
//
end;

procedure TFEveRecursoForrajero.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
    fecha.Date:=now;
end;

procedure TFEveRecursoForrajero.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);  
end;

procedure TFEveRecursoForrajero.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;  
end;

procedure TFEveRecursoForrajero.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveRecursoForrajero.Label1Click(Sender: TObject);
var
  abm : TFABMPotreros;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm := TFABMPotreros.Create(self);
      abm.Abrir(faAbm);
      DMSoftvet.IBQPotrero.Close;
      DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQPotrero.Open;
    end;
  cambiarCB(DBLCBAPotrero,nroID);
end;

procedure TFEveRecursoForrajero.Label1MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label1.Font.Color:= $00606C02;
      Label1.Font.Style:= [fsBold,fsUnderline];
    end;  
end;

procedure TFEveRecursoForrajero.Label1MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label1.Font.Color:= clWindowText;
      Label1.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveRecursoForrajero.Label2Click(Sender: TObject);
var
  abm : TFABMRecursosForrajeros;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm := TFABMRecursosForrajeros.Create(self);
      abm.Abrir(faAbm);
      IBQRecursoF.Close;
      IBQRecursoF.Open;
      // Si creo uno nuevo lo actualizo
      if nroID <> -1 then
      begin
        CBCambioRecursoForrajero.Checked := true;
        CBCambioRecursoForrajeroClick(nil);
      end;
    end;
  cambiarCB(DBLCBARecursoF,nroID);
end;

procedure TFEveRecursoForrajero.Label2MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label2.Font.Color:= $00606C02;
      Label2.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveRecursoForrajero.Label2MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label2.Font.Color:= clWindowText;
      Label2.Font.Style:= [fsUnderline];
    end
end;

procedure TFEveRecursoForrajero.completarCampos;
begin
inherited;
end;

procedure TFEveRecursoForrajero.CBModificacionSuperficieClick(
  Sender: TObject);
  var
    valor : String;
begin
  inherited;
     if (CBModificacionSuperficie.Checked) then
    begin
    //  valor := LValorSupTotal.Caption;
    //  EASuperficie.Clear;
      EASuperficie.Text := IBQStockPotrero.fieldbyname('SUPERFICIETOTAL').AsString;
      EASuperficie.Enabled:= true;
      EASuperficie.SetFocus;
      Lha.Enabled:= true;
      CBAsignacionHectareas.Checked:= true;
    end
   else
     begin
       EASuperficie.Clear;
       EASuperficie.Enabled:= false;
       Lha.Enabled:= false;
       CBAsignacionHectareas.Checked:= false;
     end;
end;

procedure TFEveRecursoForrajero.CBAsignacionHectareasClick(
  Sender: TObject);
begin
  inherited;
  if (CBAsignacionHectareas.Checked) then
    begin
      CBAsignacionPotrero.Enabled:= true;
      CBAsignacionPotrero.Color:= $00DFFEFF;
      LCantidadha.Enabled:= true;
      EACantidadha.Enabled:= true;
      Lha2.Enabled:= true;
      CBModificacionSuperficie.Checked:= true;
      EACantidadha.EsRequerido:= true;
      if (Length(Trim(EACantidadha.Text)) = 0) then
        ATerminar.Enabled:= false;
    end
   else
     begin
      CBAsignacionPotrero.Enabled:= false;
      CBAsignacionPotrero.Color:= clWhite;           
      LCantidadha.Enabled:= false;
      EACantidadha.Enabled:= false;
      Lha2.Enabled:= false;
      CBModificacionSuperficie.Checked:= false;
      EACantidadha.EsRequerido:= false;
      EACantidadha.Clear;          
     end;
end;

procedure TFEveRecursoForrajero.CBTratamientosPotrerosClick(
  Sender: TObject);
begin
  inherited;
  if (CBTratamientosPotreros.Checked) then
    begin
      DBLCBATratamientosPotreros.Enabled:= true;
      DBLCBATratamientosPotreros.EsRequerido:= true;
      DBLCBATratamientosPotreros.KeyValue:= 0;
    end
   else
     begin
       DBLCBATratamientosPotreros.Enabled:= false;
       DBLCBATratamientosPotreros.EsRequerido:= false;
       DBLCBATratamientosPotreros.KeyValue:= -1;       
     end;
end;

procedure TFEveRecursoForrajero.CBAnalisisSueloClick(Sender: TObject);
begin
  inherited;
  if (CBAnalisisSuelo.Checked) then
    begin
      MAnalisisSuelos.Enabled:= true;
    end
   else
     begin
       MAnalisisSuelos.Enabled:= false;
     end;
end;

procedure TFEveRecursoForrajero.CBMedicionMateriaSecaClick(
  Sender: TObject);
begin
  inherited;
  if (CBMedicionMateriaSeca.Checked) then
    begin
      EAMateriaSeca.Clear;
      EAMateriaSeca.Enabled:= true;
      EAMateriaSeca.SetFocus;      
      LKgMsHa.Enabled:= true;
    end
   else
     begin
      EAMateriaSeca.Clear;
      EAMateriaSeca.Enabled:= false;
      LKgMsHa.Enabled:= false;
     end;
end;

procedure TFEveRecursoForrajero.CBCambioRecursoForrajeroClick(
  Sender: TObject);
begin
  inherited;
  if (CBCambioRecursoForrajero.Checked) then
    begin
      DBLCBARecursoF.Enabled:= true;
      DBLCBARecursoF.EsRequerido:= true;
      DBLCBARecursoF.KeyValue:= 0;
    end
   else
      begin
       DBLCBARecursoF.Enabled:= false;
       DBLCBARecursoF.EsRequerido:= false;
       DBLCBARecursoF.KeyValue:= -1;       
      end;
end;

procedure TFEveRecursoForrajero.CBProdReservasForrajerasClick(
  Sender: TObject);
begin
  inherited;
  if (CBProdReservasForrajeras.Checked) then
    begin
      DBLCBAReservasForrajeras.Enabled:= true;
      DBLCBAReservasForrajeras.EsRequerido:= true;
      LCantidadReservas.Enabled:= true;
      EACantidadReservas.Enabled:= true;
      CBUnidadesReservas.Enabled:= true;
      DBLCBAReservasForrajeras.KeyValue:= 0;
    end
   else
     begin
       DBLCBAReservasForrajeras.Enabled:= false;
       DBLCBAReservasForrajeras.EsRequerido:= false;
       LCantidadReservas.Enabled:= false;
       EACantidadReservas.Enabled:= false;
       CBUnidadesReservas.Enabled:= false;
       DBLCBAReservasForrajeras.KeyValue:= -1;
     end;
end;

function TFEveRecursoForrajero.SeleccionoCheckBox: boolean;
var ind: Integer;
begin
    result:= false;
    for ind := 0 to ComponentCount -1 do
      if (Components[ind] is TCheckBox) then
        if (TCheckBox(Components[ind]).Checked) then
          result:= true;
end;

procedure TFEveRecursoForrajero.CargarStockPotrero;
var
  TotalAnimales : Integer;
begin
  IBQStockPotrero.Close;
  IBQStockPotrero.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  IBQStockPotrero.ParamByName('POTRERO').AsInteger  := DBLCBAPotrero.KeyValue;
  IBQStockPotrero.Open;

  TotalAnimales := 0;

  IBQGetStockPotNuevo.Close;
  IBQGetStockPotNuevo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGetStockPotNuevo.ParamByName('pot').AsInteger := DBLCBAPotrero.KeyValue;
  IBQGetStockPotNuevo.Open;

  IBQGetStockPotNuevo.First;
  while not IBQGetStockPotNuevo.Eof do
  begin
    if IBQGetStockPotNuevo.FieldValues['CANTANIMALES_1'] <> null then
      TotalAnimales := TotalAnimales + IBQGetStockPotNuevo.FieldValues['CANTANIMALES_1'];
    if IBQGetStockPotNuevo.FieldValues['CANTANIMALES_2'] <> null then
      TotalAnimales := TotalAnimales + IBQGetStockPotNuevo.FieldValues['CANTANIMALES_2'];
    IBQGetStockPotNuevo.Next;
  end;
  IBQGetStockPotNuevo.First;

  LValorSupTotal.Caption:= IBQStockPotrero.fieldbyname('SUPERFICIETOTAL').AsString;
  LValorSupGanadera.Caption:= IBQStockPotrero.fieldbyname('SUPERFICIEGANADERA').AsString;
  LValorSupAgricola.Caption:= IBQStockPotrero.fieldbyname('SUPERFICIEAGRICOLA').AsString;
  LValorRecursoForrajeroActual.Caption:= IBQStockPotrero.fieldbyname('RECURSOFORRAJERO').AsString;

  if (IBQStockPotrero.fieldbyname('SUPERFICIEGANADERA').AsFloat <> 0) then
    LValorcabhatotal.Caption:= FormatFloat('0.00',(TotalAnimales / IBQStockPotrero.fieldbyname('SUPERFICIEGANADERA').AsFloat));

end;

procedure TFEveRecursoForrajero.DBLCBAPotreroCloseUp(Sender: TObject);
begin
  inherited;
  CargarStockPotrero();
  CargarFichaPotrero();  
end;

procedure TFEveRecursoForrajero.CargarFichaPotrero;
begin
  IBQRepFichaPotrero.Close;
  IBQRepFichaPotrero.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRepFichaPotrero.ParamByName('POTRERO').AsInteger  := DBLCBAPotrero.KeyValue;
  IBQRepFichaPotrero.Open;  
end;

procedure TFEveRecursoForrajero.EASuperficieKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  //if ((trim(EACantidadha.Text) = '') or (trim(EACantidadha.Text) = '0')) then
  EACantidadha.Text:= EASuperficie.Text; 
end;

procedure TFEveRecursoForrajero.EACantidadhaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  ActualizarHectareasGanAgric();
end;

procedure TFEveRecursoForrajero.CBAsignacionPotreroKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  key:= #0;
end;

procedure TFEveRecursoForrajero.CBUnidadesReservasKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key:= #0;
end;

procedure TFEveRecursoForrajero.EASuperficieKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 // if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 7)) and (key <> #8)) then key:=#0;
end;

procedure TFEveRecursoForrajero.EASuperficieExit(Sender: TObject);
var valor, val_1, val_2 : double;
    separador : Char;
begin
  inherited;
  Separador := SysUtils.DecimalSeparator;
  if not TryStrToFloat(Trim((Sender as TEditAuto).Text),valor) then
  begin
    if (Trim((Sender as TEditAuto).Text)<> '') then
    begin
      MostrarMensaje(tmError,'El número no es válido. Los decimales se deben separar con coma('''+separador+''')');
      (Sender as TEditAuto).SetFocus;
    end;
  end
  else
  begin
    if (((Sender as TEditAuto).Name = 'EACantidadha') or ((Sender as TEditAuto).Name = 'EASuperficie')) then
    begin
      val_1 := 0;
      val_2 := 0;
      TryStrToFloat(EACantidadha.Text,val_1);
      TryStrToFloat(EASuperficie.Text,val_2);
      if (val_1>val_2) then
      begin
        MostrarMensaje(tmError,'La cantidad de hectareas asignadadas no debe superar a la superficie total.');
        (Sender as TEditAuto).SetFocus;
      end;
    end;
  end;
end;

procedure TFEveRecursoForrajero.CBAsignacionPotreroChange(Sender: TObject);
begin
  inherited;
  ActualizarHectareasGanAgric();
end;

procedure TFEveRecursoForrajero.EACantidadhaChange(Sender: TObject);
begin
  inherited;
  ActualizarHectareasGanAgric();
end;

procedure TFEveRecursoForrajero.ActualizarHectareasGanAgric;
var
  val_d : Double;
begin
  hectareasGanaderia := 0;
  hectareasAgricultura := 0;
  if (trim(EACantidadha.Text) <> '') then
    if (CBAsignacionPotrero.ItemIndex = 0) then //ganadería
    begin
      if TryStrToFloat(EACantidadha.Text,val_d) then
        hectareasGanaderia := val_d;
      if TryStrToFloat(EASuperficie.Text,val_d) then
        hectareasAgricultura := abs(val_d - hectareasGanaderia);
    end
    else
      if (CBAsignacionPotrero.ItemIndex = 1) then //agricultura
      begin
        if TryStrToFloat(EACantidadha.Text,val_d) then
          hectareasAgricultura := val_d;
        if TryStrToFloat(EASuperficie.Text,val_d) then
          hectareasGanaderia := abs(val_d - hectareasAgricultura);
      end;
end;

procedure TFEveRecursoForrajero.AEliminarExecute(Sender: TObject);
begin
  inherited;
  If (MostrarMensaje(tmConsulta, 'Está seguro que desea eliminar el evento del potrero?.') = mrYes) then
    begin
      IBQEliminarEventoPotrero.Close;
      IBQEliminarEventoPotrero.ParamByName('IdEventoPotrero').AsInteger := IBQRepFichaPotrero.fieldbyname('ID_EVENTO_POTRERO').AsInteger;
      IBQEliminarEventoPotrero.ParamByName('TIPO').AsInteger := IBQRepFichaPotrero.fieldbyname('TIPO_EVENTO_POTRERO').AsInteger;
      IBQEliminarEventoPotrero.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
      IBQEliminarEventoPotrero.ParamByName('RECURSO').AsInteger := IBQRepFichaPotrero.fieldbyname('ID_EVENTO_POTRERO').AsInteger;
      IBQEliminarEventoPotrero.ParamByName('POTRERO').AsInteger := DBLCBAPotrero.KeyValue;
      IBQEliminarEventoPotrero.ParamByName('FECHA').AsDate := IBQRepFichaPotrero.fieldbyname('FECHA').AsDateTime;
      IBQEliminarEventoPotrero.Open;

      IBQRepFichaPotrero.Close;
      IBQRepFichaPotrero.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    end;
end;

procedure TFEveRecursoForrajero.IBQRepFichaPotreroAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  //AEliminar.Enabled:= not(IBQRepFichaPotrero.IsEmpty);
  JvIEliminar.Enabled := not(IBQRepFichaPotrero.IsEmpty);
  LEliminar.Enabled := not(IBQRepFichaPotrero.IsEmpty);
end;

procedure TFEveRecursoForrajero.LProduccionReservasForrajerasClick(
  Sender: TObject);
var
  abm : TFABMReservasForrajeras;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm := TFABMReservasForrajeras.Create(self);
      abm.Abrir(faAbm);
      IBQCodReservasForrajeras.Close;
      IBQCodReservasForrajeras.Open;

      // Si creo uno nuevo lo actualizo
      if nroID <> -1 then
      begin
        CBProdReservasForrajeras.Checked := true;
        CBProdReservasForrajerasClick(nil);
      end;

    end;
  cambiarCB(DBLCBAReservasForrajeras,nroID);
end;



procedure TFEveRecursoForrajero.LProduccionReservasForrajerasMouseEnter(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LProduccionReservasForrajeras.Font.Color:= $00606C02;
      LProduccionReservasForrajeras.Font.Style:= [fsBold,fsUnderline];
    end;
end;



procedure TFEveRecursoForrajero.LProduccionReservasForrajerasMouseLeave(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LProduccionReservasForrajeras.Font.Color:= clWindowText;
      LProduccionReservasForrajeras.Font.Style:= [fsUnderline];
    end
end;

procedure TFEveRecursoForrajero.LTratamientosClick(Sender: TObject);
var
  abm : TFABMPotrerosTratamientos;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm := TFABMPotrerosTratamientos.Create(self);
      abm.Abrir(faAbm);
      IBQPotrerosTratamientos.Close;
      IBQPotrerosTratamientos.Open;

      // Si creo uno nuevo lo actualizo
      if nroID <> -1 then
      begin
        CBTratamientosPotreros.Checked := true;
        CBTratamientosPotrerosClick(nil);
      end;
            
    end;
  cambiarCB(DBLCBATratamientosPotreros,nroID);
end;

procedure TFEveRecursoForrajero.LTratamientosMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LTratamientos.Font.Color:= $00606C02;
      LTratamientos.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveRecursoForrajero.LTratamientosMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LTratamientos.Font.Color:= clWindowText;
      LTratamientos.Font.Style:= [fsUnderline];
    end
end;

function TFEveRecursoForrajero.PuedeTerminar: Boolean;
begin
  result:= true;
  if (CBModificacionSuperficie.Checked) then
    begin
     if (trim(EASuperficie.Text) = '') then
      begin
         mostrar:= true;
         inc(CantidadErrores);
         GetErrors();
         MAErrors.Lines.Add(Traducir('Si la modificación de superficie se encuentra seleccionada no puede quedar vacía.'));
         result:= false;
      end;

     if (trim(EACantidadha.Text) = '') then
      begin
         mostrar:= true;
         inc(CantidadErrores);
         GetErrors();
         MAErrors.Lines.Add(Traducir('Si la asignación del potrero se encuentra seleccionada la cantidad de hectareas no puede quedar vacía.'));
         result:= false;
      end;
    end;

  if (CBMedicionMateriaSeca.Checked) then
    begin
     if (trim(EAMateriaSeca.Text) = '') then
      begin
         mostrar:= true;
         inc(CantidadErrores);
         GetErrors();
         MAErrors.Lines.Add(Traducir('Si la medición de materia seca se encuentra seleccionada no puede quedar vacía.'));
         result:= false;
      end;
    end;

  if (CBAnalisisSuelo.Checked) then
    begin
     if (trim(MAnalisisSuelos.Text) = '') then
      begin
         mostrar:= true;
         inc(CantidadErrores);
         GetErrors();
         MAErrors.Lines.Add(Traducir('Si el análisis de suelo se encuentra seleccionada no puede quedar vacía.'));
         result:= false;
      end;
    end;

  if (CBProdReservasForrajeras.Checked) then
    begin
     if (trim(EACantidadReservas.Text) = '') then
      begin
         mostrar:= true;
         inc(CantidadErrores);
         GetErrors();
         MAErrors.Lines.Add('Si la producción de reservas forrajeras se encuentra seleccionada la cantidad no puede quedar vacía.');
         result:= false;
      end;
    end;

  if (CantidadErrores > 0) then
      MostrarMensaje(tmError, 'Se produjeron errores en la operación, compruebe los valores e intente nuevamente')
end;

procedure TFEveRecursoForrajero.BBImprimirReporteClick(Sender: TObject);
var
  F : TFREPFichaPotreroPreview;
  Cant : Integer;
begin
  inherited;
  F := TFREPFichaPotreroPreview.Create(nil);
  Cant := 0;
  IBQGetStockPotNuevo.First;
  while not IBQGetStockPotNuevo.Eof do
  begin
    case Cant of
      0 : begin
            if IBQGetStockPotNuevo.FieldValues['CAT_ANIM_1'] <> null then
            begin
              F.QRLCat1A.Enabled := true;
              F.CabCat1A.Enabled := true;
              F.CantCat1A.Enabled := true;
              F.QRLCat1A.Caption := IBQGetStockPotNuevo.FieldValues['CAT_ANIM_1'];
              F.CabCat1A.Caption := FormatFloat('#0.##',IBQGetStockPotNuevo.FieldValues['CABANIMALES_1']);
              F.CantCat1A.Caption := IntToStr(IBQGetStockPotNuevo.FieldValues['CANTANIMALES_1']);
            end;
            if IBQGetStockPotNuevo.FieldValues['CAT_ANIM_2'] <> null then
            begin
              F.QRLCat1B.Enabled := true;
              F.CabCat1B.Enabled := true;
              F.CantCat1B.Enabled := true;
              F.QRLCat1B.Caption := IBQGetStockPotNuevo.FieldValues['CAT_ANIM_2'];
              F.CabCat1B.Caption := FormatFloat('#0.##',IBQGetStockPotNuevo.FieldValues['CABANIMALES_2']);
              F.CantCat1B.Caption := IntToStr(IBQGetStockPotNuevo.FieldValues['CANTANIMALES_2']);
            end;
          end;
      1 : begin
            if IBQGetStockPotNuevo.FieldValues['CAT_ANIM_1'] <> null then
            begin
              F.QRLCat2A.Enabled := true;
              F.CabCat2A.Enabled := true;
              F.CantCat2A.Enabled := true;
              F.QRLCat2A.Caption := IBQGetStockPotNuevo.FieldValues['CAT_ANIM_1'];
              F.CabCat2A.Caption := FormatFloat('#0.##',IBQGetStockPotNuevo.FieldValues['CABANIMALES_1']);
              F.CantCat2A.Caption := IntToStr(IBQGetStockPotNuevo.FieldValues['CANTANIMALES_1']);
            end;
            if IBQGetStockPotNuevo.FieldValues['CAT_ANIM_2'] <> null then
            begin
              F.QRLCat2B.Enabled := true;
              F.CabCat2B.Enabled := true;
              F.CantCat2B.Enabled := true;
              F.QRLCat2B.Caption := IBQGetStockPotNuevo.FieldValues['CAT_ANIM_2'];
              F.CabCat2B.Caption := FormatFloat('#0.##',IBQGetStockPotNuevo.FieldValues['CABANIMALES_2']);
              F.CantCat2B.Caption := IntToStr(IBQGetStockPotNuevo.FieldValues['CANTANIMALES_2']);
            end;
          end;
      2 : begin
            if IBQGetStockPotNuevo.FieldValues['CAT_ANIM_1'] <> null then
            begin
              F.QRLCat3A.Enabled := true;
              F.CabCat3A.Enabled := true;
              F.CantCat3A.Enabled := true;
              F.QRLCat3A.Caption := IBQGetStockPotNuevo.FieldValues['CAT_ANIM_1'];
              F.CabCat3A.Caption := FormatFloat('#0.##',IBQGetStockPotNuevo.FieldValues['CABANIMALES_1']);
              F.CantCat3A.Caption := IntToStr(IBQGetStockPotNuevo.FieldValues['CANTANIMALES_1']);
            end;
            if IBQGetStockPotNuevo.FieldValues['CAT_ANIM_2'] <> null then
            begin
              F.QRLCat3B.Enabled := true;
              F.CabCat3B.Enabled := true;
              F.CantCat3B.Enabled := true;
              F.QRLCat3B.Caption := IBQGetStockPotNuevo.FieldValues['CAT_ANIM_2'];
              F.CabCat3B.Caption := FormatFloat('#0.##',IBQGetStockPotNuevo.FieldValues['CABANIMALES_2']);
              F.CantCat3B.Caption := IntToStr(IBQGetStockPotNuevo.FieldValues['CANTANIMALES_2']);
            end;
          end;
      3 : begin
            if IBQGetStockPotNuevo.FieldValues['CAT_ANIM_1'] <> null then
            begin
              F.QRLCat4A.Enabled := true;
              F.CabCat4A.Enabled := true;
              F.CantCat4A.Enabled := true;
              F.QRLCat4A.Caption := IBQGetStockPotNuevo.FieldValues['CAT_ANIM_1'];
              F.CabCat4A.Caption := FormatFloat('#0.##',IBQGetStockPotNuevo.FieldValues['CABANIMALES_1']);
              F.CantCat4A.Caption := IntToStr(IBQGetStockPotNuevo.FieldValues['CANTANIMALES_1']);
            end;
            if IBQGetStockPotNuevo.FieldValues['CAT_ANIM_2'] <> null then
            begin
              F.QRLCat4B.Enabled := true;
              F.CabCat4B.Enabled := true;
              F.CantCat4B.Enabled := true;
              F.QRLCat4B.Caption := IBQGetStockPotNuevo.FieldValues['CAT_ANIM_2'];
              F.CabCat4B.Caption := FormatFloat('#0.##',IBQGetStockPotNuevo.FieldValues['CABANIMALES_2']);
              F.CantCat4B.Caption := IntToStr(IBQGetStockPotNuevo.FieldValues['CANTANIMALES_2']);
            end;
          end;
    end;
    Inc(Cant);
    IBQGetStockPotNuevo.Next;
  end;

  F.QRLPotrero.Caption := DBLCBAPotrero.Text;
  F.QRLSupTotal.Caption := LValorSupTotal.Caption;
  F.QRLSupGana.Caption := LValorSupGanadera.Caption;
  F.QRLSupAgric.Caption := LValorSupAgricola.Caption;
  F.QRLRecFor.Caption := LValorRecursoForrajeroActual.Caption;
  F.QRLCabsTotal.Caption := LValorcabhatotal.Caption;
  {F.CantNov.Caption := LCantNovillos.Caption;
  F.CantTera.Caption := LCantTerneros.Caption;
  F.CantTero.Caption := LCantTerneras.Caption;
  F.CantToro.Caption := LCantToros.Caption;
  F.CantVaca.Caption := LCantVacas.Caption;
  F.CantVaq.Caption := LCantVaquillonas.Caption;
  F.CabNov.Caption := LCabNovillos.Caption;
  F.CabTera.Caption := LCabTerneras.Caption;
  F.CabTero.Caption := LCabTerneros.Caption;
  F.CabToro.Caption := LCabToros.Caption;
  F.CabVaca.Caption := LCabVacas.Caption;
  F.CabVaq.Caption := LCabVaquillonas.Caption;}
  
  F.ShowModal;
  F.Destroy;
end;

procedure TFEveRecursoForrajero.EASuperficieChange(Sender: TObject);
var
  hectareas : Double;

begin
  inherited;
  try
      hectareas := StrToFloat((Sender as TEditAuto).text);
  except
    MostrarMensaje(tmInformacion, 'El formato de hectáreas no es correcto');
  end;
end;

end.
