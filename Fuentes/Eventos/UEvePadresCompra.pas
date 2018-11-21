unit UEvePadresCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, DBCtrls, UDBLookupComboBoxAuto, Mask,
  UDBEditAuto, JvExExtCtrls, JvExtComponent, JvRollOut, IBUpdateSQL,
  DateTimePickerAuto, JvExControls, JvLabel, JvGIF, PngImage, jpeg,
  ImgList, PngImageList, JvImage;

type
  TFEvePadresCompra = class(TFUniversal)
    PMadre: TPanel;
    PPadre: TPanel;
    PBotones: TPanel;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    GBDonadora: TGroupBox;
    GroupBox2: TGroupBox;
    BDBGMadre: TBitDBGrid;
    BDBGPadre: TBitDBGrid;
    IBQMadres: TIBQuery;
    DSMadres: TDataSource;
    IBQPadres1: TIBQuery;
    DSPadres1: TDataSource;
    IBQPadres1ID_RP: TIBStringField;
    IBQPadres1ESTABLECIMIENTO: TIntegerField;
    IBQPadres1ID_ANIMAL_EXTERNO: TIntegerField;
    IBQPadres1ID_SENASA: TIBStringField;
    IBQPadres1ID_PC: TIBStringField;
    IBQPadres1ID_HBA: TIBStringField;
    IBQPadres1ID_RA: TIBStringField;
    IBQPadres1ID_OTRO: TIBStringField;
    IBQPadres1NOMBRE: TIBStringField;
    IBQPadres1APODO: TIBStringField;
    IBQPadres1RAZA: TIntegerField;
    IBQPadres1SEXO: TIntegerField;
    IBQPadres1CRIADOR: TIBStringField;
    IBQPadres1PROPIETARIO: TIntegerField;
    IBQMadresID_RP: TIBStringField;
    IBQMadresESTABLECIMIENTO: TIntegerField;
    IBQMadresID_ANIMAL_EXTERNO: TIntegerField;
    IBQMadresID_SENASA: TIBStringField;
    IBQMadresID_PC: TIBStringField;
    IBQMadresID_HBA: TIBStringField;
    IBQMadresID_RA: TIBStringField;
    IBQMadresID_OTRO: TIBStringField;
    IBQMadresNOMBRE: TIBStringField;
    IBQMadresAPODO: TIBStringField;
    IBQMadresRAZA: TIntegerField;
    IBQMadresSEXO: TIntegerField;
    IBQMadresCRIADOR: TIBStringField;
    IBQMadresPROPIETARIO: TIntegerField;
    BBAddMadre: TSpeedButton;
    BBAddPadres: TSpeedButton;
    PDatosMadre: TPanel;
    PDatos: TPanel;
    DBEASenasaMadre: TDBEditAuto;
    RBSenasaMadre: TRadioButton;
    RBCuigMadre: TRadioButton;
    DBEARPMadre: TDBEditAuto;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBLCBAPropietarioMadre: TDBLookupComboBoxAuto;
    DBEACriadorMadre: TDBEditAuto;
    DBEAApodoMadre: TDBEditAuto;
    DBEANombreMadre: TDBEditAuto;
    DBLCBARazaMadre: TDBLookupComboBoxAuto;
    DBLCBASexoMadre: TDBLookupComboBoxAuto;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEAPCMadre: TDBEditAuto;
    DBEAOtroMadre: TDBEditAuto;
    DBEARAMadre: TDBEditAuto;
    DBEAHBAMadre: TDBEditAuto;
    PBotonesMadres: TPanel;
    BBAceptarM: TBitBtn;
    BBCancelarM: TBitBtn;
    PDatosPadre: TPanel;
    Panel3: TPanel;
    BBAceptarP: TBitBtn;
    BBCancelarP: TBitBtn;
    JROPadre1: TJvRollOut;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEASenasaPadre1: TDBEditAuto;
    RBSenasaPadre1: TRadioButton;
    RBCuigPadre1: TRadioButton;
    DBEARPPadre1: TDBEditAuto;
    DBLCBAPropietarioPadre1: TDBLookupComboBoxAuto;
    DBEACriadorPadre1: TDBEditAuto;
    DBEAApodoPadre1: TDBEditAuto;
    DBEANombrePadre1: TDBEditAuto;
    DBLCBARazaPadre1: TDBLookupComboBoxAuto;
    DBLCBASexoPadre1: TDBLookupComboBoxAuto;
    DBEPCPadre1: TDBEditAuto;
    DBEAOtroPadre1: TDBEditAuto;
    DBEARAPadre1: TDBEditAuto;
    DBEHBAPadre1: TDBEditAuto;
    JROPadre2: TJvRollOut;
    Panel1: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    DBEASenasaPadre2: TDBEditAuto;
    RBSenasaPadre2: TRadioButton;
    RBCuigPadre2: TRadioButton;
    DBERPPadre2: TDBEditAuto;
    DBLCBAPropietarioPadre2: TDBLookupComboBoxAuto;
    DBEACriadorPadre2: TDBEditAuto;
    DBEAApodoPadre2: TDBEditAuto;
    DBEANombrePadre2: TDBEditAuto;
    DBLCBARazaPadre2: TDBLookupComboBoxAuto;
    DBLCBASexoPadre2: TDBLookupComboBoxAuto;
    DBEAPCPadre2: TDBEditAuto;
    DBEAOtroPadre2: TDBEditAuto;
    DBEARAPadre2: TDBEditAuto;
    DBEAHBAPadre2: TDBEditAuto;
    IBUMadres: TIBUpdateSQL;
    IBUPadres1: TIBUpdateSQL;
    IBQSexoMadre: TIBQuery;
    DSSexoMadre: TDataSource;
    IBQSexoPadre: TIBQuery;
    DSSexoPadre: TDataSource;
    DSPadres2: TDataSource;
    IBQPadres2: TIBQuery;
    IBStringField1: TIBStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IBStringField9: TIBStringField;
    IntegerField5: TIntegerField;
    IBUPadres2: TIBUpdateSQL;
    BBAceptar: TBitBtn;
    IBSPCargarEmbriones: TIBStoredProc;
    DTPAFechaNacMadre: TDateTimePickerAuto;
    Label34: TLabel;
    Label35: TLabel;
    DTPAFechaNacPadre1: TDateTimePickerAuto;
    Label36: TLabel;
    Label37: TLabel;
    DTPAFechaNacPadre2: TDateTimePickerAuto;
    Label38: TLabel;
    Label39: TLabel;
    IBQRNIdentificacion: TIBQuery;
    IBQPadres1FECHA_NACIMIENTO: TDateField;
    IBQPadres2FECHA_NACIMIENTO: TDateField;
    IBQMadresFECHA_NACIMIENTO: TDateField;
    PDonantes: TPanel;
    GBDonantes: TGroupBox;
    Label40: TLabel;
    EBuscarDonante: TEdit;
    IBuscarDonante: TImage;
    LBuscarDonante: TLabel;
    LDonanteSelect: TLabel;
    PPadres: TPanel;
    GBPadres: TGroupBox;
    Label41: TLabel;
    EBuscarPadres: TEdit;
    IBuscarPadres: TImage;
    LBuscarPadres: TLabel;
    LPadreSelect: TLabel;
    IFondoB: TImage;
    IAyuda: TImage;
    IAceptar: TImage;
    ISalir: TImage;
    LAyuda: TLabel;
    LAceptar: TLabel;
    LSalir: TLabel;
    IBQAuxMadres: TIBQuery;
    IBQAuxPadres: TIBQuery;
    GBOtroPadre: TGroupBox;
    Label42: TLabel;
    EBuscarOtro: TEdit;
    IBuscarOtro: TImage;
    LBuscarOtro: TLabel;
    LPadreSelectOtro: TLabel;
    procedure BBAddMadreClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBAceptarMClick(Sender: TObject);
    procedure BBAddPadresClick(Sender: TObject);
    procedure BBAceptarPClick(Sender: TObject);
    procedure JROPadre1Collapse(Sender: TObject);
    procedure JROPadre1Expand(Sender: TObject);
    procedure JROPadre2Collapse(Sender: TObject);
    procedure JROPadre2Expand(Sender: TObject);
    procedure BBCancelarMClick(Sender: TObject);
    procedure BBCancelarPClick(Sender: TObject);
    procedure BBSalirClick(Sender: TObject);
    procedure IBQPadres1BeforePost(DataSet: TDataSet);
    procedure IBQPadres2BeforePost(DataSet: TDataSet);
    procedure PadreChange(Sender: TObject);
    procedure MadreChange(Sender: TObject);
    procedure BDBGMadreCellClick(Column: TColumn);
    procedure BBAceptarClick(Sender: TObject);
    procedure MouseEnter(Sender: TObject);
    procedure MouseLeave(Sender: TObject);
    procedure PropietarioClick(Sender: TObject);
    procedure IBuscarDonanteClick(Sender: TObject);
    procedure IBuscarPadresClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure IAceptarClick(Sender: TObject);
    procedure EBuscarDonanteKeyPress(Sender: TObject; var Key: Char);
    procedure EBuscarPadresKeyPress(Sender: TObject; var Key: Char);
    procedure EBuscarDonanteChange(Sender: TObject);
    procedure EBuscarPadresChange(Sender: TObject);
    procedure IBuscarOtroClick(Sender: TObject);
    procedure GBOtroPadreClick(Sender: TObject);
  private
    Padre1, Padre2, Madre : Variant;
    MultPadres : Boolean;
    function PuedePadre1 : boolean;
    function PuedePadre2 : boolean;
    procedure DatosEmbrion;
    procedure ActPadres();
    procedure ActMadre();
    function Validar(animal : Integer; RP,SENASA,HBA,RA,OTRO,PC : String) : Boolean;

    procedure BuscarDonante(consulta : string);
    procedure BuscarPadre(consulta : string);
    procedure BuscarPadre2(consulta : string);
  public
    { Public declarations }
  end;

