unit UEveEvaluacionPreservicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, EditAuto, Mask, DBCtrls,
  UDBLookupComboBoxAuto, DateTimePickerAuto, UDBDateTimePickerAuto,
  DataExport, DataToXLS, WinXP, ImgList, PngImageList, JvExControls,
  JvLabel, PngImage, JvExExtCtrls, JvImage, jpeg, JvGIF, JvComponentBase,
  JvBalloonHint, xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveEvaluacionPreservicio = class(TFEveSimple)
    IBQCriteriosPreservicio: TIBQuery;
    DataSource1: TDataSource;
    IBQRechazo: TIBQuery;
    DSRechazo: TDataSource;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleEW: TIBStringField;
    IBDSSimpleI2: TIntegerField;
    IBDSSimpleI3: TIntegerField;
    IBDSSimpleF1: TFloatField;
    IBDSSimpleF2: TFloatField;
    IBDSSimpleF3: TFloatField;
    IBDSSimpleVUNO1: TIBStringField;
    IBDSSimpleF4: TFloatField;
    IBDSSimpleF5: TFloatField;
    IBDSSimpleVUNO2: TIBStringField;
    IBDSSimpleVUNO3: TIBStringField;
    IBDSSimpleV1: TIBStringField;
    IBDSSimpleVUNO4: TIBStringField;
    IBDSSimpleV2: TIBStringField;
    IBDSSimpleV3: TIBStringField;
    IBDSSimpleVUNO5: TIBStringField;
    IBDSSimpleV6: TIBStringField;
    IBQFechaNac: TIBQuery;
    IBDSSimpleD1: TDateField;
    IBDSSimpleOBSERVACION: TIBStringField;
    PAprueba: TPanel;
    PDatosGrales: TPanel;
    LFecha: TLabel;
    LResponsable: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    DTPAFecha: TDateTimePickerAuto;
    PPeso: TPanel;
    LPeso: TLabel;
    LKilos: TLabel;
    MEPeso: TEditAuto;
    PGDR: TPanel;
    LGDR: TLabel;
    DBLCBGDR: TDBLookupComboBoxAuto;
    Pbrucelosis: TPanel;
    CBbrucelosis: TCheckBox;
    PAreaPelvica: TPanel;
    LAreaPelvica: TLabel;
    LAlto: TLabel;
    LAncho: TLabel;
    Lcm1: TLabel;
    Lcm2: TLabel;
    LTituloPelv: TLabel;
    AreaPelvica: TEdit;
    MEAlto: TEditAuto;
    MEAncho: TEditAuto;
    PFrame: TPanel;
    LAltura: TLabel;
    LUnidadMedida: TLabel;
    LEdad: TLabel;
    LPulgadas: TLabel;
    LDias: TLabel;
    LFrame: TLabel;
    Frame: TEdit;
    MEAltura: TEditAuto;
    Panel1: TPanel;
    LRechazo: TLabel;
    DBLCBARechazo: TDBLookupComboBoxAuto;
    PPrenezRobo: TPanel;
    CBPrenez: TCheckBox;
    PResultado: TPanel;
    LResultado: TLabel;
    MCausaRechazo: TMemo;
    CBAprobarManual: TCheckBox;
    CBDesaprobarManual: TCheckBox;
    MCausaAprobado: TMemo;
    CBFrame: TCheckBox;
    CBGDR: TCheckBox;
    CBPelvimetria: TCheckBox;
    CBPeso: TCheckBox;
    CBRechazo: TCheckBox;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleF6: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Change(Sender: TField);
    procedure PCBasicoChange(Sender: TObject);
    procedure DBLCBGDRExit(Sender: TObject);
    procedure DBLCBGDRDropDown(Sender: TObject);
    procedure DBLCBGDRKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLCBGDRClick(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure CBPrenezClick(Sender: TObject);
    procedure IBDSSimpleF1Change(Sender: TField);
    procedure DTPAFechaCloseUp(Sender: TObject);
    procedure BDBGSimpleDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BDBGSimpleCellClick(Column: TColumn);
    procedure IBDSSimpleV2SetText(Sender: TField; const Text: String);
    procedure MEPesoKeyPress(Sender: TObject; var Key: Char);
    procedure MEAlturaExit(Sender: TObject);
    procedure MEAlturaChange(Sender: TObject);
    procedure MEAltoChange(Sender: TObject);
    procedure MEAnchoChange(Sender: TObject);
    procedure MCausaAprobadoKeyPress(Sender: TObject; var Key: Char);
    procedure MCausaRechazoKeyPress(Sender: TObject; var Key: Char);
    procedure IBDSSimpleF1SetText(Sender: TField; const Text: String);
    procedure IBDSSimpleF2SetText(Sender: TField; const Text: String);
    procedure IBDSSimpleF3SetText(Sender: TField; const Text: String);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure CBClick(Sender: TObject);
    procedure BBXlsImportClick(Sender: TObject);
    procedure SetText(Sender: TField; const Text: String);
    procedure LRechazoMouseEnter(Sender: TObject);
    procedure LRechazoMouseLeave(Sender: TObject);
    procedure LRechazoClick(Sender: TObject);
    procedure IBDSSimpleF6SetText(Sender: TField; const Text: String);
    procedure BDBGSimpleKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    CriterioDesaprobado,CriterioAprobado,CriterioBD: String;
    bAP, bGDR, bRechazo, bPpR : Boolean;
    procedure HandlerOnExitAltura(Sender: TObject);
    procedure HandlerOnExitAlto(Sender: TObject);
    procedure HandlerOnExitAncho(Sender: TObject);
    procedure HandlerOnExitPeso(Sender: TObject);
    procedure EvaluarDeControles();
    function EvaluarAnimal(gdr:integer; peso:real; frame:real; AreaPelvica: real; altura:double; alto,ancho:real;prenez:integer; rechazo:integer):Boolean;
    function RevisarValores(altura:double; alto:real; ancho:real; peso:real):Boolean;
    procedure CambiarValorColumna(Column: TColumn);
    procedure HabilitarOpciones(Sender : TObject);
  protected
    Procedure CargarParametrosRN;override;
    procedure LoadSQLStringList; override;
    procedure CargarParametrosSP; override;
    procedure CargarParametrosMasivo; override;
    procedure CargarDatosGrilla; override;
    procedure cargarDatos(i:integer);override;
    procedure continuarGrilla;override;
    procedure configurarColumnasACargar;override;
    procedure acomodarGrilla;override;
  public
    { Public declarations }
  end;

var
  FEveEvaluacionPreservicio: TFEveEvaluacionPreservicio;
implementation

uses UDMSoftvet, UPrincipal, DateUtils, StdConvs, UEveUniversal,UFunctions,
  UUniversal, UMensajeHuella, UABMEmpleados, UImportacion, UAbmRechazosPreservicio, UTraduccion;

{$R *.dfm}

procedure TFEveEvaluacionPreservicio.FormShow(Sender: TObject);
begin
  inherited;
//  MSimple.PasarParametros(2,0);//cambie codigo
  MSimple.PasarParametros(2,8);//cambie codigo
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  IBQCriteriosPreservicio.Close;
  IBQCriteriosPreservicio.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQCriteriosPreservicio.Open;
 { IBQRechazo.Close;
  IBQRechazo.Open;}
  DMSoftvet.IBQRechazo.Close;
  DMSoftvet.IBQRechazo.Open;
  {IBQRechazo.Last;
  IBQRechazo.First;}
  DBLCBARechazo.KeyValue := 0;
  MSimple.DBLCBCategoria.KeyValue := 1;
  MSimple.ControlarBotones;
  CBAprobarManual.Visible := False;
  CBDesaprobarManual.Visible := False;
  DTPAFecha.Date := now;
//  DTPAFecha.MaxDate:= now;    
  DBLCBAResponsable.KeyValue := 0;
  DBLCBGDR.KeyValue := 0;

  if not(ConManga)then
  begin
    IBQFechaNac.Close;
    IBQFechaNac.ParamByName('IDANIMAL').AsInteger := IDANIMAL;
    IBQFechaNac.Open;
    DBLCBGDR.KeyValue := IBQFechaNac.FieldValues['gdr'];
    LEdad.Caption := Traducir('Edad: ')+ CantidadMeses(IBQFechaNac.FieldValues['Fecha_nacimiento'],DTPAFecha.DateTime);
    LDias.Caption := IntToStr(CantidadDias(DTPAFecha.DateTime, IBQFechaNac.FieldValues['Fecha_nacimiento']))+ Traducir(' Dias.');

  end;
  {if (ModoEve = meMasivo)then
  begin
    LGDR.Enabled := false;
    DBLCBGDR.Enabled := false;
  end;                        }

  //DecimalSeparator:='.';  
end;

procedure TFEveEvaluacionPreservicio.FormCreate(Sender: TObject);
begin
  inherited;
  sysutils.CurrencyDecimals:=2;
  //sysutils.decimalseparator:='.';
  //sysutils.thousandseparator:=',';
  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, id_ie, fecha_nacimiento, gdr, sinonimo, nombre, apodo from vis_evaluacion_Preservicio ';
  MEAltura.SetOnExit(HandlerOnExitAltura);
  MEAlto.SetOnExit(HandlerOnExitAlto);
  MEAncho.SetOnExit(HandlerOnExitAncho);
  MEPeso.SetOnExit(HandlerOnExitPeso);
  acomodarGrilla;
end;

procedure TFEveEvaluacionPreservicio.PCBasicoChange(Sender: TObject);
var  hoy : TDateTime;
begin
  inherited;
  if(PCBasico.ActivePage = TSDatos) then
  begin
      //MEAltura.SetFocus;
      if (ModoEve = meIndividual) and (MSimple.hay_animales)  then
          begin
            IBQFechaNac.Close;
            IBQFechaNac.ParamByName('IDANIMAL').AsInteger := IDANIMAL;
            IBQFechaNac.Open;

            hoy := DTPAFecha.DateTime;
            LEdad.Visible := true;
            LDias.Visible := true;
            LFrame.Visible := true;
            LAreaPelvica.Visible := true;
            PResultado.Visible := true;
            LEdad.Caption := Traducir('Edad: ' )+ CantidadMeses(MSimple.IBQSeleccionados.FieldValues['Fecha_nacimiento'], hoy);
            LDias.Caption := IntToStr(CantidadDias(hoy, MSimple.IBQSeleccionados.FieldValues['Fecha_nacimiento']))+ Traducir(' Dias.');
            DBLCBGDR.KeyValue := IBQFechaNac.FieldValues['gdr'];
            //LGDR.Enabled := true;
            //DBLCBGDR.Enabled := true;
            EvaluarDeControles;
         end
         else if ((ModoEve = meMasivo) and (MSimple.hay_animales)) or cargaXLS then
          begin
            LEdad.Visible := false;
            LDias.Visible := false;
            LFrame.Visible := false;
            LAreaPelvica.Visible := false;
            PResultado.Visible := false;
            //LGDR.Enabled := false;
            //DBLCBGDR.Enabled := false;
            //DBLCBGDR.KeyValue := 0;
            DBLCBARechazo.KeyValue := 0;
            IBDSSimple.Edit;
          end
          else begin
            MostrarMensaje(tmAdvertencia, 'Debe Seleccionar animales para evaluar');
            PCBasico.ActivePageIndex := 0;
          end;
    end;
    ControlEventoOnExit(self); //para manejar la visulaizacion de la grilla detalle
    if(PCBasico.ActivePage = TSGrilla) then
        acomodarGrilla;
end;


procedure TFEveEvaluacionPreservicio.DBLCBGDRExit(Sender: TObject);
begin
  inherited;
  //MEAlto.SetFocus;
  GetEvent(Sender);
end;


function TFEveEvaluacionPreservicio.EvaluarAnimal(gdr: integer; peso: real; frame:real; AreaPelvica: real; altura:double; alto:real; ancho:real; prenez:integer; rechazo:integer): Boolean;
var pGDRMin, pFrameMin, pFrameMax, pAreaPelvMin, pAreaPelvMax : integer;
    pPeso: double;
begin
   CriterioAprobado := '';
   CriterioDesaprobado := '';
   CriterioBD := '';
   bAP := false;
   bGDR := false;
   bRechazo := false;
   bPpR := false;
   MCausaRechazo.Visible := False;
   MCausaAprobado.Visible := False;
   CBAprobarManual.Visible := False;
   CBDesaprobarManual.Visible := False;
   CBDesaprobarManual.Checked := False;
   CBAprobarManual.Checked := False;
   MCausaRechazo.Lines.Clear;
   MCausaAprobado.Lines.Clear;
   EvaluarAnimal := True;
   // Ubico y recupero el peso.
   IBQCriteriosPreservicio.Locate('NOMBRE','MPMINPE',[]);
   pPeso := IBQCriteriosPreservicio.FieldValues['VALOR'];
   // Ubico y recupero el Gdr.
   IBQCriteriosPreservicio.Locate('NOMBRE','MPMINGDR',[]);
   pGDRMin := IBQCriteriosPreservicio.FieldValues['VALOR'];
   // Ubico y recupero el frame min.
   IBQCriteriosPreservicio.Locate('NOMBRE','MPMINFR',[]);
   pFrameMin := IBQCriteriosPreservicio.FieldValues['VALOR'];
   // Ubico y recupero el frame max.
   IBQCriteriosPreservicio.Locate('NOMBRE','MPMAXFR',[]);
   pFrameMax := IBQCriteriosPreservicio.FieldValues['VALOR'];
   // Ubico y recupero el area pelvica min.
   IBQCriteriosPreservicio.Locate('NOMBRE','MPMINAP',[]);
   pAreaPelvMin := IBQCriteriosPreservicio.FieldValues['VALOR'];
   // Ubico y recupero el area pelvica max.
   IBQCriteriosPreservicio.Locate('NOMBRE','MPMAXAP',[]);
   pAreaPelvMax := IBQCriteriosPreservicio.FieldValues['VALOR'];


   ///FRAME
   if CBFrame.Checked then
   begin
      BDBGSimple.Columns[6].Visible := true;
      BDBGSimple.Columns[7].Visible := true;

      if ((frame > pFrameMax) and (altura <> 0)) then
      begin
          MCausaRechazo.Lines.Add(Traducir('Frame Grande'));
          CriterioDesaprobado := CriterioDesaprobado + ' FR';
          EvaluarAnimal := Result and False;
      end
      else if ((frame < pFrameMin) and (altura <> 0)) then
           begin
              MCausaRechazo.Lines.Add(Traducir('Frame Chico'));
              CriterioDesaprobado := CriterioDesaprobado + ' FR';
              EvaluarAnimal := Result and False;
           end
           else if (altura <> 0) then
                begin
                    MCausaAprobado.Lines.Add(Traducir('Frame'));
                    CriterioAprobado := CriterioAprobado + ' FR';
                    EvaluarAnimal := Result and True;
                end;
   end
   else
   begin
      BDBGSimple.Columns[6].Visible := false;
      BDBGSimple.Columns[7].Visible := false;

      EvaluarAnimal := Result and True;   //Si no selecciono la opcion va aprobado
   end;

   ////GDR
   if CBGDR.Checked then
   begin
      BDBGSimple.Columns[8].Visible := true;

      bGDR := true;
      CriterioBD := CriterioBD+'GDR: '+DBLCBGDR.Text;

      if gdr < pGDRMin then
      begin
          MCausaRechazo.Lines.Add(Traducir('GDR bajo'));
          CriterioDesaprobado := CriterioDesaprobado + ' GDR';
          EvaluarAnimal :=  Result and False;
      end
      else
      begin
          MCausaAprobado.Lines.Add(Traducir('GDR'));
          CriterioAprobado := CriterioAprobado + ' GDR';
          EvaluarAnimal := Result and True;
      end;
   end
   else
   begin
      BDBGSimple.Columns[8].Visible := false;

      EvaluarAnimal := Result and TRUE; //Si no selecciono la opcion va aprobado
   end;


   ////Area Pelvica
   if CBPelvimetria.Checked then
   begin
      BDBGSimple.Columns[9].Visible := true;
      BDBGSimple.Columns[10].Visible := true;
      BDBGSimple.Columns[11].Visible := true;


      CriterioBD := CriterioBD+' AP: '+FormatFloat('##.##',alto*ancho);
      bAP := true;

      if ((AreaPelvica > pAreaPelvMax) and (alto <> 0) and (ancho <> 0)) then
      begin
          MCausaRechazo.Lines.Add(Traducir('Area Pélvica Grande'));
          CriterioDesaprobado := CriterioDesaprobado + ' AP';
          EvaluarAnimal := Result and False;
      end
      else if ((AreaPelvica < pAreaPelvMin) and (alto <> 0) and (ancho <> 0)) then
           begin
              MCausaRechazo.Lines.Add(Traducir('Area Pélvica Chica'));
              CriterioDesaprobado := CriterioDesaprobado + ' AP';
              EvaluarAnimal := Result and False;
           end
           else if ((alto <> 0) and (ancho <> 0))then
                begin
                    MCausaAprobado.Lines.Add(Traducir('Area Pélvica'));
                    CriterioAprobado := CriterioAprobado + ' AP';
                    EvaluarAnimal := Result and True;
                end;
   end
   else
   begin
      BDBGSimple.Columns[9].Visible := false;
      BDBGSimple.Columns[10].Visible := false;
      BDBGSimple.Columns[11].Visible := false;

      EvaluarAnimal := Result and TRUE;  //Si no selecciono la opcion va aprobado
   end;


   ////PESO
   if CBPeso.Checked then
   begin
      BDBGSimple.Columns[12].Visible := true;

      if ((peso < pPeso) and (peso <> 0)) then
      begin
          MCausaRechazo.Lines.Add(Traducir('Peso bajo'));
          CriterioDesaprobado := CriterioDesaprobado + ' PE';
          EvaluarAnimal :=  Result and False;
      end
      else if (peso <> 0) then
           begin
              MCausaAprobado.Lines.Add(Traducir('Peso'));
              CriterioAprobado := CriterioAprobado + ' PE';
              EvaluarAnimal := Result and True;
           end;
   end
   else
   begin
      BDBGSimple.Columns[12].Visible := false;

      EvaluarAnimal := Result and TRUE; //Si no selecciono la opcion va aprobado
   end;

   if prenez = 1 then
   begin
      CriterioBD := CriterioBD+' Preñez por Robo';
      bPpR := true;

      MCausaRechazo.Lines.Add(Traducir('Preñez por Robo'));
      CriterioDesaprobado := CriterioDesaprobado + ' PpR';
      EvaluarAnimal :=  Result and False;
   end
   else
   begin
        if CBPeso.Checked then
        begin
            if (peso <> 0) then
            begin
              MCausaAprobado.Lines.Add(Traducir('Preñez'));
              CriterioAprobado := CriterioAprobado + ' Pñ';
              EvaluarAnimal := Result and True;
            end;
        end
        else
          EvaluarAnimal := Result and TRUE; //Si no selecciono la opcion va aprobado
   end;


   if CBRechazo.Checked then
   begin
      BDBGSimple.Columns[14].Visible := true;

      bRechazo := true;
      CriterioBD := CriterioBD+' Rechazo: '+DBLCBARechazo.Text;

      if (rechazo <> 0) then
      begin
          MCausaRechazo.Lines.Add({IBQRechazo}DMSoftvet.IBQRechazo.Lookup('ID_RECHAZO',rechazo,'NOMBRE'));
          CriterioDesaprobado := CriterioDesaprobado +' '+ {IBQRechazo}DMSoftvet.IBQRechazo.Lookup('ID_RECHAZO',rechazo,'CODIGO'); //' Cod Rechazo';
          EvaluarAnimal :=  Result and False;
      end;
   end
   else
   begin
      BDBGSimple.Columns[14].Visible := false;

      EvaluarAnimal := Result and TRUE;
   end;



   if (ModoEve = meIndividual) then
      if not Result then
      begin
          LResultado.Caption := Traducir('Animal No Apto por:');
          LResultado.Font.Color := clRed;
          MCausaRechazo.Visible := True;
          MCausaRechazo.BringToFront;
          CBAprobarManual.Visible := True;
      end
      else
      begin
          LResultado.Caption := Traducir('Animal Apto');
          LResultado.Font.Color := clBlue;
          CBDesaprobarManual.Visible := True;
          MCausaAprobado.Visible := True;
          MCausaAprobado.BringToFront;
      end
   else  // es masivo.
      if not Result then
      begin
          // Animal Rechazado
          IBDSSimple.FieldValues['VUNO2'] := '';
          IBDSSimple.FieldValues['VUNO2'] := 'N';
          IBDSSimple.FieldValues['V6'] := 'NEGATIVO';
          IBDSSimple.FieldValues['V1']    := CriterioDesaprobado;
      end
      else
      begin
          // Animal Aprobado
          IBDSSimple.FieldValues['VUNO2'] := '';
          IBDSSimple.FieldValues['VUNO2'] := 'P';
          IBDSSimple.FieldValues['V6'] := 'POSITIVO';
          IBDSSimple.FieldValues['V1']    := CriterioAprobado;
      end
end;

function TFEveEvaluacionPreservicio.RevisarValores(altura :double; alto: real; ancho:real; peso: real): Boolean;
begin
  if Not((altura <> 0) and (alto <> 0) and (ancho <> 0) and (peso <> 0)) then
       begin
        MostrarMensaje(tmError, 'Faltan ingresar datos');
        RevisarValores := False;
       end
      else
       RevisarValores := True;
end;


procedure TFEveEvaluacionPreservicio.HandlerOnExitAltura(Sender: TObject);
var Pulgadas : Real;
    Dias: integer;
    hoy : TDateTime;
begin
  inherited;
  if (MEAltura.Text <> '')then
  begin
      hoy := DTPAFecha.DateTime;
      Pulgadas := StrToFloat(trim(MEAltura.Text))/ 2.54;
      Pulgadas := StrToFloat(FormatFloat('00.000',Pulgadas));
      LPulgadas.Caption := FloatToStr(Pulgadas)+ Traducir(' Pulgadas.');
      if (ModoEve = meIndividual) and (idanimal <> null) then
       begin
          IBQFechaNac.Close;
          IBQFechaNac.ParamByName('IDANIMAL').AsInteger := IDANIMAL;
          IBQFechaNac.Open;
          Dias := CantidadDias(hoy, IBQFechaNac.FieldValues['Fecha_nacimiento']);
          LEdad.Caption := Traducir('Edad: ') + CantidadMeses(IBQFechaNac.FieldValues['Fecha_nacimiento'],hoy);
          LDias.Caption := IntToStr(CantidadDias(hoy, IBQFechaNac.FieldValues['Fecha_nacimiento']))+ Traducir(' Dias.');
       end
      else
          Dias := CantidadDias(hoy, MSimple.IBQSeleccionados.FieldValues['Fecha_nacimiento']);

      LFrame.Visible:= true;    
      LFrame.Caption := Traducir('FRAME: ') + FloatToStr(CalcularFrameHembras(Pulgadas,Dias));
      Frame.Text := FloatToStr(CalcularFrameHembras(Pulgadas,Dias));
      //if(DBLCBGDR.Enabled)then
      //    DBLCBGDR.SetFocus;
      ControlEventoOnExit(self);
      if ModoEve = meIndividual then
        EvaluarDeControles;
  end
  else
     begin
        LFrame.Caption := '';
        LPulgadas.Caption:= '0'+Traducir(' Pulgadas.');
     end
end;

procedure TFEveEvaluacionPreservicio.HandlerOnExitAlto(Sender: TObject);
begin
  GetEvent(MEAlto);
  if(MEAncho.Text <> '')and (MEAlto.Text <> '')then
  begin
    LAreaPelvica.Visible:= true;
    LAreaPelvica.Caption := Traducir('Area Pélvica: ') + FloatToStr( StrTofloat(trim(MEAlto.Text)) * StrTofloat(trim(MEAncho.Text))) + Traducir(' Cm²');
    AreaPelvica.Text := FloatToStr( StrTofloat(trim(MEAlto.Text)) * StrTofloat(trim(MEAncho.Text)));
    //MEAncho.SetFocus;
    ControlEventoOnExit(self);
    if ModoEve = meIndividual then
          EvaluarDeControles;
  end;
end;

procedure TFEveEvaluacionPreservicio.HandlerOnExitAncho(Sender: TObject);
begin
  GetEvent(MEAncho);
  LAreaPelvica.Caption := '';
  if(MEAncho.Text <> '')and (MEAlto.Text <> '')then
  begin
    LAreaPelvica.Visible:= true;
    LAreaPelvica.Caption := Traducir('Area Pélvica: ') + FloatToStr( StrToFloat(trim(MEAlto.Text)) * StrToFloat(trim(MEAncho.Text))) + Traducir(' Cm²');
    AreaPelvica.Text := FloatToStr( StrToFloat(trim(MEAlto.Text)) * StrToFloat(trim(MEAncho.Text)));
    //MEPeso.SetFocus;
    ControlEventoOnExit(self);
    if ModoEve = meIndividual then
          EvaluarDeControles;
  end;
end;

procedure TFEveEvaluacionPreservicio.EvaluarDeControles;
var peso,frame1,AP,ancho,alto:real;
    rechazo:integer;
    prenez, gdr: integer;
    Altura: double;
begin
  inherited;
  if(MEPeso.Text = '')then
    peso  := 0
  else  peso  := StrTofloat(trim(MEPeso.Text));
  if(Frame.Text = '')then
    frame1 := 0
  else  frame1 := StrTofloat(trim(Frame.Text));
  if(AreaPelvica.Text = '')then
     AP    := 0
  else  AP    := StrTofloat(trim(AreaPelvica.Text));
  if(MEAlto.Text = '')then
    alto  := 0
  else  alto  := StrTofloat(trim(MEAlto.Text));
  if(MEAncho.Text='')then
    ancho := 0
  else ancho := StrTofloat(trim(MEAncho.Text));
  if(MEAltura.Text = '')then
    Altura:= 0
  else Altura:= StrToFloat(trim(MEAltura.Text));
  if CBPrenez.Checked then
     prenez := 1
    else
     prenez := 0;
  rechazo := DBLCBARechazo.KeyValue;
  if DBLCBGDR.KeyValue = null then
     gdr := 0
    else
     gdr := DBLCBGDR.KeyValue;
  EvaluarAnimal(gdr,peso,frame1,AP,Altura,alto,ancho,prenez,rechazo);
end;

procedure TFEveEvaluacionPreservicio.DBLCBGDRDropDown(Sender: TObject);
begin
  inherited;
  if ModoEve = meIndividual then
        EvaluarDeControles;
end;

procedure TFEveEvaluacionPreservicio.DBLCBGDRKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ModoEve = meIndividual then
        EvaluarDeControles;
end;

procedure TFEveEvaluacionPreservicio.DBLCBGDRClick(Sender: TObject);
begin
  inherited;
  if ModoEve = meIndividual then
        EvaluarDeControles;
end;

procedure TFEveEvaluacionPreservicio.HandlerOnExitPeso(Sender: TObject);
begin
  GetEvent(MEPeso);
  ControlEventoOnExit(self);
  if ModoEve = meIndividual then
        EvaluarDeControles;
end;

procedure TFEveEvaluacionPreservicio.CargarParametrosSP;
begin
  inherited;
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := null;
  IBQSPEventoInd.ParamByName('FECHA').Value := DTPAFecha.DateTime;
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IDANIMAL;
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := MAObservacion.Text;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := DBLCBAResponsable.KeyValue;

  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := DTPAFecha.DateTime;
  if MEAncho.Text = '' then
   IBQSPEventoInd.ParamByName('ANCHO').Value := 0
  else
   IBQSPEventoInd.ParamByName('ANCHO').Value := StrToFloat(MEAncho.Text);
  if MEAlto.Text = '' then
    IBQSPEventoInd.ParamByName('ALTO').Value := 0
   else
    IBQSPEventoInd.ParamByName('ALTO').Value := StrToFloat(MEAlto.Text);
  if MEAltura.Text = '' then
    IBQSPEventoInd.ParamByName('ALTURA').Value := 0
   else
    IBQSPEventoInd.ParamByName('ALTURA').Value := StrToFloat(MEAltura.Text);
  if CBPrenez.Checked then
    IBQSPEventoInd.ParamByName('ROBO').Value := 'S'
  else
    IBQSPEventoInd.ParamByName('ROBO').Value := 'N';
  if MEPeso.Text = '' then
    IBQSPEventoInd.ParamByName('PESO').Value := 0
   else
    IBQSPEventoInd.ParamByName('PESO').Value := StrToFloat(MEPeso.Text);
  IBQSPEventoInd.ParamByName('GDR').Value := DBLCBGDR.KeyValue;
  IBQSPEventoInd.ParamByName('RECHAZO').value := DBLCBARechazo.KeyValue;  //0 - no definido.
  IBQSPEventoInd.ParamByName('AP_MANUAL').AsString := 'N';
  if MCausaAprobado.Visible then
    IBQSPEventoInd.ParamByName('EVAL_CALCULADA').value := 'P'
  else
    IBQSPEventoInd.ParamByName('EVAL_CALCULADA').value := 'N';
    
  if (ModoEve = meIndividual)then
       begin
          IBQFechaNac.Close;
          IBQFechaNac.ParamByName('IDANIMAL').AsInteger := IDANIMAL;
          IBQFechaNac.Open;
          IBQSPEventoInd.ParamByName('EDAD').value := CantidadDias(now, IBQFechaNac.FieldValues['Fecha_nacimiento']);
       end
      else
        IBQSPEventoInd.ParamByName('EDAD').value := CantidadDias(DTPAFecha.DateTime, MSimple.IBQSeleccionados.FieldValues['Fecha_nacimiento']);

  if Frame.Text = '' then
     IBQSPEventoInd.ParamByName('FRAME').value := 0
    else
     IBQSPEventoInd.ParamByName('FRAME').value := StrToFloat(Frame.Text);
  if CBAprobarManual.Checked then
      IBQSPEventoInd.ParamByName('AP_MANUAL').value := 'S';
  if CBDesaprobarManual.Checked then
      IBQSPEventoInd.ParamByName('AP_MANUAL').value := 'N';
  if CBbrucelosis.Checked then
     IBQSPEventoInd.ParamByName('MUESTREO').value := 'S';

  IBQSPEventoInd.ParamByName('CRITERIO').AsString := CriterioBD;

end;

procedure TFEveEvaluacionPreservicio.ATerminarExecute(Sender: TObject);
begin
   if (NOT(MSimple.hay_animales) and (ModoEve = meMasivo)) then
     MostrarMensaje(tmError, 'Debe seleccionar animales para evaluar')
   else
     inherited;
end;

procedure TFEveEvaluacionPreservicio.CBPrenezClick(Sender: TObject);
begin
  inherited;
  if ModoEve = meIndividual then
    EvaluarDeControles;
end;

procedure TFEveEvaluacionPreservicio.CargarParametrosMasivo;
begin
  inherited;
  //cargo los parametros del SP.
  CriterioBD := '';
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').AsInteger;
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := IBDSSimple.FieldValues['RESPONSABLE'];

  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := now;
  IBQSPEventoInd.ParamByName('ANCHO').Value := IBDSSimple.FieldValues['F2']; //Ancho
  IBQSPEventoInd.ParamByName('ALTO').Value := IBDSSimple.FieldValues['F1'];  //Alto
  if bAP then
    CriterioBD := CriterioBD+' - AP: '+FormatFloat('##.##',IBDSSimple.FieldValues['F2']*IBDSSimple.FieldValues['F1'])+' cm²';
  IBQSPEventoInd.ParamByName('ALTURA').Value := IBDSSimple.FieldValues['F6']; // Altura
  if IBDSSimpleVUNO1.AsString = '0' then
    IBQSPEventoInd.ParamByName('ROBO').Value := 'N';
  if IBDSSimpleVUNO1.AsString = '1' then
  begin
    if bPpR then
      CriterioBD := CriterioBD+' - Preñez por Robo';
    IBQSPEventoInd.ParamByName('ROBO').Value := 'S';
  end;
  IBQSPEventoInd.ParamByName('PESO').Value := IBDSSimple.FieldValues['F3']; // Peso
  IBQSPEventoInd.ParamByName('GDR').Value := IBDSSimple.FieldValues['I2']; // GDR
  if bGDR then
    CriterioBD := CriterioBD+' - GDR: '+IBDSSimple.FieldValues['V2'];
  IBQSPEventoInd.ParamByName('RECHAZO').value := IBDSSimple.FieldValues['I3']; // 0 - no definido.
  if bRechazo then
    CriterioBD := CriterioBD+' - Rechazo: '+IBDSSimple.FieldValues['V3'];
  IBQSPEventoInd.ParamByName('EVAL_CALCULADA').value := IBDSSimple.FieldValues['VUNO2'];
  if IBDSSimpleVUNO4.AsString = '0' then
   IBQSPEventoInd.ParamByName('AP_MANUAL').value := 'N';
  if IBDSSimpleVUNO4.AsString = '1' then
   IBQSPEventoInd.ParamByName('AP_MANUAL').value := 'S';
  IBQSPEventoInd.ParamByName('EDAD').value := CantidadDias(DTPAFecha.DateTime, IBDSSimple.FieldValues['Fecha']);
  IBQSPEventoInd.ParamByName('FRAME').value := IBDSSimple.FieldValues['F4'];
  if IBDSSimpleVUNO5.AsString = '1' then
     IBQSPEventoInd.ParamByName('MUESTREO').value := 'S';

  IBQSPEventoInd.ParamByName('CRITERIO').AsString := CriterioBD;
end;

procedure TFEveEvaluacionPreservicio.CargarDatosGrilla;
var frameIndividual : Double;
    dias, preniez, brucelosis : integer;
    pulgadas, alto, ancho, areaP, peso, altura: double;
begin
  inherited;
  {if NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple) then
  begin
      IBDSSimple.Insert; }
      IBDSSimple.FieldByName('fecha').AsDateTime := DTPAFecha.Date;
      IBDSSimple.FieldByName('D1').AsDateTime := MSimple.IBQSeleccionados.FieldValues['FECHA_NACIMIENTO'];
      IBDSSimple.FieldByName('ID_rp').AsString := MSimple.IBQSeleccionados.FieldValues['ID_rp'];
      IBDSSimple.FieldByName('ID_ANIMAL').AsString := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
      IBDSSimple.FieldByName('ID_senasa').AsString := '';
      RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.Text]);
      RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('RESP')],[DBLCBAResponsable.KeyValue,DBLCBAResponsable.Text]);
      //IBDSSimple.FieldByName('RESPONSABLE').AsInteger := DBLCBAResponsable.KeyValue;
      if(MEAltura.Text= '')then
        altura := 0
      else
        altura := StrToFloat(MEAltura.Text);
      RealizarCambio(MEAltura,[IBDSSimple.FieldByName('F6')],[altura]);

      RealizarCambio(DBLCBGDR,[IBDSSimple.FieldByName('I2'),IBDSSimple.FieldByName('V2')],[DBLCBGDR.KeyValue,DBLCBGDR.Text]);
      //IBDSSimple.FieldByName('I2').AsInteger := DBLCBGDR.KeyValue;//MSimple.IBQSeleccionados.FieldValues['GDR'];
      //IBDSSimple.FieldByName('V2').Value:= DBLCBGDR.Text;
      RealizarCambio(DBLCBARechazo,[IBDSSimple.FieldByName('I3'),IBDSSimple.FieldByName('V3')],[DBLCBARechazo.KeyValue,DBLCBARechazo.Text]);
      //IBDSSimple.FieldByName('I3').AsInteger := DBLCBARechazo.KeyValue;
      //IBDSSimple.FieldByName('V3').AsString := DBLCBARechazo.Text;


      if(MEAlto.Text = '')then
        alto := 0
      else
        alto := StrToFloat(trim(MEAlto.Text));
      RealizarCambio(MEAlto,[IBDSSimple.FieldByName('F1')],[alto]);

      if(MEAncho.Text= '')then
        ancho := 0
      else
        ancho := StrToFloat(trim(MEAncho.Text));
      RealizarCambio(MEAncho,[IBDSSimple.FieldByName('F2')],[ancho]);

      if(MEPeso.Text= '')then
        peso := 0
      else
        peso := StrToFloat(trim(MEPeso.Text));
      RealizarCambio(MEPeso,[IBDSSimple.FieldByName('F3')],[peso]);

      if CBPrenez.Checked then
        preniez := 1
      else
        preniez := 0;
      RealizarCambio(CBPrenez,[IBDSSimple.FieldByName('VUNO1')],[preniez]);


      if(Frame.Text = '')then
        frameIndividual := 0
      else
        begin
          if(MEAltura.Text= '')then
            pulgadas:= 0
          else
            Pulgadas := StrToFloat(trim(MEAltura.Text))/ 2.54;

          dias := CantidadDias(DTPAFecha.DateTime, MSimple.IBQSeleccionados.FieldValues['FECHA_NACIMIENTO']);
          frameIndividual := CalcularFrameHembras(Pulgadas,Dias);
        end;
      RealizarCambio(Frame,[IBDSSimple.FieldByName('F4')],[frameIndividual]);
      //IBDSSimple.FieldByName('F4').AsFloat := frameIndividual;

      if(AreaPelvica.Text = '')then
        areaP := 0
      else
        areaP := StrToFloat(trim(AreaPelvica.Text));
      RealizarCambio(AreaPelvica,[IBDSSimple.FieldByName('F5')],[areaP]);

      IBDSSimple.FieldByName('V1').AsString := '';
      IBDSSimple.FieldByName('VUNO4').Value := 0;
                     //Evaluacion manual.
                    //MSimple.IBQSeleccionados.FieldValues['sinonimo']; // GDR.
      if CBbrucelosis.Checked then
        brucelosis := 1
      else
        brucelosis := 0;
      RealizarCambio(CBbrucelosis,[IBDSSimple.FieldByName('VUNO5')],[brucelosis]);
  //end;
