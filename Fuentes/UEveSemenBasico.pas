unit UEveSemenBasico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, Grids, DBGrids,
  UBDBGrid, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, UButtonABM,
  IBStoredProc, DataExport, DataToXLS, WinXP, JvExControls, JvLabel, JvGIF,
  PngImage, jpeg, ImgList, PngImageList, JvExExtCtrls, JvImage;

type  TFMovimientosdeSemen = class(TFUniversal)
    PGrilla: TPanel;
    PBotones: TPanel;
    DSToros: TDataSource;
    SBSemental: TSpeedButton;
    BBSalir: TBitBtn;
    IBDSToros: TIBDataSet;
    IBSPTab_Semen: TIBStoredProc;
    BBInfoSemen: TBitBtn;
    BBAyuda: TBitBtn;
    IFondoB: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    BDBGSemen: TBitDBGrid;
    procedure BBSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BDBGSemenDblClick(Sender: TObject);
    procedure BBInfoSemenClick(Sender: TObject);
    procedure DSTorosDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);

  private
      { Private declarations }
    procedure PaintRequired;
    procedure AutoAjustarColumnas;

  protected
   FTipoModificacionSemen:Integer;
   FEsCompra:boolean;
   procedure ActivarQueries;
   function ChequearCantidad(A:integer; B:integer(*sale*)):Boolean; virtual;Abstract;
   procedure PasarParametro;virtual;Abstract;
   procedure ComponentesVisiblesPorPais(pais: Integer);override;     
  public
    { Public declarations }
  end;

var
  FMovimientosdeSemen: TFMovimientosdeSemen;

implementation

{$R *.dfm}
uses UModificacionSemen, UPrincipal, UTraduccion;

procedure TFMovimientosdeSemen.BBSalirClick(Sender: TObject);
begin
  inherited;
  FPrincipal.IBTPrincipal.CommitRetaining;
  Close;
end;

(*
  Refresca el Query de la Grilla de Sementales
*)
procedure TFMovimientosdeSemen.ActivarQueries;
begin
  IBDSToros.Close;
  PasarParametro;
  IBDSToros.Open;
end;


procedure TFMovimientosdeSemen.FormCreate(Sender: TObject);
begin
  inherited;
  ActivarQueries;
  PaintRequired;
end;

procedure TFMovimientosdeSemen.BDBGSemenDblClick(Sender: TObject);
var v:TFModificacionSemen;
begin
  inherited;

  if (Self.PTitulo.Caption <> 'Compra de Semen') then
  begin
      if not(IBDSToros.IsEmpty) then
      begin
            v:= TFModificacionSemen.Create(self);
            v.PTitulo.Caption := self.PTitulo.Caption;
            v.LAnimal.Caption := Traducir('Nombre Animal:')+IBDSToros.FieldbyName('Nombre').AsString+'-'+IBDSToros.FieldbyName('Apodo').AsString;
            if not (FEsCompra)then // Oculto la parte de Centros de Inseminacion
            begin
                 v.DBLCBACentros.Visible := false;
                 v.LCentros.Visible := false;
            end;
            v.ShowModal;
            if(v.EACANTIDAD.Text = '')then
               v.EACANTIDAD.Text := '0';

            if(v.ModalResult = 1) and ChequearCantidad(BDBGSemen.DataSource.DataSet.FieldByName('cantidad').AsInteger,StrToInt(v.EACANTIDAD.Text))then
            begin
                 v.Fsemen  := IBDSToros.FieldValues['id_semen'];
                 v.IBSPSemen.ParamByName('TIPO').Value := FTipoModificacionSemen;
                 v.CargarParametrosSP;
                 ActivarQueries;
            end;
      end;
      PaintRequired;
  end;
end;

procedure TFMovimientosdeSemen.BBInfoSemenClick(Sender: TObject);
begin
  inherited;
  BDBGSemenDblClick(sender);
end;

procedure TFMovimientosdeSemen.DSTorosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  BBInfoSemen.Enabled := (not BDBGSemen.DataSource.DataSet.IsEmpty);
end;

procedure TFMovimientosdeSemen.ComponentesVisiblesPorPais(pais: Integer);
begin
  inherited;
  BDBGSemen.ColumnByField('id_senasa').Title.Caption:= FPrincipal.PaisNombreCaravana;
end;

procedure TFMovimientosdeSemen.FormShow(Sender: TObject);
begin
  inherited;
  ComponentesVisiblesPorPais(-1);
end;

procedure TFMovimientosdeSemen.PaintRequired;
begin
//  autoajustarcolumnas;
end;

procedure TFMovimientosdeSemen.AutoAjustarColumnas;
var
   ind_col, LONG_MAX, LONG_COL, LONG_TITLE: integer;
begin

       for ind_col := 0 to BDBGSemen.Columns.Count - 1 do
       begin
           LONG_MAX := 0;
           BDBGSemen.DataSource.DataSet.First;
           while not BDBGSemen.DataSource.DataSet.Eof do
           begin
                 LONG_COL := length(BDBGSemen.Columns[ind_col].Field.AsString);

                 if (LONG_COL > LONG_MAX) then
                      LONG_MAX := LONG_COL;

                 BDBGSemen.DataSource.DataSet.Next;
           end;

           LONG_TITLE := length(BDBGSemen.Columns[ind_col].Title.Caption);

           if (LONG_MAX > LONG_TITLE) then
               BDBGSemen.Columns[ind_col].Width := (8*LONG_MAX)+5
           else
               BDBGSemen.Columns[ind_col].Width := (7*LONG_TITLE)+6;

       end;
end;


end.