var
  FEvePadresCompra: TFEvePadresCompra;

implementation

uses
  UPrincipal, UDMSoftvet, UDatosEmbriones, UMensajeHuella, UMensajesNacimientos,
  UABMPropietarioAnimal, USelAnimalesEmbriones;

{$R *.dfm}

procedure TFEvePadresCompra.BBAddMadreClick(Sender: TObject);
begin
  inherited;
  PDatosPadre.Align := alCustom;
  PPadre.Align := alCustom;
  PMadre.Visible := false;
  PDatosMadre.Visible := true;
  PDatosMadre.Align := alTop;
  PMadre.Align := alCustom;
  IBQMadres.Insert;
  DBLCBASexoMadre.KeyValue := 2;
end;

procedure TFEvePadresCompra.ActMadre;
begin
  IBQMadres.Close;
  IBQMadres.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQMadres.Open;
end;

procedure TFEvePadresCompra.ActPadres;
begin
  IBQPadres1.Close;
  IBQPadres1.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPadres1.Open;
  IBQPadres2.Close;
  IBQPadres2.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPadres2.Open;
end;

procedure TFEvePadresCompra.FormCreate(Sender: TObject);
begin
  inherited;
  PDatosMadre.Visible := false;
  PMadre.Visible := false; //true;
  PDatosPadre.Visible := false;
  PPadre.Visible := false; //true;
  PDatosMadre.Align := alCustom;
  PMadre.Align := alTop;
  PDatosPadre.Align := alCustom;
  PPadre.Align := alTop;