end;

procedure TFEveEvaluacionPreservicio.IBDSSimpleF1Change(Sender: TField);
begin
  inherited;
  if ((IBDSSimple.FieldValues['F1'] <> null) And (IBDSSimple.FieldValues['F2'])) then
      IBDSSimple.FieldValues['F5'] := IBDSSimple.FieldValues['F1'] * IBDSSimple.FieldValues['F2']
    else
      IBDSSimple.FieldValues['F5'] := 0;
  EvaluarAnimal(1,251,3,1,Sender.AsInteger,1,1,0,0);
end;

//se activa cuando cambia el valor en un campo "NO Read Only".
procedure TFEveEvaluacionPreservicio.Change(Sender: TField);
var pulgadas : Double;
    Dias, gdr, rechazo : integer;
    hoy : TDateTime;
    frameNuevo, alto, ancho, area, peso, altura : Double;
    prenez, valor : integer;
begin
  inherited;

  altura := 0; alto := 0; ancho := 0; frameNuevo := 0;
  gdr := 0; peso := 0; rechazo := 0; area := 0;
//  prenez := 0;
  if (IBDSSimple.State <> dsInsert ) then
    case (Sender.Index) of
       6: begin      // ALTURA
            hoy := DTPAFecha.DateTime;
            if IBDSSimple.FieldValues['F6'] <> null then
                altura := IBDSSimple.FieldValues['F6'];
            pulgadas := altura / 2.54;
            Dias := CantidadDias(hoy, IBDSSimple.FieldValues['D1']);
            frameNuevo := CalcularFrameHembras(pulgadas,Dias);
            IBDSSimple.FieldValues['F4'] := frameNuevo;
          end;
       19: begin // GDR
          if IBDSSimple.FieldValues['I2'] <> null then
              IBDSSimple.FieldValues['I2'] :=  BDBGSimple.ColumnByField('V2').PickList.IndexOf(BDBGSimple.ColumnByField('V2').Field.AsString);
           end;
       20: begin // Rechazo
          if IBDSSimple.FieldValues['I3'] <> null then
              IBDSSimple.FieldValues['I3'] := BDBGSimple.ColumnByField('V3').PickList.IndexOf(BDBGSimple.ColumnByField('V3').Field.AsString);
          end;
       9: begin // Alto
          if ((IBDSSimple.FieldValues['F1'] <> null) And (IBDSSimple.FieldValues['F2'] <> null)) then
            IBDSSimple.FieldValues['F5'] := IBDSSimple.FieldValues['F1'] * IBDSSimple.FieldValues['F2']
          else
            IBDSSimple.FieldValues['F5'] := 0;
          if (IBDSSimple.FieldValues['F2'] <> null) then
            alto := IBDSSimple.FieldValues['F1'];
          end;
       10: begin // Ancho
          if ((IBDSSimple.FieldValues['F1'] <> null) And (IBDSSimple.FieldValues['F2'] <> null)) then
            IBDSSimple.FieldValues['F5'] := IBDSSimple.FieldValues['F1'] * IBDSSimple.FieldValues['F2']
          else
            IBDSSimple.FieldValues['F5'] := 0;
          if (IBDSSimple.FieldValues['F2'] <> null) then
            ancho := IBDSSimple.FieldValues['F2'];
          end;
       11: begin // Peso
            if IBDSSimple.FieldValues['F3'] <> null then
              peso := IBDSSimple.FieldValues['F3'];
          end;
       12: begin // Preñez por Robo.
             if (TryStrToInt(IBDSSimple.FieldValues['VUNO1'],valor)) then
             begin
                if (IBDSSimple.FieldValues['VUNO1'] = null) or (IBDSSimple.FieldValues['VUNO1'] < 0) or (IBDSSimple.FieldValues['VUNO1'] > 1) then
                  IBDSSimple.FieldValues['VUNO1'] := 0
                else
                begin
                    if IBDSSimple.FieldValues['VUNO1'] <> null then
                      prenez := {MARTIN: ESTO LO COMENTE POR EL HINT}IBDSSimple.FieldValues['VUNO1'];
                end
             end
             else
              IBDSSimple.FieldValues['VUNO1']:= 0;
          end;
       18: begin // Eval manual.
             if (TryStrToInt(IBDSSimple.FieldValues['VUNO4'],valor)) then
               begin
                if (IBDSSimple.FieldValues['VUNO4'] = null) or (IBDSSimple.FieldValues['VUNO4'] < 0) or (IBDSSimple.FieldValues['VUNO4'] > 1) then
                  IBDSSimple.FieldValues['VUNO4']:= 0;
               end
              else
                   IBDSSimple.FieldValues['VUNO4']:= 0;
          end;
       21: begin // Sangrado.
             if (TryStrToInt(IBDSSimple.FieldValues['VUNO5'],valor)) then
               begin
                if (IBDSSimple.FieldValues['VUNO5'] = null) or (IBDSSimple.FieldValues['VUNO5'] < 0) or (IBDSSimple.FieldValues['VUNO5'] > 1)then
                  IBDSSimple.FieldValues['VUNO5']:= 0;
               end
              else
                   IBDSSimple.FieldValues['VUNO5']:= 0;
          end;
    end; //del CASE.

    if IBDSSimple.FieldValues['F4'] <> null then
       frameNuevo := IBDSSimple.FieldValues['F4'];
    if IBDSSimple.FieldValues['I2'] <> null then
       gdr := IBDSSimple.FieldValues['I2'];
    if IBDSSimple.FieldValues['I3'] <> null then
       rechazo := IBDSSimple.FieldValues['I3'];
    if IBDSSimple.FieldValues['F3'] <> null then
       peso := IBDSSimple.FieldValues['F3'];
    if IBDSSimple.FieldValues['F6'] <> null then
       altura := IBDSSimple.FieldValues['F6'];
    if IBDSSimple.FieldValues['F1'] <> null then
       alto := IBDSSimple.FieldValues['F1'];
    if IBDSSimple.FieldValues['F2'] <> null then
       ancho := IBDSSimple.FieldValues['F2'];
    if IBDSSimple.FieldValues['F5'] <> null then
       area := IBDSSimple.FieldValues['F5'];
    if IBDSSimple.FieldValues['F4'] <> null then
       frameNuevo := IBDSSimple.FieldValues['F4'];
    if IBDSSimple.FieldValues['VUNO1'] = null then
      prenez := 0
     else
      prenez := IBDSSimple.FieldValues['VUNO1'];
    EvaluarAnimal(gdr,peso,frameNuevo,area,altura,alto,ancho,prenez,rechazo);
