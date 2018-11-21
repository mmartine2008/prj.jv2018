unit UExpBraford;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, PngImage, Grids, DBGrids, ImgList,
  PngImageList;

type
  TFExpBraford = class(TFUniversal)
    IBQGetAnimales: TIBQuery;
    DataSource1: TDataSource;
    IBQGetCantAnimalesSexo: TIBQuery;
    IBQuery1: TIBQuery;
    INacimientos: TImage;
    IServicios: TImage;
    ITransferencia: TImage;
    IFlushing: TImage;
    IImplantes: TImage;
    Image9: TImage;
    IBajas: TImage;
    IVientres: TImage;
    LNacimientos: TLabel;
    LServicios: TLabel;
    LTransferencia: TLabel;
    LFlushing: TLabel;
    LImplantes: TLabel;
    LInspeccion: TLabel;
    LBajas: TLabel;
    LVientres: TLabel;
    Image1: TImage;
    Image5: TImage;
    procedure IExpNacimientosColectivosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure IExpNacColectivosAnexoClick(Sender: TObject);
    procedure IExpNacIndividualesClick(Sender: TObject);
    procedure IExpServColectivosClick(Sender: TObject);
    procedure IExpSerColecDetalleClick(Sender: TObject);
    procedure IExpServIndividualesClick(Sender: TObject);
    procedure IExpFlushingClick(Sender: TObject);
    procedure ITransferenciaClick(Sender: TObject);
    procedure INacimientosClick(Sender: TObject);
    procedure IServiciosClick(Sender: TObject);
    procedure IFlushingClick(Sender: TObject);
    procedure IImplantesClick(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure IBajasClick(Sender: TObject);
    procedure IVientresClick(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Exportar(item : integer);

    procedure ArmarExcelNacimientosIndividales();

    procedure ArmarExcelNacimientosAnexo();

    procedure ArmarExcelListadoServicios();

    procedure ArmarExcelServiciosColectivos();

    procedure ArmarExcelServiciosColectivosDetalle();

    procedure ArmarExcelServiciosIndividuales();

    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);
  public
    { Public declarations }
  end;

var
  FExpBraford: TFExpBraford;
  fechaDesde, fechaHasta : TDate;

implementation

uses
  UPrincipal, UCartel, UMensajeHuella, UExpBrafordFlushing, UExpBrafordImplantes,
  UExpBrafordNacimientos, UExpBrafordServicios, UExpBrafordTransferencia, UExpBrafordInspeccion,
  UExpBrafordBaja, UExpBrafordVientresEmpadronar, URepListadoAnimalesFenotipos;

{$R *.dfm}

procedure TFExpBraford.ArmarExcelServiciosIndividuales;
var column: TxlColumn;
begin  {

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQGetAnimales;
  DTXLS.Title.Text:= 'DECLARACION SERVICIOS INDIVIDUALES.';

  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_servicio','Nº Servicio.',True);

  AgregarColumnaExcel(column,taLeftJustify,0,'rp_padre','Rp Toro.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_padre','Nombre Toro.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'razapadrenombre','Raza Toro.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'subcat_padre','Registro Toro.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_padre','ABA/HBA Toro.',True);

  AgregarColumnaExcel(column,taLeftJustify,0,'subcat_mbi','Registro Vaca.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp_madre_biologica','RP Vaca.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'aba_madre_biologica','A.B.A. Vaca.',True);
 }
end;


procedure TFExpBraford.ArmarExcelServiciosColectivosDetalle;
var column: TxlColumn;
begin {

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQGetAnimales;
  DTXLS.Title.Text:= 'SERVICIOS COLECTIVOS DETALLE MADRES).';

  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_servicio','Nº de Servicio.',True);

  AgregarColumnaExcel(column,taLeftJustify,0,'subcat_mbi','Reg. Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp_madre_biologica','RP Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'aba_madre_biologica','Nº A.B.A. Madre.',True);
      }
end;

procedure TFExpBraford.ArmarExcelServiciosColectivos;
var column: TxlColumn;
begin {

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQGetAnimales;
  DTXLS.Title.Text := 'DECLARACION DE SERVICIOS COLECTIVOS.';

  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_servicio','Nº Servicio.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'fecha_inicio','Fecha de inicio del servicio.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'fecha_fin','Fecha de fin del servicio.',True);  

  AgregarColumnaExcel(column,taLeftJustify,0,'rp_padre','Rp Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_padre','Nombre Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'razapadrenombre','Raza Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'subcat_padre','Registro Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_padre','ABA/HBA Padre.',True);
   }
end;


procedure TFExpBraford.ArmarExcelNacimientosIndividales();
var column: TxlColumn;
begin
       {
  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQGetAnimales;
  DTXLS.Title.Text := 'DECLARACION DE NACIMIENTOS INDIVIDUALES.';

  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_servicio','Nº Servicio.',True);

  AgregarColumnaExcel(column,taLeftJustify,0,'rp_padre','Rp Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_padre','Nombre Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'razapadrenombre','Raza Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'subcat_padre','Registro Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_padre','ABA/HBA Padre.',True);

  AgregarColumnaExcel(column,taLeftJustify,0,'fecha_nacimiento','Fecha Nacimiento Cría.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp','RP Cría.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nomsexo','Sexo Cría.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'subcat','Reg. Cría.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp_madre_biologica','RP Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'aba_madre_biologica','A.B.A. Madre.',True);
      }
end;

procedure TFExpBraford.ArmarExcelNacimientosAnexo();
var column: TxlColumn;
begin {

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQGetAnimales;
  DTXLS.Title.Text:= 'NACIMIENTOS COLECTIVOS (DETALLE CRIAS / MADRES).';

  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_servicio','Nº Servicio.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp','RP Cría.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nomsexo','Sexo Cría.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'subcat','Reg. Cría.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp_madre_biologica','RP Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'aba_madre_biologica','A.B.A. Madre.',True);
     }
end;

procedure TFExpBraford.ArmarExcelListadoServicios();
var column: TxlColumn;
begin
       {
  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQGetAnimales;
  DTXLS.Title.Text:= 'DECLARACION DE NACIMIENTOS COLECTIVOS (SERVICIOS COLECTIVOS).';

  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_servicio','Nº de Servicio.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'cant','Nº Vientres Entorados.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'machos','Nº Terneros Nacidos.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hembras','Nº Terneras Nacidas.',True);
       }
end;

procedure TFExpBraford.AgregarColumnaExcel(var column: TxlColumn;
  alig: TAlignment; coldwidth: Integer; datafield, title: String;
  save: Boolean);
begin   {
    column:= TxlColumn.Create(nil);
    column:= DTXLS.Columns.Add;
    column.Alignment:= alig;
    column.ColWidth:= coldwidth;
    column.DataField:= datafield;
    column.Save:= save;
    column.Title:= title;  }
end;

procedure TFExpBraford.FormCreate(Sender: TObject);
begin
  inherited;
{
  DTPDesde.Date := Now();
  DTPHasta.Date := Now();

  fechaDesde := DTPDesde.Date;
  fechaHasta := DTPHasta.Date;
 }
end;

procedure TFExpBraford.DTPDesdeChange(Sender: TObject);
begin
  inherited;
//  fechaDesde := DTPDesde.Date;
end;

procedure TFExpBraford.DTPHastaChange(Sender: TObject);
begin
  inherited;
//  fechaHasta := DTPHasta.Date;
end;

procedure TFExpBraford.Exportar(item : integer);
var cartel : TCartel;
begin {

  if not(IBQGetAnimales.IsEmpty) then
  begin
    if SDXLS.Execute then
    begin
      cartel := TCartel.getInstance;
      cartel.abrircartel('Exportando datos a Excel...');

      if (item = 1) then
        ArmarExcelListadoServicios;

      if (item = 2) then
        ArmarExcelNacimientosAnexo;

      if (item = 3) then
        ArmarExcelNacimientosIndividales;

      if (item = 4) then
        ArmarExcelServiciosColectivos;

      if (item = 5) then
        ArmarExcelServiciosColectivosDetalle;

      if (item = 6) then
        ArmarExcelServiciosIndividuales;

      DTXLS.SaveToFile(SDXLS.FileName);
      cartel.cerrarcartel;
      cartel.FreeInstance;
    end
  end
  else
      MostrarMensaje(tmInformacion,'No existen animales que hayan nacido en el período de fechas indicado.'); }
end;

procedure TFExpBraford.IExpNacimientosColectivosClick(sender: TObject);
begin {

  IBQGetAnimales.Close;
  IBQGetAnimales.SQL.Clear;
  IBQGetAnimales.SQL.Add('select nombre_servicio, count(rp_madre_biologica) as cant, sum(cant_machos) as machos, sum(cant_hembras) as hembras from rep_export_nacimientos_braford(:esta,:desde,:hasta) where servicio = 20 group by nombre_servicio');
  IBQGetAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGetAnimales.ParamByName('desde').AsDate := fechaDesde;
  IBQGetAnimales.ParamByName('hasta').AsDate := fechaHasta;
  IBQGetAnimales.Open;

  Exportar(1);
               }
end;


procedure TFExpBraford.IExpNacColectivosAnexoClick(Sender: TObject);
begin  {

  IBQGetAnimales.Close;
  IBQGetAnimales.SQL.Clear;
  IBQGetAnimales.SQL.Add('select nombre_servicio, rp, nomsexo, subcat, rp_madre_biologica, aba_madre_biologica from rep_export_nacimientos_braford(:esta,:desde,:hasta) where servicio = 20 group by nombre_servicio, rp, nomsexo, subcat, rp_madre_biologica, aba_madre_biologica');
  IBQGetAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGetAnimales.ParamByName('desde').AsDate := fechaDesde;
  IBQGetAnimales.ParamByName('hasta').AsDate := fechaHasta;
  IBQGetAnimales.Open;

  Exportar(2);
         }
end;

procedure TFExpBraford.IExpNacIndividualesClick(Sender: TObject);
begin
       {
  IBQGetAnimales.Close;
  IBQGetAnimales.SQL.Clear;
  IBQGetAnimales.SQL.Add('select nombre_servicio, fecha_nacimiento, rp, nomsexo, subcat, rp_madre_biologica, aba_madre_biologica, rp_padre, nombre_padre, subcat_padre, razapadrenombre, hba_padre from rep_export_nacimientos_braford(:esta,:desde,:hasta) where servicio = 28');
  IBQGetAnimales.SQL.Add(' group by nombre_servicio, fecha_nacimiento, rp, nomsexo, subcat, rp_madre_biologica, aba_madre_biologica, rp_padre, nombre_padre, subcat_padre, razapadrenombre, hba_padre');
  IBQGetAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGetAnimales.ParamByName('desde').AsDate := fechaDesde;
  IBQGetAnimales.ParamByName('hasta').AsDate := fechaHasta;
  IBQGetAnimales.Open;

  Exportar(3);  }

end;

procedure TFExpBraford.IExpServColectivosClick(Sender: TObject);
begin
      {
  IBQGetAnimales.Close;
  IBQGetAnimales.SQL.Clear;
  IBQGetAnimales.SQL.Add('select * from rep_export_nacimientos_braford(:esta,:desde,:hasta) sp join tab_servicios ts on sp.id_servicio = ts.id_servicio where sp.servicio = 20 order by sp.nombre_servicio');
  IBQGetAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGetAnimales.ParamByName('desde').AsDate := fechaDesde;
  IBQGetAnimales.ParamByName('hasta').AsDate := fechaHasta;
  IBQGetAnimales.Open;

  Exportar(4);  }

end;

procedure TFExpBraford.IExpSerColecDetalleClick(Sender: TObject);
begin  {

  IBQGetAnimales.Close;
  IBQGetAnimales.SQL.Clear;
  IBQGetAnimales.SQL.Add('select * from rep_export_nacimientos_braford(:esta,:desde,:hasta) where servicio = 20 order by nombre_servicio');
  IBQGetAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGetAnimales.ParamByName('desde').AsDate := fechaDesde;
  IBQGetAnimales.ParamByName('hasta').AsDate := fechaHasta;
  IBQGetAnimales.Open;

  Exportar(5); }

end;

procedure TFExpBraford.IExpServIndividualesClick(Sender: TObject);
begin {

  IBQGetAnimales.Close;
  IBQGetAnimales.SQL.Clear;
  IBQGetAnimales.SQL.Add('select * from rep_export_nacimientos_braford(:esta,:desde,:hasta) where servicio = 28 order by nombre_servicio');
  IBQGetAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGetAnimales.ParamByName('desde').AsDate := fechaDesde;
  IBQGetAnimales.ParamByName('hasta').AsDate := fechaHasta;
  IBQGetAnimales.Open;

  Exportar(6);  }

end;

procedure TFExpBraford.IExpFlushingClick(Sender: TObject);
var F : TFExpBrafordFlushing;
begin

    F := TFExpBrafordFlushing.Create(self);
    F.ShowModal;
    F.Destroy;
end;

procedure TFExpBraford.ITransferenciaClick(Sender: TObject);
var F : TFExpBrafordTransferencia;
begin
    F := TFExpBrafordTransferencia.Create(self);
    F.ShowModal;
    F.Destroy;
end;

procedure TFExpBraford.INacimientosClick(Sender: TObject);
var F : TFExpBrafordNacimientos;
begin
    F := TFExpBrafordNacimientos.Create(self);
    F.ShowModal;
    F.Destroy;
end;

procedure TFExpBraford.IServiciosClick(Sender: TObject);
var F : TFExpBrafordServicios;
begin
    F := TFExpBrafordServicios.Create(self);
    F.ShowModal;
    F.Destroy;
end;

procedure TFExpBraford.IFlushingClick(Sender: TObject);
var F : TFExpBrafordFlushing;
begin
    F := TFExpBrafordFlushing.Create(self);
    F.ShowModal;
    F.Destroy;
end;

procedure TFExpBraford.IImplantesClick(Sender: TObject);
var F : TFExpBrafordImplantes;
begin
    F := TFExpBrafordImplantes.Create(self);
    F.ShowModal;
    F.Destroy;
end;

procedure TFExpBraford.Image9Click(Sender: TObject);
var F : TFExpBrafordInspeccion;
begin
    F := TFExpBrafordInspeccion.Create(self);
    F.ShowModal;
    F.Destroy;
end;

procedure TFExpBraford.IBajasClick(Sender: TObject);
var F : TFExpBrafordBaja;
begin

    F := TFExpBrafordBaja.Create(self);
    F.ShowModal;
    F.Destroy;
end;

procedure TFExpBraford.IVientresClick(Sender: TObject);
var F : TFExpBrafordVientresEmpadronar;
begin
    F := TFExpBrafordVientresEmpadronar.Create(self);
    F.ShowModal;
    F.Destroy;
end;

procedure TFExpBraford.Image5Click(Sender: TObject);
var F : TFRepListadoAnimalesFenotipos;
begin

    F := TFRepListadoAnimalesFenotipos.Create(self);
    F.ShowModal;
    F.Destroy;

end;

procedure TFExpBraford.Image1Click(Sender: TObject);
begin
  inherited;
  Image5Click(Sender);
end;

end.
