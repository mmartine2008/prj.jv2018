unit UABMDescDestEmbrion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, DBCtrls,
  UDBLookupComboBoxAuto, Mask, UDBEditAuto, JvExControls, JvLabel,
  PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMDescDestEmbrion = class(TFABMSimple)
    IBQDestinos: TIBQuery;
    IBQAbmSimpleVAL_DESTINO: TStringField;
    IBQAbmSimpleID_DESCRIPCION: TIntegerField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleCODIGO: TIBStringField;
    IBQAbmSimpleSINONIMO: TIBStringField;
    IBQAbmSimpleDESTINO: TIntegerField;
    Label1: TLabel;
    DBEANombre: TDBEditAuto;
    DBEditAuto1: TDBEditAuto;
    Label2: TLabel;
    Label3: TLabel;
    DBEditAuto2: TDBEditAuto;
    Label4: TLabel;
    DBLCBADestino: TDBLookupComboBoxAuto;
    DSDestinos: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure IBQAbmSimpleBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMDescDestEmbrion: TFABMDescDestEmbrion;

implementation

uses
  UPrincipal;

{$R *.dfm}

procedure TFABMDescDestEmbrion.FormCreate(Sender: TObject);
begin
  inherited;
//  PermiteCambio := true;
//  PermiteInsertar := true;
  IBQDestinos.Close;
  IBQDestinos.Open;
end;

procedure TFABMDescDestEmbrion.IBQAbmSimpleBeforePost(DataSet: TDataSet);
begin
  inherited;
  IBQABMSimple.FieldValues['DESTINO'] := DBLCBADestino.KeyValue;
end;

end.