//  ActMadre;
//  ActPadres;

//  IBQSexoPadre.Close;
//  IBQSexoPadre.Open;
//  IBQSexoMadre.Close;
//  IBQSexoMadre.Open;

  MultPadres := false;

  Padre1 := null;
  Padre2 := null;
  Madre := null;

  LDonanteSelect.Visible := false;
  LPadreSelect.Visible := false;

  GBOtroPadre.Height := 32;

  IAceptar.Visible := false;
  LAceptar.Visible := false;
end;

procedure TFEvePadresCompra.BBAceptarMClick(Sender: TObject);
begin
  inherited;
  if Validar(IBQMadres.FieldValues['ID_ANIMAL_EXTERNO'],
     DBEARPMadre.Text,DBEASenasaMadre.Text,DBEAHBAMadre.Text,DBEARAMadre.Text,DBEAOtroMadre.Text,DBEAPCMadre.Text) then
  begin
    PDatosMadre.Visible := false;
    PMadre.Visible := true;
    PMadre.Align := alTop;
    PDatosMadre.Align := alCustom;

    IBQMadres.FieldValues['SEXO'] := 2;
    IBQMadres.FieldValues['ESTABLECIMIENTO'] := FPrincipal.EstablecimientoActual;
    IBQMadres.FieldValues['FECHA_NACIMIENTO'] := DTPAFechaNacMadre.Date;
    FPrincipal.IBDPrincipal.ApplyUpdates([IBQMadres]);

    ActMadre;
  end;
