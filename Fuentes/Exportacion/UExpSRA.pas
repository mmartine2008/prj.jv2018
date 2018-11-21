unit UExpSRA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, cxControls, cxSSheet, ImgList, PngImageList, ComObj,
  IBQuery, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc,
  ActnList, ComCtrls, JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF,
  JvBaseDlg, JvBrowseFolder, jpeg, PngImage, JvExExtCtrls, JvImage;

type
  TTipoPlanilla = (tpServicio,tpNacimiento,tpNacTransf,tpCongelacion,tpTransferencia,tpCongTransf);

  TFExpSRA = class(TFUniversal)
    IBQDatos: TIBQuery;
    FolderSelect: TJvBrowseForFolderDialog;
    P1: TPanel;
    P2: TPanel;
    IFondoB: TImage;
    LTotal: TLabel;
    ISalir: TImage;
    LSalir: TLabel;
    IBQGetColor: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
  private
    xls, xlw, pag: OleVariant;
    Folder : String;
    Cant : Integer;
    TipoPlanilla : TTipoPlanilla;
    procedure CargarServicio;
    procedure CargarNacimientos;
    procedure CargarNacTransfer;
    procedure CargarCongelacion;
    procedure CargarTransferencia;
  public
    NomCriador, NomRaza, NroCriador, CodRaza, FolioNro : String;
  published
    constructor Create(AOwner : TComponent; Planilla : TTipoPlanilla; Datos : TIBQuery); reintroduce;
  end;

var
  FExpSRA: TFExpSRA;

implementation

uses
  UPrincipal;

{$R *.dfm}

constructor TFExpSRA.Create(AOwner : TComponent; Planilla : TTipoPlanilla; Datos : TIBQuery);
begin
  inherited Create(AOwner);
  TipoPlanilla := Planilla;
  IBQDatos := Datos;
end;

procedure TFExpSRA.FormShow(Sender: TObject);
begin
  inherited;
  if FolderSelect.Execute then
    Folder := FolderSelect.Directory+'\';

  try
    xls := CreateOleObject('Excel.Application');
    case TipoPlanilla of
       tpServicio : xlw := xls.WorkBooks.Open(ExtractFilePath(Application.ExeName)+'Planillas\SRA\Servicios.xls');
       tpNacimiento : xlw := xls.WorkBooks.Open(ExtractFilePath(Application.ExeName)+'Planillas\SRA\Nacimientos.xls');
       tpNacTransf : xlw := xls.WorkBooks.Open(ExtractFilePath(Application.ExeName)+'Planillas\SRA\Nac_Transf.xls');
       tpCongelacion : xlw := xls.WorkBooks.Open(ExtractFilePath(Application.ExeName)+'Planillas\SRA\Congelacion.xls');
       tpTransferencia : xlw := xls.WorkBooks.Open(ExtractFilePath(Application.ExeName)+'Planillas\SRA\Transferencia.xls');
    end;
    pag := xlw.Sheets[1];
    IBQDatos.Open;
    case TipoPlanilla of
      tpServicio : CargarServicio;
      tpNacimiento : CargarNacimientos;
      tpNacTransf : CargarNacTransfer;
      tpCongelacion : CargarCongelacion;
      tpTransferencia : CargarTransferencia;
      tpCongTransf : begin
                      CargarTransferencia;
                      CargarCongelacion;
                     end;
    end;
  finally
    xls.WorkBooks.Close;
    xlw := UnAssigned;
    if not VarIsEmpty(xls) then
    begin
      OleVariant(xls).DisplayAlerts := False;
      OleVariant(xls).Quit;
    end;
      OleVariant(xls) := UnAssigned;
  end;

  LTotal.Caption := 'Se generarón '+IntToStr(Cant)+' archivos en la carpeta '+Folder;

end;

procedure TFExpSRA.CargarServicio;
var
  I : Integer;