end;

procedure TFEveEvaluacionPreservicio.DTPAFechaCloseUp(Sender: TObject);

begin
  inherited;
  IBQFechaNac.Close;
  IBQFechaNac.ParamByName('IDANIMAL').AsInteger := IDANIMAL;
  IBQFechaNac.Open;

  LFrame.Visible := true;
  LAreaPelvica.Visible := true;
  PResultado.Visible := true;
  // VER EVALUAR DE CONTROLES, PORQUE EN UNA RAMA DEL IF ESTA COMENTADO
//  LEdad.Caption := 'Edad: ' + CantidadMeses(IBQFechaNac.FieldValues['Fecha_nacimiento'],DTPAFecha.DateTime);
//  LDias.Caption := IntToStr(CantidadDias(DTPAFecha.DateTime,IBQFechaNac.FieldValues['Fecha_nacimiento']))+ ' Dias.';
//  LEdad.Visible := ModoEve = meIndividual;
//  LDias.Visible := ModoEve = meIndividual;
  if ModoEve = meIndividual then
   begin
    LEdad.Caption := Traducir('Edad: ') + CantidadMeses(IBQFechaNac.FieldValues['Fecha_nacimiento'],DTPAFecha.DateTime);
    LDias.Caption := IntToStr(CantidadDias(DTPAFecha.DateTime,IBQFechaNac.FieldValues['Fecha_nacimiento']))+ Traducir(' Dias.');
    LEdad.Visible := True;
    LDias.Visible := True;
    EvaluarDeControles
    end
  else
   // EvaluarDeControles;
  //;
  //MEAltura.SetFocus;