end;

procedure TFEvePadresCompra.BBAddPadresClick(Sender: TObject);
begin
  inherited;
  MultPadres := false;
  PPadre.Visible := false;
  PDatosPadre.Visible := true;
  PDatosPadre.Align := alTop;
  PPadre.Align := alCustom;
  IBQPadres1.Insert;
  IBQPadres2.Insert;
  DBLCBASexoPadre1.KeyValue := 1;
  DBLCBASexoPadre2.KeyValue := 1;
end;

procedure TFEvePadresCompra.BBAceptarPClick(Sender: TObject);
begin
  inherited;
  if Validar(IBQPadres1.FieldValues['ID_ANIMAL_EXTERNO'],
     DBEARPPadre1.Text,DBEASenasaPadre1.Text,DBEHBAPadre1.Text,DBEARAPadre1.Text,DBEAOtroPadre1.Text,DBEPCPadre1.Text) then
  begin
    if MultPadres then
    begin
      if Validar(IBQPadres2.FieldValues['ID_ANIMAL_EXTERNO'],
         DBERPPadre2.Text,DBEASenasaPadre2.Text,DBEAHBAPadre2.Text,DBEARAPadre2.Text,DBEAOtroPadre2.Text,DBEAPCPadre2.Text) then
      begin
        PDatosPadre.Visible := false;
        PPadre.Visible := true;
        PPadre.Align := alTop;
        PDatosPadre.Align := alCustom;

        FPrincipal.IBDPrincipal.ApplyUpdates([IBQPadres1,IBQPadres2]);
      end;
    end
    else
    begin
      PDatosPadre.Visible := false;
      PPadre.Visible := true;
      PPadre.Align := alTop;
      PDatosPadre.Align := alCustom;

      FPrincipal.IBDPrincipal.ApplyUpdates([IBQPadres1]);
    end;
    ActPadres;
  end;
end;

procedure TFEvePadresCompra.JROPadre1Collapse(Sender: TObject);
begin
  inherited;
  if JROPadre2.Enabled then
  begin
    JROPadre2.Expand;
    IBQPadres1.Post;
  end
  else JROPadre1.Expand;
end;

procedure TFEvePadresCompra.JROPadre1Expand(Sender: TObject);
begin
  inherited;
  JROPadre2.Collapse;
  IBQPadres1.Edit;
end;

procedure TFEvePadresCompra.JROPadre2Collapse(Sender: TObject);
begin
  inherited;
  JROPadre1.Expand;
  if PuedePadre2 then
    IBQPadres2.Post
  else
  begin
      IBQPadres2.Delete;
      MultPadres := false;
  end;
end;

procedure TFEvePadresCompra.JROPadre2Expand(Sender: TObject);
begin
  inherited;
  MultPadres := true;
  PadreChange(nil);
  JROPadre1.Collapse;
  IBQPadres2.Edit;
end;

procedure TFEvePadresCompra.BBCancelarMClick(Sender: TObject);
begin
  inherited;
  PDatosMadre.Visible := false;
  PMadre.Visible := true;
  PMadre.Align := alTop;
  PDatosMadre.Align := alCustom;
  IBQMadres.CancelUpdates;
end;

procedure TFEvePadresCompra.BBCancelarPClick(Sender: TObject);
begin
  inherited;
  PDatosPadre.Visible := false;
  PPadre.Visible := true;
  PPadre.Align := alTop;
  PDatosPadre.Align := alCustom;
  IBQPadres1.CancelUpdates;
  IBQPadres2.CancelUpdates;
end;

procedure TFEvePadresCompra.BBSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFEvePadresCompra.DatosEmbrion;
var
  F : TFDatosEmbriones;
begin
  F := TFDatosEmbriones.Create(self,0,Date());
  if Madre = null then
    Exit;
  if Padre1 = null then
    Exit;

  F.Madre := Madre;
  F.ModoColeccion := mcExterno;
  F.Padre_1 := Padre1;
  F.Externo_1 := 'S';
  if Padre2 <> null then
  begin
    F.Padre_2 := Padre2;
    F.Externo_2 := 'S';
  end;

  F.ShowModal;
  ModalResult := F.ModalResult;
  try
    IBSPCargarEmbriones.Close;
    IBSPCargarEmbriones.ParamByName('madre').AsInteger := Madre;
    IBSPCargarEmbriones.ParamByName('interna').AsString := 'N';
    IBSPCargarEmbriones.ParamByName('evento').Value := null;
    IBSPCargarEmbriones.ParamByName('centro_transplante').Value := null;
    IBSPCargarEmbriones.ParamByName('tipo').Value := 'A';
    IBSPCargarEmbriones.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;

  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;

  F.Destroy;
