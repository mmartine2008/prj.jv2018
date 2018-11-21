unit UREPMultiEsta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB, Types,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  Buttons, UFrameDBSeleccion, EditAuto, ComboBoxAuto, UPrincipal, DateUtils,
  PngImage, jpeg, JvGIF, JvExControls, JvLabel, ImgList, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFREPMultiEsta = class(TFUniversal)
    GBFiltros: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LIni: TLabel;
    LFin: TLabel;
    CBAServicio: TComboBoxAuto;
    EAAnio: TEditAuto;
    CBCompra: TCheckBox;
    GBObservaciones: TGroupBox;
    MObservaciones: TMemo;
    FrameEstablecimientos: TFrameSeleccion;
    IBQTipoServicios: TIBQuery;
    IBQProcreoNoRelac: TIBQuery;
    IBQREPProcreoCompraTer: TIBQuery;
    IBQREPProcreoCompra: TIBQuery;
    IBQREPProcreo: TIBQuery;
    IBQEstaActual: TIBQuery;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    Label6: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Seleccionar(Sender: TObject);
    procedure BBSalirClick(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure EAAnioChange(Sender: TObject);
    procedure CBAServicioChange(Sender: TObject);
    procedure FrameEstablecimientosIBQSeleccionadosAfterOpen(
      DataSet: TDataSet);
    procedure CBCompraClick(Sender: TObject);
    procedure FrameEstablecimientosBBAgregarTodosClick(Sender: TObject);
    procedure FrameEstablecimientosBBAgregarUnoClick(Sender: TObject);
    procedure FrameEstablecimientosBBEliminarUnoClick(Sender: TObject);
    procedure FrameEstablecimientosBBEliminarTodosClick(Sender: TObject);
  private
    Fecha_Ini, Fecha_Fin : TDate;
    Anio : Word;
    ServicioPrimavera : Boolean;
    hay_fecha_serv_fin, hay_fecha_serv_ini, hay_fecha_tacto, hay_fecha_parto, hay_fecha_destete : boolean;
    Compra : Boolean;
    procedure BuscarTipoServicio();
    procedure ActualizarConsulta();
    procedure ArmarPreview();
  public
    cant_servicio : integer;
    cant_muerte_servicio : integer;
    cant_venta_servicio : integer;
    cant_sin_cerrar_servicio : integer;
    cant_tactos : integer;
    cant_vacias : integer;
    cant_preniadas : integer;
    cant_muerte_tacto : integer;
    cant_venta_tacto : integer;
    cant_abortos : integer;
    cant_sin_cerrar_tactos : integer;
    cant_partos : integer;
    cant_venta_partos : integer;
    cant_muerte_partos : integer;
    cant_muerte_menor_36 : integer;
    cant_muerte_mayor_36 : integer;
    cant_sin_cerrar_partos : integer;
    cant_destetados : integer;
    menor_fecha_servicio : TDate;
    mayor_fecha_servicio : TDate;
    menor_fecha_tacto : TDate;
    mayor_fecha_tacto : TDate;
    menor_fecha_parto : TDate;
    mayor_fecha_parto : TDate;
    menor_fecha_destete : TDate;
    mayor_fecha_destete : TDate;
    cant_compra_pren : Integer;
    cant_compra_serv : Integer;
    cant_compra_con_cria : Integer;
  end;

var
  FREPMultiEsta: TFREPMultiEsta;

implementation

uses
  UCartel, UREPMultiEstaPreview, UTraduccion;

{$R *.dfm}

procedure TFREPMultiEsta.FormCreate(Sender: TObject);
var
  a, b : Word; //se usan solo como parametros auxiliares
begin
  inherited;

  IBQEstaActual.Close;
  IBQEstaActual.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQEstaActual.ParamByName('nomesta').AsString := FPrincipal.NombreEstablecimiento;
  IBQEstaActual.Open;

  FrameEstablecimientos.OnSelectItem := Seleccionar;
  FrameEstablecimientos.ActivarQuery;
  Compra := True;
  DecodeDate(Date(),Anio,a,b);
  EAAnio.Text := IntToStr(Anio);
  ServicioPrimavera := true;
  BuscarTipoServicio();
end;

procedure TFREPMultiEsta.Seleccionar(Sender: TObject);
begin
  FrameEstablecimientos.IBQSeleccionados.Insert;
  FrameEstablecimientos.IBQSeleccionados.FieldByName('id_animal').AsInteger := FrameEstablecimientos.IBQDisponibles.FieldValues['id_establecimiento'];
  FrameEstablecimientos.IBQSeleccionados.FieldByName('nombre').AsString := FrameEstablecimientos.IBQDisponibles.FieldValues['nombre'];
  FrameEstablecimientos.IBQSeleccionados.FieldByName('id_aux').AsInteger := 1;
end;

procedure TFREPMultiEsta.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFREPMultiEsta.BuscarTipoServicio();
var
  Fecha : TDate;
  Dia, Mes, a : Word;
  FS : TFormatSettings;
begin
  GetLocaleFormatSettings(Windows.GetSystemDefaultLCID,FS);

  IBQTipoServicios.Close;
  IBQTipoServicios.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  if ServicioPrimavera then
    IBQTipoServicios.ParamByName('PARAM').AsInteger := 50
  else
    IBQTipoServicios.ParamByName('PARAM').AsInteger := 52;
  IBQTipoServicios.Open;
  Fecha := StrToDate(IBQTipoServicios.FieldValues['VALOR']);
  DecodeDate(Fecha,a,Mes,Dia);
  Fecha_Ini := EncodeDate(Anio,Mes,Dia);

  Fecha_Fin := IncMonth(Fecha_Ini,6);
  Fecha_Fin := IncDay(Fecha_Fin,-1);

  FS.ShortDateFormat := 'dd - MMMM - yyyy';
  LIni.Caption := DateToStr(Fecha_Ini,FS);
  LFin.Caption := DateToStr(Fecha_Fin,FS);

  ActualizarConsulta();
end;

procedure TFREPMultiEsta.ActualizarConsulta();
var
  Cartel: TCartel;
begin
  Cartel := TCartel.getInstance();
  Cartel.abrircartel('Cargando datos de Procreo ...');


  {IBQREPProcreo.Close;
  IBQREPProcreo.ParamByName('FECHA_INI').AsDate := Fecha_Ini;
  IBQREPProcreo.ParamByName('FECHA_FIN').AsDate := Fecha_Fin;
  IBQREPProcreo.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  IBQREPProcreo.Open;}


  Cartel.cerrarcartel;
  Cartel.FreeInstance;
end;

procedure TFREPMultiEsta.ArmarPreview();
var
  cant_men_36_nr, cant_may_36_nr, cant_dest_nr : integer;
  menor_fecha_dest_nr, mayor_fecha_dest_nr : TDate;
begin

    cant_servicio := 0;
    cant_muerte_servicio := 0;
    cant_venta_servicio := 0;
    cant_sin_cerrar_servicio := 0;
    cant_tactos := 0;
    cant_vacias := 0;
    cant_preniadas := 0;
    cant_muerte_tacto := 0;
    cant_venta_tacto := 0;
    cant_abortos := 0;
    cant_sin_cerrar_tactos := 0;
    cant_partos := 0;
    cant_venta_partos := 0;
    cant_muerte_partos := 0;
    cant_muerte_menor_36 := 0;
    cant_muerte_mayor_36 := 0;
    cant_sin_cerrar_partos := 0;
    cant_destetados := 0;
    cant_compra_pren := 0;
    cant_compra_serv := 0;
    cant_compra_con_cria := 0;
    menor_fecha_servicio := Date();
    mayor_fecha_servicio := StrToDate('01/01/1990');
    menor_fecha_tacto := Date();
    mayor_fecha_tacto := StrToDate('01/01/1990');
    menor_fecha_parto := Date();
    mayor_fecha_parto := StrToDate('01/01/1990');
    menor_fecha_destete := Date();
    mayor_fecha_destete := StrToDate('01/01/1990');
    hay_fecha_serv_ini := false;
    hay_fecha_serv_fin := false;
    hay_fecha_tacto := false;
    hay_fecha_parto := false;
    hay_fecha_destete := false;
    cant_men_36_nr := 0;
    cant_may_36_nr := 0;
    cant_dest_nr := 0;
    menor_fecha_dest_nr := Date();
    mayor_fecha_dest_nr := StrToDate('01/01/1990');

    IBQREPProcreo.Close;
    IBQREPProcreo.ParamByName('FECHA_INI').AsDate := Fecha_Ini;
    IBQREPProcreo.ParamByName('FECHA_FIN').AsDate := Fecha_Fin;
   // IBQREPProcreo.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
    IBQREPProcreo.Open;

    IBQREPProcreo.First;
    while not IBQREPProcreo.Eof do
    begin
      //fechas
      if IBQREPProcreo.FieldValues['fecha_serv_ini'] <> null then
      begin
        hay_fecha_serv_ini := true;
        if CompareDate(IBQREPProcreo.FieldValues['fecha_serv_ini'],menor_fecha_servicio) = LessThanValue then
          menor_fecha_servicio := IBQREPProcreo.FieldValues['fecha_serv_ini'];
      end;
      if IBQREPProcreo.FieldValues['fecha_serv_fin'] <> null then
      begin
        hay_fecha_serv_fin := true;
        if CompareDate(IBQREPProcreo.FieldValues['fecha_serv_fin'],mayor_fecha_servicio) = GreaterThanValue then
          mayor_fecha_servicio := IBQREPProcreo.FieldValues['fecha_serv_fin'];
      end;
      if IBQREPProcreo.FieldValues['fecha_tacto'] <> null then
      begin
        if CompareDate(IBQREPProcreo.FieldValues['fecha_tacto'],menor_fecha_tacto) = LessThanValue then
          menor_fecha_tacto := IBQREPProcreo.FieldValues['fecha_tacto'];
        if CompareDate(IBQREPProcreo.FieldValues['fecha_tacto'],mayor_fecha_tacto) = GreaterThanValue then
          mayor_fecha_tacto := IBQREPProcreo.FieldValues['fecha_tacto'];
        hay_fecha_tacto := true;
      end;

      if IBQREPProcreo.FieldValues['fecha_parto'] <> null then
      begin
        if CompareDate(IBQREPProcreo.FieldValues['fecha_parto'],menor_fecha_parto) = LessThanValue then
          menor_fecha_parto := IBQREPProcreo.FieldValues['fecha_parto'];
        if CompareDate(IBQREPProcreo.FieldValues['fecha_parto'],mayor_fecha_parto) = GreaterThanValue then
          mayor_fecha_parto := IBQREPProcreo.FieldValues['fecha_parto'];
        hay_fecha_parto := true;
      end;

      if IBQREPProcreo.FieldValues['fecha_destete_1'] <> null then
      begin
        if CompareDate(IBQREPProcreo.FieldValues['fecha_destete_1'],menor_fecha_destete) = LessThanValue then
          menor_fecha_destete := IBQREPProcreo.FieldValues['fecha_destete_1'];
        if CompareDate(IBQREPProcreo.FieldValues['fecha_destete_1'],mayor_fecha_destete) = GreaterThanValue then
          mayor_fecha_destete := IBQREPProcreo.FieldValues['fecha_destete_1'];
        hay_fecha_destete := true;
      end;
      if IBQREPProcreo.FieldValues['fecha_destete_2'] <> null then
      begin
        if CompareDate(IBQREPProcreo.FieldValues['fecha_destete_2'],menor_fecha_destete) = LessThanValue then
          menor_fecha_destete := IBQREPProcreo.FieldValues['fecha_destete_2'];
        if CompareDate(IBQREPProcreo.FieldValues['fecha_destete_2'],mayor_fecha_destete) = GreaterThanValue then
          mayor_fecha_destete := IBQREPProcreo.FieldValues['fecha_destete_2'];
        hay_fecha_destete := true;
      end;
      if IBQREPProcreo.FieldValues['fecha_destete_3'] <> null then
      begin
        if CompareDate(IBQREPProcreo.FieldValues['fecha_destete_3'],menor_fecha_destete) = LessThanValue then
          menor_fecha_destete := IBQREPProcreo.FieldValues['fecha_destete_3'];
        if CompareDate(IBQREPProcreo.FieldValues['fecha_destete_3'],mayor_fecha_destete) = GreaterThanValue then
          mayor_fecha_destete := IBQREPProcreo.FieldValues['fecha_destete_3'];
        hay_fecha_destete := true;
      end;
      ////
      //servicios
      Inc(cant_servicio);
      if IBQREPProcreo.FieldValues['SERV_MUERTO'] <> null then
        if IBQREPProcreo.FieldValues['SERV_MUERTO'] = 'S' then Inc(cant_muerte_servicio);

      if IBQREPProcreo.FieldValues['SERV_VENDIDO'] <> null then
        if IBQREPProcreo.FieldValues['SERV_VENDIDO'] = 'S' then Inc(cant_venta_servicio);

      if IBQREPProcreo.FieldValues['TACTADO'] <> null then
        if IBQREPProcreo.FieldValues['TACTADO'] = 'S' then
        begin
          Inc(cant_tactos);
          if IBQREPProcreo.FieldValues['PRENIADA'] = 'S' then Inc(cant_preniadas)
          else Inc(cant_vacias);
        end;

      if IBQREPProcreo.FieldValues['TACTO_VENTA'] <> null then
        if IBQREPProcreo.FieldValues['TACTO_VENTA'] = 'S' then Inc(cant_venta_tacto);

      if IBQREPProcreo.FieldValues['TACTO_MUERTE'] <> null then
        if IBQREPProcreo.FieldValues['TACTO_MUERTE'] = 'S' then Inc(cant_muerte_tacto);

      if IBQREPProcreo.FieldValues['TACTO_ABORTO'] <> null then
        if IBQREPProcreo.FieldValues['TACTO_ABORTO'] = 'S' then Inc(cant_abortos);

      if IBQREPProcreo.FieldValues['TACTO_SIN_CIERRE'] <> null then
        if IBQREPProcreo.FieldValues['TACTO_SIN_CIERRE'] = 'S' then Inc(cant_sin_cerrar_tactos);

      if IBQREPProcreo.FieldValues['PARTO'] <> null then
        if IBQREPProcreo.FieldValues['PARTO'] = 'S' then Inc(cant_partos);

      if IBQREPProcreo.FieldValues['PARTO_VENTA'] <> null then
        if IBQREPProcreo.FieldValues['PARTO_VENTA'] = 'S' then Inc(cant_venta_partos);

      if IBQREPProcreo.FieldValues['PARTO_MUERTE'] <> null then
        if IBQREPProcreo.FieldValues['PARTO_MUERTE'] = 'S' then Inc(cant_muerte_partos);

      if IBQREPProcreo.FieldValues['PARTO_MUERTE_HIJO_36_1'] <> null then
        if IBQREPProcreo.FieldValues['PARTO_MUERTE_HIJO_36_1'] = 'S' then Inc(cant_muerte_menor_36);
      if IBQREPProcreo.FieldValues['PARTO_MUERTE_HIJO_36_2'] <> null then
        if IBQREPProcreo.FieldValues['PARTO_MUERTE_HIJO_36_2'] = 'S' then Inc(cant_muerte_menor_36);
      if IBQREPProcreo.FieldValues['PARTO_MUERTE_HIJO_36_3'] <> null then
        if IBQREPProcreo.FieldValues['PARTO_MUERTE_HIJO_36_3'] = 'S' then Inc(cant_muerte_menor_36);

      if IBQREPProcreo.FieldValues['PARTO_MUERTE_HIJO_DEST_1'] <> null then
        if IBQREPProcreo.FieldValues['PARTO_MUERTE_HIJO_DEST_1'] = 'S' then Inc(cant_muerte_mayor_36);
      if IBQREPProcreo.FieldValues['PARTO_MUERTE_HIJO_DEST_2'] <> null then
        if IBQREPProcreo.FieldValues['PARTO_MUERTE_HIJO_DEST_2'] = 'S' then Inc(cant_muerte_mayor_36);
      if IBQREPProcreo.FieldValues['PARTO_MUERTE_HIJO_DEST_3'] <> null then
        if IBQREPProcreo.FieldValues['PARTO_MUERTE_HIJO_DEST_3'] = 'S' then Inc(cant_muerte_mayor_36);

      if IBQREPProcreo.FieldValues['PARTO_SIN_CIERRE'] <> null then
        if IBQREPProcreo.FieldValues['PARTO_SIN_CIERRE'] = 'S' then Inc(cant_sin_cerrar_partos);

      if IBQREPProcreo.FieldValues['DESTETE_1'] <> null then
        if IBQREPProcreo.FieldValues['DESTETE_1'] = 'S' then Inc(cant_destetados);
      if IBQREPProcreo.FieldValues['DESTETE_2'] <> null then
        if IBQREPProcreo.FieldValues['DESTETE_2'] = 'S' then Inc(cant_destetados);
      if IBQREPProcreo.FieldValues['DESTETE_3'] <> null then
        if IBQREPProcreo.FieldValues['DESTETE_3'] = 'S' then Inc(cant_destetados);

      IBQREPProcreo.Next;
    end;

    if hay_fecha_parto then
    begin
      IBQProcreoNoRelac.Close;
      //IBQProcreoNoRelac.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQProcreoNoRelac.ParamByName('desde').AsDate := menor_fecha_parto;
      IBQProcreoNoRelac.ParamByName('hasta').AsDate := mayor_fecha_parto;
      IBQProcreoNoRelac.Open;

      IBQProcreoNoRelac.First;
      while not IBQProcreoNoRelac.Eof do
      begin
        if IBQProcreoNoRelac.FieldValues['MUERTO_MENOR_36'] <> null then
          if IBQProcreoNoRelac.FieldValues['MUERTO_MENOR_36'] = 'S' then
            Inc(cant_men_36_nr);
        if IBQProcreoNoRelac.FieldValues['MUERTO_MAYOR_36'] <> null then
          if IBQProcreoNoRelac.FieldValues['MUERTO_MAYOR_36'] = 'S' then
            Inc(cant_may_36_nr);
        if IBQProcreoNoRelac.FieldValues['DESTETE'] <> null then
          if IBQProcreoNoRelac.FieldValues['DESTETE'] = 'S' then
            Inc(cant_dest_nr);
        if IBQProcreoNoRelac.FieldValues['FECHA_DESTETE'] <> null then
        begin
          if CompareDate(IBQProcreoNoRelac.FieldValues['FECHA_DESTETE'],menor_fecha_dest_nr) = LessThanValue then
            menor_fecha_dest_nr := IBQProcreoNoRelac.FieldValues['FECHA_DESTETE'];
          if CompareDate(IBQProcreoNoRelac.FieldValues['FECHA_DESTETE'],mayor_fecha_dest_nr) = GreaterThanValue then
            mayor_fecha_dest_nr := IBQProcreoNoRelac.FieldValues['FECHA_DESTETE'];
          hay_fecha_destete := true;
        end;
        IBQProcreoNoRelac.Next;
      end;

      cant_destetados := cant_dest_nr + cant_destetados;
      cant_muerte_menor_36 := cant_men_36_nr + cant_muerte_menor_36;
      cant_muerte_mayor_36 := cant_may_36_nr + cant_muerte_mayor_36;
      if hay_fecha_destete then
      begin
        if CompareDate(menor_fecha_dest_nr,menor_fecha_destete) = LessThanValue then
          menor_fecha_destete := menor_fecha_dest_nr;
        if CompareDate(mayor_fecha_dest_nr,mayor_fecha_destete) = GreaterThanValue then
          mayor_fecha_destete := mayor_fecha_dest_nr;
      end;
    end;
    if Compra then
      begin

        IBQREPProcreoCompra.Close;
        IBQREPProcreoCompra.ParamByName('fecha_min_serv').AsDate := menor_fecha_servicio;
        IBQREPProcreoCompra.ParamByName('fecha_max_serv').AsDate := mayor_fecha_servicio;
        IBQREPProcreoCompra.ParamByName('fecha_max_tacto').AsDate := mayor_fecha_tacto;
        //IBQREPProcreoCompra.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
        IBQREPProcreoCompra.Open;

        IBQREPProcreoCompra.First;
        while not IBQREPProcreoCompra.Eof do
        begin
          //fechas
          if IBQREPProcreoCompra.FieldValues['fecha_tacto'] <> null then
          begin
            if CompareDate(IBQREPProcreoCompra.FieldValues['fecha_tacto'],menor_fecha_tacto) = LessThanValue then
              menor_fecha_tacto := IBQREPProcreoCompra.FieldValues['fecha_tacto'];
            if CompareDate(IBQREPProcreoCompra.FieldValues['fecha_tacto'],mayor_fecha_tacto) = GreaterThanValue then
              mayor_fecha_tacto := IBQREPProcreoCompra.FieldValues['fecha_tacto'];
            hay_fecha_tacto := true;
          end;

          if IBQREPProcreoCompra.FieldValues['fecha_parto'] <> null then
          begin
            if CompareDate(IBQREPProcreoCompra.FieldValues['fecha_parto'],menor_fecha_parto) = LessThanValue then
              menor_fecha_parto := IBQREPProcreoCompra.FieldValues['fecha_parto'];
            if CompareDate(IBQREPProcreoCompra.FieldValues['fecha_parto'],mayor_fecha_parto) = GreaterThanValue then
              mayor_fecha_parto := IBQREPProcreoCompra.FieldValues['fecha_parto'];
            hay_fecha_parto := true;
          end;

          if IBQREPProcreoCompra.FieldValues['fecha_destete_1'] <> null then
          begin
            if CompareDate(IBQREPProcreoCompra.FieldValues['fecha_destete_1'],menor_fecha_destete) = LessThanValue then
              menor_fecha_destete := IBQREPProcreoCompra.FieldValues['fecha_destete_1'];
            if CompareDate(IBQREPProcreoCompra.FieldValues['fecha_destete_1'],mayor_fecha_destete) = GreaterThanValue then
              mayor_fecha_destete := IBQREPProcreoCompra.FieldValues['fecha_destete_1'];
            hay_fecha_destete := true;
          end;
          if IBQREPProcreoCompra.FieldValues['fecha_destete_2'] <> null then
          begin
            if CompareDate(IBQREPProcreoCompra.FieldValues['fecha_destete_2'],menor_fecha_destete) = LessThanValue then
              menor_fecha_destete := IBQREPProcreoCompra.FieldValues['fecha_destete_2'];
            if CompareDate(IBQREPProcreoCompra.FieldValues['fecha_destete_2'],mayor_fecha_destete) = GreaterThanValue then
              mayor_fecha_destete := IBQREPProcreoCompra.FieldValues['fecha_destete_2'];
            hay_fecha_destete := true;
          end;
          if IBQREPProcreoCompra.FieldValues['fecha_destete_3'] <> null then
          begin
            if CompareDate(IBQREPProcreoCompra.FieldValues['fecha_destete_3'],menor_fecha_destete) = LessThanValue then
              menor_fecha_destete := IBQREPProcreoCompra.FieldValues['fecha_destete_3'];
            if CompareDate(IBQREPProcreoCompra.FieldValues['fecha_destete_3'],mayor_fecha_destete) = GreaterThanValue then
              mayor_fecha_destete := IBQREPProcreoCompra.FieldValues['fecha_destete_3'];
            hay_fecha_destete := true;
          end;
          ////

          if IBQREPProcreoCompra.FieldValues['COMPRA_SERVICIO'] = 'S' then
            Inc(cant_compra_serv);
          if IBQREPProcreoCompra.FieldValues['COMPRA_TACTO'] = 'S' then
            Inc(cant_compra_pren);

          if IBQREPProcreoCompra.FieldValues['TACTADO'] <> null then
            if IBQREPProcreoCompra.FieldValues['TACTADO'] = 'S' then
            begin
              Inc(cant_tactos);
              if IBQREPProcreoCompra.FieldValues['PRENIADA'] = 'S' then Inc(cant_preniadas)
              else Inc(cant_vacias);
            end;

          if IBQREPProcreoCompra.FieldValues['TACTO_VENTA'] <> null then
            if IBQREPProcreoCompra.FieldValues['TACTO_VENTA'] = 'S' then Inc(cant_venta_tacto);

          if IBQREPProcreoCompra.FieldValues['TACTO_MUERTE'] <> null then
            if IBQREPProcreoCompra.FieldValues['TACTO_MUERTE'] = 'S' then Inc(cant_muerte_tacto);

          if IBQREPProcreoCompra.FieldValues['TACTO_ABORTO'] <> null then
            if IBQREPProcreoCompra.FieldValues['TACTO_ABORTO'] = 'S' then Inc(cant_abortos);

          if IBQREPProcreoCompra.FieldValues['TACTO_SIN_CIERRE'] <> null then
            if IBQREPProcreoCompra.FieldValues['TACTO_SIN_CIERRE'] = 'S' then Inc(cant_sin_cerrar_tactos);

          if IBQREPProcreoCompra.FieldValues['PARTO'] <> null then
            if IBQREPProcreoCompra.FieldValues['PARTO'] = 'S' then Inc(cant_partos);

          if IBQREPProcreoCompra.FieldValues['PARTO_VENTA'] <> null then
            if IBQREPProcreoCompra.FieldValues['PARTO_VENTA'] = 'S' then Inc(cant_venta_partos);

          if IBQREPProcreoCompra.FieldValues['PARTO_MUERTE'] <> null then
            if IBQREPProcreoCompra.FieldValues['PARTO_MUERTE'] = 'S' then Inc(cant_muerte_partos);

          if IBQREPProcreoCompra.FieldValues['PARTO_MUERTE_HIJO_36_1'] <> null then
            if IBQREPProcreoCompra.FieldValues['PARTO_MUERTE_HIJO_36_1'] = 'S' then Inc(cant_muerte_menor_36);
          if IBQREPProcreoCompra.FieldValues['PARTO_MUERTE_HIJO_36_2'] <> null then
            if IBQREPProcreoCompra.FieldValues['PARTO_MUERTE_HIJO_36_2'] = 'S' then Inc(cant_muerte_menor_36);
          if IBQREPProcreoCompra.FieldValues['PARTO_MUERTE_HIJO_36_3'] <> null then
            if IBQREPProcreoCompra.FieldValues['PARTO_MUERTE_HIJO_36_3'] = 'S' then Inc(cant_muerte_menor_36);

          if IBQREPProcreoCompra.FieldValues['PARTO_MUERTE_HIJO_DEST_1'] <> null then
            if IBQREPProcreoCompra.FieldValues['PARTO_MUERTE_HIJO_DEST_1'] = 'S' then Inc(cant_muerte_mayor_36);
          if IBQREPProcreoCompra.FieldValues['PARTO_MUERTE_HIJO_DEST_2'] <> null then
            if IBQREPProcreoCompra.FieldValues['PARTO_MUERTE_HIJO_DEST_2'] = 'S' then Inc(cant_muerte_mayor_36);
          if IBQREPProcreoCompra.FieldValues['PARTO_MUERTE_HIJO_DEST_3'] <> null then
            if IBQREPProcreoCompra.FieldValues['PARTO_MUERTE_HIJO_DEST_3'] = 'S' then Inc(cant_muerte_mayor_36);

          if IBQREPProcreoCompra.FieldValues['PARTO_SIN_CIERRE'] <> null then
            if IBQREPProcreoCompra.FieldValues['PARTO_SIN_CIERRE'] = 'S' then Inc(cant_sin_cerrar_partos);

          if IBQREPProcreoCompra.FieldValues['DESTETE_1'] <> null then
            if IBQREPProcreoCompra.FieldValues['DESTETE_1'] = 'S' then Inc(cant_destetados);
          if IBQREPProcreoCompra.FieldValues['DESTETE_2'] <> null then
            if IBQREPProcreoCompra.FieldValues['DESTETE_2'] = 'S' then Inc(cant_destetados);
          if IBQREPProcreoCompra.FieldValues['DESTETE_3'] <> null then
            if IBQREPProcreoCompra.FieldValues['DESTETE_3'] = 'S' then Inc(cant_destetados);
          IBQREPProcreoCompra.Next;
        end;

        IBQREPProcreoCompraTer.Close;
        IBQREPProcreoCompraTer.ParamByName('fecha_ini').AsDate := mayor_fecha_tacto;
        IBQREPProcreoCompraTer.ParamByName('fecha_fin').AsDate := mayor_fecha_destete;
        //IBQREPProcreoCompraTer.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
        IBQREPProcreoCompraTer.Open;

        IBQREPProcreoCompraTer.First;
        while not IBQREPProcreoCompraTer.Eof do
        begin
          if IBQREPProcreoCompraTer.FieldValues['DESTETE'] <> null then
            if IBQREPProcreoCompraTer.FieldValues['DESTETE'] = 'S' then
            begin
              Inc(cant_destetados);
              Inc(cant_compra_con_cria);
            end;
          IBQREPProcreoCompraTer.Next;
        end;
      end;
end;

procedure TFREPMultiEsta.BBImprimirReporteClick(Sender: TObject);
var
  F : TFREPMultiEstaPreview;
  Cartel : TCartel;
  total_parto_sin_cierre : integer;
begin
  inherited;
  HabilitarDesabilitarControles();
  Cartel := TCartel.getInstance;
  Cartel.abrircartel('Generando reporte de Procreo...');

  F := TFREPMultiEstaPreview.Create(nil);
  ArmarPreview();

  if Compra then
  begin
    F.QRLabel37.Caption := Traducir('Tasa preñez/vientres Ajustados');
    F.QRLabel38.Caption := Traducir('Tasa parición/vientres Ajustados');
    F.QRLabel39.Caption := Traducir('Tasa destete/vientres Ajustados');
    F.QRLabel35.Caption := Traducir('Compras: ');
    F.QRLabel34.Caption := Traducir('Compras: ');
    F.QRLabel36.Caption := Traducir('Compra con Ternero/a: ');
    F.QRLabel32.Caption := Traducir('% sobre vientres Ajustados');
    F.QRLabel49.Enabled := true;
  end
  else
  begin
    F.QRLabel37.Caption := Traducir('Tasa preñez/vientres servidos Aj.');
    F.QRLabel38.Caption := Traducir('Tasa paricion/vientres en serv. Aj.');
    F.QRLabel39.Caption := Traducir('Tasa destete/vientres en serv. Aj.');
    F.QRLabel35.Caption := '';
    F.QRLabel34.Caption := '';
    F.QRLabel36.Caption := '';
    F.QRLabel32.Caption := Traducir('% sobre vientres en servicio Ajustados');
    F.QRLabel49.Enabled := false;
  end;

  total_parto_sin_cierre := cant_muerte_partos+cant_muerte_servicio+cant_muerte_tacto+
                            cant_venta_servicio+cant_venta_tacto+cant_venta_partos+
                            cant_abortos+cant_vacias;
  if total_parto_sin_cierre > cant_sin_cerrar_partos then
    total_parto_sin_cierre := 0;

  //Cantidades
  if Compra then
  begin
    F.cant_compra_serv.Caption := IntToStr(cant_compra_serv);
    F.cant_compra_pren.Caption := IntToStr(cant_compra_pren);
    F.cant_compra_dest.Caption := IntToStr(cant_compra_con_cria);
  end
  else
  begin
    F.cant_compra_serv.Caption := '';
    F.cant_compra_pren.Caption := '';
    F.cant_compra_dest.Caption := '';
  end;
  F.cant_abortos.Caption := IntToStr(cant_abortos);
  F.cant_destete.Caption := IntToStr(cant_destetados);
  F.cant_muerte_36.Caption := IntToStr(cant_muerte_menor_36);
  F.cant_muerte_dest.Caption := IntToStr(cant_muerte_mayor_36);
  F.cant_muerte_parto.Caption := IntToStr(cant_muerte_partos);
  F.cant_muerte_serv.Caption := IntToStr(cant_muerte_servicio);
  F.cant_muerte_tacto.Caption := IntToStr(cant_muerte_tacto);
  F.cant_preniadas.Caption := IntToStr(cant_preniadas);
  F.Cant_servidas.Caption := IntToStr(cant_servicio);
  F.cant_sin_cierre_parto.Caption := IntToStr(cant_sin_cerrar_partos-total_parto_sin_cierre);
  F.cant_sin_cierre_tacto.Caption := IntToStr(cant_sin_cerrar_tactos);
  F.cant_vacias.Caption := IntToStr(cant_vacias);
  F.cant_ventas_serv.Caption := IntToStr(cant_venta_servicio);
  F.cant_ventas_tacto.Caption := IntToStr(cant_venta_tacto);
  F.cant_venta_parto.Caption := IntToStr(cant_venta_partos);
  F.cant_preniadas_menos_venta.Caption := IntToStr(cant_preniadas - cant_venta_tacto);
  F.cant_partos_menos_ventas.Caption := IntToStr(cant_partos - cant_venta_partos);
  F.cant_tactos.Caption := IntToStr(cant_tactos);
  F.cant_partos.Caption := IntToStr(cant_partos);
  //Fechas
  if hay_fecha_serv_ini then
    F.Fecha_ini_serv.Caption := DateToStr(menor_fecha_servicio)
  else
    F.Fecha_ini_serv.Caption := '-';
    
  if hay_fecha_serv_fin then
    F.Fecha_fin_serv.Caption := DateToStr(mayor_fecha_servicio)
  else
    F.Fecha_fin_serv.Caption := '-';

  if hay_fecha_tacto then
  begin
    F.Fecha_fin_tacto.Caption := DateToStr(mayor_fecha_tacto);
    F.Fecha_ini_tacto.Caption := DateToStr(menor_fecha_tacto);
  end
  else
  begin
    F.Fecha_fin_tacto.Caption := '-';
    F.Fecha_ini_tacto.Caption := '-';
  end;
  if hay_fecha_parto then
  begin
    F.Fecha_ini_parto.Caption := DateToStr(menor_fecha_parto);
    F.Fecha_fin_parto.Caption := DateToStr(mayor_fecha_parto);
  end
  else
  begin
    F.Fecha_fin_parto.Caption := '-';
    F.Fecha_ini_parto.Caption := '-';
  end;
  if hay_fecha_destete then
  begin
    F.Fecha_ini_dest.Caption := DateToStr(menor_fecha_destete);
    F.Fecha_fin_dest.Caption := DateToStr(mayor_fecha_destete);
  end
  else
  begin
    F.Fecha_fin_dest.Caption := '-';
    F.Fecha_ini_dest.Caption := '-'; 
  end;


  //Porcentajes sobre vientres en servicio
  F.por_abortos.Caption := FormatFloat('##,#',(cant_abortos/cant_servicio)*100)+'%';
  F.por_destete.Caption := FormatFloat('##,#',(cant_destetados/cant_servicio)*100)+'%';
  F.por_muerte_m36.Caption := FormatFloat('##,#',(cant_muerte_menor_36/cant_servicio)*100)+'%';
  F.por_muerte_Ma36.Caption := FormatFloat('##,#',(cant_muerte_mayor_36/cant_servicio)*100)+'%';
  F.por_muerte_parto.Caption := FormatFloat('##,#',(cant_muerte_partos/cant_servicio)*100)+'%';
  F.por_muerte_serv.Caption := FormatFloat('##,#',(cant_muerte_servicio/cant_servicio)*100)+'%';
  F.por_muerte_tacto.Caption := FormatFloat('##,#',(cant_muerte_tacto/cant_servicio)*100)+'%';
  F.por_paridas.Caption := FormatFloat('##,#',(cant_partos/cant_servicio)*100)+'%';
  F.por_preniadas.Caption := FormatFloat('##,#',(cant_preniadas/cant_servicio)*100)+'%';
  F.por_quedan_parto.Caption := FormatFloat('##,#',((cant_partos - cant_venta_partos)/cant_servicio)*100)+'%';
  F.por_quedan_tacto.Caption := FormatFloat('##,#',((cant_preniadas - cant_venta_tacto)/cant_servicio)*100)+'%';
  F.por_serv.Caption := FormatFloat('##,#',(cant_servicio/cant_servicio)*100)+'%';
  F.por_tacto.Caption := FormatFloat('##,#',(cant_tactos/cant_servicio)*100)+'%';
  F.por_vacias.Caption := FormatFloat('##,#',(cant_vacias/cant_servicio)*100)+'%';
  F.por_vaja_serv.Caption := FormatFloat('##,#',(cant_venta_servicio/cant_servicio)*100)+'%';
  F.por_venta_parto.Caption := FormatFloat('##,#',(cant_venta_partos/cant_servicio)*100)+'%';
  F.por_venta_tacto.Caption := FormatFloat('##,#',(cant_venta_tacto/cant_servicio)*100)+'%';
  //Porcentajes sobre vientres ajustados
  if cant_servicio-cant_venta_tacto-cant_venta_partos-cant_venta_servicio > 0 then
    F.por_dest_ajus.Caption := FormatFloat('##,#',(cant_destetados/(cant_servicio-cant_venta_tacto-cant_venta_partos-cant_venta_servicio))*100)+'%'
  else
    F.por_dest_ajus.Caption := '0%';

  if cant_servicio-cant_venta_servicio > 0 then
    F.por_tacto_ajus.Caption := FormatFloat('##,#',(cant_preniadas/(cant_servicio-cant_venta_servicio))*100)+'%'
  else
    F.por_tacto_ajus.Caption := '0%';

  if cant_servicio-cant_venta_tacto-cant_venta_servicio > 0 then
    F.por_parto_ajus.Caption := FormatFloat('##,#',(cant_partos/(cant_servicio-cant_venta_tacto-cant_venta_servicio))*100)+'%'
  else
    F.por_parto_ajus.Caption := '0%';
  //Porcentajes merma
  if cant_preniadas - cant_venta_tacto > 0 then
    F.merma_tacto_parto.Caption := FormatFloat('##,#',((cant_preniadas-cant_venta_tacto-cant_partos)/(cant_preniadas-cant_venta_tacto))*100)+'%'
  else
    F.merma_tacto_parto.Caption := '0%';

  if cant_preniadas-cant_venta_tacto-cant_venta_partos > 0 then
    F.merma_tacto_dest.Caption := FormatFloat('##,#',((cant_preniadas-cant_venta_tacto-cant_venta_partos-cant_destetados)/(cant_preniadas-cant_venta_tacto-cant_venta_partos))*100)+'%'
  else
    F.merma_tacto_dest.Caption := '0%';

  if cant_partos-cant_venta_partos > 0 then
    F.merma_parto_dest.Caption := FormatFloat('##,#',((cant_partos-cant_venta_partos-cant_destetados)/(cant_partos-cant_venta_partos))*100)+'%'
  else
    F.merma_parto_dest.Caption := '0%';
  //Porcentajes sobre trabajo realizado
  if cant_partos-cant_venta_partos > 0 then
    F.por_dest_trabajo.Caption := FormatFloat('##,#',(cant_destetados/(cant_partos-cant_venta_partos))*100)+'%'
  else
    F.por_dest_trabajo.Caption := '0%';

  if cant_preniadas-cant_venta_tacto > 0 then
    F.por_parto_trabajo.Caption := FormatFloat('##,#',(cant_partos/(cant_preniadas-cant_venta_tacto))*100)+'%'
  else
    F.por_parto_trabajo.Caption := '0%';

  if cant_tactos > 0 then
    F.por_tacto_trabajo.Caption := FormatFloat('##,#',(cant_preniadas/cant_tactos)*100)+'%'
  else
    F.por_tacto_trabajo.Caption := '0%';

  F.QRLTipoServicio.Caption := CBAServicio.Text+' de '+IntToStr(Anio);
  F.QRLTipoServicio1.Caption := CBAServicio.Text+' de '+IntToStr(Anio);

  Cartel.cerrarcartel;
  Cartel.FreeInstance;

  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();
end;

procedure TFREPMultiEsta.EAAnioChange(Sender: TObject);
var
  valor : Integer;
begin
  inherited;
  if TryStrToInt(EAAnio.Text,valor) then
    if (valor > 1990) and  (valor < 9999) then
    begin
      Anio := Word(valor);
      BuscarTipoServicio();
    end;
end;

procedure TFREPMultiEsta.CBAServicioChange(Sender: TObject);
begin
  inherited;
  if CBAServicio.ItemIndex = 0 then ServicioPrimavera := true;
  if CBAServicio.ItemIndex = 1 then ServicioPrimavera := false;
  BuscarTipoServicio();
end;

procedure TFREPMultiEsta.FrameEstablecimientosIBQSeleccionadosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  //BBImprimirReporte.Enabled := not FrameEstablecimientos.IBQSeleccionados.IsEmpty;
  LPreview.Enabled := not FrameEstablecimientos.IBQSeleccionados.IsEmpty;
  IPreview.Enabled := not FrameEstablecimientos.IBQSeleccionados.IsEmpty;
end;

procedure TFREPMultiEsta.CBCompraClick(Sender: TObject);
begin
  inherited;
  Compra := CBCompra.Checked;
  ActualizarConsulta();
end;

procedure TFREPMultiEsta.FrameEstablecimientosBBAgregarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameEstablecimientos.OnSelectItem := Seleccionar;
  FrameEstablecimientos.BBAgregarTodosClick(Sender);
end;

procedure TFREPMultiEsta.FrameEstablecimientosBBAgregarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameEstablecimientos.OnSelectItem := Seleccionar;
  FrameEstablecimientos.BBAgregarUnoClick(Sender);
end;

procedure TFREPMultiEsta.FrameEstablecimientosBBEliminarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameEstablecimientos.OnSelectItem := Seleccionar;
  FrameEstablecimientos.BBEliminarUnoClick(Sender);
end;

procedure TFREPMultiEsta.FrameEstablecimientosBBEliminarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameEstablecimientos.OnSelectItem := Seleccionar;
  FrameEstablecimientos.BBEliminarTodosClick(Sender);
end;

end.
