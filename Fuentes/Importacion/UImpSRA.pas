unit UImpSRA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  IBCustomDataSet, IBQuery, IBUpdateSQL, IBDatabase, ExtCtrls;

type
  TForm2 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTPadreSRA: TADOTable;
    DSPadreSRA: TDataSource;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    IBQSPEventoIndParto: TIBQuery;
    IBQGenId: TIBQuery;
    IBQAbmSimple: TIBQuery;
    IBQAbmSimpleAPODO: TIBStringField;
    IBQAbmSimpleID_ANIMAL_EXTERNO: TIntegerField;
    IBQAbmSimpleID_HBA: TIBStringField;
    IBQAbmSimpleSEXO: TIntegerField;
    IBQAbmSimpleNOMSEX: TIBStringField;
    IBQAbmSimpleNOMRAZ: TIBStringField;
    IBQAbmSimpleID_OTRO: TIBStringField;
    IBQAbmSimpleID_PC: TIBStringField;
    IBQAbmSimpleID_RA: TIBStringField;
    IBQAbmSimpleID_RP: TIBStringField;
    IBQAbmSimpleID_SENASA: TIBStringField;
    IBQAbmSimpleRAZA: TIntegerField;
    IBQAbmSimpleESTABLECIMIENTO: TIntegerField;
    IBQAbmSimpleKEYVALUE: TIBStringField;
    IBQAbmSimpleNOMBRE_ANIMAL: TIBStringField;
    IBQAbmSimpleCRIADOR: TIBStringField;
    IBQAbmSimpleNOM_PROP: TIBStringField;
    IBQAbmSimplePROPIETARIO: TIntegerField;
    IBQAbmSimpleFECHA_NACIMIENTO: TDateField;
    IBQAbmSimpleADN: TIBStringField;
    IBQAbmSimpleTIPIFICACION_SANGUINEA: TIBStringField;
    DSAbmSimple: TDataSource;
    IBQVerificarHBAInterno: TIBQuery;
    IBQVerificarHBAExterno: TIBQuery;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    IBQGenIDAnimal: TIBQuery;
    IBQSPEventoIndAltaDirecta: TIBQuery;
    DSIBQ_SPEventoIndAltaDirecta: TDataSource;
    IBTSRA: TIBTransaction;
    IBDSRA: TIBDatabase;
    IBQInsertPDRE: TIBQuery;
    IBStringField1: TIBStringField;
    IntegerField1: TIntegerField;
    IBStringField2: TIBStringField;
    IntegerField2: TIntegerField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IBStringField10: TIBStringField;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    IBStringField13: TIBStringField;
    IntegerField5: TIntegerField;
    DateField1: TDateField;
    IBStringField14: TIBStringField;
    IBStringField15: TIBStringField;
    DSInsertPDRE: TDataSource;
    ADOQuery5: TADOQuery;
    DataSource5: TDataSource;
    IBQGenIdPadre: TIBQuery;
    IBQRelPadres: TIBQuery;
    IBStringField16: TIBStringField;
    IntegerField6: TIntegerField;
    IBStringField17: TIBStringField;
    IntegerField7: TIntegerField;
    IBStringField18: TIBStringField;
    IBStringField19: TIBStringField;
    IBStringField20: TIBStringField;
    IBStringField21: TIBStringField;
    IBStringField22: TIBStringField;
    IBStringField23: TIBStringField;
    IBStringField24: TIBStringField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IBStringField25: TIBStringField;
    IBStringField26: TIBStringField;
    IBStringField27: TIBStringField;
    IBStringField28: TIBStringField;
    IntegerField10: TIntegerField;
    DateField2: TDateField;
    IBStringField29: TIBStringField;
    IBStringField30: TIBStringField;
    IBQRelMadres: TIBQuery;
    IBStringField31: TIBStringField;
    IntegerField11: TIntegerField;
    IBStringField32: TIBStringField;
    IntegerField12: TIntegerField;
    IBStringField33: TIBStringField;
    IBStringField34: TIBStringField;
    IBStringField35: TIBStringField;
    IBStringField36: TIBStringField;
    IBStringField37: TIBStringField;
    IBStringField38: TIBStringField;
    IBStringField39: TIBStringField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    IBStringField40: TIBStringField;
    IBStringField41: TIBStringField;
    IBStringField42: TIBStringField;
    IBStringField43: TIBStringField;
    IntegerField15: TIntegerField;
    DateField3: TDateField;
    IBStringField44: TIBStringField;
    IBStringField45: TIBStringField;
    IBQInsAuxAnimExternos: TIBQuery;
    IBStringField46: TIBStringField;
    IntegerField16: TIntegerField;
    IBStringField47: TIBStringField;
    IntegerField17: TIntegerField;
    IBStringField48: TIBStringField;
    IBStringField49: TIBStringField;
    IBStringField50: TIBStringField;
    IBStringField51: TIBStringField;
    IBStringField52: TIBStringField;
    IBStringField53: TIBStringField;
    IBStringField54: TIBStringField;
    IntegerField18: TIntegerField;
    IntegerField19: TIntegerField;
    IBStringField55: TIBStringField;
    IBStringField56: TIBStringField;
    IBStringField57: TIBStringField;
    IBStringField58: TIBStringField;
    IntegerField20: TIntegerField;
    DateField4: TDateField;
    IBStringField59: TIBStringField;
    IBStringField60: TIBStringField;
    IBQDelAuxAnimExternos: TIBQuery;
    IBStringField61: TIBStringField;
    IntegerField21: TIntegerField;
    IBStringField62: TIBStringField;
    IntegerField22: TIntegerField;
    IBStringField63: TIBStringField;
    IBStringField64: TIBStringField;
    IBStringField65: TIBStringField;
    IBStringField66: TIBStringField;
    IBStringField67: TIBStringField;
    IBStringField68: TIBStringField;
    IBStringField69: TIBStringField;
    IntegerField23: TIntegerField;
    IntegerField24: TIntegerField;
    IBStringField70: TIBStringField;
    IBStringField71: TIBStringField;
    IBStringField72: TIBStringField;
    IBStringField73: TIBStringField;
    IntegerField25: TIntegerField;
    DateField5: TDateField;
    IBStringField74: TIBStringField;
    IBStringField75: TIBStringField;
    IBQGenerador: TIBQuery;
    IBQuery1: TIBQuery;
    DataSource6: TDataSource;
    IBQuery2: TIBQuery;
    DataSource7: TDataSource;
    IBQuery3: TIBQuery;
    DataSource8: TDataSource;
    IBDSRAPADRES: TIBDatabase;
    IBTSRAPADRES: TIBTransaction;
    IBDSRAMADRES: TIBDatabase;
    IBTSRAMADRES: TIBTransaction;
    IBQuery4: TIBQuery;
    DataSource9: TDataSource;
    IBDPADRESEXTERNOS: TIBDatabase;
    IBTPADRESEXTERNOS: TIBTransaction;
    IBUSQLAbmSimple: TIBUpdateSQL;
    IBQSPEventoIndBaja: TIBQuery;
    DSIBQ_SPEventoIndBaja: TDataSource;
    IBQuery5: TIBQuery;
    DataSource10: TDataSource;
    GroupBox1: TGroupBox;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    BitBtn7: TBitBtn;
    Label1: TLabel;
    BitBtn5: TBitBtn;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    MErrorAltas: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LCantNacMachos: TLabel;
    LCantNacHembras: TLabel;
    LCantAltasExtMachos: TLabel;
    LCantAltasExtHembras: TLabel;
    LCantAltasDirHembras: TLabel;
    LCantAltasDirMachos: TLabel;
    BitBtn1: TBitBtn;
    Label8: TLabel;
    LCantAnimInternos: TLabel;
    ProgressBar1: TProgressBar;
    MAltas: TMemo;
    MBaja: TMemo;
    MErrorBaja: TMemo;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
    cantInserciones, cantErrores, cantAltasDirectasMachos,
    cantAltasDirectasHembras, cantNacimientosMachos, cantNacimientosHembras,
    cantAltasExternasMachos, cantAltasExternasHembras: Integer;

    function EsFechaValida(str:String):boolean;

    procedure agregarPadreExterno(sexo, propietario, criador, raza:Integer;
                                     fechanacimiento:TDate; rp, hba, nombre, apodo,
                                     adn, tipisangui,hbap,hbam:String);

    procedure agregarNacimiento(sexo, propietario,padreinterno: Integer; fechanacimiento: TDate;
                                rp, nombreAnimal, adn, tipisangui,
                                hba, hbamadre, hbapadre: String);

    procedure agregarPadreInterno(rp,hba,nombre,apodo:String;padreexterno,
                                  madrereceptoraexterna,madrebiologicaexterna,
                                  padreinterno,madrebiologicainterna,madrereceptorainterna,
                                  cantidadpartos:Integer;fechanacimiento:TDate;sexo,peso,raza:Integer);

    procedure agregarBaja(fechabaja: TDate; idanimal: Integer);

    function retornarIDAnimal(hba:String;sexo, establecimiento, interno:Integer):Integer;

    function verificarHBA(hba:string; sexo,establecimiento,interno:integer):boolean;//interno 1 si 0 no
    procedure RecorroPadres(sexo:Integer;cria,asoc,hbae, rpex, nomb, anls, colo, fnac, fbaj, ftrf, fser, apdo,asop,hbap,asom,hbam: String);
    procedure RecorroMadres(cria,asom,hbam: String);
    procedure RealizarGenealogia(query: TIBQuery; sexo: Integer);
    procedure RealizarBaja(query: TIBQuery; sexo: Integer);    

    function retornarRaza(color:String): Integer;

  public
    { Public declarations }
    ID_Animal : integer;
  end;

var
  Form2: TForm2;

implementation

uses uTiposGlobales, UPrincipal;

{$R *.dfm}







procedure TForm2.agregarNacimiento(sexo, propietario, padreinterno: Integer;
  fechanacimiento: TDate; rp, nombreAnimal, adn, tipisangui, hba, hbamadre, hbapadre: String);
var idanimalmadre, idanimalpadre: Integer;
    interno: String;