end;

procedure TFEvePadresCompra.IBQPadres1BeforePost(DataSet: TDataSet);
begin
  inherited;
  IBQPadres1.FieldValues['SEXO'] := 1;
  IBQPadres1.FieldValues['ESTABLECIMIENTO'] := FPrincipal.EstablecimientoActual;
  IBQPadres1.FieldValues['FECHA_NACIMIENTO'] := DTPAFechaNacPadre1.Date;
end;

procedure TFEvePadresCompra.IBQPadres2BeforePost(DataSet: TDataSet);
begin
  inherited;
  IBQPadres2.FieldValues['SEXO'] := 1;
  IBQPadres2.FieldValues['ESTABLECIMIENTO'] := FPrincipal.EstablecimientoActual;
  IBQPadres2.FieldValues['FECHA_NACIMIENTO'] := DTPAFechaNacPadre2.Date;
end;

function TFEvePadresCompra.PuedePadre1 : Boolean;
begin
  Result := DBEARPPadre1.PuedeGrabar and DBLCBARazaPadre1.PuedeGrabar and
            DBEAApodoPadre1.PuedeGrabar and DBLCBAPropietarioPadre1.PuedeGrabar;
end;

function TFEvePadresCompra.PuedePadre2 : Boolean;
begin
  Result := DBERPPadre2.PuedeGrabar and DBLCBARazaPadre2.PuedeGrabar and
            DBEAApodoPadre2.PuedeGrabar and DBLCBAPropietarioPadre2.PuedeGrabar;
end;

procedure TFEvePadresCompra.PadreChange(Sender: TObject);
begin
  inherited;
  JROPadre2.Enabled := PuedePadre1;
  if MultPadres then
    BBAceptarP.Enabled := PuedePadre1 and PuedePadre2
  else
    BBAceptarP.Enabled := PuedePadre1;
end;

procedure TFEvePadresCompra.MadreChange(Sender: TObject);
begin
  inherited;
  BBAceptarM.Enabled := DBEARPMadre.PuedeGrabar and DBLCBARazaMadre.PuedeGrabar and
                        DBEAApodoMadre.PuedeGrabar and DBLCBAPropietarioMadre.PuedeGrabar;
end;

procedure TFEvePadresCompra.BDBGMadreCellClick(Column: TColumn);
begin
  inherited;
  Madre := IBQMadres.FieldValues['ID_ANIMAL_EXTERNO'];
end;

procedure TFEvePadresCompra.BBAceptarClick(Sender: TObject);
var
  i, k : integer;
begin
  k := 0;
  if BDBGPadre.SelectedRows.Count > 0 then
  begin
    with BDBGPadre.DataSource.DataSet do
    for i:=0 to BDBGPadre.SelectedRows.Count-1 do
      begin
        if k < 2 then //solo 2 animales
        begin
          GotoBookmark(pointer(BDBGPadre.SelectedRows.Items[i]));
          case k of
            0 : Padre1 := IBQPadres1.FieldValues['ID_ANIMAL_EXTERNO'];
            1 : Padre2 := IBQPadres1.FieldValues['ID_ANIMAL_EXTERNO'];
          end;
          Inc(k);
        end
        else
        begin
          MostrarMensaje(tmError,'Solo se pueden seleccionar 2 padres');
          Exit;
        end;
      end;
  end;
  DatosEmbrion();
  Close;
end;

function TFEvePadresCompra.Validar(animal : Integer; RP,SENASA,HBA,RA,OTRO,PC : String) : Boolean;
var
  resultado : boolean;
  Errores : TStringList;