begin
  I := 0;
  Cant := 1;
  IBQDatos.First;
  while not IBQDatos.Eof do
  begin
    if i < 20 then
    begin
      pag.Cells[I+12,6] := IBQDatos.FieldValues['DIAINICIO'];
      pag.Cells[I+12,7] := IBQDatos.FieldValues['MESINICIO'];
      pag.Cells[I+12,8] := IBQDatos.FieldValues['ANIOINICIO'];
      pag.Cells[I+12,9] := IBQDatos.FieldValues['DIAFIN'];
      pag.Cells[I+12,10] := IBQDatos.FieldValues['MESFIN'];
      pag.Cells[I+12,11] := IBQDatos.FieldValues['ANIOFIN'];
      pag.Cells[I+12,12] := IBQDatos.FieldValues['TIPOSERVICIO'];
      pag.Cells[I+12,13] := IBQDatos.FieldValues['RP_TORO'];
      pag.Cells[I+12,15] := IBQDatos.FieldValues['HBA_TORO'];
      pag.Cells[I+12,17] := IBQDatos.FieldValues['RP_TORO'];
      pag.Cells[I+12,18] := IBQDatos.FieldValues['RP_ANIMAL'];
      pag.Cells[I+12,20] := IBQDatos.FieldValues['RP_ANIMAL'];
      pag.Cells[I+12,21] := IBQDatos.FieldValues['HBA_ANIMAL'];
      pag.Cells[I+12,23] := IBQDatos.FieldValues['OBSERVACION'];
      I := I + 1;
      IBQDatos.Next;
    end
    else
    begin
      pag.Cells[1,20] := pag.Cells[1,20].Text + FolioNro ;
      pag.Cells[7,6] := NroCriador;
      pag.Cells[7,8] := NomCriador;
      pag.Cells[7,17] := CodRaza;
      pag.Cells[7,20] := NomRaza;
      xlw.SaveAs(Folder+'Denuncia_'+IntToStr(Cant)+'.xls');
      Cant := Cant + 1;
      I := 0;
    end;
  end;
  while I < 20 do
  begin
      pag.Cells[I+12,6] := '';
      pag.Cells[I+12,7] := '';
      pag.Cells[I+12,8] := '';
      pag.Cells[I+12,9] := '';
      pag.Cells[I+12,10] := '';
      pag.Cells[I+12,11] := '';
      pag.Cells[I+12,12] := '';
      pag.Cells[I+12,13] := '';
      pag.Cells[I+12,15] := '';
      pag.Cells[I+12,17] := '';
      pag.Cells[I+12,18] := '';
      pag.Cells[I+12,20] := '';
      pag.Cells[I+12,21] := '';
      pag.Cells[I+12,23] := '';
      I := I + 1;
  end;
  pag.Cells[1,20] := pag.Cells[1,20].Text + FolioNro ;
  pag.Cells[7,6] := NroCriador;
  pag.Cells[7,8] := NomCriador;
  pag.Cells[7,17] := CodRaza;
  pag.Cells[7,20] := NomRaza;
  xlw.SaveAs(Folder+'Denuncia_'+IntToStr(Cant)+'.xls');
end;

procedure TFExpSRA.CargarNacimientos;
  function buildFecha(dia, mes, anio: Variant):String;
  var
    auxDia, auxMes: String;
  begin
    if (VarIsNull(dia)) then
    begin
      buildFecha := '';
    end
    else
    begin
      auxDia := VarToStr(dia);
      auxMes := VarToStr(mes);
      if (Length(auxDia) = 1) then
      begin
        auxDia := '0'+auxDia;
      end;
      if (Length(auxMes) = 1) then
      begin
        auxMes := '0'+auxMes;
      end;
      buildFecha := auxDia + '/' + auxMes + '/' + VarToStr(anio);
    end;
  end;

var
  I : Integer;