//  BBTerminar.Enabled := true;

end;

procedure TFEveEvaluacionPreservicio.BDBGSimpleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var   CheckBoxRectangle : TRect;
      val : integer;
      R : TRect;
Const CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  inherited;
  if (IBDSSimpleVUNO2.AsString = 'N') then
  begin
      BDBGSimple.Canvas.Font.Color := clred;
      //BDBGSimple.Canvas.TextOut( Rect.Left+2, Rect.Top+2, Column.Field.Text);
  end;
  if (IBDSSimpleVUNO2.AsString = 'P') then
  begin
      BDBGSimple.Canvas.Font.Color := clblue;
      //BDBGSimple.Canvas.TextOut( Rect.Left+2, Rect.Top+2, Column.Field.Text);
  end;
  R := Rect;
  if Column.FieldName = 'V6' then
    DrawText(Self.BDBGSimple.Canvas.Handle,PAnsiChar(VarToStr(Column.Field.Value)),-1,R,DT_CENTER);
  if Column.FieldName = 'V1' then
    DrawText(Self.BDBGSimple.Canvas.Handle,PAnsiChar(VarToStr(Column.Field.Value)),-1,R,DT_CENTER);
  // Para el check de Evaluacion Manual.
   if Column.FieldName = 'VUNO4' then
   begin
      Self.BDBGSimple.Canvas.FillRect(Rect);
      CheckBoxRectangle.Left := Rect.Left + 40;
      CheckBoxRectangle.Right := Rect.Right - 2;
      CheckBoxRectangle.Top := Rect.Top + 2;
      CheckBoxRectangle.Bottom := Rect.Bottom - 2;
      if(Column.Field.Value <> null )then
        if(Column.Field.AsInteger = 0) and (IBDSSimpleVUNO2.AsString = 'P')  then
        begin
            BDBGSimple.Canvas.TextOut( Rect.Left+2, Rect.Top+2, 'Rechazar');
            Column.Alignment := taCenter;
            DrawFrameControl(Self.BDBGSimple.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[false]);
        end;
      if(Column.Field.Value <> null )then
        if(Column.Field.AsInteger = 1) and (IBDSSimpleVUNO2.AsString = 'P')  then
        begin
            BDBGSimple.Canvas.TextOut( Rect.Left+2, Rect.Top+2, 'Rechazar');
            Column.Alignment := taCenter;
            DrawFrameControl(Self.BDBGSimple.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[true]);
        end;
     if(Column.Field.Value <> null )then
        if(Column.Field.AsInteger = 0) and (IBDSSimpleVUNO2.AsString = 'N')  then
        begin
            BDBGSimple.Canvas.TextOut( Rect.Left+2, Rect.Top+2, 'Aprobar');
            Column.Alignment := taCenter;
            DrawFrameControl(Self.BDBGSimple.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[false]);
        end;
     if(Column.Field.Value <> null )then
        if(Column.Field.AsInteger = 1) and (IBDSSimpleVUNO2.AsString = 'N')  then
        begin
            BDBGSimple.Canvas.TextOut( Rect.Left+2, Rect.Top+2, 'Aprobar');
            Column.Alignment := taCenter;
            DrawFrameControl(Self.BDBGSimple.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[true]);
        end;
   end;
   //fin del check

   // Para el check de Preñez.
   if Column.FieldName = 'VUNO1' then
   begin
      if VarType(Column.Field.Value) = varString then
      begin
        if TryStrToInt(Column.Field.Value,val) then
        begin
          BDBGSimple.Canvas.FillRect(Rect);
          CheckBoxRectangle.Left := Rect.Left + 2;
          CheckBoxRectangle.Right := Rect.Right - 2;
          CheckBoxRectangle.Top := Rect.Top + 2;
          CheckBoxRectangle.Bottom := Rect.Bottom - 2;
          if (val = 0) then
            DrawFrameControl(BDBGSimple.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[false])
          else
            DrawFrameControl(BDBGSimple.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[true]);
        end;
      end;
   end;
   //fin del check  de Preñez

   // Para el check de Brucelosis.
   if Column.FieldName = 'VUNO5' then
   begin
      if VarType(Column.Field.Value) = varString then
      begin
        if TryStrToInt(Column.Field.Value, val) then
        begin
          BDBGSimple.Canvas.FillRect(Rect);
          CheckBoxRectangle.Left := Rect.Left + 2;
          CheckBoxRectangle.Right := Rect.Right - 2;
          CheckBoxRectangle.Top := Rect.Top + 2;
          CheckBoxRectangle.Bottom := Rect.Bottom - 2;

          if(val = 0)   then
            DrawFrameControl(Self.BDBGSimple.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[false])
          else
            DrawFrameControl(Self.BDBGSimple.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[true]);
        end;
      end;
   end;
   //fin del check de Brucelosis.