begin
  Errores := TStringList.Create;
  Errores.Clear;

  IBQRNIdentificacion.Close;
  IBQRNIdentificacion.ParamByName('animal').AsInteger := animal;
  IBQRNIdentificacion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  if (RP <> '') then
    IBQRNIdentificacion.ParamByName('rp').Value := RP
  else
    IBQRNIdentificacion.ParamByName('rp').Value := null;

  if (SENASA <> '') then
    IBQRNIdentificacion.ParamByName('senasa').Value := SENASA
  else
    IBQRNIdentificacion.ParamByName('senasa').Value := null;

  if (PC <> '') then
    IBQRNIdentificacion.ParamByName('pc').Value := PC
  else
    IBQRNIdentificacion.ParamByName('pc').Value := null;

  if (HBA <> '') then
    IBQRNIdentificacion.ParamByName('hba').Value := HBA
  else
    IBQRNIdentificacion.ParamByName('hba').Value := null;

  if (RA <> '') then
    IBQRNIdentificacion.ParamByName('ra').Value := RA
  else
    IBQRNIdentificacion.ParamByName('ra').Value := null;

  if (OTRO <> '') then
    IBQRNIdentificacion.ParamByName('otro').Value := OTRO
  else
    IBQRNIdentificacion.ParamByName('otro').Value := null;
  IBQRNIdentificacion.Open;

  IBQRNIdentificacion.First;
  resultado := IBQRNIdentificacion.FieldByName('result').AsString = 'A';

  if not resultado then
  begin
    while not IBQRNIdentificacion.Eof do
    begin
      Errores.Add(IBQRNIdentificacion.FieldValues['result']+': '+RP+': '+IBQRNIdentificacion.FieldValues['mensaje']);
      IBQRNIdentificacion.Next;
    end;
    MostrarMensajeNacimientos(tmError,'Error de Identificación',Errores);
  end;
  Result := resultado;
end;

procedure TFEvePadresCompra.MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= $00606C02;
    (Sender as TLabel).Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFEvePadresCompra.MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= clWindowText;
    (Sender as TLabel).Font.Style:= [fsUnderline];
  end;
end;

procedure TFEvePadresCompra.PropietarioClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AbrirFormNormal(TFABMPropietarioAnimal.Create(self));
    DMSoftvet.IBQCodPropietario.Close;
    DMSoftvet.IBQCodPropietario.Open;
  end;
end;

procedure TFEvePadresCompra.IBuscarDonanteClick(Sender: TObject);
var sql1, sql2, sql3 : string;
begin
  inherited;

  sql1 := 'SELECT * FROM TAB_ANIMALES_EXTERNOS WHERE SEXO = 2';

  if (EBuscarDonante.Text <> '') then
  begin
    sql2 := ' and ((ID_RP LIKE ''%' +EBuscarDonante.Text+ '%'') OR (NOMBRE LIKE ''%' +EBuscarDonante.Text+ '%'') OR (APODO LIKE ''%' +EBuscarDonante.Text+ '%'') OR (ID_HBA LIKE ''%' +EBuscarDonante.Text+ '%''))';
    sql3 := sql1 + sql2;
    BuscarDonante(sql3);
  end
  else
    BuscarDonante(sql1);

end;

procedure TFEvePadresCompra.BuscarDonante(consulta : string);
var cadena : string;
    F : TFSelAnimalesEmbriones;
begin
     IBQAuxMadres.Close;
     IBQAuxMadres.SQL.Clear;
     IBQAuxMadres.SQL.Add(consulta);
//     IBQAuxMadres.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
     IBQAuxMadres.Open;
     IBQAuxMadres.Last;
     IBQAuxMadres.First;

     cadena := '';
     LDonanteSelect.Caption := 'Donante Seleccionada: ';

     if (IBQAuxMadres.RecordCount = 1) then
     begin
          if (IBQAuxMadres.FieldValues['id_rp'] <> null) then
            cadena := cadena + 'RP: '+IBQAuxMadres.FieldValues['id_rp']+' / ';

          if (IBQAuxMadres.FieldValues['id_hba'] <> null) then
            cadena := cadena + 'HBA: '+IBQAuxMadres.FieldValues['id_hba']+' / ';

          if (IBQAuxMadres.FieldValues['nombre'] <> null) then
            cadena := cadena + 'NOMBRE: '+IBQAuxMadres.FieldValues['nombre']+' / ';

          if (IBQAuxMadres.FieldValues['apodo'] <> null) then
            cadena := cadena + 'APODO: '+IBQAuxMadres.FieldValues['apodo'];

          Madre := IBQAuxMadres.FieldValues['id_animal_externo'];
     end
     else
     begin
          F := TFSelAnimalesEmbriones.Create(self);
          F.SQLconsulta := consulta;
          F.sexo := 2;
          F.ShowModal;

          if (F.RP <> '') then
             cadena := cadena + 'RP: ' +F.RP+' / ';

          if (F.HBA <> '') then
            cadena := cadena + 'HBA: ' +F.HBA+' / ';

          if (F.NOMBRE <> '') then
            cadena := cadena + 'NOMBRE: '+F.NOMBRE+' / ';
            
          if (F.APODO <> '') then
            cadena := cadena + 'APODO: '+F.APODO;

          Madre := F.id_animal;

          F.Destroy;
          EBuscarDonante.Text := '';
          EBuscarPadres.SetFocus;
     end;

     if (cadena <> '') then EBuscarPadres.SetFocus;

     LDonanteSelect.Caption := LDonanteSelect.Caption + cadena;
     LDonanteSelect.Visible := true;

     EBuscarDonanteChange(self);