begin   //padreinterno 1 si 0 externo
    //calcular el id de la madre segun el hba de la madre y sino tiene hba por rpmadre
    //calcular el id de la madre segun el hba del padre y sino tiene hba por rppadre

  IBQVerificarHBAInterno.Close;
  IBQVerificarHBAInterno.ParamByName('hba').Value:= hbamadre;
  IBQVerificarHBAInterno.ParamByName('sexo').Value:= 2;
  IBQVerificarHBAInterno.ParamByName('esta').Value:= FPrincipal.EstablecimientoActual;
  IBQVerificarHBAInterno.Open;
  IBQVerificarHBAInterno.First;

  idanimalmadre:= IBQVerificarHBAInterno.fieldbyname('id_animal').AsInteger;

  idanimalpadre:= -1;
  if (hbapadre <> '') then
    begin
      if (padreinterno = 1) then
        begin
          IBQVerificarHBAInterno.Close;
          IBQVerificarHBAInterno.ParamByName('hba').Value:= hbapadre;
          IBQVerificarHBAInterno.ParamByName('sexo').Value:= 1;
          IBQVerificarHBAInterno.ParamByName('esta').Value:= FPrincipal.EstablecimientoActual;
          IBQVerificarHBAInterno.Open;
          IBQVerificarHBAInterno.First;


          if not(IBQVerificarHBAInterno.IsEmpty) then
            begin
              idanimalpadre:= IBQVerificarHBAInterno.fieldbyname('id_animal').AsInteger;
              interno:= 'S';
            end;

        end
      else
        if (padreinterno = 0) then
          begin
            IBQVerificarHBAExterno.Close;
            IBQVerificarHBAExterno.ParamByName('hba').Value:= hbapadre;
            IBQVerificarHBAExterno.ParamByName('sexo').Value:= 1;
            IBQVerificarHBAExterno.ParamByName('esta').Value:= FPrincipal.EstablecimientoActual;
            IBQVerificarHBAExterno.Open;
            IBQVerificarHBAExterno.First;


            if not(IBQVerificarHBAExterno.IsEmpty) then
              begin
                idanimalpadre:= IBQVerificarHBAExterno.fieldbyname('id_animal_externo').AsInteger;
                interno:= 'N';
              end;

          end
   end;

  if (idanimalpadre <> -1) then
   begin
      IBQGenerador.Open;
      IBQInsAuxAnimExternos.Close;
      IBQInsAuxAnimExternos.ParamByName('ID_ANIMAL_EXTERNO').Value:= idanimalpadre;
      IBQInsAuxAnimExternos.ParamByName('INTERNO').Value:= interno;
      IBQInsAuxAnimExternos.ParamByName('sexo').Value := 1;
      IBQInsAuxAnimExternos.ParamByName('id_aux').Value := idanimalpadre;//IBQGenerador.fieldByName('idauxpe').AsInteger;
      IBQInsAuxAnimExternos.Open;
      IBQGenerador.Close;
      FPrincipal.IBTPrincipal.CommitRetaining;       
   end;

  IBQSPEventoIndParto.Close;
  IBQSPEventoIndParto.ParamByName('fecha').AsDateTime := fechanacimiento;
  IBQSPEventoIndParto.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoIndParto.ParamByName('responsable').value := 0;
  IBQSPEventoIndParto.ParamByName('log_usuario').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoIndParto.ParamByName('log_fecha_modificado').AsDateTime := now;
  IBQSPEventoIndParto.ParamByName('animal').AsInteger := idanimalmadre;//ID_Animal;
  IBQSPEventoIndParto.ParamByName('madre_biologica').Value := null;//idanimalmadre;//IDMadreB;
  IBQSPEventoIndParto.ParamByName('potrero').AsInteger := 0;
  IBQSPEventoIndParto.ParamByName('rodeo').AsInteger := 0;
  IBQSPEventoIndParto.ParamByName('observacion').AsString := '';
  IBQSPEventoIndParto.ParamByName('cantidad').AsInteger := 1;
  IBQSPEventoIndParto.ParamByName('condicion_corporal').Value := null;

  IBQSPEventoIndParto.ParamByName('sexo0').AsInteger := sexo;
  IBQSPEventoIndParto.ParamByName('vivo0').AsString := 'S';  //preguntar eso
//  if (IBDSNacidos.FieldByName('peso').AsInteger <>  0) then
//    IBQSPEventoIndParto.ParamByName('peso0').AsInteger := IBDSNacidos.FieldByName('peso').AsInteger
//   else
  IBQSPEventoIndParto.ParamByName('peso0').AsInteger := 0; //fijarse como hacer con el peso

   // if (IBDSNacidos.FieldByName('identifico').AsString = 'S') then
   //   begin
  IBQSPEventoIndParto.ParamByName('rp0').value   := trim(rp);
       // IBQSPEventoInd.ParamByName('sen0').Value  := IBDSNacidos.FieldValues['id_senasa'];
       // IBQSPEventoInd.ParamByName('pc0').Value   := IBDSNacidos.FieldValues['id_pc'];
  IBQSPEventoIndParto.ParamByName('hba0').Value  := hba;
       // IBQSPEventoInd.ParamByName('ra0').Value   := IBDSNacidos.FieldValues['id_ra'];
       // IBQSPEventoInd.ParamByName('otro0').Value := IBDSNacidos.FieldValues['id_otro'];
       // IBQSPEventoInd.ParamByName('ie0').Value := IBDSNacidos.FieldValues['id_ie'];
       // if (ultimo < IBDSNacidos.FieldValues['id_senasa']) then
       //   ultimo := IBDSNacidos.FieldValues['id_senasa'];
     // end;

  IBQSPEventoIndParto.ParamByName('observacion_nacimientos').AsString := '';

  if (hbapadre = '') then
    IBQSPEventoIndParto.ParamByName('padre').Value := null
  else
      IBQSPEventoIndParto.ParamByName('padre').AsInteger := idanimalpadre;//aux_padre_manual;

  IBQSPEventoIndParto.Open;
  IBQDelAuxAnimExternos.Close;
  IBQDelAuxAnimExternos.Open;

  inc(cantInserciones);

  if (sexo = 1) then
    inc(cantNacimientosMachos)
   else
     if (sexo = 2) then
      inc(cantNacimientosHembras);
end;

procedure TForm2.agregarPadreExterno(sexo, propietario, criador, raza:Integer;
                                     fechanacimiento:TDate; rp, hba, nombre,apodo,
                                     adn, tipisangui, hbap,hbam:String);
var idanimalpadre, idanimalmadre: Integer;
begin
  IBQGenId.Close;
  IBQGenId.Open;
  ID_Animal := IBQGenId.FieldValues['IDEXT'];

//  if Validar then

  IBQAbmSimple.Close;

  if (Trim(apodo) <> '') then
    IBQAbmSimple.ParamByName('apodo').Value := apodo
   else
      IBQAbmSimple.ParamByName('apodo').Value := nombre;

  IBQAbmSimple.ParamByName('ID_ANIMAL_EXTERNO').Value := ID_Animal;

  IBQAbmSimple.ParamByName('ID_HBA').Value := hba;

  IBQAbmSimple.ParamByName('SEXO').Value := sexo;

  IBQAbmSimple.ParamByName('ID_OTRO').Value := null;

  IBQAbmSimple.ParamByName('ID_PC').Value := null;

  IBQAbmSimple.ParamByName('ID_RA').Value := null;

  if (Trim(rp) <> '') then
    IBQAbmSimple.ParamByName('ID_RP').Value := Trim(rp)
   else
     IBQAbmSimple.ParamByName('ID_RP').Value := hba;

  IBQAbmSimple.ParamByName('ID_SENASA').Value := null;

  IBQAbmSimple.ParamByName('RAZA').Value := raza;

  IBQAbmSimple.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;

  IBQAbmSimple.ParamByName('CRIADOR').Value := criador;

  IBQAbmSimple.ParamByName('PROPIETARIO').Value := propietario;

  IBQAbmSimple.ParamByName('FECHA_NACIMIENTO').Value := DateToStr(fechanacimiento);

  IBQAbmSimple.ParamByName('NOMBRE_ANIMAL').Value := nombre;

  IBQAbmSimple.ParamByName('ADN').Value := adn;

  IBQAbmSimple.ParamByName('TIPIFICACION_SANGUINEA').Value := tipisangui;

  IBQAbmSimple.Open;


  if (hbap <> '') then
    begin
      idanimalpadre:= retornarIDAnimal(hbap,1,FPrincipal.EstablecimientoActual,0);

      if (idanimalpadre <> -1) then
        begin
          IBQRelPadres.Close;
          IBQRelPadres.ParamByName('ID_PADRE').Value:= idanimalpadre;
          IBQRelPadres.ParamByName('ID_HIJO').Value:= ID_Animal;
          IBQRelPadres.ParamByName('ESTABLECIMIENTO').Value:= FPrincipal.EstablecimientoActual;
          IBQRelPadres.Open;
        end;
    end;


  if (hbam <> '') then
    begin
      idanimalmadre:= retornarIDAnimal(hbam,2,FPrincipal.EstablecimientoActual,0);

      if (idanimalmadre <> -1) then
        begin
          IBQRelMadres.Close;
          IBQRelMadres.ParamByName('ID_MADRE').Value:= idanimalmadre;
          IBQRelMadres.ParamByName('ID_HIJO').Value:= ID_Animal;
          IBQRelMadres.ParamByName('ESTABLECIMIENTO').Value:= FPrincipal.EstablecimientoActual;
          IBQRelMadres.Open;
        end;  
    end;

  inc(cantInserciones);

  if (sexo = 1) then
    inc(cantAltasExternasMachos)
   else
     if (sexo = 2) then
      inc(cantAltasExternasHembras);
end;


procedure TForm2.agregarPadreInterno(rp, hba, nombre, apodo:String; padreexterno,
  madrereceptoraexterna, madrebiologicaexterna, padreinterno,
  madrebiologicainterna, madrereceptorainterna, cantidadpartos: Integer;
  fechanacimiento: TDate;sexo, peso, raza:Integer);
var idanimalpadre: Integer;
    interno: String;
