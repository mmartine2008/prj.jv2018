unit UDOTri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveUniversal, UFrameMangazo, DB, IBCustomDataSet, IBQuery,
  ActnList, StdCtrls, MemoAuto, ComCtrls, ExtCtrls, Buttons, UEveBaja,
  DateTimePickerAuto, EditAuto, QuickRpt, QRCtrls, DBCtrls, IBStoredProc,
  Mask, DataExport, DataToXLS, WinXP, UEveSimple, QRExport, QRPDFFilt, dateutils,
  PngImage, JvExExtCtrls, JvImage, jpeg, JvGIF, ImgList, PngImageList,
  JvExControls, JvLabel, JvComponentBase, JvBalloonHint;

type
  TFEveTri = class(TFEveUniversal)
    TSManga: TTabSheet;
    MSimple: TMangazo;
    TSDatos: TTabSheet;
    GBDatos: TGroupBox;
    GBObservaciones: TGroupBox;
    MAObservacion: TMemoAuto;
    LRemitente: TLabel;
    LRenspaOri: TLabel;
    GBDestino: TGroupBox;
    EADestinatario: TEditAuto;
    LDestinatario: TLabel;
    LRenspaDest: TLabel;
    GroupBox1: TGroupBox;
    LFecha: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    TabSheet1: TTabSheet;
    QRTri: TQuickRep;
    TitleBand1: TQRBand;
    QRRichText4: TQRRichText;
    QRRichText11: TQRRichText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRRichText3: TQRRichText;
    QRRichText5: TQRRichText;
    QRRichText6: TQRRichText;
    QRRichText7: TQRRichText;
    QRRichText9: TQRRichText;
    QRLabel2: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRImage1: TQRImage;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRRichText17: TQRRichText;
    QRRichText15: TQRRichText;
    QRRichText14: TQRRichText;
    QRRichText16: TQRRichText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape3: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLRemitente: TQRLabel;
    QRLDestinatario: TQRLabel;
    QRLRenspaOri: TQRLabel;
    QRLRenspaDest: TQRLabel;
    QRLFecha: TQRLabel;
    QRLabel15: TQRLabel;
    EARemitente: TEditAuto;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    LDTA: TLabel;
    EADTA: TEditAuto;
    QRLDTA: TQRLabel;
    QRShape1: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape2: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRShape26: TQRShape;
    ASalir: TAction;
    EARenspaOri: TMaskEdit;
    EARenspaDest: TMaskEdit;
    IBQSPEventoIndRENSPA: TIBStringField;
    IBQSPEventoIndNOMBRE: TIBStringField;
    SDTri: TSaveDialog;
    BBGenerarTri: TBitBtn;
    QRLComentarios: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRExcelFilter1: TQRExcelFilter;
    JvITRI: TJvImage;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QRLabel24Print(sender: TObject; var Value: String);
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QRLabel18Print(sender: TObject; var Value: String);
    procedure PCBasicoChange(Sender: TObject);
    procedure MSimpleBBAgregarUnoClick(Sender: TObject);
    procedure QRTriBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure ASalirExecute(Sender: TObject);
    procedure BBGenerarTriClick(Sender: TObject);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure MSimpleBDBGDisponiblesDblClick(Sender: TObject);
    procedure MSimpleBBEliminarUnoClick(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
  private
    FCant :integer;
    Procedure BorrarLineasAdicionales;
    procedure sacarAnimalDeSeleccionados(id_animal: integer);
    //function CompareNames(Item1, Item2: Pointer): Integer;    
    Function CompletarDigitos(idsenasa:String): String;
    procedure DarDeBajaAnimales();
    procedure RefrescarMangaDisp();
  public
  end;

var
  FEveTri: TFEveTri;

implementation

uses UUniversal,UPrincipal, MaskUtils, UMensajeHuella, UFunctions, UREPFichaAnimal, UAvanceTerminar;

{$R *.dfm}

procedure TFEveTri.FormCreate(Sender: TObject);
begin
  FAvanceTerminar := TFAvanceTerminar.Create(self);
  Msimple.SQLBasico := 'select  ID_AUX, ID_RP, ID_SENASA,id_animal, id_pc, id_hba, id_otro From VIS_TRI A where ID_SENASA <> ''''';
  MSimple.PasarParametros(0,0);//Hembras y Machos //cambie codigo
  MSimple.IBQSeleccionados.Open;
  inherited;
 // FAvanceTerminar.Destroy;
end;

procedure TFEveTri.FormActivate(Sender: TObject);
begin
  inherited;
  MSimple.RBTodas.Checked := true;
end;

procedure TFEveTri.ATerminarExecute(Sender: TObject);
var cant : integer;
    H : HWND;
begin
  if(MSimple.IBQSeleccionados.RecordCount > 75)then
    MostrarMensaje(tmError, 'El Documento TRI permite un máximo de 75 Animales')
  else
  begin
    for cant := MSimple.IBQSeleccionados.RecordCount+1 to 75 do
    begin
       MSimple.IBQSeleccionados.Insert;
       MSimple.IBQSeleccionados.FieldByName('id_aux').AsInteger := -1;
       MSimple.IBQSeleccionados.FieldByName('id_animal').AsInteger:= cant*-1;
    end;
    QRLRemitente.Caption := EARemitente.Text;
    QRLDestinatario.Caption :=  EADestinatario.Text;
    QRLRenspaOri.Caption := FormatMaskText('CC.CCC.C.CCCCC.CC;0;_',EARenspaOri.Text);
    QRLRenspaDest.Caption := EARenspaDest.Text;
    QRLFecha.Caption := DateToStr(DTPAFecha.Date);
    QRLDTA.Caption := EADTA.Text;
    QRLComentarios.Caption := MAObservacion.Text;
    QRTri.Preview;

    BorrarLineasAdicionales;
    DarDeBajaAnimales();
    inherited;
    Close();
  end;
end;

procedure TFEveTri.DarDeBajaAnimales();
var
  F : TFEveBaja;
begin
    if MostrarMensaje(tmConsulta,'Desea dar de baja los animales seleccionados?') = mrYes then
    begin
      FPrincipal.IBDPrincipal.ApplyUpdates([MSimple.IBQSeleccionados]);
      F := TFEveBaja.Create(self);
      F.Hide;
      F.ConManga := True;
      F.EADta.Text := EADTA.Text;
      F.ModoEve  := meMasivo;
      F.ShowModal();
    end;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
end;

procedure TFEveTri.FormShow(Sender: TObject);
begin
  inherited;
  TabSheet1.TabVisible := false;
  DTPAFecha.Date:= Now();
end;

procedure TFEveTri.QRLabel24Print(sender: TObject; var Value: String);
begin
  inherited;
  inc(FCant);
  Value := IntToStr(FCant);
end;

procedure TFEveTri.QRLabel3Print(sender: TObject; var Value: String);
begin
  inherited;
   Value := '';
end;

procedure TFEveTri.QRLabel6Print(sender: TObject; var Value: String);
begin
  inherited;
  Value := '';
end;

procedure TFEveTri.QRLabel18Print(sender: TObject; var Value: String);
begin
  inherited;
  Value := '';
end;

procedure TFEveTri.PCBasicoChange(Sender: TObject);
begin
  inherited;
  FCant := 0;// para llenar las filas del informe con blancos
  if(PCBasico.ActivePage = TSDatos)then
    begin
       IBQSPEventoInd.Close;
       IBQSPEventoInd.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
       IBQSPEventoInd.Open;
       EARenspaOri.Text := IBQSPEventoIndRENSPA.AsString;
       EARemitente.Text := IBQSPEventoIndNOMBRE.AsString;
    end;
end;

procedure TFEveTri.MSimpleBBAgregarUnoClick(Sender: TObject);
begin
  inherited;
  MSimple.BBAgregarUnoClick(Sender);
end;

procedure TFEveTri.BorrarLineasAdicionales;
begin
 { MSimple.IBQSeleccionados.First;
  while(MSimple.IBQSeleccionados.Eof)do
  begin
     sacarAnimalDeSeleccionados(-1);
     //MSimple.IBQSeleccionados.Delete;
     MSimple.IBQSeleccionados.Next;
  end;
  sacarAnimalDeSeleccionados(-1);
  //MSimple.BDBGSeleccionados.Refresh;    }

  MSimple.IBQSeleccionados.First;
  while Msimple.IBQSeleccionados.Eof do
  begin
    if MSimple.IBQSeleccionados.FieldByName('id_animal').AsInteger < 0 then
      MSimple.IBQSeleccionados.Delete;
    MSimple.IBQSeleccionados.Next;
  end;

end;


// Saca el id_animal de seleccionados y "NO" lo agrega en disponibles
procedure TFEveTri.sacarAnimalDeSeleccionados(id_animal: integer);
var pointer : TBookmark;
begin
//  MSimple.BDBGSeleccionados.SelectedRows.Clear;
  if(MSimple.IBQSeleccionados.Locate('id_animal', VarArrayOf([id_animal]),[]))then
  begin
    pointer := MSimple.IBQSeleccionados.GetBookmark;
    MSimple.IBQSeleccionados.GotoBookmark(pointer);
    MSimple.IBQSeleccionados.Delete;
    MSimple.BDBGSeleccionados.Refresh;
  end;
end;


procedure TFEveTri.QRTriBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  FCant := 0;// para llenar las filas del informe con blancos
end;

procedure TFEveTri.ASalirExecute(Sender: TObject);
begin
  inherited;
  close;
end;


function CompareNames(Item1, Item2: String): Integer;
var str1, str2: String;
begin
//   Result := CompareText((Item1 as String).Name, (Item2 as String).Name);
   str1:= Item1;
   str2:= Item1;

   //if (StrComp(PChar(str1), PChar(str2)) = 0) then

   result:= StrComp(PChar(str1), PChar(str2));
   //Result := CompareText(String(Item1), String(Item2));
end;

procedure TFEveTri.BBGenerarTriClick(Sender: TObject);
var F: TextFile;
    extension: String;
    i:Integer;
    aux2: AnsiString;
    arreglo: array of variant;
begin
  inherited;    //falta generar de ceros si tiene menos de 9 digitos
 if not(MSimple.IBQSeleccionados.IsEmpty) then
   begin
       if (SDTri.Execute) then
         begin
           MSimple.IBQSeleccionados.First;
           extension:= ExtractFileExt(SDTri.FileName);
           if (StrComp(PChar(extension), PChar('.txt')) <> 0) then
             SDTri.FileName:= SDTri.FileName + '.txt';
           AssignFile(F, SDTri.FileName);
           ReWrite(F);
           setLength(arreglo,0);
           while not(MSimple.IBQSeleccionados.Eof) do
             begin
              setLength(arreglo,Length(arreglo) + 1);
              aux2:= CompletarDigitos(MSimple.IBQSeleccionados.FieldByName('ID_SENASA').AsString);
              arreglo[Length(arreglo) - 1]:= aux2;
              MSimple.IBQSeleccionados.Next;
             end;

           quicksort(arreglo,0,Length(arreglo) - 1);

           i:= 0;
           while (i < Length(arreglo)) do
            begin
              WriteLn(F,arreglo[i]);
              inc(i);
            end;
           CloseFile(F);
           MostrarMensaje(tmInformacion, 'TRI generado con éxito')
         end;
    end
   else
     MostrarMensaje(tmAdvertencia, 'No se puede generar el archivo de texto del Tri debido a que no hay ningún animal seleccionado')
end;

function TFEveTri.CompletarDigitos(idsenasa: String): String;
var largoSenasa, aux: Integer;
    auxSenasa: String;
begin
  largoSenasa:= Length(idsenasa);
  auxSenasa:= idsenasa;
  if (largoSenasa <> 9) then
    begin
      aux:= 9 - largoSenasa;
      while (aux <> 0) do
       begin
         auxSenasa:= '0'+auxsenasa;
         dec(aux);
       end;
      result:= auxSenasa + IntToStr(UFunctions.DigitoVerificadorCaravana(auxSenasa));
    end
   else
     result:= idsenasa + IntToStr(UFunctions.DigitoVerificadorCaravana(auxSenasa)); 
end;

procedure TFEveTri.QRDBText1Print(sender: TObject; var Value: String);
var
  e ,r : String;
begin
  inherited;
  if (UFunctions.CheckFormatoCUIG(Value)) then
    begin
      e := '12345';
      r := '1234';
      e[1] := Value[1];
      e[2] := Value[2];
      e[3] := Value[3];
      e[4] := Value[4];
      e[5] := Value[5];
      r[1] := Value[6];
      r[2] := Value[7];
      r[3] := Value[8];
      r[4] := Value[9];
      Value := e+r+'-'+IntToStr(UFunctions.DigitoVerificadorCaravana(Value));
      //Value := e+r;
    end
   else
      if (UFunctions.CheckFormatoReidentificacion(Value)) then
      begin
        e := '12345';
        r := '1234';
        e[1] := Value[1];
        e[2] := Value[2];
        e[3] := Value[3];
        e[4] := Value[4];
        e[5] := Value[5];
        r[1] := Value[6];
        r[2] := Value[7];
        r[3] := Value[8];
        r[4] := Value[9];
        Value := e+r+'-'+IntToStr(UFunctions.DigitoVerificadorCaravana('00'+Value));
        //Value := e+r;
      end;
end;

procedure TFEveTri.MSimpleBDBGDisponiblesDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (MSimple.BDBGDisponibles.SelectedIndex = MSimple.BDBGDisponibles.ColumnByField('id_rp').Index) then
  begin
    if not(MSimple.BDBGDisponibles.DataSource.DataSet.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := MSimple.BDBGDisponibles.DataSource.DataSet.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
    // RefrescarMangaDisp();
  end;
end;

procedure TFEveTri.RefrescarMangaDisp();
begin
  {MSimple.IBQDisponibles.Close;
  MSimple.IBQDisponibles.Open;}
end;

procedure TFEveTri.MSimpleBBEliminarUnoClick(Sender: TObject);
begin
  inherited;
  MSimple.BBEliminarUnoClick(Sender);

end;

procedure TFEveTri.ACancelarExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

end.