end;

procedure TFEvePadresCompra.BuscarPadre(consulta : string);
var cadena : string;
    F : TFSelAnimalesEmbriones;
begin
     IBQAuxPadres.Close;
     IBQAuxPadres.SQL.Clear;
     IBQAuxPadres.SQL.Add(consulta);
//     IBQAuxPadres.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
     IBQAuxPadres.Open;
     IBQAuxPadres.Last;
     IBQAuxPadres.First;

     cadena := '';
     LPadreSelect.Caption := 'Padre Seleccionado: ';

     if (IBQAuxPadres.RecordCount = 1) then
     begin
          if (IBQAuxPadres.FieldValues['id_rp'] <> null) then
            cadena := cadena + 'RP: '+IBQAuxPadres.FieldValues['id_rp']+' / ';

          if (IBQAuxPadres.FieldValues['id_hba'] <> null) then
            cadena := cadena + 'HBA: '+IBQAuxPadres.FieldValues['id_hba']+' / ';

          if (IBQAuxPadres.FieldValues['nombre'] <> null) then
            cadena := cadena + 'NOMBRE: '+IBQAuxPadres.FieldValues['nombre']+' / ';

          if (IBQAuxPadres.FieldValues['apodo'] <> null) then
            cadena := cadena + 'APODO: '+IBQAuxPadres.FieldValues['apodo'];

          Padre1 := IBQAuxPadres.FieldValues['id_animal_externo'];
     end
     else
     begin
          F := TFSelAnimalesEmbriones.Create(self);
          F.SQLconsulta := consulta;
          F.sexo := 1;
          F.ShowModal;

          if (F.RP <> '') then
            cadena := cadena + 'RP: '+F.RP+' / ';
          if (F.HBA <> '') then
            cadena := cadena + 'HBA: '+F.HBA+' / ';
          if (F.NOMBRE <> '') then
            cadena := cadena + 'NOMBRE: '+F.NOMBRE+' / ';
          if (F.APODO <> '') then
            cadena := cadena + 'APODO: '+F.APODO;

          Padre1 := F.id_animal;

          F.Destroy;
          EBuscarPadres.Text := '';
     end;
     
     LPadreSelect.Caption := LPadreSelect.Caption + cadena;
     LPadreSelect.Visible := true;



     EBuscarPadresChange(self);
end;

procedure TFEvePadresCompra.IBuscarPadresClick(Sender: TObject);
var sql1, sql2, sql3 : string;
begin
  inherited;

  sql1 := 'SELECT * FROM TAB_ANIMALES_EXTERNOS WHERE SEXO = 1';

  if (EBuscarPadres.Text <> '') then
  begin
    sql2 := ' and ((ID_RP LIKE ''%' +EBuscarPadres.Text+ '%'') OR (NOMBRE LIKE ''%' +EBuscarPadres.Text+ '%'') OR (APODO LIKE ''%' +EBuscarPadres.Text+ '%'') OR (ID_HBA LIKE ''%' +EBuscarPadres.Text+ '%''))';
    sql3 := sql1 + sql2;
    BuscarPadre(sql3);
  end
  else
    BuscarPadre(sql1);

end;

procedure TFEvePadresCompra.ISalirClick(Sender: TObject);
begin
  inherited;

  Close();
end;

procedure TFEvePadresCompra.IAceptarClick(Sender: TObject);
begin
  inherited;
  DatosEmbrion();
  Close;