begin



  idanimalpadre:= -1;

  if (padreinterno <> -1) then
    begin
      idanimalpadre:= padreinterno;
      interno:= 'S';
    end;

  if (padreexterno <> -1) then
    begin
      idanimalpadre:= padreexterno;
      interno:= 'N';
    end;

  if (idanimalpadre <> -1) then
   begin
      IBQGenerador.Open;
      IBQInsAuxAnimExternos.Close;
      IBQInsAuxAnimExternos.ParamByName('ID_ANIMAL_EXTERNO').Value:= idanimalpadre;
      IBQInsAuxAnimExternos.ParamByName('INTERNO').Value:= interno;
      IBQInsAuxAnimExternos.ParamByName('sexo').Value := 1;
      IBQInsAuxAnimExternos.ParamByName('id_aux').Value := IBQGenerador.fieldByName('idauxpe').AsInteger;
      IBQInsAuxAnimExternos.Open;

      FPrincipal.IBTPrincipal.CommitRetaining;      
   end;


  IBQSPEventoIndAltaDirecta.Close;

  IBQGenIDAnimal.Close;
  IBQGenIDAnimal.Open;


  if (Trim(rp) <> '') then
     IBQSPEventoIndAltaDirecta.ParamByName('ID_RP').Value := Trim(rp)
   else
       IBQSPEventoIndAltaDirecta.ParamByName('ID_RP').Value := null;

  IBQSPEventoIndAltaDirecta.ParamByName('IDNUEVOANIMAL').AsInteger := IBQGenIDAnimal.FieldValues['IDANIMAL'];

  IBQSPEventoIndAltaDirecta.ParamByName('FECHA_NACIMIENTO').Value := DateToStr(fechanacimiento);

  if (peso = 0) then
    IBQSPEventoIndAltaDirecta.ParamByName('PESO').Value := null
   else
      IBQSPEventoIndAltaDirecta.ParamByName('PESO').Value := peso;

  if (padreexterno <> -1) then
    IBQSPEventoIndAltaDirecta.ParamByName('PADRE_EXTERNO').Value := padreexterno
   else
      IBQSPEventoIndAltaDirecta.ParamByName('PADRE_EXTERNO').Value := null;

  if (madrereceptoraexterna <> -1) then
    IBQSPEventoIndAltaDirecta.ParamByName('MADRE_RECEPTORA_EXTERNA').Value := madrereceptoraexterna
   else
      IBQSPEventoIndAltaDirecta.ParamByName('MADRE_RECEPTORA_EXTERNA').Value := null;

  if (madrebiologicaexterna <> -1) then
    IBQSPEventoIndAltaDirecta.ParamByName('MADRE_BIOLOGICA_EXTERNA').Value := madrebiologicaexterna
   else
      IBQSPEventoIndAltaDirecta.ParamByName('MADRE_BIOLOGICA_EXTERNA').Value := null;

  if (padreinterno <> -1) then
    IBQSPEventoIndAltaDirecta.ParamByName('PADRE_INTERNO').Value := padreinterno
   else
      IBQSPEventoIndAltaDirecta.ParamByName('PADRE_INTERNO').Value := null;    

  if (madrebiologicainterna <> -1) then
    IBQSPEventoIndAltaDirecta.ParamByName('MADRE_BIOLOGICA_INTERNA').Value := madrebiologicainterna
   else
      IBQSPEventoIndAltaDirecta.ParamByName('MADRE_BIOLOGICA_INTERNA').Value := null;     

  if (madrereceptorainterna <> -1) then
    IBQSPEventoIndAltaDirecta.ParamByName('MADRE_RECEPTORA_INTERNA').Value := madrereceptorainterna
   else
      IBQSPEventoIndAltaDirecta.ParamByName('MADRE_RECEPTORA_INTERNA').Value := null;

  if (cantidadpartos <> -1) then
    IBQSPEventoIndAltaDirecta.ParamByName('ESTADO_LACTACION').Value:= cantidadpartos
   else
      IBQSPEventoIndAltaDirecta.ParamByName('ESTADO_LACTACION').Value:= null;    

  IBQSPEventoIndAltaDirecta.ParamByName('RODEO').Value := 0;

  IBQSPEventoIndAltaDirecta.ParamByName('RAZA').Value := raza; //aca fijarse si es 2 es AAN o 3 es AAC

  IBQSPEventoIndAltaDirecta.ParamByName('DTA').Value := null;

  IBQSPEventoIndAltaDirecta.ParamByName('POTRERO').Value := 0;
  if (sexo = 1) then //macho
    IBQSPEventoIndAltaDirecta.ParamByName('CATEGORIA').Value := 1
   else
      if (sexo = 2) then //hembra
        IBQSPEventoIndAltaDirecta.ParamByName('CATEGORIA').Value := 4;

  IBQSPEventoIndAltaDirecta.ParamByName('CRONOLOGIA_DENTARIA').Value := 0;
  IBQSPEventoIndAltaDirecta.ParamByName('CONDICION_CORPORAL').Value := null;
  IBQSPEventoIndAltaDirecta.ParamByName('GDR').Value := 0;

  //IBQSPEventoIndAltaDirecta.ParamByName('CIRCUNFERENCIA_ESCROTAL').Value := EACircunferenciaE.GetDato;


  IBQSPEventoIndAltaDirecta.ParamByName('ESTADO_REPRODUCTIVO').Value := 0;

  IBQSPEventoIndAltaDirecta.ParamByName('ID_PC').Value  := null;

  IBQSPEventoIndAltaDirecta.ParamByName('ID_HBA').Value := hba;

  IBQSPEventoIndAltaDirecta.ParamByName('ID_RA').Value  := null;

  IBQSPEventoIndAltaDirecta.ParamByName('ID_OTRO').Value:= null;

  IBQSPEventoIndAltaDirecta.ParamByName('ID_IE').Value:= null;

  if (Trim(nombre) <> '') then
    IBQSPEventoIndAltaDirecta.ParamByName('NOMBRE').Value := nombre
   else
     IBQSPEventoIndAltaDirecta.ParamByName('NOMBRE').Value := null;

  if (Trim(apodo) <> '') then
    IBQSPEventoIndAltaDirecta.ParamByName('APODO').Value := apodo
   else
      IBQSPEventoIndAltaDirecta.ParamByName('APODO').Value := null;

  IBQSPEventoIndAltaDirecta.ParamByName('SEXO').Value := sexo;
  IBQSPEventoIndAltaDirecta.ParamByName('FECHA_EVENTO').Value := DateToStr(fechanacimiento);
  IBQSPEventoIndAltaDirecta.ParamByName('TIPO_ALTA').Value := 3;


  IBQSPEventoIndAltaDirecta.ParamByName('PRECIO_BRUTO').AsFloat := 0;

  IBQSPEventoIndAltaDirecta.ParamByName('PRECIO_UNITARIO').asFloat := 0;

  IBQSPEventoIndAltaDirecta.ParamByName('OBSERVACION').Value  := null;
  IBQSPEventoIndAltaDirecta.ParamByName('RESPONSABLE').Value  := 0;
  IBQSPEventoIndAltaDirecta.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoIndAltaDirecta.ParamByName('LOG_USUARIO').Value  := 1;
  IBQSPEventoIndAltaDirecta.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  IBQSPEventoIndAltaDirecta.ParamByName('ID_AUX').Value := null;
  if (idanimalpadre <> -1) then
    IBQSPEventoIndAltaDirecta.ParamByName('ID_AUXPE').Value := IBQGenerador.fieldByName('idauxpe').AsInteger
   else
      IBQSPEventoIndAltaDirecta.ParamByName('ID_AUXPE').Value := null;   

  IBQSPEventoIndAltaDirecta.ParamByName('ID_GRUPO').Value := NULL;
  IBQSPEventoIndAltaDirecta.ParamByName('DISPARADOR').Value := NULL;

  IBQSPEventoIndAltaDirecta.ParamByName('ACTIVIDAD').Value := 3;


  IBQSPEventoIndAltaDirecta.ParamByName('GASTOS').AsFloat := 0;

  //IBQSPEventoIndAltaDirecta.ParamByName('DIASPESO').Value := DiasPeso;

  IBQSPEventoIndAltaDirecta.ParamByName('ADN').Value := null;
  IBQSPEventoIndAltaDirecta.ParamByName('TipificacionSanguinea').Value:=null;
  IBQSPEventoIndAltaDirecta.ParamByName('Propietario').Value := 0;
  IBQSPEventoIndAltaDirecta.ParamByName('Criador').Value := 0;
  IBQSPEventoIndAltaDirecta.ParamByName('Origen').Value := 0;



  IBQSPEventoIndAltaDirecta.Open;
  IBQGenerador.Close;
  IBQDelAuxAnimExternos.Close;
  IBQDelAuxAnimExternos.Open;

  inc(cantInserciones);

  if (sexo = 1) then
    inc(cantAltasDirectasMachos)
   else
     if (sexo = 2) then
      inc(cantAltasDirectasHembras);
end;


procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  ProgressBar1.Position:= 0;
  cantInserciones:= 0;
  cantErrores:= 0;
  cantAltasDirectasMachos:= 0;
  cantAltasDirectasHembras:= 0;
  cantNacimientosMachos:= 0;
  cantNacimientosHembras:= 0;
  cantAltasExternasMachos:= 0;
  cantAltasExternasHembras:= 0;

  MAltas.Lines.Add('****************************************');
  MAltas.Lines.Add('*Comenzando con la GENEALOGIA de MACHOS*');
  MAltas.Lines.Add('****************************************');
  MAltas.Lines.Add('');
  IBQuery1.Close;
  IBQuery1.ParamByName('cria').Value:= StrToInt(Edit1.Text);
  IBQuery1.Open;

  IBQuery1.Last;
  IBQuery1.First;

  IBQuery5.Close;
  IBQuery5.ParamByName('cria').Value:= StrToInt(Edit1.Text);
  IBQuery5.Open;

  IBQuery5.Last;
  IBQuery5.First;

  ProgressBar1.Max:= IBQuery1.RecordCount + IBQuery5.RecordCount;


  RealizarGenealogia(IBQuery1,1);

  MAltas.Lines.Add('');
  MAltas.Lines.Add('*****************************************');
  MAltas.Lines.Add('*Comenzando con la GENEALOGIA de HEMBRAS*.');
  MAltas.Lines.Add('*****************************************');
  MAltas.Lines.Add('');


  RealizarGenealogia(IBQuery5,2);

  showmessage('TERMINO Genealogía.');  
end;

procedure TForm2.RecorroPadres(sexo:Integer;cria, asoc, hbae, rpex, nomb, anls, colo, fnac, fbaj, ftrf, fser, apdo, asop, hbap, asom, hbam: String);
var tipopadre, tipomadre, interno:Integer;//0 no tiene  //1  interno //2 externo //-1 no insertarlo
    idmadre, idpadre: Integer;
    mismopadre, mismamadre: Integer;//1 si 0 no
    interno2: Integer;//1 si 0 no
    nomSexo: String;