begin
  I := 0;
  Cant := 1;

  IBQGetColor.Close;
  IBQGetColor.Open;

  IBQDatos.First;

  pag.Cells[1,2] := NroCriador;
  pag.Cells[2,2] := NomCriador;
  pag.Cells[3,2] := CodRaza;
  pag.Cells[4,2] := NomRaza;

  I := 11;

  while not IBQDatos.Eof do
  begin
     pag.Cells[I,1] := buildFecha(IBQDatos.FieldValues['DIAI'], IBQDatos.FieldValues['MESI'], IBQDatos.FieldValues['ANIOI']);
     pag.Cells[I,2] := buildFecha(IBQDatos.FieldValues['DIAF'], IBQDatos.FieldValues['MESF'], IBQDatos.FieldValues['ANIOF']);
     pag.Cells[I,3] := IBQDatos.FieldValues['TIPO_PARTO'];
     pag.Cells[I,4] := IBQDatos.FieldValues['CRIA'];
     pag.Cells[I,5] := IBQDatos.FieldValues['RP'];
     pag.Cells[I,6] := IBQDatos.FieldValues['NOMBRESEXO'];

//     pag.Cells[I,7] := IBQGetColor.Lookup('nombre', IBQDatos.FieldValues['COLOR'], 'id_color');
     pag.Cells[I,7] := IBQDatos.FieldValues['COLOR'];

     pag.Cells[I,8] := IBQDatos.FieldValues['MELLIZO'];
     pag.Cells[I,9] := IBQDatos.FieldValues['PREFIJO'];
     pag.Cells[I,10] := IBQDatos.FieldValues['NOMBRE'];
     pag.Cells[I,11] := IBQDatos.FieldValues['PESO_NACIMIENTO_PROM'];
     pag.Cells[I,12] := IBQDatos.FieldValues['NRO_REG_ASOC_P'];
     pag.Cells[I,13] := IBQDatos.FieldValues['RPPADRE'];
     pag.Cells[I,14] := IBQDatos.FieldValues['HBAPADRE'];
     pag.Cells[I,15] := IBQDatos.FieldValues['NRO_REG_ASOC_M'];
     pag.Cells[I,16] := IBQDatos.FieldValues['RPMADRE'];
     pag.Cells[I,17] := IBQDatos.FieldValues['HBAMADRE'];

     I := I + 1;
     IBQDatos.Next;
   end;

   xlw.SaveAs(Folder+'Nacimientos.xls');

end;

procedure TFExpSRA.CargarNacTransfer;
var
  I : Integer;