end;

procedure TFEveEvaluacionPreservicio.BDBGSimpleCellClick(Column: TColumn);
begin
  inherited;
    if(Column.FieldName = 'VUNO4') then
    CambiarValorColumna(Column);
    if(Column.FieldName = 'VUNO1') then
    CambiarValorColumna(Column);
    if(Column.FieldName = 'VUNO5') then
    CambiarValorColumna(Column);
end;

procedure TFEveEvaluacionPreservicio.CambiarValorColumna(Column: TColumn);
begin
  Column.Field.DataSet.Edit;
  if(Column.Field.AsInteger = 0)then
    Column.Field.AsInteger := 1
  else
    Column.Field.AsInteger := 0;
  Column.Field.DataSet.Post;
end;

procedure TFEveEvaluacionPreservicio.LoadSQLStringList;
begin
  SQLStringList.AddObject('V2',DMSoftvet.DSGDR);
  SQLStringList.AddObject('V3',DMSoftvet.DSRechazo);
  SQLStringList.AddObject('RESP',DMSoftvet.DSResponsable);
  inherited;
end;

procedure TFEveEvaluacionPreservicio.IBDSSimpleV2SetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if ((IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
  begin
    IBQValidaciones.Active := false;
    IBQValidaciones.SQL.Clear;
    if (Sender.FieldName = 'V2') then
    begin      // GDR
        IBQValidaciones.SQL.Add('select Sinonimo from COD_GDR where Sinonimo like '''+UpperCase(Text)+'%''');
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
            Sender.AsString := IBQValidaciones.FieldByName('Sinonimo').AsString;
    end
    else
    if (Sender.FieldName = 'V3') then
    begin      // RECHAZO
        IBQValidaciones.SQL.Add('select NOMBRE from Cod_rechazos_preservicio where nombre like '''+UpperCase(Text)+'%''');
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
            Sender.AsString := IBQValidaciones.FieldByName('Nombre').AsString;
    end
  end;
end;

procedure TFEveEvaluacionPreservicio.CargarParametrosRN;
begin
  inherited;
  IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  if(self.ModoEve = meIndividual)then
    begin
      if Frame.Text = '' then
        IBQSPRN.ParamByName('FRAME').AsFloat := 0
      else
        IBQSPRN.ParamByName('FRAME').AsFloat := StrToFloat(Frame.Text);
      if MEPeso.Text = '' then
        IBQSPRN.ParamByName('PESO').AsFloat := 0
      else
        IBQSPRN.ParamByName('PESO').AsFloat := StrToFloat(MEPeso.Text);
      IBQSPRN.ParamByName('ANIMAL').AsInteger := IDAnimal;
      IBQSPRN.ParamByName('fecha').AsDateTime := DTPAFecha.DateTime;
    end
  else
    begin
      IBQSPRN.ParamByName('FRAME').AsFloat := IBDSSimple.fieldbyname('F4').AsFloat;
      IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
      IBQSPRN.ParamByName('fecha').AsDateTime := DTPAFecha.DateTime;
      IBQSPRN.ParamByName('PESO').AsFloat := IBDSSimple.fieldByName('F3').AsFloat;
    end;
end;

procedure TFEveEvaluacionPreservicio.MEPesoKeyPress(Sender: TObject;
  var Key: Char);
var Separador: Char;
begin
  inherited;
//  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;

  Separador := SysUtils.DecimalSeparator;

  if ((Key = '.') or ( Key = ',')) then
    Key := Separador;

  if (pos(Separador,TEditAuto(Sender).Text)=0) then
    begin
      if not (key in ['0'..'9',Separador,#8]) then
        key:=#0;
    end
  else
    if not (key in ['0'..'9',#8]) then
      key:=#0;
end;

procedure TFEveEvaluacionPreservicio.MEAlturaExit(Sender: TObject);
begin
  inherited;
  if ( StrToFloat(MEAltura.Text) > 200) then
       MEAltura.Text := '200';
end;

procedure TFEveEvaluacionPreservicio.MEAlturaChange(Sender: TObject);
begin
  inherited;
  HandlerOnExitAltura(Sender);
  GetEvent(MEAltura);
end;

procedure TFEveEvaluacionPreservicio.MEAltoChange(Sender: TObject);
begin
  inherited;
  HandlerOnExitAlto(Sender);
  //HandlerOnExitAncho(Sender);
end;

procedure TFEveEvaluacionPreservicio.MEAnchoChange(Sender: TObject);
begin
  inherited;
  //HandlerOnExitAlto(Sender);
  HandlerOnExitAncho(Sender);  
end;

procedure TFEveEvaluacionPreservicio.MCausaAprobadoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  Key:= #0;
end;

procedure TFEveEvaluacionPreservicio.MCausaRechazoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key:= #0;
end;

procedure TFEveEvaluacionPreservicio.IBDSSimpleF1SetText(Sender: TField;
  const Text: String);
var
  valor : double;
  auxText : String;
begin
  inherited;
  auxText := Text;
  auxText := FixDecimal(auxText);
  if(IBDSSimple.State <> dsInsert)then
  begin
    if (TryStrToFloat(auxText,valor)) then
      begin
        try
          Sender.AsString := auxText;
        except on e:Exception do
         begin
           MostrarMensaje(tmError, 'El valor del alto de Pelvimetría no es válido.');
         end;
        end;
      end;
  end;
end;

procedure TFEveEvaluacionPreservicio.IBDSSimpleF2SetText(Sender: TField;
  const Text: String);
var
  valor : double;
  auxText : String;
begin
  inherited;
  auxText := Text;
  auxText := FixDecimal(auxText);
  if(IBDSSimple.State <> dsInsert)then
  begin
    if (TryStrToFloat(auxText,valor)) then
      begin
        try
          Sender.AsString := auxText;
        except on e:Exception do
         begin
           MostrarMensaje(tmError, 'El valor del ancho de Pelvimetría no es válido.');
         end;
        end;
      end;
  end;
end;

procedure TFEveEvaluacionPreservicio.IBDSSimpleF3SetText(Sender: TField;
  const Text: String);
var valor : double;
    po: integer;
    auxText: String;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin
    auxText:= Text;
    {po:= pos(',',auxText);
    if (po>0) then
      begin
        auxText[po]:='.';
      end;}
    auxText := FixDecimal(auxText);
    if (TryStrToFloat(auxText,valor)) then
      begin
        try
          Sender.AsFloat := valor;
        except on e:Exception do
         begin
           MostrarMensaje(tmError, 'El valor del peso no es válido.');
         end;
        end;
      end;
  end;
end;

procedure TFEveEvaluacionPreservicio.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;

end;

procedure TFEveEvaluacionPreservicio.LResponsableClick(Sender: TObject);
begin
  inherited;
  if nroID>0 then
  begin
        DBLCBAResponsable.KeyValue:=nroID;
        nroID:=-1;
  end;
end;

procedure TFEveEvaluacionPreservicio.LResponsableMouseEnter(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveEvaluacionPreservicio.LResponsableMouseLeave(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveEvaluacionPreservicio.cargarDatos(i:integer);
var dias,col:integer;
    Pulgadas:double;
    str:string;
    alto,ancho,area,frame,altura:double;
begin
  inherited;

  if getDato('fecha nac',anim[i])<>'' then
    IBDSSimple.FieldByName('D1').AsDateTime := strtodatetime(getDato('fecha nac',anim[i]))
  else
    IBDSSimple.FieldByName('D1').AsDateTime := DMSoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',anim[i].id,'FECHA_NACIMIENTO');

  if (getDato('preñez',anim[i])='0') or (lowercase(getDato('preñez',anim[i]))='false') or (lowercase(getDato('preñez',anim[i]))='no') then
    IBDSSimple.FieldByName('VUNO1').Value:=0
  else
    IBDSSimple.FieldByName('VUNO1').Value:=1;

  str:=getDato('rechazo',anim[i]);
  if (lowercase(str)='no presenta') then str:='NO RECHAZADA';
  if str<>'' then
    IBDSSimple.FieldByName('V3').AsString :=str
  else
    IBDSSimple.FieldByName('V3').AsString :='NO RECHAZADA';
  if DBLCBARechazo.ListSource.DataSet.Lookup('CODIGO',IBDSSimple.FieldByName('V3').Value,'SINONIMO')<>null then
    IBDSSimple.FieldByName('V3').Value := DBLCBARechazo.ListSource.DataSet.Lookup('CODIGO',IBDSSimple.FieldByName('V3').Value,'sinonimo');
  IBDSSimple.FieldByName('I3').AsInteger := DBLCBARechazo.ListSource.DataSet.Lookup('sinonimo',IBDSSimple.FieldByName('V3').Value,'id_rechazo');

  if getDato('sangrado',anim[i])<>'' then
    IBDSSimple.FieldByName('VUNO5').AsInteger:=strtoint(getDato('sangrado',anim[i]))
  else
    IBDSSimple.FieldByName('VUNO5').AsInteger:=0;

  if not(CBFrame.Checked)or(getDato('checkaal',anim[i])='FALSE') then
    begin
    CBFrame.Checked:=false;
    IBDSSimple.FieldByName('F4').Value := 0;
    IBDSSimple.FieldByName('F6').Value:= 0;
    end
  else
    begin
    CBFrame.Checked:=true;
    IBDSSimple.FieldByName('F6').Value:=normalizarFloat(getDato('altura',anim[i]));
    frame:=normalizarFloat(getDato('frame',anim[i]));
    if frame<>0 then
      IBDSSimple.FieldByName('F4').Value := frame
    else
      begin
      Pulgadas := IBDSSimple.FieldByName('F6').Value/ 2.54;
      Pulgadas := StrToFloat(FormatFloat('00.000',Pulgadas));
      Dias := CantidadDias(IBDSSimple.FieldByName('FECHA').AsDateTime, IBDSSimple.FieldByName('D1').AsDateTime);
      IBDSSimple.FieldByName('F4').Value:=CalcularFrameHembras(Pulgadas,Dias);
      end;
    end;

  if not(CBGDR.Checked)or(getDato('checkgdr',anim[i])='FALSE') then
    begin
    CBGDR.Checked:=false;
    end
  else
    begin
    CBGDR.Checked:=true;
    str:=getDato('gdr',anim[i]);
    if str<>'' then
      begin
      if DBLCBGDR.ListSource.DataSet.Lookup('ID_GDR',str,'SINONIMO')<>null then
        begin
        IBDSSimple.FieldByName('I2').AsInteger:= strtoint(str);
        IBDSSimple.FieldByName('V2').AsString := DBLCBGDR.ListSource.DataSet.Lookup('ID_GDR',IBDSSimple.FieldByName('I2').AsInteger,'SINONIMO');
        end
      else
        begin
        IBDSSimple.FieldByName('V2').AsString:= str;
        if DBLCBGDR.ListSource.DataSet.Lookup('CODIGO',IBDSSimple.FieldByName('V2').AsString,'SINONIMO')<>null then
          IBDSSimple.FieldByName('V2').AsString := DBLCBGDR.ListSource.DataSet.Lookup('CODIGO',IBDSSimple.FieldByName('V2').AsString,'SINONIMO');
        IBDSSimple.FieldByName('I2').AsInteger := DBLCBGDR.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('V2').AsString,'ID_GDR');
        end;
      end;
    end;

  if not(CBPelvimetria.Checked)or(getDato('checkpel',anim[i])='FALSE')or(getDato('pelvimetriaactiva',anim[i])='NO') then
    begin
    CBPelvimetria.Checked:=false;
    IBDSSimple.FieldByName('F1').Value:=0;
    IBDSSimple.FieldByName('F2').Value:=0;
    IBDSSimple.FieldByName('F5').Value:=0;
    end
  else
    begin
    CBPelvimetria.Checked:=true;
    alto:=normalizarFloat(getDato('alto',anim[i]));
    ancho:=normalizarFloat(getDato('ancho',anim[i]));
    area:=normalizarFloat(getDato('area',anim[i]));
    IBDSSimple.FieldByName('F1').Value:=alto;
    IBDSSimple.FieldByName('F2').Value:=ancho;
    if area<>0 then
      IBDSSimple.FieldByName('F5').Value := area
    else
      IBDSSimple.FieldByName('F5').Value := alto*ancho;
    end;

    // Incidencia, no trae alto y ancho pelvimetria en XML IOS
  if ((getDato('checkpel',anim[i])='TRUE')or(getDato('pelvimetriaactiva',anim[i])='SI')) then
  begin
    CBPelvimetria.Checked:=true;
    alto:=normalizarFloat(getDato('pelvimetriaAlto',anim[i]));
    ancho:=normalizarFloat(getDato('pelvimetriaAncho',anim[i]));
    area:=normalizarFloat(getDato('area',anim[i]));
    IBDSSimple.FieldByName('F1').Value:=alto;
    IBDSSimple.FieldByName('F2').Value:=ancho;
    if area<>0 then
      IBDSSimple.FieldByName('F5').Value := area
    else
      IBDSSimple.FieldByName('F5').Value := alto*ancho;
  end;


  if not(CBPeso.Checked)or(getDato('checkpeg',anim[0])='FALSE') then
    begin
    CBPeso.Checked:=false;
    IBDSSimple.FieldByName('F3').Value:=0;
    end
  else
    begin
    CBPeso.Checked:=true;
    IBDSSimple.FieldByName('F3').Value:=getDato('peso',anim[i]);
    end;

  if getDato('evaluación manual',anim[i])<>'' then
    IBDSSimple.FieldByName('VUNO4').AsInteger := strtoint(getDato('evaluación manual',anim[i]))
  else
    IBDSSimple.FieldByName('VUNO4').AsInteger := 0;

  IBDSSimple.FieldByName('ID_senasa').AsString :=getDato('senasa',anim[i]);

  str:=upperCase(getDato('responsable',anim[i]));
  DBLCBAResponsable.ListSource.DataSet.Close;
  DBLCBAResponsable.ListSource.DataSet.Open;
  if DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',str,'ID_EMPLEADO')<>null then
    begin
    IBDSSimple.FieldByName('RESPONSABLE').AsInteger := DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',str,'ID_EMPLEADO');
    IBDSSimple.FieldByName('RESP').AsString := str;
    end
  else if DBLCBAResponsable.ListSource.DataSet.Lookup('ID_EMPLEADO',str,'ID_EMPLEADO')<>null then
    begin
    IBDSSimple.FieldByName('RESPONSABLE').AsInteger := 0;
    IBDSSimple.FieldByName('RESP').AsString :='INDEFINIDO';
    end;
  //DBLCBAResponsable.KeyValue:=DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',getDato('responsable',anim[i]),'ID_EMPLEADO');

  IBDSSimple.FieldByName('V1').AsString := ''; //Criterios

  EvaluarAnimal(IBDSSimple.FieldByName('I2').AsInteger,IBDSSimple.FieldByName('F3').Value,IBDSSimple.FieldByName('F4').Value,IBDSSimple.FieldByName('F5').Value,
                IBDSSimple.FieldByName('F6').Value,IBDSSimple.FieldByName('F1').Value,IBDSSimple.FieldByName('F2').Value,
                IBDSSimple.FieldByName('VUNO1').Value,IBDSSimple.FieldByName('I3').AsInteger);
end;

procedure TFEveEvaluacionPreservicio.IBDSSimpleID_RPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  IBDSSimple.Edit;
  IBDSSimple.FieldByName('D1').AsDateTime:=DMSoftVet.IBQDatosAnimal.Lookup('ID_ANIMAL',IBDSSimple.FieldByName('ID_ANIMAL').Value,'FECHA_NACIMIENTO');
  IBDSSimple.Post;
end;

procedure TFEveEvaluacionPreservicio.CBClick(Sender: TObject);
begin
  inherited;
  HabilitarOpciones(Sender);
  if modoEve = meIndividual then
    EvaluarDeControles;
end;

procedure TFEveEvaluacionPreservicio.HabilitarOpciones(Sender : TObject);
var
  C : TCheckBox;
begin
  if (Sender is TCheckBox) then
  begin
      C := (Sender as TCheckBox);
      case C.Tag of
        1 : begin
              LAltura.Enabled := C.Checked;
              MEAltura.Enabled := C.Checked;
              LPulgadas.Enabled := C.Checked;
              LUnidadMedida.Enabled := C.Checked;
              LEdad.Enabled := C.Checked;
              LFrame.Enabled := C.Checked;
              LDias.Enabled := C.Checked;
            end;
        2 : begin
              LGDR.Enabled := C.Checked;
              DBLCBGDR.Enabled := C.Checked;
            end;
        3 : begin
              LTituloPelv.Enabled := C.Checked;
              LAlto.Enabled := C.Checked;
              MEAlto.Enabled := C.Checked;
              LAncho.Enabled := C.Checked;
              MEAncho.Enabled := C.Checked;
              Lcm1.Enabled := C.Checked;
              Lcm2.Enabled := C.Checked;
            end;
        4 : begin
              LPeso.Enabled := C.Checked;
              MEPeso.Enabled := C.Checked;
              LKilos.Enabled := C.Checked;
            end;
        5 : begin
              LRechazo.Enabled := C.Checked;
              DBLCBARechazo.Enabled := C.Checked;
            end;
      end;
  end;
end;

procedure TFEveEvaluacionPreservicio.BBXlsImportClick(Sender: TObject);
begin
  inherited;
  acomodarGrilla;
end;

procedure TFEveEvaluacionPreservicio.continuarGrilla;
begin
  inherited;
  acomodarGrilla;
end;

procedure TFEveEvaluacionPreservicio.acomodarGrilla;
var i:integer;
begin
inherited;
for i:=0 to BDBGSimple.Columns.Count-1 do
  case i of
    0 : BDBGSimple.Columns[i].Width := 82;
    1 : BDBGSimple.Columns[i].Width := 70;
    2 : BDBGSimple.Columns[i].Width := 82;
    3 : BDBGSimple.Columns[i].Width := 138;
    4 : BDBGSimple.Columns[i].Width := 158;
    5 : BDBGSimple.Columns[i].Width := 105;
    6 : BDBGSimple.Columns[i].Width := 80;
    7 : BDBGSimple.Columns[i].Width := 158;
    8 : BDBGSimple.Columns[i].Width := 100;
    9 : BDBGSimple.Columns[i].Width := 80;
    10 : BDBGSimple.Columns[i].Width := 85;
    11 : BDBGSimple.Columns[i].Width := 130;
    12 : BDBGSimple.Columns[i].Width := 80;
    13 : BDBGSimple.Columns[i].Width := 150;
    14 : BDBGSimple.Columns[i].Width := 90;
    15 : BDBGSimple.Columns[i].Width := 140;
    16 : BDBGSimple.Columns[i].Width := 140;
    17 : BDBGSimple.Columns[i].Width := 250;
   end;
end;

procedure TFEveEvaluacionPreservicio.configurarColumnasACargar;
begin
if existeCampo('Preñez') then CBPrenez.Checked:=true;
if existeCampo('Rechazo') then CBRechazo.Checked:=true else CBRechazo.Checked:=false;
if existeCampo('Sangrado') then CBbrucelosis.Checked:=true;
if (existeCampo('Altura'))or(existeCampo('Frame')) then CBFrame.Checked:=true else CBFrame.Checked:=false;
if existeCampo('GDR') then CBGDR.Checked:=true else CBGDR.Checked:=false;
if existeCampo('Alto') then CBPelvimetria.Checked:=true else CBPelvimetria.Checked:=false;
if existeCampo('Peso') then CBPeso.Checked:=true else CBPeso.Checked:=false;
end;

procedure TFEveEvaluacionPreservicio.SetText(Sender: TField;
  const Text: String);
begin
  inherited;
  //hereda
end;

procedure TFEveEvaluacionPreservicio.LRechazoMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    LRechazo.Font.Color:= $00606C02;
    LRechazo.Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFEveEvaluacionPreservicio.LRechazoMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    LRechazo.Font.Color:= clWindowText;
    LRechazo.Font.Style:= [fsUnderline];
  end;
end;

procedure TFEveEvaluacionPreservicio.LRechazoClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AbrirFormNormal(TFAbmRechazosPreservicio.Create(self));
    DMSoftvet.IBQRechazo.Close;
    DMSoftvet.IBQRechazo.Open;
  end;
  cambiarCB(DBLCBARechazo,nroID);
end;

procedure TFEveEvaluacionPreservicio.IBDSSimpleF6SetText(Sender: TField;
  const Text: String);
var valor : double;
    po: integer;
    auxText: String;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin
    auxText:= Text;
    auxText := FixDecimal(auxText);
    if (TryStrToFloat(auxText,valor)) then
      begin
        try
          Sender.AsFloat := valor;
        except on e:Exception do
         begin
           MostrarMensaje(tmError, 'El valor de la altura al anca no es válido.');
         end;
        end;
      end;
  end;
end;

procedure TFEveEvaluacionPreservicio.BDBGSimpleKeyPress(Sender: TObject;
  var Key: Char);
var
  Separador : Char;
begin
  inherited;
  Separador := SysUtils.DecimalSeparator;
  if (Key = '.') or (Key = ',') then
    Key := Separador;
end;

end.