begin
 tipopadre:= -1;
 tipomadre:= -1;

 GroupBox2.Caption:= 'Altas - Nacimientos y Bajas ('+IntToStr(cantInserciones)+')';
 GroupBox3.Caption:= 'Errores ('+IntToStr(cantErrores)+')';

 LCantNacMachos.Caption:= IntToStr(cantNacimientosMachos);
 LCantNacHembras.Caption:= IntToStr(cantNacimientosHembras);

 LCantAltasExtMachos.Caption:= IntToStr(cantAltasExternasMachos);
 LCantAltasExtHembras.Caption:= IntToStr(cantAltasExternasHembras);

 LCantAltasDirMachos.Caption:= IntToStr(cantAltasDirectasMachos);
 LCantAltasDirHembras.Caption:= IntToStr(cantAltasDirectasHembras);
 LCantAnimInternos.Caption:= IntToStr(cantNacimientosMachos+cantNacimientosHembras+cantAltasDirectasMachos+cantAltasDirectasHembras);

 Application.ProcessMessages;

 if (sexo = 1) then
   nomSexo:= 'MACHO'
  else
    if (sexo = 2) then
      nomSexo:= 'HEMBRA';

 if ((asoc = '0') and (cria = Edit1.Text)) then
   interno:= 1
  else
    interno:= 0;

 mismopadre:= 0;
 if (hbap = hbae) then
   mismopadre:= 1;

 mismamadre:= 0;
 if (hbap = hbae) then
   mismamadre:= 1;

 if (retornarIDAnimal(hbae,sexo,FPrincipal.EstablecimientoActual,interno) = -1) then
  if (EsFechaValida(fnac)) then
    begin

     if asoc='0' then
     begin
       IBQuery2.Close;   //busco padre en pdre
       IBQuery2.ParamByName('hbae').Value:= hbap;
       IBQuery2.Open;
       IBQuery2.First;
       if not(IBQuery2.IsEmpty) then
          begin
             if ((asop = '0') and (IBQuery2.FieldByName('asoc').AsString <> '0')) then
               asop:= '0'
              else
                if ((asop <> '0') and (IBQuery2.FieldByName('asoc').AsString = '0')) then
                   asop:='0';
                   //asop:=IBQuery2.FieldByName('asoc').AsString;
          end;
     end;

     if (asop = '0') then  //asop = 0 es argentino
       begin
         IBQuery2.Close;   //busco padre en pdre
         IBQuery2.ParamByName('hbae').Value:= hbap;
         IBQuery2.Open;
         IBQuery2.First;
         if not(IBQuery2.IsEmpty) then
           begin
             //showMessage('padre: ' + ADOQuery2.FieldByName('hbae').AsString);
             //ADOQuery2.Next;
             if (IBQuery2.FieldByName('cria').AsString = Edit1.Text) then // si el criador es mismo que el hijo busco en huella internos
               begin
                 tipopadre:= 1;
                 if not(verificarHBA(IBQuery2.FieldByName('hbae').AsString,1,FPrincipal.EstablecimientoActual,1)) then  //pregunto si está en huella cargado como interno
                   begin
                       //tipopadre:= 1;    no hago nada
                   end
                  else
                    begin
                     if ((hbae = hbap) and (sexo = 1)) then
                       begin
                         tipopadre:= 0;
                         MErrorAltas.Lines.Add('El padre '+IBQuery2.FieldByName('hbae').AsString+' del animal '+nomSexo+': '+hbae + ' no se puede agregar porque son el mismo');
                         inc(cantErrores);
                       end
                      else
                      begin
                       //llamado recursivo para agregar al padre del padre
                       RecorroPadres(1,
                                     IBQuery2.FieldByName('cria').AsString,
                                     //IBQuery2.FieldByName('asoc').AsString,
                                     asop,
                                     IBQuery2.FieldByName('hbae').AsString,
                                     IBQuery2.FieldByName('rpex').AsString,
                                     IBQuery2.FieldByName('nomb').AsString,
                                     IBQuery2.FieldByName('anls').AsString,
                                     IBQuery2.FieldByName('colo').AsString,
                                     IBQuery2.FieldByName('fnac').AsString,
                                     IBQuery2.FieldByName('fbaj').AsString,
                                     IBQuery2.FieldByName('ftrf').AsString,
                                     IBQuery2.FieldByName('fser').AsString,
                                     IBQuery2.FieldByName('apdo').AsString,
                                     IBQuery2.FieldByName('asop').AsString,
                                     IBQuery2.FieldByName('hbap').AsString,
                                     IBQuery2.FieldByName('asom').AsString,
                                     IBQuery2.FieldByName('hbam').AsString);
                       //RecorroMadres(ADOQuery2.FieldByName('cria').AsString,ADOQuery2.FieldByName('asom').AsString,ADOQuery2.FieldByName('hbam').AsString);
                      end;
                    end;
               end
             else //criador distinto que el hijo busco en huella externos
               begin
                   tipopadre:= 2;
                   if not(verificarHBA(IBQuery2.FieldByName('hbae').AsString,1,FPrincipal.EstablecimientoActual,0)) then  //pregunto si está en huella cargado como externo
                     begin
                         //tipopadre:= 2;
                         //recuperar el id del padre externo retornarlo
                     end
                    else
                      begin
                         //llamado recursivo para agregar al padre del padre
                         if ((hbae = hbap) and (sexo = 1))  then
                           begin
                             tipopadre:= 0;
                             MErrorAltas.Lines.Add('El padre con HBA: '+IBQuery2.FieldByName('hbae').AsString+' del animal '+nomSexo+' con RP: '+rpex+' y HBA: '+hbae + ' no se puede agregar porque son el mismo');
                             inc(cantErrores);
                           end
                          else
                           begin
                             RecorroPadres(1,
                                           IBQuery2.FieldByName('cria').AsString,
                                           //IBQuery2.FieldByName('asoc').AsString,
                                           asop,
                                           IBQuery2.FieldByName('hbae').AsString,
                                           IBQuery2.FieldByName('rpex').AsString,
                                           IBQuery2.FieldByName('nomb').AsString,
                                           IBQuery2.FieldByName('anls').AsString,
                                           IBQuery2.FieldByName('colo').AsString,
                                           IBQuery2.FieldByName('fnac').AsString,
                                           IBQuery2.FieldByName('fbaj').AsString,
                                           IBQuery2.FieldByName('ftrf').AsString,
                                           IBQuery2.FieldByName('fser').AsString,
                                           IBQuery2.FieldByName('apdo').AsString,
                                           IBQuery2.FieldByName('asop').AsString,
                                           IBQuery2.FieldByName('hbap').AsString,
                                           IBQuery2.FieldByName('asom').AsString,
                                           IBQuery2.FieldByName('hbam').AsString);
                                // RecorroMadres(ADOQuery2.FieldByName('cria').AsString,ADOQuery2.FieldByName('asom').AsString,ADOQuery2.FieldByName('hbam').AsString);
                          end;
                      end;


               end;
           end
         else     //no tiene padre
           begin   ////////////
              //lo busco por las dudas en la tabla de extranjeros  antes de enviar el mensaje de que no existe en pdre

               IBQuery4.Close;   //busco padre
               IBQuery4.ParamByName('hbex').Value:= hbap;
               IBQuery4.ParamByName('sexo').Value:= 1;
               IBQuery4.Open;
               IBQuery4.First;
               if not(IBQuery4.IsEmpty) then    //busco en padres externos
                 begin
                     tipopadre:= 2;
                     if not(verificarHBA(IBQuery4.FieldByName('hbex').AsString,1,FPrincipal.EstablecimientoActual,0)) then  //pregunto si está en huella cargado como externo
                       begin
                           //tipopadre:= 2;
                       end
                      else
                        begin
                           //llamado recursivo para agregar al padre del padre en extr
                             if ((hbae = hbap) and (sexo = 1)) then
                               begin
                                 tipopadre:= 0;
                                 MErrorAltas.Lines.Add('El padre con HBA: '+hbap+' del animal '+nomSexo+'con RP: '+rpex+' y HBA: '+hbae + ' no se puede agregar porque son el mismo');
                                 inc(cantErrores);
                               end
                              else
                                begin
                                   RecorroPadres(1,'',
                                                 //'-1',
                                                 IBQuery4.FieldByName('asox').AsString,
                                                 IBQuery4.FieldByName('hbex').AsString,
                                                 IBQuery4.FieldByName('rpex').AsString,
                                                 IBQuery4.FieldByName('nomb').AsString,
                                                 IBQuery4.FieldByName('anls').AsString,
                                                 '',
                                                 DateToStr(now()),
                                                 DateToStr(now()),
                                                 DateToStr(now()),
                                                 DateToStr(now()),
                                                 '',
                                                 //'-1',
                                                 IBQuery4.FieldByName('asop').AsString,
                                                 IBQuery4.FieldByName('hbap').AsString,
                                                 //'-1',
                                                 IBQuery4.FieldByName('asom').AsString,
                                                 IBQuery4.FieldByName('hbam').AsString);
                                  // RecorroMadres('',ADOQuery4.FieldByName('asom').AsString,ADOQuery4.FieldByName('hbam').AsString);
                                end;
                        end;
                 end  ///////
                else
                  begin //si busca en los padres extranjero y no encuentra digo el siguiente mensaje
                    tipopadre:= 0;
                    MErrorAltas.Lines.Add('El padre con HBA: '+hbap+' del  hijo '+nomSexo+' con RP: '+rpex+' y HBA: '+hbae+' no se puede dar de alta porque no existe en pdre (Machos)');
                    inc(cantErrores);
                  end;
           end;
        end
       else //asop <> 0 no es argentino  busco en extr
         begin
           IBQuery4.Close;   //busco padre
           IBQuery4.ParamByName('hbex').Value:= hbap;
           IBQuery4.ParamByName('sexo').Value:= 1;
           IBQuery4.Open;
           IBQuery4.First;
           if not(IBQuery4.IsEmpty) then    //busco en padres externos
             begin
                 tipopadre:= 2;
                 if not(verificarHBA(IBQuery4.FieldByName('hbex').AsString,1,FPrincipal.EstablecimientoActual,0)) then  //pregunto si está en huella cargado como externo
                   begin
                       //tipopadre:= 2;
                   end
                  else
                    begin
                       //llamado recursivo para agregar al padre del padre en extr
                         if ((hbae = hbap) and (sexo = 1)) then
                           begin
                             tipopadre:= 0;
                             MErrorAltas.Lines.Add('El padre con HBA: '+hbap+' del animal '+nomSexo+'con RP: '+rpex+' y HBA: '+hbae + ' no se puede agregar porque son el mismo');
                             inc(cantErrores);
                           end
                          else
                            begin
                               RecorroPadres(1,'',
                                             //'-1',
                                             IBQuery4.FieldByName('asox').AsString,
                                             IBQuery4.FieldByName('hbex').AsString,
                                             IBQuery4.FieldByName('rpex').AsString,
                                             IBQuery4.FieldByName('nomb').AsString,
                                             IBQuery4.FieldByName('anls').AsString,
                                             '',
                                             DateToStr(now()),
                                             DateToStr(now()),
                                             DateToStr(now()),
                                             DateToStr(now()),
                                             '',
                                             //'-1',
                                             IBQuery4.FieldByName('asop').AsString,
                                             IBQuery4.FieldByName('hbap').AsString,
                                             //'-1',
                                             IBQuery4.FieldByName('asom').AsString,
                                             IBQuery4.FieldByName('hbam').AsString);
                              // RecorroMadres('',ADOQuery4.FieldByName('asom').AsString,ADOQuery4.FieldByName('hbam').AsString);
                            end;
                    end;
             end
            else
              begin
                 tipopadre:= 0; //no tiene padre
                 MErrorAltas.Lines.Add('El padre con HBA: '+hbap+' del  hijo '+nomSexo+' con RP: '+rpex+' y con HBA:'+hbae+' no se puede dar de alta porque no existe en Extr (Extranjeros)');
                 inc(cantErrores);
              end;


         end;