begin
  I := 0;
  Cant := 1;
  IBQDatos.First;
  while not IBQDatos.Eof do
  begin
    if i < 30 then
    begin
      pag.Cells[I+12,7] := IBQDatos.FieldValues['TIPO_PARTO'];
      pag.Cells[I+12,10] := IBQDatos.FieldValues['CRIA'];
      pag.Cells[I+12,13] := IBQDatos.FieldValues['RPHIJO'];
      pag.Cells[I+12,16] := IBQDatos.FieldValues['NOMBRESEXO'];
      pag.Cells[I+12,19] := IBQDatos.FieldValues['COLOR'];
      pag.Cells[I+12,22] := IBQDatos.FieldValues['MELLIZO'];
      pag.Cells[I+12,25] := IBQDatos.FieldValues['PESO_NACIMIENTO_PROM'];
      pag.Cells[I+12,28] := IBQDatos.FieldValues['DIAF'];
      pag.Cells[I+12,31] := IBQDatos.FieldValues['MESF'];
      pag.Cells[I+12,32] := IBQDatos.FieldValues['ANIOF'];
      pag.Cells[I+12,33] := IBQDatos.FieldValues['DIAI'];
      pag.Cells[I+12,34] := IBQDatos.FieldValues['MESI'];
      pag.Cells[I+12,35] := IBQDatos.FieldValues['ANIOI'];
      pag.Cells[I+12,36] := IBQDatos.FieldValues['DIAS'];
      pag.Cells[I+12,37] := IBQDatos.FieldValues['MESS'];
      pag.Cells[I+12,38] := IBQDatos.FieldValues['ANIOS'];

      pag.Cells[I+13,11] := IBQDatos.FieldValues['PREFIJO'];
      pag.Cells[I+13,27] := IBQDatos.FieldValues['NOMBRE'];

      pag.Cells[I+14,12] := IBQDatos.FieldValues['RPRECEPTORA'];
      pag.Cells[I+14,26] := IBQDatos.FieldValues['CTRO_NRO'];
      pag.Cells[I+14,32] := IBQDatos.FieldValues['CTRO_NOMBRE'];

      pag.Cells[I+16,7] := IBQDatos.FieldValues['NRO_REG_ASOC_P'];
      pag.Cells[I+16,14] := IBQDatos.FieldValues['RPPADRE'];
      pag.Cells[I+16,18] := IBQDatos.FieldValues['HBAPADRE'];
      pag.Cells[I+16,25] := IBQDatos.FieldValues['NOMBREPADRE'];

      pag.Cells[I+18,7] := IBQDatos.FieldValues['NRO_REG_ASOC_M'];
      pag.Cells[I+18,14] := IBQDatos.FieldValues['RPMADRE'];
      pag.Cells[I+18,18] := IBQDatos.FieldValues['HBAMADRE'];
      pag.Cells[I+18,25] := IBQDatos.FieldValues['NOMBREMADRE'];

      I := I + 10;
      IBQDatos.Next;
    end
    else
    begin
      pag.Cells[7,7] := NroCriador;
      pag.Cells[7,11] := NomCriador;
      pag.Cells[7,30] := CodRaza;
      pag.Cells[7,32] := NomRaza;
      xlw.SaveAs(Folder+'Nac_Transf_'+IntToStr(Cant)+'.xls');
      Cant := Cant + 1;
      I := 0;
    end;
  end;
  while I < 30 do
  begin
      pag.Cells[I+12,7] := '';
      pag.Cells[I+12,10] := '';
      pag.Cells[I+12,13] := '';
      pag.Cells[I+12,16] := '';
      pag.Cells[I+12,19] := '';
      pag.Cells[I+12,22] := '';
      pag.Cells[I+12,25] := '';
      pag.Cells[I+12,28] := '';
      pag.Cells[I+12,31] := '';
      pag.Cells[I+12,32] := '';
      pag.Cells[I+12,33] := '';
      pag.Cells[I+12,34] := '';
      pag.Cells[I+12,35] := '';
      pag.Cells[I+12,36] := '';
      pag.Cells[I+12,37] := '';
      pag.Cells[I+12,38] := '';

      pag.Cells[I+13,11] := '';
      pag.Cells[I+13,27] := '';

      pag.Cells[I+14,12] := '';
      pag.Cells[I+14,26] := '';
      pag.Cells[I+14,32] := '';

      pag.Cells[I+16,7] := '';
      pag.Cells[I+16,14] := '';
      pag.Cells[I+16,18] := '';
      pag.Cells[I+16,25] := '';

      pag.Cells[I+18,7] := '';
      pag.Cells[I+18,14] := '';
      pag.Cells[I+18,18] := '';
      pag.Cells[I+18,25] := '';

      I := I + 10;
  end;
  pag.Cells[7,7] := NroCriador;
  pag.Cells[7,11] := NomCriador;
  pag.Cells[7,30] := CodRaza;
  pag.Cells[7,32] := NomRaza;
  xlw.SaveAs(Folder+'Nac_Transf_'+IntToStr(Cant)+'.xls');
end;

procedure TFExpSRA.CargarCongelacion;
var
  I : Integer;