end;

procedure TFEvePadresCompra.EBuscarDonanteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if (key = #13) then
  begin
    IBuscarDonanteClick(self);
    key := #0;
  end;

end;

procedure TFEvePadresCompra.EBuscarPadresKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if (key = #13) then
  begin
    IBuscarPadresClick(self);
    key := #0;
  end;

end;

procedure TFEvePadresCompra.EBuscarDonanteChange(Sender: TObject);
begin
  inherited;

  if (Madre <> null) then
    LDonanteSelect.Visible := true;

  if ((Madre <> null) and (Padre1 <> null)) then
  begin
    IAceptar.Visible := true;
    LAceptar.Visible := true;
  end;
end;

procedure TFEvePadresCompra.EBuscarPadresChange(Sender: TObject);
begin
  inherited;

  if (Padre1 <> null) then
    LPadreSelect.Visible := true;

  if ((Madre <> null) and (Padre1 <> null)) then
  begin
    IAceptar.Visible := true;
    LAceptar.Visible := true;
  end;
end;

procedure TFEvePadresCompra.IBuscarOtroClick(Sender: TObject);
var sql1, sql2, sql3 : string;
begin
  inherited;

  sql1 := 'SELECT * FROM TAB_ANIMALES_EXTERNOS WHERE SEXO = 1';

  if (EBuscarOtro.Text <> '') then
  begin
    sql2 := ' and ((ID_RP LIKE ''%' +EBuscarPadres.Text+ '%'') OR (NOMBRE LIKE ''%' +EBuscarPadres.Text+ '%'') OR (APODO LIKE ''%' +EBuscarPadres.Text+ '%'') OR (ID_HBA LIKE ''%' +EBuscarPadres.Text+ '%''))';
    sql3 := sql1 + sql2;
    BuscarPadre2(sql3);
  end
  else
    BuscarPadre2(sql1);

end;

procedure TFEvePadresCompra.BuscarPadre2(consulta : string);
var cadena : string;
    F : TFSelAnimalesEmbriones;
begin
     IBQAuxPadres.Close;
     IBQAuxPadres.SQL.Clear;
     IBQAuxPadres.SQL.Add(consulta);
 //    IBQAuxPadres.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
     IBQAuxPadres.Open;
     IBQAuxPadres.Last;
     IBQAuxPadres.First;

     cadena := '';
     LPadreSelectOtro.Caption := 'Padre Seleccionado: ';

     if (IBQAuxPadres.RecordCount = 1) then
     begin
          if (IBQAuxPadres.FieldValues['id_rp'] <> null) then
            cadena := cadena + 'RP: '+IBQAuxPadres.FieldValues['id_rp']+' / ';

          if (IBQAuxPadres.FieldValues['id_hba'] <> null) then
            cadena := cadena + 'HBA: '+IBQAuxPadres.FieldValues['id_hba']+' / ';

          if (IBQAuxPadres.FieldValues['nombre'] <> null) then
            cadena := cadena + 'NOMBRE: '+IBQAuxPadres.FieldValues['nombre']+' / ';

          if (IBQAuxPadres.FieldValues['apodo'] <> null) then
            cadena := cadena + 'APODO: '+IBQAuxPadres.FieldValues['apodo'];

          Padre2 := IBQAuxPadres.FieldValues['id_animal_externo'];
     end
     else
     begin
          F := TFSelAnimalesEmbriones.Create(self);
          F.SQLconsulta := consulta;
          F.sexo := 1;
          F.ShowModal;

          if (F.RP <> '') then
            cadena := cadena + 'RP: '+F.RP+' / ';
          if (F.HBA <> '') then
            cadena := cadena + 'HBA: '+F.HBA+' / ';
          if (F.NOMBRE <> '') then
            cadena := cadena + 'NOMBRE: '+F.NOMBRE+' / ';
          if (F.APODO <> '') then
            cadena := cadena + 'APODO: '+F.APODO;

          Padre2 := F.id_animal;

          F.Destroy;
          EBuscarOtro.Text := '';
     end;
     
     LPadreSelectOtro.Caption := LPadreSelectOtro.Caption + cadena;
     LPadreSelectOtro.Visible := true;


end;

procedure TFEvePadresCompra.GBOtroPadreClick(Sender: TObject);
begin
  inherited;

  GBOtroPadre.Height := 130;
end;

end.