//voy por las madres

     if asoc='0' then  // aca esta el problema
     begin
       IBQuery3.Close;   //busco madre en exis
       IBQuery3.ParamByName('hbae').Value:= hbam;
       IBQuery3.Open;
       IBQuery3.First;
       if not(IBQuery3.IsEmpty) then
        begin //asom:=IBQuery3.FieldByName('asoc').AsString;
         if ((asom = '0') and (IBQuery3.FieldByName('asoc').AsString <> '0')) then
           asom:= '0'
          else
            if ((asom <> '0') and (IBQuery3.FieldByName('asoc').AsString = '0')) then
               asom:='0';
        end;
     end;

     if (asom = '0') then  //asom = 0 es argentina
       begin
         IBQuery3.Close;   //busco madre en exis
         IBQuery3.ParamByName('hbae').Value:= hbam;
         IBQuery3.Open;
         IBQuery3.First;
         if not(IBQuery3.IsEmpty) then
           begin
             //showMessage('madre: ' + ADOQuery3.FieldByName('hbae').AsString);
             //ADOQuery3.Next;
             if (IBQuery3.FieldByName('cria').AsString = Edit1.Text) then // si el criador es mismo que el hijo busco en huella internos
               begin
                 tipomadre:= 1;
                 if not(verificarHBA(IBQuery3.FieldByName('hbae').AsString,2,FPrincipal.EstablecimientoActual,1)) then  //pregunto si está en huella cargado como interno
                   begin
                       //tipomadre:= 1;
                   end
                  else
                    begin
                       if ((hbae = hbam) and (sexo = 2)) then
                         begin
                           tipomadre:= 0;
                           MErrorAltas.Lines.Add('La Madre con HBA: '+hbam+' del animal ' +nomSexo+' con RP: '+rpex+' y con HBA: '+hbae+ ' no se puede agregar porque son el mismo');
                           inc(cantErrores);
                         end
                        else
                         begin
                           //llamado recursivo para agregar a los padres de la madre
                           RecorroPadres(2,
                                         IBQuery3.FieldByName('cria').AsString,
                                         //IBQuery3.FieldByName('asoc').AsString,
                                         asom,
                                         IBQuery3.FieldByName('hbae').AsString,
                                         IBQuery3.FieldByName('rpex').AsString,
                                         IBQuery3.FieldByName('nomb').AsString,
                                         IBQuery3.FieldByName('anls').AsString,
                                         IBQuery3.FieldByName('colo').AsString,
                                         IBQuery3.FieldByName('fnac').AsString,
                                         IBQuery3.FieldByName('fbaj').AsString,
                                         IBQuery3.FieldByName('ftrf').AsString,
                                         IBQuery3.FieldByName('fser').AsString,
                                         IBQuery3.FieldByName('apdo').AsString,
                                         IBQuery3.FieldByName('asop').AsString,
                                         IBQuery3.FieldByName('hbap').AsString,
                                         IBQuery3.FieldByName('asom').AsString,
                                         IBQuery3.FieldByName('hbam').AsString);
                           //RecorroMadres(ADOQuery3.FieldByName('cria').AsString,ADOQuery3.FieldByName('asom').AsString,ADOQuery3.FieldByName('hbam').AsString);
                         end;
                    end;
               end
             else //criador distinto que el hijo busco en huella externos
               begin
                   tipomadre:= 2;
                   if not(verificarHBA(IBQuery3.FieldByName('hbae').AsString,2,FPrincipal.EstablecimientoActual,0)) then  //pregunto si está en huella cargado como externo
                     begin
                         //tipomadre:= 2;
                     end
                    else
                      begin
                         if ((hbae = hbam) and (sexo = 2)) then
                           begin
                             tipomadre:= 0;
                             MErrorAltas.Lines.Add('La Madre con HBA: '+hbam+' del animal ' +nomSexo+ ' con RP: '+rpex+' y con HBA: '+hbae+' no se puede agregar porque son el mismo');
                             inc(cantErrores);
                           end
                          else
                            begin
                             //llamado recursivo para agregar a los padres de la madre
                             RecorroPadres(2,
                                           IBQuery3.FieldByName('cria').AsString,
                                           //IBQuery3.FieldByName('asoc').AsString,
                                           asom,
                                           IBQuery3.FieldByName('hbae').AsString,
                                           IBQuery3.FieldByName('rpex').AsString,
                                           IBQuery3.FieldByName('nomb').AsString,
                                           IBQuery3.FieldByName('anls').AsString,
                                           IBQuery3.FieldByName('colo').AsString,
                                           IBQuery3.FieldByName('fnac').AsString,
                                           IBQuery3.FieldByName('fbaj').AsString,
                                           IBQuery3.FieldByName('ftrf').AsString,
                                           IBQuery3.FieldByName('fser').AsString,
                                           IBQuery3.FieldByName('apdo').AsString,
                                           IBQuery3.FieldByName('asop').AsString,
                                           IBQuery3.FieldByName('hbap').AsString,
                                           IBQuery3.FieldByName('asom').AsString,
                                           IBQuery3.FieldByName('hbam').AsString);
                             //RecorroMadres(ADOQuery3.FieldByName('cria').AsString,ADOQuery3.FieldByName('asom').AsString,ADOQuery3.FieldByName('hbam').AsString);
                           end;
                      end;

               end;
           end
         else     //no tiene madre
           begin
              //lo busco por las dudas en la tabla de extranjeros  antes de enviar el mensaje de que no existe en pdre
             IBQuery4.Close;   //busco padre
             IBQuery4.ParamByName('hbex').Value:= hbam;
             IBQuery4.ParamByName('sexo').Value:= 2;
             IBQuery4.Open;
             IBQuery4.First;
             if not(IBQuery4.IsEmpty) then    //busco en padres externos
               begin
                   tipomadre:= 2;
                   if not(verificarHBA(IBQuery4.FieldByName('hbex').AsString,2,FPrincipal.EstablecimientoActual,0)) then  //pregunto si está en huella cargado como externo
                     begin
                         //tipomadre:= 2;
                     end
                    else
                      begin
                         if ((hbae = hbam) and (sexo = 2)) then
                           begin
                             tipomadre:= 0;
                             MErrorAltas.Lines.Add('La Madre con HBA: '+hbam+' del animal '+nomSexo+' con RP: '+rpex+' y con HBA: '+hbae+' no se puede agregar porque son el mismo');
                             inc(cantErrores);
                           end
                          else
                            begin
                             //llamado recursivo para agregar a los padres de la madre
                             RecorroPadres(2,'',
                                           //'-1',
                                           IBQuery4.FieldByName('asox').AsString,
                                           IBQuery4.FieldByName('hbex').AsString,
                                           IBQuery4.FieldByName('rpex').AsString,
                                           IBQuery4.FieldByName('nomb').AsString,
                                           IBQuery4.FieldByName('anls').AsString,
                                           '',
                                           DateToStr(now()),
                                           DateToStr(now()),
                                           DateToStr(now()),
                                           DateToStr(now()),
                                           '',
                                           //'-1',
                                           IBQuery4.FieldByName('asop').AsString,
                                           IBQuery4.FieldByName('hbap').AsString,
                                           //'-1',
                                           IBQuery4.FieldByName('asom').AsString,
                                           IBQuery4.FieldByName('hbam').AsString);


                             //RecorroMadres('',ADOQuery4.FieldByName('asom').AsString,ADOQuery4.FieldByName('hbam').AsString);
                            end;
                      end;
               end
              else
                begin
                  tipomadre:= 0;
                  MErrorAltas.Lines.Add('La madre con HBA: '+hbam+' del hijo '+nomSexo+' con RP: '+rpex+' y con HBA: '+hbae+' no se puede dar de alta porque no existe en exis (Hembras)');
                  inc(cantErrores);
                end;
           end;
        end
       else //asom <> 0 no es argentina  busco en extr
         begin
           IBQuery4.Close;   //busco padre
           IBQuery4.ParamByName('hbex').Value:= hbam;
           IBQuery4.ParamByName('sexo').Value:= 2;
           IBQuery4.Open;
           IBQuery4.First;
           if not(IBQuery4.IsEmpty) then    //busco en padres externos
             begin
                 tipomadre:= 2;
                 if not(verificarHBA(IBQuery4.FieldByName('hbex').AsString,2,FPrincipal.EstablecimientoActual,0)) then  //pregunto si está en huella cargado como externo
                   begin
                       //tipomadre:= 2;
                   end
                  else
                    begin
                       if ((hbae = hbam) and (sexo = 2)) then
                         begin
                           tipomadre:= 0;
                           MErrorAltas.Lines.Add('La Madre con HBA: '+hbam+' del animal '+nomSexo+' con RP: '+rpex+' y con HBA: '+hbae+' no se puede agregar porque son el mismo');
                           inc(cantErrores);
                         end
                        else
                          begin
                           //llamado recursivo para agregar a los padres de la madre
                           RecorroPadres(2,'',
                                         //'-1',
                                         IBQuery4.FieldByName('asox').AsString,
                                         IBQuery4.FieldByName('hbex').AsString,
                                         IBQuery4.FieldByName('rpex').AsString,
                                         IBQuery4.FieldByName('nomb').AsString,
                                         IBQuery4.FieldByName('anls').AsString,
                                         '',
                                         DateToStr(now()),
                                         DateToStr(now()),
                                         DateToStr(now()),
                                         DateToStr(now()),
                                         '',
                                         //'-1',
                                         IBQuery4.FieldByName('asop').AsString,
                                         IBQuery4.FieldByName('hbap').AsString,
                                         //'-1',
                                         IBQuery4.FieldByName('asom').AsString,
                                         IBQuery4.FieldByName('hbam').AsString);


                           //RecorroMadres('',ADOQuery4.FieldByName('asom').AsString,ADOQuery4.FieldByName('hbam').AsString);
                          end;
                    end;
             end
            else
              begin
                 tipomadre:= 0; //no tiene madre
                 MErrorAltas.Lines.Add('La madre con HBA: '+hbam+' del hijo '+nomSexo+' con RP: '+rpex+' y con HBA: '+hbae+' no se puede dar de alta porque no existe en Extr (Extranjeros)');
                 inc(cantErrores);
              end;

         end;

     if (tipopadre = 1) then
       interno2:= 1
      else
        if (tipopadre = 2) then
          interno2:= 0;

     if (tipopadre <> 0) then
       if (retornarIDAnimal(hbap,1,FPrincipal.EstablecimientoActual,interno2) = -1) then
          tipopadre:= 0;

     if (tipomadre = 1) then
       interno2:= 1
      else
        if (tipomadre = 2) then
          interno2:= 0;

     if (tipomadre <> 0) then
       if (retornarIDAnimal(hbam,2,FPrincipal.EstablecimientoActual,interno2) = -1) then
          tipomadre:= 0;


         //0 no tiene  //1  interno //2 externo //-1 no insertarlo
    if ((tipopadre = 0) and (tipomadre = 0)) then
      begin
        if ((asoc = '0') and (cria = Edit1.Text)) then
          begin
            MAltas.Lines.Add('Alta Directa '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' sin padre ni madre');
            agregarPadreInterno(rpex,hbae,nomb,apdo,-1,-1,-1,-1,-1,-1,-1,StrToDate(fnac),sexo,0,retornarRaza(colo));
          end
         else
           begin
             MAltas.Lines.Add('Alta externa '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' sin padre ni madre');
             agregarPadreExterno(sexo,0,0,retornarRaza(colo),now(),rpex,hbae,nomb,apdo,anls,'','','');
           end;
      end
     else
        if ((tipopadre = 0) and (tipomadre = 1)) then
          begin
             if ((asoc = '0') and (cria = Edit1.Text)) then
               begin
                  MAltas.Lines.Add('Parto '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' con madre interna HBA: '+hbam+ ' sin padre');
                  agregarNacimiento(sexo,0,1,StrToDate(fnac),rpex,nomb,anls,'',hbae,hbam,'');
               end
              else
                 begin
                  MAltas.Lines.Add('Alta Externa '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' sin padre ni madre pero tiene madre interna HBA: '+hbam);
                  agregarPadreExterno(sexo,0,0,retornarRaza(colo),now(),rpex,hbae,nomb,apdo,anls,'','','');
                 end;
          end
         else
            if ((tipopadre = 1) and (tipomadre = 0)) then
              begin
                 if ((asoc = '0') and (cria = Edit1.Text)) then
                   begin
                    MAltas.Lines.Add('Alta Directa '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' con padre interno HBA: '+hbap+ ' sin madre');
                    agregarPadreInterno(rpex,hbae,nomb,apdo,-1,-1,-1,retornarIDAnimal(hbap,1,FPrincipal.EstablecimientoActual,1),-1,-1,-1,StrToDate(fnac),sexo,0,retornarRaza(colo));
                   end
                  else
                     begin
                      MAltas.Lines.Add('Alta Externa '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' sin padre ni madre pero tiene padre interno HBA: '+hbap);
                      agregarPadreExterno(sexo,0,0,retornarRaza(colo),now(),rpex,hbae,nomb,apdo,anls,'',hbap,'');
                     end;
              end
             else
                if ((tipopadre = 1) and (tipomadre = 1)) then
                  begin
                    if ((asoc = '0') and (cria = Edit1.Text)) then
                      begin
                        MAltas.Lines.Add('Parto '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' con padre interno HBA: '+hbap+ ' con madre interna HBA: '+hbam);
                        agregarNacimiento(sexo,0,1,StrToDate(fnac),rpex,nomb,anls,'',hbae,hbam,hbap);
                      end
                     else
                        begin
                          MAltas.Lines.Add('Alta Externa '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' sin padre ni madre pero tiene padre interno HBA:'+hbap+' y madre interna HBA: '+hbam);
                          agregarPadreExterno(sexo,0,0,retornarRaza(colo),now(),rpex,hbae,nomb,apdo,anls,'','','');
                        end;
                   end
                 else
                  if ((tipopadre = 0) and (tipomadre = 2)) then
                    begin
                      if ((asoc = '0') and (cria = Edit1.Text)) then
                        begin
                          MAltas.Lines.Add('Alta Directa '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' con madre externa HBA: '+hbam+ ' sin padre');
                          agregarPadreInterno(rpex,hbae,nomb,apdo,-1,-1,retornarIDAnimal(hbam,2,FPrincipal.EstablecimientoActual,0),-1,-1,-1,-1,StrToDate(fnac),sexo,0,retornarRaza(colo));
                        end
                       else
                         begin
                           MAltas.Lines.Add('Alta Externa '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' con madre externa HBA: '+hbam+ ' sin padre');
                           //agregar relacion de madre sacando el id por hbam
                           agregarPadreExterno(sexo,0,0,retornarRaza(colo),now(),rpex,hbae,nomb,apdo,anls,'','',hbam);
                         end;
                    end
                   else
                    if ((tipopadre = 2) and (tipomadre = 0)) then
                      begin
                        if ((asoc = '0') and (cria = Edit1.Text)) then
                          begin
                            MAltas.Lines.Add('Alta Directa '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' con padre externo HBA: '+hbap+ ' sin madre');
                            //sacar id externo de la tabla tab_animales_externos por hbap
                            agregarPadreInterno(rpex,hbae,nomb,apdo,retornarIDAnimal(hbap,1,FPrincipal.EstablecimientoActual,0),-1,-1,-1,-1,-1,-1,StrToDate(fnac),sexo,0,retornarRaza(colo));
                          end
                         else
                            begin
                              MAltas.Lines.Add('Alta Externa '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' con padre externo HBA: '+hbap+ ' sin madre');
                              //agregar relacion de madre sacando el id por hbap
                              agregarPadreExterno(sexo,0,0,retornarRaza(colo),now(),rpex,hbae,nomb,apdo,anls,'',hbap,'');
                            end
                      end
                     else
                      if ((tipopadre = 2) and (tipomadre = 2)) then
                        begin
                          if ((asoc = '0') and (cria = Edit1.Text)) then
                            begin
                              MAltas.Lines.Add('Alta Directa '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' con padre externo HBA: '+hbap+ ' con madre externa HBA: '+hbam);
                              //sacar id externo de la tabla tab_animales_externos por hbap

                              agregarPadreInterno(rpex,hbae,nomb,apdo,retornarIDAnimal(hbap,1,FPrincipal.EstablecimientoActual,0),-1,retornarIDAnimal(hbam,2,FPrincipal.EstablecimientoActual,0),-1,-1,-1,-1,StrToDate(fnac),sexo,0,retornarRaza(colo));
                            end
                           else
                              begin
                                MAltas.Lines.Add('Alta Externa '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' con padre externo HBA: '+hbap+ ' con madre externa HBA: '+hbam);
                                //agregar relacion de madre sacando el id por hbap
                                agregarPadreExterno(sexo,0,0,retornarRaza(colo),now(),rpex,hbae,nomb,apdo,anls,'',hbap,hbam);
                              end;
                        end
                       else
                        if ((tipopadre = 1) and (tipomadre = 2)) then
                          begin
                            if ((asoc = '0') and (cria = Edit1.Text)) then
                              begin
                                MAltas.Lines.Add('Alta Directa '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' con padre interno HBA: '+hbap+ ' con madre externa HBA: '+hbam);

                                agregarPadreInterno(rpex,hbae,nomb,apdo,-1,-1,retornarIDAnimal(hbam,2,FPrincipal.EstablecimientoActual,0),retornarIDAnimal(hbap,1,FPrincipal.EstablecimientoActual,1),-1,-1,-1,StrToDate(fnac),sexo,0,retornarRaza(colo));
                              end
                             else
                               begin
                                  MAltas.Lines.Add('Alta Externa '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' con padre interno HBA: '+hbap+ ' con madre externa HBA: '+hbam);
                                  agregarPadreExterno(sexo,0,0,retornarRaza(colo),now(),rpex,hbae,nomb,apdo,anls,'',hbap,hbam);
                               end;
                          end
                         else
                          if ((tipopadre = 2) and (tipomadre = 1)) then
                            begin
                              if ((asoc = '0') and (cria = Edit1.Text)) then
                                begin
                                  MAltas.Lines.Add('Parto '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' con padre externo HBA: '+hbap+ ' con madre interna HBA: '+hbam);
                                  agregarNacimiento(sexo,0,0,StrToDate(fnac),rpex,nomb,anls,'',hbae,hbam,hbap);
                                end
                               else
                                 begin
                                     MAltas.Lines.Add('Alta Externa '+nomSexo+' hijo: RP: '+rpex+' HBA: '+hbae+' con padre externo HBA: '+hbap+ ' con madre interna HBA: '+hbam);
                                     agregarPadreExterno(sexo,0,0,retornarRaza(colo),now(),rpex,hbae,nomb,apdo,anls,'',hbap,hbam);
                                 end
                            end;
      FPrincipal.IBTPrincipal.CommitRetaining;

   end
  else
    begin
       MErrorAltas.Lines.Add('Fecha inválida para el animal '+nomSexo+' con RP: '+rpex+' y con HBA: '+hbae+ ' no se pudo dar de alta.');
       inc(cantErrores);
    end