begin
  I := 0;
  Cant := 1;
  IBQDatos.First;
  while not IBQDatos.Eof do
  begin
    if i < 20 then
    begin
      pag.Cells[I+12,6] := IBQDatos.FieldValues['DIAINICIO'];
      pag.Cells[I+12,7] := IBQDatos.FieldValues['MESINICIO'];
      pag.Cells[I+12,8] := IBQDatos.FieldValues['ANIOINICIO'];
      pag.Cells[I+12,9] := IBQDatos.FieldValues['DIAFIN'];
      pag.Cells[I+12,10] := IBQDatos.FieldValues['MESFIN'];
      pag.Cells[I+12,11] := IBQDatos.FieldValues['ANIOFIN'];
      pag.Cells[I+12,12] := IBQDatos.FieldValues['TIPOSERVICIO'];
      pag.Cells[I+12,13] := IBQDatos.FieldValues['RP_TORO'];
      pag.Cells[I+12,15] := IBQDatos.FieldValues['HBA_TORO'];
      pag.Cells[I+12,17] := IBQDatos.FieldValues['RP_TORO'];
      pag.Cells[I+12,18] := IBQDatos.FieldValues['RP_ANIMAL'];
      pag.Cells[I+12,20] := IBQDatos.FieldValues['RP_ANIMAL'];
      pag.Cells[I+12,21] := IBQDatos.FieldValues['HBA_ANIMAL'];
      pag.Cells[I+12,23] := IBQDatos.FieldValues['OBSERVACION'];
      I := I + 1;
      IBQDatos.Next;
    end
    else
    begin
      xlw.SaveAs(Folder+'Congelacion_'+IntToStr(Cant)+'.xls');
      Cant := Cant + 1;
      I := 0;
    end;
  end;
  while I < 20 do
  begin
      pag.Cells[I+12,6] := '';
      pag.Cells[I+12,7] := '';
      pag.Cells[I+12,8] := '';
      pag.Cells[I+12,9] := '';
      pag.Cells[I+12,10] := '';
      pag.Cells[I+12,11] := '';
      pag.Cells[I+12,12] := '';
      pag.Cells[I+12,13] := '';
      pag.Cells[I+12,15] := '';
      pag.Cells[I+12,17] := '';
      pag.Cells[I+12,18] := '';
      pag.Cells[I+12,20] := '';
      pag.Cells[I+12,21] := '';
      pag.Cells[I+12,23] := '';
      I := I + 1;
  end;
  xlw.SaveAs(Folder+'Congelacion_'+IntToStr(Cant)+'.xls');
end;

procedure TFExpSRA.CargarTransferencia;
var
  I : Integer;
begin
  I := 0;
  Cant := 1;
  IBQDatos.First;
  while not IBQDatos.Eof do
  begin
    if i < 20 then
    begin
      pag.Cells[I+12,6] := IBQDatos.FieldValues['DIAINICIO'];
      pag.Cells[I+12,7] := IBQDatos.FieldValues['MESINICIO'];
      pag.Cells[I+12,8] := IBQDatos.FieldValues['ANIOINICIO'];
      pag.Cells[I+12,9] := IBQDatos.FieldValues['DIAFIN'];
      pag.Cells[I+12,10] := IBQDatos.FieldValues['MESFIN'];
      pag.Cells[I+12,11] := IBQDatos.FieldValues['ANIOFIN'];
      pag.Cells[I+12,12] := IBQDatos.FieldValues['TIPOSERVICIO'];
      pag.Cells[I+12,13] := IBQDatos.FieldValues['RP_TORO'];
      pag.Cells[I+12,15] := IBQDatos.FieldValues['HBA_TORO'];
      pag.Cells[I+12,17] := IBQDatos.FieldValues['RP_TORO'];
      pag.Cells[I+12,18] := IBQDatos.FieldValues['RP_ANIMAL'];
      pag.Cells[I+12,20] := IBQDatos.FieldValues['RP_ANIMAL'];
      pag.Cells[I+12,21] := IBQDatos.FieldValues['HBA_ANIMAL'];
      pag.Cells[I+12,23] := IBQDatos.FieldValues['OBSERVACION'];
      I := I + 1;
      IBQDatos.Next;
    end
    else
    begin
      xlw.SaveAs(Folder+'Transferencia_'+IntToStr(Cant)+'.xls');
      Cant := Cant + 1;
      I := 0;
    end;
  end;
  while I < 20 do
  begin
      pag.Cells[I+12,6] := '';
      pag.Cells[I+12,7] := '';
      pag.Cells[I+12,8] := '';
      pag.Cells[I+12,9] := '';
      pag.Cells[I+12,10] := '';
      pag.Cells[I+12,11] := '';
      pag.Cells[I+12,12] := '';
      pag.Cells[I+12,13] := '';
      pag.Cells[I+12,15] := '';
      pag.Cells[I+12,17] := '';
      pag.Cells[I+12,18] := '';
      pag.Cells[I+12,20] := '';
      pag.Cells[I+12,21] := '';
      pag.Cells[I+12,23] := '';
      I := I + 1;
  end;
  xlw.SaveAs(Folder+'Transferencia_'+IntToStr(Cant)+'.xls');
end;

procedure TFExpSRA.ISalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.