end;


procedure TForm2.RealizarGenealogia(query: TIBQuery; sexo: Integer);
var i,interno:integer;
begin
  query.First;
  while not(query.Eof) do
    begin
     if (query.FieldByName('asoc').AsString = '0') then
       interno:= 1
      else
        interno:= 0;

     if (retornarIDAnimal(query.FieldByName('hbae').AsString,sexo,FPrincipal.EstablecimientoActual,interno) = -1) then
         RecorroPadres(sexo,Edit1.Text,query.FieldByName('asoc').AsString,
                       query.FieldByName('hbae').AsString,
                       query.FieldByName('rpex').AsString,
                       query.FieldByName('nomb').AsString,
                       query.FieldByName('anls').AsString,
                       query.FieldByName('colo').AsString,
                       query.FieldByName('fnac').AsString,
                       query.FieldByName('fbaj').AsString,
                       query.FieldByName('ftrf').AsString,
                       query.FieldByName('fser').AsString,
                       query.FieldByName('apdo').AsString,
                       query.FieldByName('asop').AsString,
                       query.FieldByName('hbap').AsString,
                       query.FieldByName('asom').AsString,
                       query.FieldByName('hbam').AsString);

     ProgressBar1.Position:= ProgressBar1.Position + 1;
     query.Next;
    end;
end;

procedure TForm2.RealizarBaja(query: TIBQuery; sexo: Integer);
var i, idanimalbaja:integer;
begin

  query.First;
  while not(query.Eof) do
    begin
     Application.ProcessMessages;
     if (query.FieldByName('fbaj').Value <> null ) then
       begin
         idanimalbaja:= retornarIDAnimal(query.FieldByName('hbae').AsString,sexo,FPrincipal.EstablecimientoActual,1);
         if (idanimalbaja <> -1) then
            begin
              if (EsFechaValida(query.FieldByName('fbaj').AsString)) then
                begin
                  agregarBaja(StrToDate(query.FieldByName('fbaj').AsString),idanimalbaja);
                  MBaja.Lines.Add('Animal con RP: ' +query.FieldByName('rpex').AsString+' y con HBA '+query.FieldByName('hbae').AsString+' fue dado de baja con éxito.');
                end
               else
                    MErrorBaja.Lines.Add('Animal con RP: ' +query.FieldByName('rpex').AsString+' y con HBA '+query.FieldByName('hbae').AsString+' no puede ser dado de baja porque la fecha es inválida.');
            end
          else
            MErrorBaja.Lines.Add('Animal con RP: ' +query.FieldByName('rpex').AsString+' y con HBA '+query.FieldByName('hbae').AsString+' no fue encontrado en la base de datos para darlo de baja.');
       end;

     ProgressBar1.Position:= ProgressBar1.Position + 1;  
     query.Next;
    end;

end;

function TForm2.verificarHBA(hba: string; sexo, establecimiento,
  interno: integer): boolean;
begin
  result:= false;
  if (interno = 1) then //es interno
    begin
       IBQVerificarHBAInterno.Close;
       IBQVerificarHBAInterno.ParamByName('hba').Value:= hba;
       IBQVerificarHBAInterno.ParamByName('sexo').Value:= sexo;
       IBQVerificarHBAInterno.ParamByName('esta').Value:= establecimiento;
       IBQVerificarHBAInterno.Open;
       IBQVerificarHBAInterno.First;

       result:= IBQVerificarHBAInterno.IsEmpty;
    end
   else
    if (interno = 0) then //es externo
      begin
         IBQVerificarHBAExterno.Close;
         IBQVerificarHBAExterno.ParamByName('hba').Value:= hba;
         IBQVerificarHBAExterno.ParamByName('sexo').Value:= sexo;
         IBQVerificarHBAExterno.ParamByName('esta').Value:= establecimiento;
         IBQVerificarHBAExterno.Open;
         IBQVerificarHBAExterno.First;

         result:= IBQVerificarHBAExterno.IsEmpty;

      end;
end;


function TForm2.EsFechaValida(str: string): Boolean;
var
    dt: TDateTime;
begin
  Result := True;
  try
    dt := StrToDate(str);
  except
    Result := False;
  end;
end;


procedure TForm2.RecorroMadres(cria, asom, hbam :String);
begin
//
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
var i:Integer;
    d: TDate;
    dfloat:Double;
    s:string;
    v:variant;
begin
//  tipopadre:= -1;
//  tipomadre:= -1;

  ADOQuery5.Close;
  ADOQuery5.Open;
  ADOQuery5.First;
  i:= 1;
  while not(ADOQuery5.Eof) do
    begin

     if not((ADOQuery5.FieldByName('HBAE').AsString = '517287') or (ADOQuery5.FieldByName('HBAE').AsString = '363199') or
         (ADOQuery5.FieldByName('HBAE').AsString = '269518') or (ADOQuery5.FieldByName('HBAE').AsString = '732132') or
         (ADOQuery5.FieldByName('HBAE').AsString = '748271') or (ADOQuery5.FieldByName('HBAE').AsString = '749287') or
         (ADOQuery5.FieldByName('HBAE').AsString = '731856') or (ADOQuery5.FieldByName('HBAE').AsString = '731848') or
         (ADOQuery5.FieldByName('HBAE').AsString = '721798') or (ADOQuery5.FieldByName('HBAE').AsString = '713502') or
         (ADOQuery5.FieldByName('HBAE').AsString = '710277') or (ADOQuery5.FieldByName('HBAE').AsString = '753661') or
         (ADOQuery5.FieldByName('HBAE').AsString = '741890') or (ADOQuery5.FieldByName('HBAE').AsString = '755520') or
         (ADOQuery5.FieldByName('HBAE').AsString = '717138') or (ADOQuery5.FieldByName('HBAE').AsString = '730854')) then

       begin

           IBQInsertPDRE.Close;

          // IBQGenIDPadre.Close;
          // IBQGenIDPadre.Open;


           IBQInsertPDRE.ParamByName('IDPADRE').AsInteger:= i;//IBQGenIDPadre.FieldValues['IDPADRE'];
           //IBQInsertPDRE.ParamByName('SEXO').Value:= 2;

           if (ADOQuery5.FieldByName('RAZA').Value <> null) then
             IBQInsertPDRE.ParamByName('RAZA').Value:= ADOQuery5.FieldByName('RAZA').AsInteger
            else
              IBQInsertPDRE.ParamByName('RAZA').Value:= null;

           if (ADOQuery5.FieldByName('RGST').Value <> null) then
             IBQInsertPDRE.ParamByName('RGST').Value:= ADOQuery5.FieldByName('RGST').AsString
            else
              IBQInsertPDRE.ParamByName('RGST').Value:= null;

           if (ADOQuery5.FieldByName('VARI').Value <> null) then
              IBQInsertPDRE.ParamByName('VARI').Value:= ADOQuery5.FieldByName('VARI').AsString
            else
              IBQInsertPDRE.ParamByName('VARI').Value:= null;

           if (ADOQuery5.FieldByName('ASOC').Value <> null) then
             IBQInsertPDRE.ParamByName('ASOC').Value:= ADOQuery5.FieldByName('ASOC').AsInteger
            else
               IBQInsertPDRE.ParamByName('ASOC').Value:= null;

           if (ADOQuery5.FieldByName('HBAE').Value <> null) then
             IBQInsertPDRE.ParamByName('HBAE').Value:= ADOQuery5.FieldByName('HBAE').AsString
            else
               IBQInsertPDRE.ParamByName('HBAE').Value:= null;

           if (ADOQuery5.FieldByName('CDPX').Value <> null) then
             IBQInsertPDRE.ParamByName('CDPX').Value:= ADOQuery5.FieldByName('CDPX').AsString
            else
              IBQInsertPDRE.ParamByName('CDPX').Value:= null;

           if (ADOQuery5.FieldByName('RPEX').Value <> null) then
             IBQInsertPDRE.ParamByName('RPEX').Value:= ADOQuery5.FieldByName('RPEX').AsString
            else
              IBQInsertPDRE.ParamByName('RPEX').Value:= null;

           if (ADOQuery5.FieldByName('NOMB').Value <> null) then
             IBQInsertPDRE.ParamByName('NOMB').Value:= ADOQuery5.FieldByName('NOMB').AsString
            else
              IBQInsertPDRE.ParamByName('NOMB').Value:= null;

           if (ADOQuery5.FieldByName('CBAJ').Value <> null) then
             IBQInsertPDRE.ParamByName('CBAJ').Value:= ADOQuery5.FieldByName('CBAJ').AsString
            else
              IBQInsertPDRE.ParamByName('CBAJ').Value:= null;

           if (ADOQuery5.FieldByName('OBSI').Value <> null) then
             IBQInsertPDRE.ParamByName('OBSI').Value:= ADOQuery5.FieldByName('OBSI').AsString
            else
              IBQInsertPDRE.ParamByName('OBSI').Value:= null;

           if (ADOQuery5.FieldByName('DADO').Value <> null) then
             IBQInsertPDRE.ParamByName('DADO').Value:= ADOQuery5.FieldByName('DADO').AsInteger
            else
              IBQInsertPDRE.ParamByName('DADO').Value:= null;

           if (ADOQuery5.FieldByName('PROP').Value <> null) then
             IBQInsertPDRE.ParamByName('PROP').Value:= ADOQuery5.FieldByName('PROP').AsInteger
            else
              IBQInsertPDRE.ParamByName('PROP').Value:= null;

           if (ADOQuery5.FieldByName('CRIA').Value <> null) then
             IBQInsertPDRE.ParamByName('CRIA').Value:= ADOQuery5.FieldByName('CRIA').AsInteger
            else
              IBQInsertPDRE.ParamByName('CRIA').Value:= null;

           if (ADOQuery5.FieldByName('TRAN').Value <> null) then
             IBQInsertPDRE.ParamByName('TRAN').Value:= ADOQuery5.FieldByName('TRAN').AsInteger
            else
              IBQInsertPDRE.ParamByName('TRAN').Value:= null;

           if (ADOQuery5.FieldByName('ANLS').Value <> null) then
             IBQInsertPDRE.ParamByName('ANLS').Value:= ADOQuery5.FieldByName('ANLS').AsInteger
            else
              IBQInsertPDRE.ParamByName('ANLS').Value:= null;

           if (ADOQuery5.FieldByName('RANA').Value <> null) then
             IBQInsertPDRE.ParamByName('RANA').Value:= ADOQuery5.FieldByName('RANA').AsInteger
            else
              IBQInsertPDRE.ParamByName('RANA').Value:= null;

           if (ADOQuery5.FieldByName('CALG').Value <> null) then
             IBQInsertPDRE.ParamByName('CALG').Value:= ADOQuery5.FieldByName('CALG').AsString
            else
              IBQInsertPDRE.ParamByName('CALG').Value:= null;

           if (ADOQuery5.FieldByName('APRB').Value <> null) then
             IBQInsertPDRE.ParamByName('APRB').Value:= ADOQuery5.FieldByName('APRB').AsString
            else
              IBQInsertPDRE.ParamByName('APRB').Value:= null;

           if (ADOQuery5.FieldByName('SIET').Value <> null) then
             IBQInsertPDRE.ParamByName('SIET').Value:= ADOQuery5.FieldByName('SIET').AsInteger
            else
              IBQInsertPDRE.ParamByName('SIET').Value:= null;

           if (ADOQuery5.FieldByName('DONA').Value <> null) then
             IBQInsertPDRE.ParamByName('DONA').Value:= ADOQuery5.FieldByName('DONA').AsString
            else
              IBQInsertPDRE.ParamByName('DONA').Value:= null;

           if (ADOQuery5.FieldByName('MELL').Value <> null) then
             IBQInsertPDRE.ParamByName('MELL').Value:= ADOQuery5.FieldByName('MELL').AsInteger
            else
              IBQInsertPDRE.ParamByName('MELL').Value:= null;

           if (ADOQuery5.FieldByName('TRNS').Value <> null) then
             IBQInsertPDRE.ParamByName('TRNS').Value:= ADOQuery5.FieldByName('TRNS').AsString
            else
              IBQInsertPDRE.ParamByName('TRNS').Value:= null;

           if (ADOQuery5.FieldByName('TSER').Value <> null) then
             IBQInsertPDRE.ParamByName('TSER').Value:= ADOQuery5.FieldByName('TSER').AsInteger
            else
              IBQInsertPDRE.ParamByName('TSER').Value:= null;

           if (ADOQuery5.FieldByName('EMBA').Value <> null) then
             IBQInsertPDRE.ParamByName('EMBA').Value:= ADOQuery5.FieldByName('EMBA').AsString
            else
              IBQInsertPDRE.ParamByName('EMBA').Value:= null;

           if (ADOQuery5.FieldByName('COLO').Value <> null) then
             IBQInsertPDRE.ParamByName('COLO').Value:= ADOQuery5.FieldByName('COLO').AsString
            else
              IBQInsertPDRE.ParamByName('COLO').Value:= null;

           if (ADOQuery5.FieldByName('RGSP').Value <> null) then
             IBQInsertPDRE.ParamByName('RGSP').Value:= ADOQuery5.FieldByName('RGSP').AsString
            else
              IBQInsertPDRE.ParamByName('RGSP').Value:= null;

           if (ADOQuery5.FieldByName('VARP').Value <> null) then
             IBQInsertPDRE.ParamByName('VARP').Value:= ADOQuery5.FieldByName('VARP').AsString
            else
              IBQInsertPDRE.ParamByName('VARP').Value:= null;

           if (ADOQuery5.FieldByName('ASOP').Value <> null) then
             IBQInsertPDRE.ParamByName('ASOP').Value:= ADOQuery5.FieldByName('ASOP').AsInteger
            else
              IBQInsertPDRE.ParamByName('ASOP').Value:= null;

           if (ADOQuery5.FieldByName('HBAP').Value <> null) then
             IBQInsertPDRE.ParamByName('HBAP').Value:= ADOQuery5.FieldByName('HBAP').AsString
            else
              IBQInsertPDRE.ParamByName('HBAP').Value:= null;

           if (ADOQuery5.FieldByName('RPPD').Value <> null) then
             IBQInsertPDRE.ParamByName('RPPD').Value:= ADOQuery5.FieldByName('RPPD').AsString
            else
              IBQInsertPDRE.ParamByName('RPPD').Value:= null;

           if (ADOQuery5.FieldByName('RGSM').Value <> null) then
             IBQInsertPDRE.ParamByName('RGSM').Value:= ADOQuery5.FieldByName('RGSM').AsString
            else
              IBQInsertPDRE.ParamByName('RGSM').Value:= null;

           if (ADOQuery5.FieldByName('VARM').Value <> null) then
             IBQInsertPDRE.ParamByName('VARM').Value:= ADOQuery5.FieldByName('VARM').AsString
            else
              IBQInsertPDRE.ParamByName('VARM').Value:= null;

           if (ADOQuery5.FieldByName('ASOM').Value <> null) then
             IBQInsertPDRE.ParamByName('ASOM').Value:= ADOQuery5.FieldByName('ASOM').AsInteger
            else
              IBQInsertPDRE.ParamByName('ASOM').Value:= null;

           if (ADOQuery5.FieldByName('HBAM').Value <> null) then
             IBQInsertPDRE.ParamByName('HBAM').Value:= ADOQuery5.FieldByName('HBAM').AsString
            else
              IBQInsertPDRE.ParamByName('HBAM').Value:= null;

           if (ADOQuery5.FieldByName('RPMD').Value <> null) then
             IBQInsertPDRE.ParamByName('RPMD').Value:= ADOQuery5.FieldByName('RPMD').AsString
            else
              IBQInsertPDRE.ParamByName('RPMD').Value:= null;

           if (ADOQuery5.FieldByName('RPTI').Value <> null) then
             IBQInsertPDRE.ParamByName('RPTI').Value:= ADOQuery5.FieldByName('RPTI').AsString
            else
              IBQInsertPDRE.ParamByName('RPTI').Value:= null;

            if (EsFechaValida(ADOQuery5.FieldByName('FNAC').AsString)) then
              begin
                 if (ADOQuery5.FieldByName('FNAC').Value <> null) then
                   IBQInsertPDRE.ParamByName('FNAC').Value:= ADOQuery5.FieldByName('FNAC').AsDateTime
                  else
                    IBQInsertPDRE.ParamByName('FNAC').Value:= null;
              end
             else
               IBQInsertPDRE.ParamByName('FNAC').Value:= null;


            if (EsFechaValida(ADOQuery5.FieldByName('FBAJ').AsString)) then
              begin
                 if (ADOQuery5.FieldByName('FBAJ').Value <> null) then
                   IBQInsertPDRE.ParamByName('FBAJ').Value:= ADOQuery5.FieldByName('FBAJ').AsDateTime
                  else
                    IBQInsertPDRE.ParamByName('FBAJ').Value:= null;
              end
             else
               IBQInsertPDRE.ParamByName('FBAJ').Value:= null;


            if (EsFechaValida(ADOQuery5.FieldByName('FESB').AsString)) then
              begin
                 if (ADOQuery5.FieldByName('FESB').Value <> null) then
                   IBQInsertPDRE.ParamByName('FESB').Value:= ADOQuery5.FieldByName('FESB').AsDateTime
                  else
                    IBQInsertPDRE.ParamByName('FESB').Value:= null;
              end
             else
               IBQInsertPDRE.ParamByName('FESB').Value:= null;


            if (EsFechaValida(ADOQuery5.FieldByName('FOBS').AsString)) then
              begin
                 if (ADOQuery5.FieldByName('FOBS').Value <> null) then
                   IBQInsertPDRE.ParamByName('FOBS').Value:= ADOQuery5.FieldByName('FOBS').AsDateTime
                  else
                    IBQInsertPDRE.ParamByName('FOBS').Value:= null;
              end
             else
               IBQInsertPDRE.ParamByName('FOBS').Value:= null;


            if (EsFechaValida(ADOQuery5.FieldByName('FTRF').AsString)) then
              begin
                 if (ADOQuery5.FieldByName('FTRF').Value <> null) then
                   IBQInsertPDRE.ParamByName('FTRF').Value:= ADOQuery5.FieldByName('FTRF').AsDateTime
                  else
                    IBQInsertPDRE.ParamByName('FTRF').Value:= null;
              end
             else
               IBQInsertPDRE.ParamByName('FTRF').Value:= null;

            if (EsFechaValida(ADOQuery5.FieldByName('FSER').AsString)) then
              begin
                 if (ADOQuery5.FieldByName('FSER').Value <> null) then
                   IBQInsertPDRE.ParamByName('FSER').Value:= ADOQuery5.FieldByName('FSER').AsDateTime
                  else
                    IBQInsertPDRE.ParamByName('FSER').Value:= null;
              end
             else
               IBQInsertPDRE.ParamByName('FSER').Value:= null;

           if (ADOQuery5.FieldByName('CPEL').Value <> null) then
             IBQInsertPDRE.ParamByName('CPEL').Value:= ADOQuery5.FieldByName('CPEL').AsInteger
            else
              IBQInsertPDRE.ParamByName('CPEL').Value:= null;

           if (ADOQuery5.FieldByName('CCUE').Value <> null) then
             IBQInsertPDRE.ParamByName('CCUE').Value:= ADOQuery5.FieldByName('CCUE').AsInteger
            else
              IBQInsertPDRE.ParamByName('CCUE').Value:= null;

           if (ADOQuery5.FieldByName('CCAB').Value <> null) then
             IBQInsertPDRE.ParamByName('CCAB').Value:= ADOQuery5.FieldByName('CCAB').AsInteger
            else
              IBQInsertPDRE.ParamByName('CCAB').Value:= null;

           if (ADOQuery5.FieldByName('CMIE').Value <> null) then
             IBQInsertPDRE.ParamByName('CMIE').Value:= ADOQuery5.FieldByName('CMIE').AsInteger
            else
              IBQInsertPDRE.ParamByName('CMIE').Value:= null;

           if (ADOQuery5.FieldByName('RPNU').Value <> null) then
             IBQInsertPDRE.ParamByName('RPNU').Value:= ADOQuery5.FieldByName('RPNU').AsString
            else
              IBQInsertPDRE.ParamByName('RPNU').Value:= null;

           if (ADOQuery5.FieldByName('APDO').Value <> null) then
             IBQInsertPDRE.ParamByName('APDO').Value:= ADOQuery5.FieldByName('APDO').AsString
            else
              IBQInsertPDRE.ParamByName('APDO').Value:= null;

           if (ADOQuery5.FieldByName('PENA').Value <> null) then
             IBQInsertPDRE.ParamByName('PENA').Value:= ADOQuery5.FieldByName('PENA').AsInteger
            else
              IBQInsertPDRE.ParamByName('PENA').Value:= null;

           if (ADOQuery5.FieldByName('PEDE').Value <> null) then
             IBQInsertPDRE.ParamByName('PEDE').Value:= ADOQuery5.FieldByName('PEDE').AsInteger
            else
              IBQInsertPDRE.ParamByName('PEDE').Value:= null;

           if (ADOQuery5.FieldByName('PEFI').Value <> null) then
             IBQInsertPDRE.ParamByName('PEFI').Value:= ADOQuery5.FieldByName('PEFI').AsInteger
            else
              IBQInsertPDRE.ParamByName('PEFI').Value:= null;

           if (ADOQuery5.FieldByName('EPNA').Value <> null) then
             IBQInsertPDRE.ParamByName('EPNA').Value:= ADOQuery5.FieldByName('EPNA').AsInteger
            else
              IBQInsertPDRE.ParamByName('EPNA').Value:= null;

           if (ADOQuery5.FieldByName('EPDE').Value <> null) then
             IBQInsertPDRE.ParamByName('EPDE').Value:= ADOQuery5.FieldByName('EPDE').AsInteger
            else
              IBQInsertPDRE.ParamByName('EPDE').Value:= null;

           if (ADOQuery5.FieldByName('EPFI').Value <> null) then
             IBQInsertPDRE.ParamByName('EPFI').Value:= ADOQuery5.FieldByName('EPFI').AsInteger
            else
              IBQInsertPDRE.ParamByName('EPFI').Value:= null;

           if (ADOQuery5.FieldByName('NROC').Value <> null) then
             IBQInsertPDRE.ParamByName('NROC').Value:= ADOQuery5.FieldByName('NROC').AsInteger
            else
              IBQInsertPDRE.ParamByName('NROC').Value:= null;

           if (ADOQuery5.FieldByName('SIGLA').Value <> null) then
             IBQInsertPDRE.ParamByName('SIGLA').Value:= ADOQuery5.FieldByName('SIGLA').AsInteger
            else
              IBQInsertPDRE.ParamByName('SIGLA').Value:= null;

           if (ADOQuery5.FieldByName('SIGPA').Value <> null) then
             IBQInsertPDRE.ParamByName('SIGPA').Value:= ADOQuery5.FieldByName('SIGPA').AsInteger
            else
              IBQInsertPDRE.ParamByName('SIGPA').Value:= null;

           if (ADOQuery5.FieldByName('SIGMA').Value <> null) then
             IBQInsertPDRE.ParamByName('SIGMA').Value:= ADOQuery5.FieldByName('SIGMA').AsInteger
            else
              IBQInsertPDRE.ParamByName('SIGMA').Value:= null;

           if (ADOQuery5.FieldByName('PURE').Value <> null) then
             IBQInsertPDRE.ParamByName('PURE').Value:= ADOQuery5.FieldByName('PURE').AsString
            else
              IBQInsertPDRE.ParamByName('PURE').Value:= null;

           if (ADOQuery5.FieldByName('TANA').Value <> null) then
             IBQInsertPDRE.ParamByName('TANA').Value:= ADOQuery5.FieldByName('TANA').AsString
            else
              IBQInsertPDRE.ParamByName('TANA').Value:= null;


           inc(i);
           IBQInsertPDRE.Open;
           IBTSRA.CommitRetaining;
       end;
     ADOQuery5.Next;
    end;
end;

function TForm2.retornarIDAnimal(hba: String; sexo, establecimiento, interno: Integer): Integer;
begin
  result:= -1;
  if (interno = 1) then //es interno
    begin
       IBQVerificarHBAInterno.Close;
       IBQVerificarHBAInterno.ParamByName('hba').Value:= hba;
       IBQVerificarHBAInterno.ParamByName('sexo').Value:= sexo;
       IBQVerificarHBAInterno.ParamByName('esta').Value:= establecimiento;
       IBQVerificarHBAInterno.Open;
       IBQVerificarHBAInterno.First;

       if not(IBQVerificarHBAInterno.IsEmpty) then
        result:= IBQVerificarHBAInterno.fieldbyname('id_animal').AsInteger;
    end
   else
    if (interno = 0) then //es externo
      begin
         IBQVerificarHBAExterno.Close;
         IBQVerificarHBAExterno.ParamByName('hba').Value:= hba;
         IBQVerificarHBAExterno.ParamByName('sexo').Value:= sexo;
         IBQVerificarHBAExterno.ParamByName('esta').Value:= establecimiento;
         IBQVerificarHBAExterno.Open;
         IBQVerificarHBAExterno.First;

         if not(IBQVerificarHBAExterno.isEmpty) then
           result:= IBQVerificarHBAExterno.fieldbyname('id_animal_externo').AsInteger;

      end;
end;



function TForm2.retornarRaza(color: String): Integer;
var colaux: String;
begin
  colaux:= Trim(color);
  result:= 2;
  if (colaux<>'') then
    begin
      if ((colaux ='6') or (colaux = '06')) then
         result:= 3
       else
            if ((colaux ='7') or (colaux = '07')) then
               result:= 2;
    end

end;

procedure TForm2.RadioGroup1Click(Sender: TObject);
begin
{   IBQuery1.Close;
   if (RadioGroup1.ItemIndex = 0) then  // es padres
     begin
        IBQuery1.Database:= IBDSRAPADRES;
        IBQuery1.Transaction:= IBTSRAPADRES;
     end
    else
     if (RadioGroup1.ItemIndex = 1) then  // es madres
       begin
          IBQuery1.Database:= IBDSRAMADRES;
          IBQuery1.Transaction:= IBTSRAMADRES;
       end
}
end;

procedure TForm2.BitBtn7Click(Sender: TObject);
begin
  ProgressBar1.Position:= 0;
  MBaja.Lines.Add('****************************************');
  MBaja.Lines.Add('****Comenzando con la BAJA de MACHOS****');
  MBaja.Lines.Add('****************************************');
  MBaja.Lines.Add('');

  IBQuery1.Close;
  IBQuery1.ParamByName('cria').Value:= StrToInt(Edit1.Text);
  IBQuery1.Open;

  IBQuery1.Last;
  IBQuery1.First;

  IBQuery5.Close;
  IBQuery5.ParamByName('cria').Value:= StrToInt(Edit1.Text);
  IBQuery5.Open;

  IBQuery5.Last;
  IBQuery5.First;

  ProgressBar1.Max:= IBQuery1.RecordCount + IBQuery5.RecordCount;

  RealizarBaja(IBQuery1,1);

  MBaja.Lines.Add('');  
  MBaja.Lines.Add('****************************************');
  MBaja.Lines.Add('****Comenzando con la BAJA de HEMBRAS***');
  MBaja.Lines.Add('****************************************');
  MBaja.Lines.Add('');

  RealizarBaja(IBQuery5,2);
  showmessage('TERMINO BAJA');
end;

procedure TForm2.agregarBaja(fechabaja: TDate; idanimal:Integer);
begin
  IBQSPEventoIndBaja.Close;
  IBQSPEventoIndBaja.ParamByName('FECHA').AsDate  := fechabaja;
  IBQSPEventoIndBaja.ParamByName('ANIMAL').AsInteger := idanimal;
  IBQSPEventoIndBaja.ParamByName('OBSERVACION').AsString := 'Baja: No especificada por SRA.';
  IBQSPEventoIndBaja.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoIndBaja.ParamByName('RESPONSABLE').AsInteger := 0;
  IBQSPEventoIndBaja.ParamByName('LOG_USUARIO').AsInteger :=  FPrincipal.UsuarioActual;
  IBQSPEventoIndBaja.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;
  IBQSPEventoIndBaja.ParamByName('ID_GRUPO').Value := Null;
  IBQSPEventoIndBaja.ParamByName('TIPO').Value := 1;

  IBQSPEventoIndBaja.ParamByName('PESO').Value := 0;

  IBQSPEventoIndBaja.ParamByName('PRECIO').Value := 0;

  IBQSPEventoIndBaja.ParamByName('PESODESTINO').Value := 0;

  IBQSPEventoIndBaja.ParamByName('DESTINO').AsInteger := 0;
  IBQSPEventoIndBaja.ParamByName('DTA').AsString := '';
  IBQSPEventoIndBaja.ParamByName('REMITO').AsString := '';
  IBQSPEventoIndBaja.Open;

  FPrincipal.IBTPrincipal.CommitRetaining;
end;


procedure TForm2.BitBtn1Click(Sender: TObject);
var F: TextFile;
    i: Integer;
begin
           AssignFile(F, ExtractFilePath(Application.ExeName)+'LOGSRAGenea.TXT');
           ReWrite(F);

           WriteLn(F,'*** Importación de Genealogía de SRA ***');
           WriteLn(F,'');

           WriteLn(F,' ** Cantidad Total de  Animales Insertados: ' + IntToStr(cantAltasDirectasMachos+cantAltasDirectasHembras+cantNacimientosMachos+cantNacimientosHembras+cantAltasExternasMachos + cantAltasExternasHembras));

           WriteLn(F,'');
           WriteLn(F,'   * Cantidad de Animales Internos Cargados: ' + IntToStr(cantAltasDirectasMachos+cantAltasDirectasHembras+cantNacimientosMachos+cantNacimientosHembras));
           WriteLn(F,'      - Cantidad de Altas Directas Machos: ' + IntToStr(cantAltasDirectasMachos));
           WriteLn(F,'      - Cantidad de Altas Directas Hembras: ' + IntToStr(cantAltasDirectasHembras));
           WriteLn(F,'      - Cantidad de Nacimientos Machos: ' + IntToStr(cantNacimientosMachos));
           WriteLn(F,'      - Cantidad de Nacimientos Hembras: ' + IntToStr(cantNacimientosHembras));
           WriteLn(F,'');

           WriteLn(F,'   * Cantidad de Animales Externos Cargados: ' + IntToStr(cantAltasExternasMachos + cantAltasExternasHembras));
           WriteLn(F,'      - Cantidad de Altas Externas Machos: ' + IntToStr(cantAltasExternasMachos));
           WriteLn(F,'      - Cantidad de Altas Externas Hembras: ' + IntToStr(cantAltasExternasHembras));

           WriteLn(F,'');
           WriteLn(F,'****************************************');
           WriteLn(F,'');

           i:= 0;
           while (i < MAltas.Lines.Count) do
             begin
               WriteLn(F,MAltas.Lines[i]);
               inc(i);
             end;

           CloseFile(F);


           AssignFile(F, ExtractFilePath(Application.ExeName)+'LOGSRAGeneaError.TXT');
           ReWrite(F);

           WriteLn(F,'*** ERRORES en Importación de Genealogía de SRA ***');
           WriteLn(F,'');
           WriteLn(F,'***************************************************');
           WriteLn(F,'');
           WriteLn(F,'');

           i:= 0;
           while (i < MErrorAltas.Lines.Count) do
             begin
               WriteLn(F,MErrorAltas.Lines[i]);
               inc(i);
             end;

           CloseFile(F);


           AssignFile(F, ExtractFilePath(Application.ExeName)+'LOGSRABaja.TXT');
           ReWrite(F);

           WriteLn(F,'*** BAJA de SRA ***');
           WriteLn(F,'');
           WriteLn(F,'*******************');
           WriteLn(F,'');
           WriteLn(F,'');

           i:= 0;
           while (i < MBaja.Lines.Count) do
             begin
               WriteLn(F,MBaja.Lines[i]);
               inc(i);
             end;

           CloseFile(F);

           AssignFile(F, ExtractFilePath(Application.ExeName)+'LOGSRABajaError.TXT');
           ReWrite(F);

           WriteLn(F,'*** ERROR BAJA de SRA ***');
           WriteLn(F,'');
           WriteLn(F,'*************************');
           WriteLn(F,'');
           WriteLn(F,'');

           i:= 0;
           while (i < MErrorBaja.Lines.Count) do
             begin
               WriteLn(F,MErrorBaja.Lines[i]);
               inc(i);
             end;

           CloseFile(F);
end;

end.

