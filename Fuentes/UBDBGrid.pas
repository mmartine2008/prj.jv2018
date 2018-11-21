{*******************************************************}
{                                                       }
{      TBitDBGrid  - Extended of standart TDBGrid       }
{    (Multiline columns titles, auto-resize columns,    }
{ inplace incremental search, titles like speedbuttons) }
{                                                       }
{   Copyright (c) 1997, 98 by Ilya Andreev AKA Andre    }
{                                                       }
{                       v 2.15.01                       }
{                                                       }
{                     SPb, Russia.                      }
{                                                       }
{                       Shareware.                      }
{                                                       }
{        e-mail: ilya_andreev@geocities.com             }
{    homepage: www.geocities.com/Athens/Delphi/8862     }
{                 FIDONet: 2:5030/55.28                 }
{                                                       }
{           Please, send me bug reports :)              }
{                                                       }
{*******************************************************}

unit UBDBGrid;

interface

//{$R BitGrid.Res}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Math, DB, StdCtrls, ClipBrd, IniFiles, Registry, DBTables, Variants
  {$DEFINE D_CS} // Remove this define, if you have't Delphi Client/Server
  {$IFDEF D_CS }
    , DBClient
    {$IFDEF D_CS}
//       {DEFINE GENESIS} //  Remove this define, if you have't Genesis ClientDataSet
        {$IFDEF GENESIS}
         , GenClientDataSet
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}

// {$DEFINE RX} // Remove this define, if you have't RX library
 {$IFDEF RX}
   , DBUtils, AppUtils, Placemnt, StrUtils, RxIni
  {$ENDIF}
  ;


const
  WM_GridEnter = WM_USER + 105;
  WM_Find = WM_USER + 106;

type

  TOnSortEvent = procedure(Field : TField; OldSQL : string; var ParseSQL : string;
     var AllowSort : boolean) of object;

  TOnDrawTitleEvent = procedure(ACol : integer; ARect : TRect; var TitleText : string)
    of object;

  TOnScrollEvent = procedure(Sender : TObject; Code : Integer; Pos : smallint)
    of object;

  TOnShowEditorEvent = procedure(Sender : TObject; Field : TField;
    var AllowShowEditor : boolean) of object;

  TOnPasteEvent = procedure(Sender : TObject;
    Field : TField; var FieldValue : string) of object;

  TIncSearchEvent = procedure(Sender:TObject;Field:TField;
      const Text:string;var MoveCaretBack:Boolean) of object;

  TGetCellParamsEvent = procedure (Sender: TObject; Field: TField;
    AFont: TFont; var Background: TColor; Highlight: Boolean) of object;

  TOnGetIconIndexEvent = procedure (Sender : TObject; Column : TColumn;
                                    var Index : Integer) of object;

  TEnterKeyDown = (ekNone, ekDouble, ekTab);

  TTitleBtnStyle = (tbNone, tbFix, tbDownUp, tbOneFix, tbDisallowAllUp,
   tbTraceSelect, tbSorted);

  TTitleBtnStyles = set of TTitleBtnStyle;

  TIncEdit = class;

  TColumnStyle = (csStandart, csIconic, csCheck);

  TFooterType = (foNone, foStatic, foColumn);

  TOnTransferRowEvent = procedure(var CellsCount : integer;
   var StopFlag : boolean) of object;

  TBitColumn = class(TColumn)
  private
   FFooterFont  : TFont;
   FFooterList : TStringList;
   FHint : string;
   procedure SetFooterFont(Value : TFont);
   procedure SetFooterValue(Value : TStrings);
   function GetFooterValue : TStrings;
  public
   constructor Create(Collection: TCollection); override;
   destructor Destroy; override;
   procedure Assign(Source : TPersistent); override;
  published
    property FooterValue : TStrings read GetFooterValue write SetFooterValue;
    property FooterFont : TFont read FFooterFont write SetFooterFont;
    property Hint : string read FHint write FHint;
  end;

  TBitDBGridColumns = class(TDBGridColumns)
  protected
    procedure LoadFromStreamEx(S: TStream);
    procedure SetColumnClass(ColumnClass : TCollectionItemClass);
    procedure Update(Item : TCollectionItem); override;
  end;

{$HINTS OFF}
  THackGrid = class(TCustomControl)
  private
    FAnchor: TGridCoord;
    FBorderStyle: TBorderStyle;
    FCanEditModify: Boolean;
    FColCount: Longint;
    FColWidths: Pointer;
    FTabStops: Pointer;
    FCurrent: TGridCoord;
    FDefaultColWidth: Integer;
    FDefaultRowHeight: Integer;
    FFixedCols: Integer;
    FFixedRows: Integer;
    FFixedColor: TColor;
    FGridLineWidth: Integer;
    FOptions: TGridOptions;
    FRowCount: Longint;
    FRowHeights: Pointer;
    FScrollBars: TScrollStyle;
    FTopLeft: TGridCoord;
    FSizingIndex: Longint;
    FSizingPos, FSizingOfs: Integer;
    FMoveIndex, FMovePos: Longint;
    FHitTest: TPoint;
    FInplaceEdit: TInplaceEdit;
    FInplaceCol, FInplaceRow: Longint;
    FColOffset: Integer;
    FDefaultDrawing: Boolean;
    FEditorMode: Boolean;
   end;

  THackDBGrid = class(TCustomGrid)
   private
    FIndicators: TImageList;
    FTitleFont: TFont;
    FReadOnly: Boolean;
    FOriginalImeName: TImeName;
    FOriginalImeMode: TImeMode;
    FUserChange: Boolean;
    FLayoutFromDataset: Boolean;
    FOptions: TDBGridOptions;
    FTitleOffset, FIndicatorOffset: Byte;
    FUpdateLock: Byte;
    FLayoutLock: Byte;
    FInColExit: Boolean;
    FDefaultDrawing: Boolean;
    FSelfChangingTitleFont: Boolean;
    FSelecting: Boolean;
    FSelRow: Integer;
    FDataLink: TGridDataLink;
    FOnColEnter: TNotifyEvent;
    FOnColExit: TNotifyEvent;
    FOnDrawDataCell: TDrawDataCellEvent;
    FOnDrawColumnCell: TDrawColumnCellEvent;
    FEditText: string;
    FColumns: TDBGridColumns;
    FOnEditButtonClick: TNotifyEvent;
    FOnColumnMoved: TMovedEvent;
    FBookmarks: TBookmarkList;
    FSelectionAnchor: TBookmarkStr;
    FOnCellClick: TDBGridClickEvent;
    FOnTitleClick:TDBGridClickEvent;
   end;

  THackCollection = class(TPersistent)
  private
    FItemClass: TCollectionItemClass;
    FItems: TList;
    FUpdateCount: Integer;
    FNextID: Integer;
    FPropName: string;
  end;

{$HINTS ON}

  TBitDBGrid = class(TDBGrid)
  private
   FAllowIncSearch : Boolean;
   FColIndex : Integer;
   FColumnDown : integer;
   FColumnVersion : integer;
   FDefaultColumns : boolean;
   FDefColumns : TBitDBGridColumns;
   FDoFocus : boolean;
   FDoSort : boolean;
   FDownSort : boolean;
   FDownBitmap : TBitmap;
   FDrawEllipse : boolean;
   FDrawReadOnly : boolean;
   FEnterKey : TEnterKeyDown;
   FFillFields : boolean;
   FFooterType : TFooterType;
   FFooterString : TCaption;
   FFooterFont : TFont;
   FFooterColor : TColor;
   FFooterHeight : integer;
   FImageList : TImageList;
   FIncEdit : TIncEdit;
   FIDownBitmap : TBitmap;
   FIndDown : boolean;
 {$IFDEF RX}
   FIniLink : TIniLink;
  {$ENDIF}
   FIniSection : string;
   FIntDrag : boolean;
   FIUpBitmap : TBitmap;
   FLongCaption : boolean;
   FMultiCaption : boolean;
   FMC : boolean;
   FOnHScroll : TOnScrollEvent;
   FOnDrawTitle : TOnDrawTitleEvent;
   FOnTitleMouseDown : TMouseEvent;
   FOnIncSearch : TIncSearchEvent;
   FOnSortEvent : TOnSortEvent;
   FOnGetCellParams: TGetCellParamsEvent;
   FOnShowEditorEvent  : TOnShowEditorEvent;
   FOnGetIconIndex : TOnGetIconIndexEvent;
   FOnHideIncEditor : TNotifyEvent;
   FOnPasteEvent : TOnPasteEvent;
   FRealTitleFont : TFont;
   FShowPropEditor : boolean;
   FShowCellHint : boolean;
   FSortFieldName : string;
   FStartBookMark : TBookmark;
   FTitleBtn : TTitleBtnStyle;
   FTitleDown : integer;
   FTitlesState : Variant;
   FUpBitmap : TBitmap;
   FUpdateLock: Byte;
   procedure CMHintShow(var Msg : TMessage); message CM_HINTSHOW;
   procedure CMDialogChar(var Message : TCMDialogChar); message CM_DIALOGCHAR;
   procedure DrawEllipse(Rect : TRect; Text : string);
   procedure DrawFooter(Col : TBitColumn);
   procedure DrawLongCaption;
   procedure FillColumnsArea(iCol : integer);
   procedure GetCellParams(Field: TField; AFont: TFont;
                var Background: TColor; Highlight: Boolean);
   procedure PainCornerBtn(ARect : TRect);
   procedure PlaseIncEdit;
   procedure ReCreateFooter(Col : TBitColumn);
   procedure ReCreateVar;
   procedure SetIncSearchText(const Text : string);
   procedure SetTitleBtn(Value : TTitleBtnStyle);
   procedure WMCaptureChanged(var Msg : TMessage); message WM_CaptureChanged;
   procedure WMChar(var Message : TWMChar); message WM_CHAR;
   procedure WMHScroll(var Msg: TWMHScroll); message WM_HSCROLL;
   procedure WMKey(var Msg : TWMKey); message WM_KeyDown;
   procedure WMSize(var Msg : TWMSize); message WM_SIZE;
   procedure WMSysKeyDown(var Msg : TWMKeyDown); message WM_SysKeyDown;
   procedure SetDrawEllipse(Value : boolean);
   procedure SetFooterColor(Value : TColor);
   procedure SetFooterFont(Value : TFont);
   procedure SetFooterString(Value : TCaption);
   procedure SetFooterType(Value : TFooterType);
   procedure SetImageList(Value : TImageList);
   procedure SetRealTitleFont(Value : TFont);
   procedure SetLongCaption(Value : boolean);
   procedure SetMultiCaption(Value : boolean);
   procedure SetPropEditor(Value : boolean);
   procedure SetSortFieldName(Value : string);
 {$IFDEF RX}
   procedure SetStorage(Value: TFormPlacement);
  {$ENDIF}
   function DoGetIconIndex(Column : TColumn):Integer; virtual;
   function DrawIconCell(Column : TColumn; Rect : TRect) : boolean;
   function FindRecord(const Text : string): Boolean;
   function GetFindMode : Boolean;
   function GetIncSearchText:string;
   function GetTitleOffset : byte;
 {$IFDEF RX}
   function GetStorage: TFormPlacement;
  {$ENDIF}
   function IncSearch : Boolean;
   function IsValidChar(C : Char): Boolean;
   function ParseQuery(ParseField : TField; OpenData: Boolean) : boolean;
        { Private declarations }
  protected
   function  CanEditShow: Boolean; override;
   procedure ColEnter; override;
   function  CreateColumns: TDBGridColumns; override;
   procedure DoEnter; override;
   procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState);  override;
   procedure DrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState); override;
   function GetClientRect: TRect; override;
   function  GetTitlesState(Index : integer) : Variant;
   procedure LinkActive(Value: Boolean); override;
   procedure Loaded; override;
   procedure Notification(AComponent: TComponent; Operation: TOperation); override;
   procedure Paint; override;
   procedure RestoreColumnsLayout(IniFile: TObject);
   procedure SaveColumnsLayout(IniFile: TObject);
   procedure SetTitlesState(Index : integer; Value : Variant);
   procedure SetColumnAttributes; override;
   function SetMimimumWidth(Cell : TGridCoord; ReHeight : boolean) : boolean;
   procedure SetDefaultColumns(Value : Boolean);
   procedure TopLeftChanged; override;
   procedure UpdateTitlesHeight;
  public
    constructor Create(AOwner : TComponent);override;
    destructor Destroy; override;
    procedure BeginLayout;
    function CellRect(ACol, ARow: Longint): TRect;
    function ColumnByField(FieldName : string) : TColumn;
    procedure CopyToClipboard(OnlyColumns, OnlySelected : boolean;
                    TrasnsferProcedure : TOnTransferRowEvent);
    procedure EndLayout;
    // Modificaciones para la Apariencia
    procedure EstablecerApariencia;

    function GetPureColumn(X, Y : integer) : integer;
    function HasRecord : boolean;
{$IFDEF RX}
    procedure IniLoad(Sender: TObject);
    procedure IniSave(Sender: TObject);
{$ENDIF}
    function MouseCoord(X, Y: Integer): TGridCoord;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
       X, Y: Integer); override;
    procedure MouseToCell(X, Y: Integer; var ACol, ARow: Longint);
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure PaintColumnTitle(ACol : integer; ARect : TRect; Down : boolean);
    procedure PasteFromClipboard;
    procedure RestoreLayoutReg(IniFile: TRegIniFile);
    procedure RunOptionsEditor;
    procedure SaveLayoutReg(IniFile: TRegIniFile);
    function SelectCell(ACol, ARow: Longint): Boolean; override;
    procedure SetAllColumnsWidth;
    procedure SetColumnFooter(Column : TColumn; Value : Variant);

    property DataLink;
    property DefColumns : TBitDBGridColumns read FDefColumns write FDefColumns;
    property FindMode : boolean read GetFindMode;
    property GridLineWidth;
    property IncEditor : TIncEdit read FIncEdit;
    property IncSearchText : string read GetIncSearchText write SetIncSearchText;
    property IndicatorOffset;
    property RowCount;
    property RowHeights;
    property TitleOffset : byte read GetTitleOffset;
    property TitlesState[Index : integer] : Variant read GetTitlesState
       write SetTitlesState;
   { Public declarations }

  published
    property AllowIncSearch:Boolean read FAllowIncSearch write FAllowIncSearch;
    property ColumnVersion : integer read FColumnVersion write FColumnVersion;
    property DefaultColumns : Boolean read FDefaultColumns write SetDefaultColumns;
    property DoChangeFocus : boolean read FDoFocus write FDoFocus default true;
    property DrawingEllipse : boolean read FDrawEllipse write SetDrawEllipse;
    property DrawReadOnly : boolean read FDrawReadOnly write FDrawReadOnly;
    property EnterKey : TEnterKeyDown read FEnterKey write FEnterKey;
    property FillFields : boolean read FFillFields write FFillFields;
    property FooterColor : TColor read FFooterColor write SetFooterColor;
    property FooterFont : TFont read FFooterFont write SetFooterFont;
    property FooterString : TCaption read FFooterString write SetFooterString;
    property FooterType : TFooterType read FFooterType write SetFooterType;
    property ImageList : TImageList read FImageList write SetImageList;
    property IniSection:string read FIniSection write FIniSection;
 {$IFDEF RX}
    property IniStorage: TFormPlacement read GetStorage write SetStorage;
  {$ENDIF}
    property InternalDrag : boolean read FIntDrag write FIntDrag;
    property LongCaption : boolean read FLongCaption write SetLongCaption;
    property MultiCaption : boolean read FMultiCaption write SetMultiCaption;
    property RealTitleFont : TFont read FRealTitleFont write SetRealTitleFont;
    property RunTimePropEditor : boolean read FShowPropEditor write SetPropEditor;
    property ShowCellHint : boolean read FShowCellHint write FShowCellHint;
    property SortFieldName : string read FSortFieldName write SetSortFieldName;
    property TitleBtn : TTitleBtnStyle read FTitleBtn write SetTitleBtn;
    property OnDrawTitle : TOnDrawTitleEvent read FOnDrawTitle write FOnDrawTitle;
    property OnGetCellParams : TGetCellParamsEvent read FOnGetCellParams write FOnGetCellParams;
    property OnGetIconIndex : TOnGetIconIndexEvent read FOnGetIconIndex write FOnGetIconIndex;
    property OnHideIncEditor : TNotifyEvent read FOnHideIncEditor write FOnHideIncEditor;
    property OnHScroll : TOnScrollEvent read FOnHScroll write FOnHScroll;
    property OnIncSearch : TIncSearchEvent read FOnIncSearch write FOnIncSearch;
    property OnMouseDown;
    property OnMouseUp;
    property OnPaste : TOnPasteEvent read FOnPasteEvent write FOnPasteEvent;
    property OnShowEditor : TOnShowEditorEvent read FOnShowEditorEvent write FOnShowEditorEvent ;
    property OnSort : TOnSortEvent read FOnSortEvent write FOnSortEvent;
    property OnTitleMouseDown : TMouseEvent read FOnTitleMouseDown write FOnTitleMouseDown;
  end;

  TIncEdit = class(TEdit)
  private
    FGrid : TBitDBGrid;
    FModalResult : TModalResult;
    procedure CMDialogChar(var Message : TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMVisibleChanged(var Message : TMessage); message CM_VISIBLECHANGED;
    procedure WMKeyDown(var Message : TWMKeyDown); message WM_KEYDOWN;
    procedure WMSysKeyDown(var Message : TWMKeyDown); message WM_SYSKEYDOWN;
    procedure WMChar(var Message : TWMChar); message WM_CHAR;
    function DoKeyDown(var Message : TWMKey) : Boolean;
  protected
    procedure Change; override;
    procedure DoExit; override;
  end;

procedure WriteText(ACanvas: TCanvas; ARect: TRect; DX, DY: Integer;
  const Text: string; Alignment: TAlignment);

procedure Register;

const
  DrawDown : TTitleBtnStyles = [tbFix, tbOneFix, tbDisallowAllUp, tbTraceSelect, tbSorted, tbDownUp];

implementation

var DrawBitmap : TBitmap;

type
  TColumnsWrapper = class(TComponent)
  private
    FColumns: TBitDBGridColumns;
  published
    property Columns: TBitDBGridColumns read FColumns write FColumns;
  end;


procedure DoFocus(Control:TWinControl);
var
  F : TCustomForm;
begin
  F := GetParentForm(Control);
  if Control.CanFocus and Assigned(F) then F.ActiveControl := Control;
end;

function GetRegSection(Component: TComponent): String;
var
  F: TCustomForm;
  Owner: TComponent;
begin
  if Component <> nil then begin
    if Component is TCustomForm then Result := Component.ClassName
     else begin
      Result := Component.Name;
      if Component is TControl then begin
        F := GetParentForm(TControl(Component));
        if F <> nil then Result := F.ClassName + '\' + Result
          else begin
            if TControl(Component).Parent <> nil then
              Result := TControl(Component).Parent.Name + '\' + Result;
          end;
       end else begin
        Owner := Component.Owner;
        if Owner is TForm then
          Result := Format('%s\%s', [Owner.ClassName, Result]);
      end;
    end;
  end else
    Result := '';
end;

{Next 4 procedures took from RX library}

type
 TCharSet = set of Char;

function WordPosition(const N: Integer; const S: string;
  const WordDelims: TCharSet): Integer;
var
  Count, I: Integer;
begin
  Count := 0;
  I := 1;
  Result := 0;
  while (I <= Length(S)) and (Count <> N) do begin
    { skip over delimiters }
    while (I <= Length(S)) and (S[I] in WordDelims) do Inc(I);
    { if we're not beyond end of S, we're at the start of a word }
    if I <= Length(S) then Inc(Count);
    { if not finished, find the end of the current word }
    if Count <> N then
      while (I <= Length(S)) and not (S[I] in WordDelims) do Inc(I)
    else Result := I;
  end;
end;

function ExtractWord(N: Integer; const S: string;
  const WordDelims: TCharSet): string;
var
  I: Integer;
  Len: Integer;
begin
  Len := 0;
  I := WordPosition(N, S, WordDelims);
  if I <> 0 then
    { find the end of the current word }
    while (I <= Length(S)) and not(S[I] in WordDelims) do begin
      { add the I'th character to result }
      Inc(Len);
      SetLength(Result, Len);
      Result[Len] := S[I];
      Inc(I);
    end;
  SetLength(Result, Len);
end;

function WordCount(const S: string; const WordDelims: TCharSet): Integer;
var
  SLen, I: Cardinal;
begin
  Result := 0;
  I := 1;
  SLen := Length(S);
  while I <= SLen do begin
    while (I <= SLen) and (S[I] in WordDelims) do Inc(I);
    if I <= SLen then Inc(Result);
    while (I <= SLen) and not(S[I] in WordDelims) do Inc(I);
  end;
end;

function MaxInteger(const Values: array of Longint): Longint;
var
  I: Cardinal;
begin
  Result := Values[0];
  for I := 0 to High(Values) do
    if Values[I] > Result then Result := Values[I];
end;

procedure StretchBltTransparent(DstDC: HDC; DstX, DstY, DstW, DstH: Integer;
  SrcDC: HDC; SrcX, SrcY, SrcW, SrcH: Integer; Palette: HPalette;
  TransparentColor: TColorRef);
var
  Color: TColorRef;
  bmAndBack, bmAndObject, bmAndMem, bmSave: HBitmap;
  bmBackOld, bmObjectOld, bmMemOld, bmSaveOld: HBitmap;
  MemDC, BackDC, ObjectDC, SaveDC: HDC;
  palDst, palMem, palSave, palObj: HPalette;
begin
  { Create some DCs to hold temporary data }
  BackDC := CreateCompatibleDC(DstDC);
  ObjectDC := CreateCompatibleDC(DstDC);
  MemDC := CreateCompatibleDC(DstDC);
  SaveDC := CreateCompatibleDC(DstDC);
  { Create a bitmap for each DC }
  bmAndObject := CreateBitmap(SrcW, SrcH, 1, 1, nil);
  bmAndBack := CreateBitmap(SrcW, SrcH, 1, 1, nil);
  bmAndMem := CreateCompatibleBitmap(DstDC, DstW, DstH);
  bmSave := CreateCompatibleBitmap(DstDC, SrcW, SrcH);
  { Each DC must select a bitmap object to store pixel data }
  bmBackOld := SelectObject(BackDC, bmAndBack);
  bmObjectOld := SelectObject(ObjectDC, bmAndObject);
  bmMemOld := SelectObject(MemDC, bmAndMem);
  bmSaveOld := SelectObject(SaveDC, bmSave);
  { Select palette }
  palDst := 0; palMem := 0; palSave := 0; palObj := 0;
  if Palette <> 0 then begin
    palDst := SelectPalette(DstDC, Palette, True);
    RealizePalette(DstDC);
    palSave := SelectPalette(SaveDC, Palette, False);
    RealizePalette(SaveDC);
    palObj := SelectPalette(ObjectDC, Palette, False);
    RealizePalette(ObjectDC);
    palMem := SelectPalette(MemDC, Palette, True);
    RealizePalette(MemDC);
  end;
  { Set proper mapping mode }
  SetMapMode(SrcDC, GetMapMode(DstDC));
  SetMapMode(SaveDC, GetMapMode(DstDC));
  { Save the bitmap sent here }
  BitBlt(SaveDC, 0, 0, SrcW, SrcH, SrcDC, SrcX, SrcY, SRCCOPY);
  { Set the background color of the source DC to the color,         }
  { contained in the parts of the bitmap that should be transparent }
  Color := SetBkColor(SaveDC, ColorToRGB(TransparentColor) or $02000000);
  { Create the object mask for the bitmap by performing a BitBlt()  }
  { from the source bitmap to a monochrome bitmap                   }
  BitBlt(ObjectDC, 0, 0, SrcW, SrcH, SaveDC, 0, 0, SRCCOPY);
  { Set the background color of the source DC back to the original  }
  SetBkColor(SaveDC, Color);
  { Create the inverse of the object mask }
  BitBlt(BackDC, 0, 0, SrcW, SrcH, ObjectDC, 0, 0, NOTSRCCOPY);
  { Copy the background of the main DC to the destination }
  BitBlt(MemDC, 0, 0, DstW, DstH, DstDC, DstX, DstY, SRCCOPY);
  { Mask out the places where the bitmap will be placed }
  StretchBlt(MemDC, 0, 0, DstW, DstH, ObjectDC, 0, 0, SrcW, SrcH, SRCAND);
  { Mask out the transparent colored pixels on the bitmap }
  BitBlt(SaveDC, 0, 0, SrcW, SrcH, BackDC, 0, 0, SRCAND);
  { XOR the bitmap with the background on the destination DC }
  StretchBlt(MemDC, 0, 0, DstW, DstH, SaveDC, 0, 0, SrcW, SrcH, SRCPAINT);
  { Copy the destination to the screen }
  BitBlt(DstDC, DstX, DstY, DstW, DstH, MemDC, 0, 0,
    SRCCOPY);
  { Restore palette }
  if Palette <> 0 then begin
    SelectPalette(MemDC, palMem, False);
    SelectPalette(ObjectDC, palObj, False);
    SelectPalette(SaveDC, palSave, False);
    SelectPalette(DstDC, palDst, True);
  end;
  { Delete the memory bitmaps }
  DeleteObject(SelectObject(BackDC, bmBackOld));
  DeleteObject(SelectObject(ObjectDC, bmObjectOld));
  DeleteObject(SelectObject(MemDC, bmMemOld));
  DeleteObject(SelectObject(SaveDC, bmSaveOld));
  { Delete the memory DCs }
  DeleteDC(MemDC);
  DeleteDC(BackDC);
  DeleteDC(ObjectDC);
  DeleteDC(SaveDC);
end;

procedure StretchBitmapTransparent(Dest: TCanvas; Bitmap: TBitmap;
  TransparentColor: TColor; DstX, DstY, DstW, DstH, SrcX, SrcY,
  SrcW, SrcH: Integer);
var
  CanvasChanging: TNotifyEvent;
  Temp: TBitmap;
begin
  if DstW <= 0 then DstW := Bitmap.Width;
  if DstH <= 0 then DstH := Bitmap.Height;
  if (SrcW <= 0) or (SrcH <= 0) then begin
    SrcX := 0; SrcY := 0;
    SrcW := Bitmap.Width;
    SrcH := Bitmap.Height;
  end;
  if not Bitmap.Monochrome then
    SetStretchBltMode(Dest.Handle, STRETCH_DELETESCANS);
  CanvasChanging := Bitmap.Canvas.OnChanging;
  try
    Bitmap.Canvas.OnChanging := nil;
    Temp := Bitmap;
    try
      if TransparentColor = clNone then begin
        StretchBlt(Dest.Handle, DstX, DstY, DstW, DstH, Temp.Canvas.Handle,
          SrcX, SrcY, SrcW, SrcH, Dest.CopyMode);
      end
      else begin
        if TransparentColor = clDefault then
          TransparentColor := Temp.Canvas.Pixels[0, Temp.Height - 1];
        if Temp.Monochrome then TransparentColor := clWhite
        else TransparentColor := ColorToRGB(TransparentColor);
        StretchBltTransparent(Dest.Handle, DstX, DstY, DstW, DstH,
          Temp.Canvas.Handle, SrcX, SrcY, SrcW, SrcH, Temp.Palette,
          TransparentColor);
      end;
    finally
    end;
  finally
    Bitmap.Canvas.OnChanging := CanvasChanging;
  end;
end;

procedure DrawBitmapTransparent(Dest: TCanvas; DstX, DstY: Integer;
  Bitmap: TBitmap; TransparentColor: TColor);
begin
  StretchBitmapTransparent(Dest, Bitmap, TransparentColor, DstX, DstY,
    Bitmap.Width, Bitmap.Height, 0, 0, Bitmap.Width, Bitmap.Height);
end;

destructor TBitColumn.Destroy;
begin
 FFooterFont.Free;
 FFooterList.Free;
 inherited;
end;

constructor TBitColumn.Create(Collection: TCollection);
begin
 inherited;
 FFooterFont := TFont.Create;
 FFooterList := TStringList.Create;
end;

procedure TBitDBGridColumns.LoadFromStreamEx(S: TStream);
var
  Wrapper: TColumnsWrapper;
begin
  Wrapper := TColumnsWrapper.Create(nil);
  try
    Wrapper.Columns := TBitDBGridColumns.Create(Grid, TBitColumn);
    S.ReadComponent(Wrapper);
    Assign(Wrapper.Columns);
  finally
    Wrapper.Columns.Free;
    Wrapper.Free;
  end;
end;

procedure TBitColumn.Assign(Source:TPersistent);
begin
  inherited Assign(Source);
  if Source is TBitColumn then begin
    FFooterList.Assign(TBitColumn(Source).FFooterList);
    FFooterFont.Assign(TBitColumn(Source).FFooterFont);
    FHint := TBitColumn(Source).Hint;
   end;
end;

procedure TBitColumn.SetFooterFont(Value : TFont);
begin
  FFooterFont.Assign(Value);
  TBitDBGrid(Grid).DrawFooter(Self);
end;

procedure TBitColumn.SetFooterValue(Value : TStrings);
begin
 FFooterList.Assign(Value);
 TBitDBGrid(Grid).ReCreateFooter(Self);
end;

function TBitColumn.GetFooterValue : TStrings;
begin
 Result := FFooterList;
end;

{TBitColumns }

procedure TBitDBGridColumns.Update(Item : TCollectionItem);
begin
  if (ItemClass <> TColumn) and (Count = 0)
   and (Item <> nil) then Add;
  inherited Update(Item);
end;

procedure TBitDBGridColumns.SetColumnClass(ColumnClass : TCollectionItemClass);
begin
  if ItemClass <> ColumnClass then begin
    with THackCollection(Self) do FItemClass := ColumnClass;
    TBitDBGrid(Grid).BeginLayout;
    try
     Clear;
     if (ItemClass <> TColumn) and (Count = 0) then Add;
    finally
     TBitDBGrid(Grid).EndLayout;
    end;
  end;
end;

function TBitDBGrid.CreateColumns: TDBGridColumns;
begin
  Result := TBitDBGridColumns.Create(Self, TColumn)
end;

procedure TBitDBGrid.SetDefaultColumns(Value : Boolean);
begin
  if FDefaultColumns <> Value then FDefaultColumns := Value;
  if Value then TBitDBGridColumns(Columns).SetColumnClass(TColumn)
   else TBitDBGridColumns(Columns).SetColumnClass(TBitColumn);
end;

function TBitDBGrid.GetTitleOffset: Byte;
begin
  Result := 0;
  if dgTitles in Options then Inc(Result);
end;

function TBitDBGrid.GetPureColumn(X, Y : integer) : integer;
begin
 result := MouseCoord(X,Y).X - integer(dgIndicator in Options)
end;

function TBitDBGrid.GetFindMode : boolean;
begin
 result := (FIncEdit <> nil) and FIncEdit.Visible
end;

procedure TBitDBGrid.SetDrawEllipse(Value : boolean);
begin
 if Value <> FDrawEllipse then begin
    FDrawEllipse := Value;
    Invalidate;
  end;
end;

procedure TBitDBGrid.SetPropEditor(Value : boolean);
begin
 if Value <> FShowPropEditor then begin
    FShowPropEditor := Value;
    Invalidate;
  end;
end;

procedure TBitDBGrid.SetMultiCaption(Value : boolean);
begin
 if Value <> FMultiCaption then begin
    FMultiCaption := Value;
    if not Value then TitleFont.Assign(FRealTitleFont)
     else UpdateTitlesHeight;
    Invalidate;
  end;
end;

procedure TBitDBGrid.SetLongCaption(Value : boolean);
begin
 if Value <> FLongCaption then begin
    FLongCaption := Value;
    Invalidate;
  end;
end;

function TBitDBGrid.SelectCell(ACol, ARow: Longint): Boolean;
begin
 result := inherited SelectCell(ACol, ARow);
end;

function Max(X, Y: Integer): Integer;
begin
  Result := Y;
  if X > Y then Result := X;
end;

procedure WriteText(ACanvas: TCanvas; ARect: TRect; DX, DY: Integer;
  const Text: string; Alignment: TAlignment);
//(C) Borland function :)
const
  AlignFlags : array [TAlignment] of Integer =
    ( DT_LEFT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX );
var
  B, R: TRect;
begin
 with DrawBitmap, ARect do { Use offscreen bitmap to eliminate flicker and }
   begin                     { brush origin tics in painting / scrolling.    }
     Width := Max(Width, Right - Left);
     Height := Max(Height, Bottom - Top);
     R := Rect(DX, DY, Right - Left - 1, Bottom - Top - 1);
     B := Rect(0, 0, Right - Left, Bottom - Top);
    end;

 with DrawBitmap.Canvas do
   begin
     DrawBitmap.Canvas.CopyRect(B, ACanvas, ARect);
     Font := ACanvas.Font;
     Font.Color := ACanvas.Font.Color;
     Brush := ACanvas.Brush;
     SetBkMode(Handle, TRANSPARENT);
     if (Pos(' ', Text) = 0) and (TextWidth(Text) > (ARect.Right - ARect.Left))
       then Alignment := taLeftJustify;
     DrawText(Handle, PChar(Text), Length(Text), R, AlignFlags[Alignment]);
    end;
 ACanvas.CopyRect(ARect, DrawBitmap.Canvas, B);
end;


constructor TBitDBGrid.Create(AOwner : TComponent);
begin
 FDoFocus := true;
 FShowCellHint := true;
 FDefColumns := TBitDBGridColumns.Create(Self, TBitColumn);
 FDefaultColumns := True;
 FFooterHeight := DefaultRowHeight;
 inherited Create(Aowner);
 Columns.Add;
 FTitleDown := -1;
 FDownBitmap := TBitmap.Create;
 FUpBitmap := TBitmap.Create;
 FIDownBitmap := TBitmap.Create;
 FIUpBitmap := TBitmap.Create;
{$IFDEF RX}
 FIniLink := TIniLink.Create;
 FIniLink.OnSave := IniSave;
 FIniLink.OnLoad := IniLoad;
{$ENDIF}
 FRealTitleFont := TFont.Create;
 FFooterFont := TFont.Create;
 FFooterColor := Color;
 RealTitleFont.Height := TitleFont.Height + 3;
 FTitleBtn := tbNone;
 FLongCaption := true;
 FShowPropEditor := true;
 FMultiCaption := true;
 FDownSort := true;
 FDrawEllipse := True;
 FIniSection:='';
 ReCreateVar;
 if not (csDesigning in ComponentState) then begin
   if FindResource(0, 'SORTDOWN', RT_BITMAP) <> 0
     then FDownBitmap.LoadFromResourceName(0, 'SORTDOWN');
   if FindResource(0, 'SORTUP', RT_BITMAP) <> 0
     then FUpBitmap.LoadFromResourceName(0, 'SORTUP');
   if FindResource(0, 'ISORTDOWN', RT_BITMAP) <> 0
     then FIDownBitmap.LoadFromResourceName(0, 'ISORTDOWN');
   if FindResource(0, 'ISORTUP', RT_BITMAP) <> 0
     then FIUpBitmap.LoadFromResourceName(0, 'ISORTUP');
  end;
end;

destructor TBitDBGrid.Destroy;
begin
 FIDownBitmap.Free;
 FIUpBitmap.Free;
 FDownBitmap.Free;
 FUpBitmap.Free;
{$IFDEF RX}
 FIniLink.Free;
{$ENDIF}
 FRealTitleFont.Free;
 FFooterFont.Free;
 FDefColumns.Free;
 inherited Destroy;
end;

procedure TBitDBGrid.ReCreateVar;
begin
 if TVarData(FTitlesState).VType = varEmpty
   then FTitlesState := VarArrayCreate([0, 1], varBoolean)
   else
    if Columns.Count > 0 then
      VarArrayRedim(FTitlesState, Columns.Count - 1)
     else VarArrayRedim(FTitlesState, 1)
end;

procedure TBitDBGrid.SetSortFieldName(Value : string);
begin
  try
  if DataLink.Active then
   if not (csDesigning in ComponentState) then
     if ParseQuery(DataLink.DataSet.FindField(Value), DataLink.Active)
       then FSortFieldName := Value
       else
    else FSortFieldName := Value;
  except on e:exception do
    abort;
  end;
end;

procedure TBitDBGrid.SetImageList(Value : TImageList);
begin
  if Value <> FImageList then begin
    FImageList := Value;
    Invalidate;
  end;
end;

Function TBitDBGrid.ParseQuery(ParseField : TField; OpenData: Boolean) : boolean;
var S, OldS : string;
    P : integer;
    D : boolean;
    Book : TBookMarkStr;
    AllowSort: boolean;

function isAllowIndex : string;
var Loop : integer;
    OldInd  : string;
    NowDesc : boolean;
    ID : TIndexDef;
begin
 result := '';
 NowDesc := false;
 with DataLink.DataSet as TTable do begin
  if IndexName <> '' then begin
     ID := IndexDefs.Items[IndexDefs.IndexOf(IndexName)];
     OldInd := ID.Name;
     NowDesc := (ixDescending in ID.Options);
     FDownSort := false;
    end;
   for Loop := 0 to IndexDefs.Count - 1 do
     with IndexDefs[Loop] do
      if not (ixExpression in Options) then
        if (Pos(ParseField.FieldName + ';', Fields) = 1)
         or (ParseField.FieldName = Fields) then begin
            if (OldInd <> Name) and
              ((not ParseField.isIndexField)
                or (NowDesc <> (ixDescending in Options)))
              then begin
               result := Name;
               FDownSort := not (ixDescending in Options);
               Break;
              end;
           end;
  end;
end;

begin
 if (ParseField = nil)
  or ParseField.Calculated then Exit;
 Result := True;
 SelectedRows.Clear;
 FDownSort := true;
 if not (DataLink.DataSet is TQuery) then begin
   if (DataLink.DataSet is TTable)
     then begin
       if ((DataLink.DataSet as TTable).DataBase <> nil)
         and (DataLink.DataSet as TTable).DataBase.IsSQLBased
        then (DataLink.DataSet as TTable).IndexFieldNames := ParseField.FieldName
        else begin
          OldS := IsAllowIndex;
          Result := OldS <> '';
          if Assigned(FOnSortEvent) then
            FOnSortEvent(ParseField, '', OldS, Result);
          if Result then
           (DataLink.DataSet as TTable).IndexName := OldS;
         end;
      end
  {$IFDEF D_CS}
   {$IFDEF GENESIS}
     else
      if (DataLink.DataSet is TGenClientDataSet)
        then with (DataLink.DataSet as TGenClientDataSet) do
         begin
           if Assigned(FOnSortEvent) then
             FOnSortEvent(ParseField, ParseField.FieldName, OldS, Result);
            if Result then
              if IndexFieldNames = ParseField.FieldName
                then if SortDirection = sdAsc
                       then SortDirection := sdDesc
                       else SortDirection := sdAsc
                else begin
                  if Assigned(BeforeSort) then BeforeSort(DataLink.DataSet);
                  IndexFieldNames := ParseField.FieldName;
                  SetWithoutSort(sdAsc);
                  if Assigned(AfterSort) then AfterSort(DataLink.DataSet);
                 end;
           FDownSort := SortDirection = sdAsc;
          end
    {$ENDIF}
        else if (DataLink.DataSet is TClientDataSet)
                then (DataLink.DataSet as TClientDataSet).IndexFieldNames := ParseField.FieldName
    {$ELSE} else begin end {$ENDIF}
  end else begin
  S := TQuery(DataLink.DataSet).SQL.Text;
  OldS := S;
  P := AnsiPos('ORDER BY', UpperCase(S));

  // Mis Modificaciones --------------------------------------------------------
//  D := (P > 0) and (AnsiPos(IntToStr(ParseField.FieldName. + ' ASC', S) > P);
  D := (P > 0) and (AnsiPos(IntToStr(ParseField.FieldNo) + ' ASC', S) > P);
  // ---------------------------------------------------------------------------
  if P > 0 then Delete(S, P+9, Length(S))
    else S := S + 'ORDER BY ';
  // Mis Modificaciones --------------------------------------------------------
//  S := S + ParseField.FieldName;
  S := S + IntToStr(ParseField.FieldNo);
  // ---------------------------------------------------------------------------
  if D then S := S + ' DESC'
    else S := S + ' ASC';
  FDownSort := not D;
  AllowSort := true;
  if Assigned(FOnSortEvent) then FOnSortEvent(ParseField, OldS, S, AllowSort);
  Result := AllowSort;
  if Result and OpenData then
  try
    Book := DataLink.DataSet.BookMark;
    DataLink.DataSet.DisableControls;
    TQuery(DataLink.DataSet).SQL.Text := S;
    if DataLink.DataSet.Active then DataLink.DataSet.Close;
    try
     DataLink.DataSet.Open;
     DataLink.DataSet.BookMark := Book;
     except
      TQuery(DataLink.DataSet).SQL.Text := OldS;
      DataLink.DataSet.Open;
      Result := false;
     end
   finally
    DataLink.DataSet.EnableControls;
   end;
  end;
end;

procedure TBitDBGrid.SetTitlesState(index : integer; Value : Variant);
var Loop : integer;
begin
  if (TitleBtn = tbOneFix) or (TitleBtn = tbTraceSelect) then
    for Loop := 0 to VarArrayHighBound(FTitlesState, 1) do
      if FTitlesState[Loop] then begin
        FTitlesState[Loop] := false;
        PaintColumnTitle(Loop, CellRect(Loop + IndicatorOffset, 0), false);
       end;
   if (TitleBtn = tbDisAllowAllUp) and (not Value) then
    for Loop := 0 to VarArrayHighBound(FTitlesState, 1) do
      if FTitlesState[Loop] and (Loop <> Index) then begin
        FTitlesState[Index] := Value;
        Break;
       end else
   else FTitlesState[Index] := Value;
  PaintColumnTitle(index, CellRect(Index + IndicatorOffset, 0), false);
end;

procedure TBitDBGrid.PaintColumnTitle(ACol : integer; ARect : TRect; Down : boolean);
var TitleText : string;
    VC : integer;
    R2 : TRect;
    Bit : TBitmap;
begin
 TitleText := Columns[ACol].Title.Caption;
 R2 := ARect;
 InflateRect(R2, -2, -2);
 if Down or ((TitleBtn in DrawDown) and (TitlesState[ACol]))
    then begin
     DrawEdge(Canvas.Handle, ARect, EDGE_SUNKEN, BF_BOTTOMLEFT);
     DrawEdge(Canvas.Handle, ARect, EDGE_SUNKEN, BF_TOPRIGHT);
    end
    else begin
     DrawEdge(Canvas.Handle, ARect, BDR_RAISEDINNER, BF_BOTTOMLEFT);
     DrawEdge(Canvas.Handle, ARect, BDR_RAISEDINNER, BF_TOPRIGHT);
    end;
 InflateRect(ARect, -1, -1);
 Canvas.Brush.Color := Columns[ACol].Title.Color;
 Canvas.FillRect(ARect);
 if Assigned(OnDrawTitle) then OnDrawTitle(ACol, ARect, TitleText);
 if Down or ((TitleBtn in DrawDown) and (TitlesState[ACol]))
   then OffsetRect(ARect, 2, 2);
 if TitleText <> '' then begin
   Canvas.Brush.Style := bsClear;
   if FMultiCaption then
    if StoreColumns and (cvTitleFont in Columns[ACol].AssignedValues)
       then Canvas.Font := Columns[ACol].Title.Font
      else Canvas.Font := RealTitleFont
     else
    if StoreColumns and (cvTitleFont in Columns[ACol].AssignedValues)
       then Canvas.Font := Columns[ACol].Title.Font
      else Canvas.Font := TitleFont;
   VC := DrawText(Canvas.Handle, PChar(TitleText), Length(TitleText), R2, DT_CALCRECT + DT_WORDBREAK);
   if  VC < - TitleFont.Height then
     ARect.Top := ARect.Top + Round(-(VC + TitleFont.Height)/2 - 1);
   WriteText(Canvas, ARect, 2, 2, TitleText, Columns[ACol].Title.Alignment);
   if (Pos(' ', TitleText) = 0) then begin
     Canvas.Brush.Color := Columns[ACol].Title.Color;
     R2 := ARect;  R2.Left := R2.Left + 2;
     DrawEllipse(R2, TitleText);
    end;
  end;
  if (TitleBtn = tbSorted) and
     DataLink.Active and (Columns[ACol].Field <> nil) and
     (Columns[ACol].FieldName = SortFieldName) then begin
      if FDownSort
        then
          if (FTitleDown <> - 1) then Bit := FIDownBitmap else Bit := FDownBitmap
        else if (FTitleDown <> - 1) then Bit := FIUpBitmap else Bit := FUpBitmap;
      DrawBitmapTransparent(Canvas, ARect.Right - 11,
        Round((ARect.Bottom - 7)/2), Bit, clDefault)
     end;
end;

function TBitDBGrid.GetTitlesState(index : integer) : Variant;
begin
  result := FTitlesState[Index];
end;

procedure TBitDBGrid.ColEnter;
begin
 inherited;
 if (TitleBtn = tbTraceSelect)
  then begin
   TitlesState[Col - IndicatorOffset] := true;
   Invalidate;
  end;
end;

procedure TBitDBGrid.Loaded;
begin
 inherited;
 FDefColumns.Assign(Columns);
 ReCreateVar;
 RecreateFooter(nil);
end;

procedure TBitDBGrid.DoEnter;
begin
 inherited;
 if DoChangeFocus then
   if (Owner is TCustomForm) then
   SendMessage((Owner as TCustomForm).Handle,
     wm_GridEnter, 0, LongInt(Pointer(Self)));
end;

function TBitDBGrid.DrawIconCell(Column : TColumn; Rect : TRect) : boolean;
var ImageIndex, X, Y : integer;
begin
  Result := false;
  ImageIndex := DoGetIconIndex(Column);
  if ImageIndex > -1 then begin
    Canvas.FillRect(Rect);
    if Assigned(FImageList) and (ImageIndex >= 0) and (ImageIndex < FImageList.Count)
      then begin
        X := Rect.Left + (Rect.Right - Rect.Left - FImageList.Width) div 2;
        Y := Rect.Top + (Rect.Bottom - Rect.Top - FImageList.Height) div 2;
        FImageList.Draw(Canvas,X,Y,ImageIndex);
        Result := True;
      end;
    end;
end;

procedure TBitDBGrid.LinkActive(Value: Boolean);
var Loop : integer;
begin
 FDownSort := false;
 inherited LinkActive(Value);
 if not Value then begin
   ReCreateVar;
   for Loop := 0 to VarArrayHighBound(FTitlesState, 1) do
     FTitlesState[Loop] := false;
  end
 else begin
  ReCreateVar;
  if (TitleBtn = tbTraceSelect)
   then begin
    TitlesState[Col - integer(dgIndicator in Options)] := true;
    Invalidate;
   end;
  if (TitleBtn = tbSorted) and not (csDesigning in ComponentState)then begin
   {$IFDEF D_CS}
    {$IFDEF GENESIS}
    if (DataLink.DataSet is TGenClientDataSet)
      then with (DataLink.DataSet as TGenClientDataSet) do
          if SortDirection = sdAsc
           then SetWithoutSort(sdDesc)
           else SetWithoutSort(sdAsc);
     {$ENDIF}
    {$ENDIF}
    SortFieldName := SortFieldName;
   end;
  end;
end;

procedure TBitDBGrid.RunOptionsEditor;
begin
// SetupGrid(Self);
end;

procedure TBitDBGrid.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  FResizeFlag : boolean;
  Cell : TGridCoord;
  ARect : TRect;
begin
 FResizeFlag := FGridState = gsColSizing;
 Cell := MouseCoord(X, Y);
 inherited MouseUp(Button, Shift, X, Y);
 if FIndDown then begin
    ARect := CellRect(0, 0);
    FIndDown := false;
    PainCornerBtn(ARect);
    if (Cell.Y < TitleOffset) and (Cell.X < IndicatorOffset)
      and (Cell.Y >= 0) and (Cell.Y >= 0)
      then RunOptionsEditor;
   end;
 if FResizeFlag then begin
   if MultiCaption then UpdateTitlesHeight;
   Invalidate;
  end;
 if FDoSort and (Cell.Y < TitleOffset)
    and ((Cell.Y <> -1) and (Cell.X <> -1))
    and (FTitleDown = Cell.X)
    and (TitleBtn = tbSorted) and DataLink.Active
   then SortFieldName := Columns[FColumnDown].FieldName;
 if (FTitleDown <> -1) and ((TitleBtn = tbSorted) or (TitleBtn = tbDownUp))
   then TitlesState[FColumnDown] := false;
 FTitleDown := -1;
 FDoSort := false;
 if Assigned(OnMouseUp) then OnMouseUp(Self, Button, Shift, X,Y);
end;

procedure TBitDBGrid.PainCornerBtn(ARect : TRect);
begin
  Canvas.Brush.color := clBtnFace;
  Canvas.FillRect(ARect);
  if FIndDown then
    DrawEdge(Canvas.Handle, ARect, EDGE_SUNKEN, BF_RECT)
   else
    DrawEdge(Canvas.Handle, ARect, EDGE_RAISED, BF_RECT);
end;

procedure TBitDBGrid.DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState);
begin
 if (ARow < TitleOffset) and (ACol < IndicatorOffset)
  and (ARow >= 0) and (ACol >= 0)
  and FShowPropEditor then begin
    PainCornerBtn(ARect);
    Exit;
   end;
 ACol := ACol - IndicatorOffset;
 if (FIncEdit <> nil) and FIncEdit.Visible and (ACol >= 0) then
   if ARow = DataLink.ActiveRecord + TitleOffset
    then begin
       if not DrawIconCell(Columns[ACol], ARect) then
        begin
          InflateRect(ARect, -1, -1);
          Canvas.Brush.Color := clHighlightText;
          Canvas.Font.Color := clHighlight;
          Canvas.Font.Style := [fsBold];
          Canvas.FillRect(ARect);
          if Columns[ACol].Field <> nil then begin
            WriteText(Canvas, ARect, 2, 2, Columns[ACol].Field.DisplayText, Columns[ACol].Alignment);
            DrawEllipse(ARect, Columns[ACol].Field.DisplayText);
           end;
         end;
       Exit;
      end;
 if ((VarArrayHighBound(FTitlesState, 1) + 1) <> Columns.Count)
  or (Columns.Count = 0) then ReCreateVar;
 if not (dgTitles in Options) or (ARow > 0) or (ACol < 0)
  then inherited DrawCell(ACol + IndicatorOffset, ARow, ARect, AState)
  else PaintColumnTitle(ACol, ARect, false);
end;

procedure TBitDBGrid.DrawColumnCell(const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  NewBackgrnd: TColor;
  Highlight: Boolean;
  Field: TField;
begin
  NewBackgrnd := Canvas.Brush.Color;
  if ReadOnly and DrawReadOnly then NewBackgrnd := Color;
  Field := Column.Field;
  Highlight := (gdSelected in State) and ((dgAlwaysShowSelection in Options) or
    Focused);
  GetCellParams(Field, Canvas.Font, NewBackgrnd, Highlight);
  Canvas.Brush.Color := NewBackgrnd;
  if DrawIconCell(Column, Rect) then Exit;
  if DefaultDrawing then DefaultDrawColumnCell(Rect, DataCol, Column, State);
  if Columns.State = csDefault then
    inherited DrawDataCell(Rect, Field, State)
  else
   inherited DrawColumnCell(Rect, DataCol, Column, State);
  if (Field <> nil) and FDrawEllipse
    then DrawEllipse(Rect, Field.DisplayText);
end;

procedure TBitDBGrid.GetCellParams(Field: TField; AFont: TFont;
  var Background: TColor; Highlight: Boolean);
begin
  if Assigned(FOnGetCellParams) then
    FOnGetCellParams(Self, Field, AFont, Background, Highlight)
end;

procedure TBitDBGrid.SetRealTitleFont(Value : TFont);
begin
  FRealTitleFont.Assign(Value);
  Repaint;
end;

procedure TBitDBGrid.WMHScroll(var Msg: TWMHScroll);
begin
  if Assigned(FOnHScroll)
    then FOnHScroll(Self, Msg.ScrollCode, Msg.Pos);
  inherited;
end;

function TBitDBGrid.CellRect(ACol, ARow: Longint): TRect;
begin
  Result := inherited CellRect(ACol, ARow);
end;

function TBitDBGrid.MouseCoord(X, Y: Integer): TGridCoord;
begin
  Result := inherited MouseCoord(X, Y);
end;

procedure TBitDBGrid.WMSize(var Msg: TWMSize);
begin
 if (FGridState <> gsColSizing) and FFillFields
   and (FUpdateLock = 0) then
    LayoutChanged
   else DrawLongCaption;
 inherited;
end;

procedure TBitDBGrid.FillColumnsArea(iCol : integer);
var
  Loop, j,
  B, B1      : Integer;
  C      : Integer;
  K          : Double;
  W1, W2, WB : Integer;
begin
    B := Integer(dgColLines in Options) * GridLineWidth;
    W2 := ClientWidth - (IndicatorWidth + B) * IndicatorOffset;
    W1 := 0; WB := 0;
    for Loop := 0 to Columns.Count - 1 do begin
      W1 := W1 + Columns[Loop].Width + B;
      if Loop = iCol - 1 then WB := W1;
    end;
    C := Columns.Count - iCol;
    if (WB + C + B > W2) and (iCol < Columns.Count) and (iCol > 0) then begin
        Columns[iCol-1].Width := Columns[iCol-1].Width + W2 - WB - C - B;
      WB := W2 - C - B;
    end;
    if W1 <> W2 then begin
      K:=(W2 - WB)/(W1 - WB); W1 := WB + B;
      FColIndex := (FColIndex + 1) mod Columns.Count;
      Columns.BeginUpdate;
      try
       for Loop := iCol to Pred(Columns.Count) do begin
         j := (FColIndex + Loop) mod C + iCol;
         B1 := Round(Columns[j].Width * K);
         if Loop = Columns.Count - 1 then
           Columns[j].Width := W2 - W1
          else Columns[j].Width := B1;
         W1 := W1 + B1 + B;
        end;
      finally
       Columns.EndUpdate;
      end;
      if FFooterType = foColumn then
        if Columns[iCol] is TBitColumn then
          DrawFooter(nil);
   end;
end;

procedure TBitDBGrid.SetColumnAttributes;
begin
  HideEditor;
  if FillFields and not (csDesigning in ComponentState) then
    with THackGrid(Self) do
     if (FGridState = gsColSizing) and ((FSizingIndex - IndicatorOffset) >= 0)
       and (FSizingIndex - IndicatorOffset < Columns.Count - 1) then
        FillColumnsArea(FSizingIndex - IndicatorOffset + 1)
      else FillColumnsArea(0);
  inherited SetColumnAttributes;
end;

///////////// Increment search ///////////////////////

procedure TIncEdit.WMKeyDown(var Message:TWMKeyDown);
begin
  if not DoKeyDown(Message) then inherited;
end;

procedure TIncEdit.WMSysKeyDown(var Message:TWMKeyDown);
begin
  if not DoKeyDown(Message) then inherited;
end;

procedure TIncEdit.WMChar(var Message:TWMChar);
begin
 if Visible then
  if Char(Message.CharCode) = #13 then begin
      FModalResult := mrOk;
      DoFocus(FGrid);
    end
   else
  if Char(Message.CharCode) = #27 then begin
      FModalResult := mrCancel;
      DoFocus(FGrid);
    end
   else if not (Char(Message.CharCode) in [#8]) and
    not FGrid.IsValidChar(Char(Message.CharCode)) then Beep
  else inherited
    else inherited
end;

procedure TIncEdit.CMDialogChar(var Message:TCMDialogChar);
begin
  inherited;
  if Message.Result <> 1 then begin
    Perform(WM_CHAR, Message.CharCode, 0);
    Message.Result:=1
  end;
end;

procedure TIncEdit.CMVisibleChanged(var Message:TMessage);
begin
  inherited;
  Visible := Visible and GetParentForm(Self).Visible;
end;

function TIncEdit.DoKeyDown(var Message:TWMKey):Boolean;
begin
  if not (Message.CharCode in [VK_RIGHT, VK_LEFT, VK_HOME, VK_END]) then
    begin
     FGrid.KeyDown(Message.CharCode, KeyDataToShiftState(Message.KeyData));
     if not (Message.CharCode in [0, VK_UP, VK_DOWN]) then
       Result := inherited DoKeyDown(Message)
      else Result := True;
   end else Result := False;
end;

procedure TIncEdit.Change;
begin
 try
  if FGrid.FindRecord(Text) then SelStart := SelStart - 1;
 except
  Beep;
 end;
 DoFocus(Self);
end;

procedure TIncEdit.DoExit;
begin
  if (FGrid.FStartBookMark <> nil) and
    FGrid.DataSource.DataSet.BookMarkValid(FGrid.FStartBookMark)
    then begin
      if FModalResult = mrCancel then
        FGrid.DataSource.DataSet.GotobookMark(FGrid.FStartBookMark);
      FGrid.DataSource.DataSet.FreeBookMark(FGrid.FStartBookMark);
     end;
  Hide;
  SelectAll;
  FGrid.Repaint;
  FGrid.SetFocus;
  if (FModalResult = mrOk) and
    Assigned(FGrid.FOnHideIncEditor) then FGrid.FOnHideIncEditor(Self);
  FModalResult := mrNone;
end;

function TBitDBGrid.IncSearch : Boolean;
begin
  Result:=False;
   if HasRecord and FAllowIncSearch and (SelectedField <> nil) then begin
      PlaseIncEdit;
//      FIncEdit.Perform(WM_CHAR, Integer(C), 0);
      Result := True;
    end else Beep;
end;

function TBitDBGrid.FindRecord(const Text:string):Boolean;
var
  F,F1 : TField;
  V    : Variant;
  i    : Integer;
  L    : TList;
  function GetSearchData(Field:TField;const T:string):string;
  begin
  //  if Field.DataType = ftString then
  Result:=T
//    else begin
//      Result:=Field.AsString;
//      if Field.Alignment = taRightJustify then
//        Result := Copy(Result, 1, Length(Result) - Length(T)) + T
//      else
  //    Result := T + Copy(Result, Length(T)+1, Length(Result))
//    end;
  end;

begin
  Result := False;
  F := SelectedField;
  if Text <> '' then
  if Assigned(FOnIncSearch) then FOnIncSearch(Self, F, Text, Result) else
   if F.FieldKind = fkLookup then begin
    i := 1;
    F1 := F.LookupDataSet.FieldByName(
       ExtractFieldName(F.LookupResultField, i));
    F.LookupDataSet.Locate(F1.FieldName, GetSearchData(F1,Text),
                           [loCaseInsensitive, loPartialKey]);
    L := TList.Create;
    try
     F.LookupDataSet.GetFieldList(L, F.LookupKeyFields);
     if L.Count > 1 then begin
       V := VarArrayCreate([0,L.Count], varVariant);
       for i := 0 to L.Count-1 do V[i] := TField(L[i]).Value;
      end else V := TField(L[0]).Value;
    finally L.Free; end;
    F.DataSet.Locate(F.KeyFields, V, [loCaseInsensitive, loPartialKey]);
  end else begin
    Result := False; //F.Alignment = taRightJustify;
    try
      F.DataSet.Locate(F.FieldName, GetSearchData(F,Text), [loCaseInsensitive, loPartialKey]);
    except
    end;
  end;
end;

function TBitDBGrid.IsValidChar(C:Char):Boolean;
begin
  Result := (SelectedField <> nil) and SelectedField.IsValidChar(C);
end;

procedure TBitDBGrid.PlaseIncEdit;
var
  R : TRect;
begin
  if not Assigned(FIncEdit) then begin
    FIncEdit := TIncEdit.Create(Owner);
    with TIncEdit(FIncEdit) do begin
      Width := 0;
      FGrid := Self;
      Autosize := False;
      Parent := Self.Parent;
      AutoSelect := False;
      Font := FGrid.RealTitleFont;
     end;
   end;
  R := CellRect(Col,0);
  R.BottomRight := Parent.ScreenToClient(ClientToScreen(R.BottomRight));
  R.TopLeft := Parent.ScreenToClient(ClientToScreen(R.TopLeft));
  if FMC then
     FIncEdit.SetBounds(R.Left, R.Bottom - FIncEdit.Height, R.Right - R.Left, FIncEdit.Height)
   else FIncEdit.SetBounds(R.Left, R.Top, R.Right - R.Left, R.Bottom - R.Top);
  FStartBookmark := DataSource.DataSet.GetBookmark;
  SelectedRows.Clear;
//  FIncEdit.FModalResult := mrOk;
  FIncEdit.Text := '';
  FIncEdit.Show;
  FIncEdit.SetFocus;
end;

function TBitDBGrid.GetIncSearchText:string;
begin
  if Assigned(FIncEdit) and FAllowIncSearch then
    Result := FIncEdit.Text
  else Result := '';
end;

procedure TBitDBGrid.SetIncSearchText(const Text:string);
begin
  if FAllowIncSearch then begin
    PlaseIncEdit;
    FIncEdit.Text := Text;
    FIncEdit.SelStart := Length(Text);
  end;
end;

procedure TBitDBGrid.WMChar(var Message:TWMChar);
begin
 if (Message.CharCode = VK_Return) and (FEnterKey = ekDouble)
   then Message.Result := 1
   else inherited;
end;

procedure TBitDBGrid.CMDialogChar(var Message:TCMDialogChar);
begin
 inherited;
end;

procedure TBitDBGrid.Paint;
begin
  if FUpdateLock > 0 then Exit;
  inherited Paint;
  if FFooterType <> foNone then DrawFooter(nil);
  if LongCaption then DrawLongCaption;
end;

procedure TBitDBGrid.DrawLongCaption;
var
  R : TRect;
  Loop : integer;
begin
 if FUpdateLock <= 0 then
  with Canvas do begin
  R := CellRect(ColCount-1,0);
  if (R.Right <> 0) and (R.Right < ClientWidth) and
     (dgTitles in Options) then begin
    Brush.Color := clBtnFace;
    R := Rect(R.Right, R.Top, ClientWidth, R.Bottom);
    if dgColLines in Options then Inc(R.Left);
    FillRect(R); Dec(R.Right);
    if [dgRowLines,dgColLines] * Options = [dgRowLines, dgColLines] then begin
      DrawEdge(Canvas.Handle, R, BDR_RAISEDINNER, BF_BOTTOMRIGHT);
      DrawEdge(Canvas.Handle, R, BDR_RAISEDINNER, BF_TOPLEFT);
    end;
    if dgColLines in Options then begin
      Pen.Color := clBlack;
      PolyLine([Point(R.Right, R.Bottom - 1), Point(R.Right, R.Top - 1)]);
    end;
    if dgRowLines in Options then begin
      Pen.Color := clBlack;
      if (dgTitles in Options) then
        PolyLine([Point(R.Left, R.Bottom), Point(R.Right + 1, R.Bottom)]);
      Pen.Color := clSilver;
      if ColorToRGB(Color) = clSilver then Pen.Color := clGray;
      for Loop := 0 + integer(dgTitles in Options) to
       VisibleRowCount - integer(not (dgTitles in Options)) do begin
        R := CellRect(ColCount - 1, Loop);
        R.Left := R.Right;
        R.Right := ClientWidth;
        PolyLine([Point(R.Left, R.Bottom), Point(R.Right + 1, R.Bottom)]);
       end;
     end;
    end;
  end;
end;

procedure TBitDBGrid.MouseToCell(X, Y: Integer; var ACol, ARow: Longint);
begin
 TDrawGrid(Self).MouseToCell(X, Y, ACol, ARow);
end;

procedure TBitDBGrid.WMSysKeyDown(var Msg : TWMKeyDown);
begin
 inherited;
end;

procedure TBitDBGrid.WMKey(var Msg : TWMKey);
var Sh : TShiftState;
begin
 Sh := KeyDataToShiftState(Msg.KeyData);
 if (ssCtrl in Sh) and (Char(Msg.CharCode) = 'S') then begin
    if IncSearch then Msg.Result := 1;
      Exit;
   end else
 if (ssCtrl in Sh) and (Char(Msg.CharCode) = 'O') and
    FShowPropEditor then begin
    RunOptionsEditor;
    Exit;
   end
  else BEGIN
    //// SERGIO
    if (Msg.CharCode >= 96) and (Msg.CharCode <= 105) then
       Msg.CharCode := Msg.CharCode - 48;
    //// SERGIO

    if ReadOnly and (Sh = [])
      and (Msg.CharCode >= 48) and (Msg.CharCode < 112) and AllowIncSearch
      and not (Msg.CharCode in [VK_UP, VK_DOWN])
      and IsValidChar(Char(Msg.CharCode)) and IncSearch
    then begin
      if dgEditing in Options then begin
        PostMessage(FIncEdit.Handle, WM_KeyDown, TMessage(Msg).wParam,
                    TMessage(Msg).LParam);
        Msg.Result := 1;
      end;
//   if IncSearchText = '' then
//     IncSearchText := Char(Msg.CharCode);
//    SendMessage(FIncEdit.Handle, WM_KeyDown, TMessage(Msg).wParam,
//      TMessage(Msg).LParam);
      Exit;
    end else
      if Msg.CharCode = VK_Return then
        if FEnterKey = ekTab
        then Msg.CharCode := VK_TAB
        else
          if (FEnterKey = ekDouble) and (Sh = [])
          then begin
            Msg.Result := 1;
            if Assigned(OnDblClick) then OnDblClick(Self);
            Exit;
          end;
  END;
 inherited;
end;

procedure TBitDBGrid.CopyToClipboard(OnlyColumns, OnlySelected : boolean;
 TrasnsferProcedure : TOnTransferRowEvent);
var ClipStr : AnsiString;
    L, TrCount : longint;
    OldB : TBookMarkStr;
    Flag : boolean;

function CopyRecord : string;
var Loop : integer;
begin
Result := '';
with DataSource.DataSet do
 for Loop := 0 to Pred(FieldCount) do
   Result := Concat(Result, Fields[Loop].asString, #9);
inc(TrCount);
if Assigned(TrasnsferProcedure) then
 TrasnsferProcedure(TrCount, Flag);
end;

function CopyRow : String;
var Loop2 : integer;
begin
Result := '';
with DataSource.DataSet do
 for Loop2 := 0 to Pred(Columns.Count) do
   if Columns[Loop2].Field <> nil then
     Result := Concat(Result, Columns[Loop2].Field.DisplayText, #9)
    else Result := Concat(Result, #9);
inc(TrCount);
if Assigned(TrasnsferProcedure) then
 TrasnsferProcedure(TrCount, Flag);
end;

begin
ClipStr := '';
TrCount := 0;
Flag := false;
if OnlyColumns then begin
  if (Owner is TCustomForm) then
    ClipStr := (Owner as TCustomForm).Caption + #13;
  for L := 0 to Pred(Columns.Count) do
    ClipStr := ClipStr + Columns[L].Title.Caption + #9;
 end;
with DataSource.DataSet do
 if HasRecord then try
  OldB := BookMark;
  if OnlySelected then
    for L := 0 to Pred(SelectedRows.Count) do begin
      Bookmark := SelectedRows[L];
      if OnlyColumns then
        ClipStr :=  Concat(ClipStr, #13, CopyRow)
       else ClipStr :=  Concat(ClipStr, #13, CopyRecord);
      if Flag then Break;
   end else begin
   First;
   DisableControls;
   while not EOF do begin
     if OnlyColumns then
        ClipStr :=  ClipStr + #13 + CopyRow
       else ClipStr :=  ClipStr + #13 + CopyRecord;
      Next;
      if Flag then Break;
     end
    end;
  Clipboard.SetTextBuf(PChar(ClipStr));
 finally
  BookMark := OldB;
  EnableControls;
 end;
end;

procedure TBitDBGrid.PasteFromClipboard;
function GetAsText: AnsiString;
var
  Data: THandle;
begin
  ClipBoard.Open;
  Data := GetClipboardData(CF_TEXT);
  try
    if Data <> 0 then
      Result := PChar(GlobalLock(Data)) else
      Result := '';
  finally
    if Data <> 0 then GlobalUnlock(Data);
    ClipBoard.Close;
  end;
end;

var ClipStr : AnsiString;
    Tabpos, Loop :   integer;
    FValue : string;
begin
 if (DataSource <> nil) and (DataSource.DataSet <> nil)
   and DataSource.DataSet.Active and ClipBoard.HasFormat(CF_TEXT)
 then
 with DataSource.DataSet do try
  ClipStr := GetAsText;
  if ClipStr = '' then Exit;
  DisableControls;
  while ClipStr[2] <> #0  do try
    Append;
    for Loop := 0 to Pred(FieldCount) do begin
      TabPos := AnsiPos(#9, ClipStr);
      if Fields[Loop].isNull then begin
        FValue := Copy(ClipStr, 0, TabPos - 1);
        if Assigned(FOnPasteEvent) then
          FOnPasteEvent(Self, Fields[Loop], FValue);
        Fields[Loop].asString := Copy(ClipStr, 0, TabPos - 1);
       end;
      Longint(ClipStr) := Longint(ClipStr) + TabPos;
     end;
    Post;
  except
   Cancel;
   raise;
  end;
 finally
  EnableControls;
 end;
end;

procedure TBitDBGrid.WMCaptureChanged(var Msg : TMessage);
begin
 inherited;
end;

function TBitDBGrid.CanEditShow: Boolean;
begin
 Result := inherited CanEditShow;
 if Assigned(FOnShowEditorEvent)
   then FOnShowEditorEvent(Self, SelectedField, Result);
end;

{--------------   RX Utils ------------}

{$IFDEF RX}

function TBitDBGrid.GetStorage: TFormPlacement;
begin
  if FIniLink <> nil then
   Result := FIniLink.Storage
   else result := nil;
end;

procedure TBitDBGrid.SetStorage(Value: TFormPlacement);
begin
  FIniLink.Storage := Value;
end;


procedure TBitDBGrid.IniSave(Sender: TObject);
begin
  if (Name <> '') and (FIniLink.IniObject <> nil) then
    if FIniLink.IniObject is TRegIniFile then
      SaveLayoutReg(TRegIniFile(FIniLink.IniObject))
end;

procedure TBitDBGrid.IniLoad(Sender: TObject);
begin
  if (Name <> '') and (FIniLink.IniObject <> nil) then
    if FIniLink.IniObject is TRegIniFile then
      RestoreLayoutReg(TRegIniFile(FIniLink.IniObject))
end;

{$ENDIF}

procedure TBitDBGrid.SaveLayoutReg(IniFile: TRegIniFile);
begin
  if (DataSource <> nil) and (DataSource.DataSet <> nil) then
    if StoreColumns then SaveColumnsLayout(IniFile)
{$IFDEF RX}
     else SaveFieldsReg(DataSource.DataSet, IniFile);
{$ENDIF}
end;

procedure TBitDBGrid.RestoreLayoutReg(IniFile: TRegIniFile);
var MC : boolean;
begin
  MC := MultiCaption;
  MultiCaption := false;
  if (DataSource <> nil) and (DataSource.DataSet <> nil) then begin
    HandleNeeded;
    if StoreColumns then RestoreColumnsLayout(IniFile)
{$IFDEF RX}
    else RestoreFieldsReg(DataSource.DataSet, IniFile, False);
{$ENDIF}
  end;
  MultiCaption := MC;
end;

procedure TBitDBGrid.SaveColumnsLayout(IniFile: TObject);
var
  Section, OldPath : string;
  msStream    : TMemoryStream;

procedure IniEraseSection(IniFile: TObject; const Section: string);
begin
  if IniFile is TRegIniFile then
    TRegIniFile(IniFile).EraseSection(Section)
  else if IniFile is TIniFile then
    TIniFile(IniFile).EraseSection(Section);
end;

procedure IniWriteInteger(IniFile: TObject; const Section, Ident: string;
  Value: Longint);
begin
  if IniFile is TRegIniFile then
    TRegIniFile(IniFile).WriteInteger(Section, Ident, Value)
  else
  if IniFile is TIniFile then
    TIniFile(IniFile).WriteInteger(Section, Ident, Value);
end;

procedure IniWriteString(IniFile: TObject; const Section, Ident,
  Value: string);
var
  S: string;
begin
  if IniFile is TRegIniFile then
    TRegIniFile(IniFile).WriteString(Section, Ident, Value)
  else begin
    S := Value;
    if S <> '' then begin
      if ((S[1] = '"') and (S[Length(S)] = '"')) or
        ((S[1] = '''') and (S[Length(S)] = '''')) then
        S := '"' + S + '"';
    end;
    if IniFile is TIniFile then
      TIniFile(IniFile).WriteString(Section, Ident, S);
  end;
end;

begin
  if IniSection <> '' then
    Section := IniSection
  else
    Section := GetRegSection(Self);
  if IniFile is TRegistry then
    OldPath := TRegistry(IniFile).CurrentPath;
  IniEraseSection(IniFile, Section);
  IniWriteString(IniFile, Section, 'SORTCOL', SortFieldName);
  IniWriteInteger(IniFile, Section, 'FILL', Integer(FillFields));
  IniWriteInteger(IniFile, Section, 'VERSION', FColumnVersion);
  IniWriteInteger(IniFile, Section, 'SEARCH', Integer(FAllowIncSearch));
  IniWriteInteger(IniFile, Section, 'AL_SORT', Integer(TitleBtn));
 {$IFDEF D_CS}
 {$IFDEF GENESIS}
  if (DataLink.DataSet is TGenClientDataSet)
    then IniWriteInteger(IniFile, Section, 'SORT_DIRECTION',
     Ord((DataLink.DataSet as TGenClientDataSet).SortDirection));
 {$ENDIF}
 {$ENDIF}

  if IniFile is TRegistry then begin
    msStream := TMemoryStream.Create;
    with TRegistry(IniFile) do try
      OpenKey(Section, true);
      Columns.SaveToStream(msStream);
      msStream.Position := 0;
      if msStream.Size > 0 then
         WriteBinaryData('Columns', msStream.Memory^, msStream.Size);
      CloseKey;
      OpenKey(OldPath, false); {added}
    finally
     msStream.Free;
    end;
  end;  
end;

procedure TBitDBGrid.RestoreColumnsLayout(IniFile: TObject);
var
  Section, OldPath : string;
  msStream : TMemoryStream;
  Info: TRegDataInfo;
  Ver : integer;

function IniReadString(IniFile: TObject; const Section, Ident,
  DefaultStr : string): string;
begin
  if IniFile is TRegIniFile then
    Result := TRegIniFile(IniFile).ReadString(Section, Ident, DefaultStr)
  else
  if IniFile is TIniFile then
    Result := TIniFile(IniFile).ReadString(Section, Ident, DefaultStr)
  else Result := DefaultStr;
end;

function IniReadInteger(IniFile: TObject; const Section, Ident: string;
  DefaultStr : Longint): Longint;
begin
  if IniFile is TRegIniFile then
    Result := TRegIniFile(IniFile).ReadInteger(Section, Ident, DefaultStr)
  else
  if IniFile is TIniFile then
    Result := TIniFile(IniFile).ReadInteger(Section, Ident, DefaultStr)
  else Result := DefaultStr;
end;

begin
  if IniSection<>'' then
    Section := IniSection
  else
    Section := GetRegSection(Self);
  if IniFile is TRegistry then
    OldPath := TRegistry(IniFile).CurrentPath;
  Ver := IniReadInteger(IniFile, Section, 'VERSION', 0);
  if Ver < FColumnVersion then Exit;
  Ver := IniReadInteger(IniFile, Section, 'AL_SORT   ', -1);
  if Ver <> -1 then TitleBtn := TTitleBtnStyle(Ver);
  if not (DataLink.DataSet is TQuery)
    and (TitleBtn = tbSorted) then
    SortFieldName := IniReadString(IniFile, Section, 'SORTCOL', SortFieldName);
  FillFields := Boolean(IniReadInteger(IniFile, Section, 'FILL', 1));
  FAllowIncSearch := Boolean(IniReadInteger(IniFile, Section, 'SEARCH', 1));
//  Ver := IniReadInteger(IniFile, Section, 'SORT_DIRECTION', 0);
 {$IFDEF D_CS}
 {$IFDEF GENESIS}
  if (DataLink.DataSet is TGenClientDataSet)
    then (DataLink.DataSet as TGenClientDataSet).SortDirection := TSortingDirection(Ver);
 {$ENDIF}
 {$ENDIF}
  if IniFile is TRegistry then begin
    msStream := TMemoryStream.Create;
    with TRegistry(IniFile) do try
     OpenKey(Section, false);
     if GetDataInfo('Columns', Info) then msStream.SetSize(Info.DataSize);
     ReadBinaryData('Columns', msStream.Memory^, msStream.Size);
     if msStream.Size > 0 then try
       BeginLayout;
       if DefaultColumns then Columns.LoadFromStream(msStream)
        else TBitDBGridColumns(Columns).LoadFromStreamEx(msStream);
      finally
     EndLayout;
     end;
    CloseKey;
    OpenKey(OldPath, false); {added}
   finally
   msStream.Free;
   end;
  end; 
end;


procedure TBitDBGrid.Notification(AComponent: TComponent; Operation: TOperation);
begin
{$IFDEF RX}
 if (Operation = opRemove) and (AComponent = IniStorage) then IniStorage := nil;
{$ENDIF}
  if (Operation = opRemove) and (AComponent = FImageList)
    then begin
      FImageList := Nil;
      Invalidate;
     end;
 inherited Notification(AComponent, Operation);
end;

procedure TBitDBGrid.UpdateTitlesHeight;
var Loop : integer;
    MaxTextHeight : integer;
    RRect : TRect;
begin
 MaxTextHeight := 0;
 try
 for loop := 0 to Columns.Count - 1 do begin
   RRect := CellRect(0, 0);
   RRect.Right := Columns[Loop].Width;
   RRect.Left := 0;
   if StoreColumns and (cvTitleFont in Columns[Loop].AssignedValues)
     then Canvas.Font := Columns[Loop].Title.Font
     else Canvas.Font := RealTitleFont;
   MaxTextHeight := Max(MaxTextHeight, DrawText(Canvas.Handle,
                         PChar(Columns[Loop].Title.Caption),
                         Length(Columns[Loop].Title.Caption), RRect,
                         DT_CALCRECT + DT_WORDBREAK));
  end;
 if FMC then FMC := - TitleFont.Height >=  MaxTextHeight
   else FMC := - TitleFont.Height <  MaxTextHeight;
 if TitleFont.Height <> - MaxTextHeight then
   TitleFont.Height := - MaxTextHeight;
 except
 end;
end;

procedure TBitDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var ARect : TRect;
    OldActive : integer;
    Exflg : boolean;
    Cell : TGridCoord;
begin
 Cell := MouseCoord(X, Y);

 if Sizing(X, Y) then begin
     if (ssDouble in Shift) then
        SetMimimumWidth(MouseCoord(X - 4, Y), True)
      else inherited MouseDown(Button, Shift, X, Y);
     Exit;
    end;

 if (ssDouble in Shift) then begin
    if Cell.Y >= TitleOffset then
      inherited MouseDown(Button, Shift, X, Y);
    Exit;
   end;
 ARect := CellRect(Cell.X, Cell.Y);

 FDoSort := (Button = mbLeft);
 if (Cell.Y < TitleOffset) and (Cell.X < IndicatorOffset) and
    (Cell.Y >= 0) and (Cell.X >= 0) and FDoSort and
    FShowPropEditor then begin
     FIndDown := true;
     PainCornerBtn(ARect);
    end;

 if (TitleBtn <> tbNone) and (Datalink <> nil) and Datalink.Active and
    (Cell.Y < TitleOffset) and (Cell.X >= IndicatorOffset) and
       not (csDesigning in ComponentState)
   then begin
    if (dgColumnResize in Options) then
      if (Button = mbRight)  then Button := mbLeft
                            else Button := mbRight;
    if FDoSort then begin
      FTitleDown := Cell.X;
      FColumnDown := GetPureColumn(X, Y);
      if (TitleBtn in DrawDown) and (TitleBtn <> tbTraceSelect)
        then TitlesState[GetPureColumn(X, Y)]  := not TitlesState[GetPureColumn(X, Y)];
      if Assigned(OnTitleMouseDown) then FOnTitleMouseDown(Self, Button, Shift, X,Y);
      inherited MouseDown(Button, Shift, X, Y);
      Exit;
     end;
   end;

  if Assigned(OnMouseDown)
    then OnMouseDown(Self, Button, Shift, X,Y);

  if DataLink.Active and InternalDrag and (Button = mbLeft)
   and (Cell.Y >= TitleOffset) and (Cell.X >= IndicatorOffset)
     then begin
         if (dgMultiSelect in Options) and (SelectedRows.Count > 1)
           then DragCursor := crMultiDrag
           else DragCursor := crDrag;
         BeginDrag(false);
         if (dgMultiSelect in Options) and not (ssCtrl in Shift)
           then begin
             OldActive := DataLink.ActiveRecord;
             DataLink.ActiveRecord := MouseCoord(X, Y).Y - integer(dgTitles in Options);
             ExFlg := SelectedRows.CurrentRowSelected;
             DataLink.ActiveRecord := OldActive;
             if ExFlg then exit;
           end;
         end;

 // Patch clear multiselect on popup menu
 if (Button = mbRight) and (PopupMenu <> nil)
   and not (ssCtrl in Shift) and (dgMultiselect in Options)
    and (SelectedRows.Count > 1)
     then begin
       PopupMenu.Popup(ClientToScreen(Point(X,Y)).X, ClientToScreen(Point(X, Y)).Y);
//      THackDBGrid(Self).FOptions := Options - [dgMultiselect];
//       inherited MouseDown(Button, Shift, X, Y);
//      THackDBGrid(Self).FOptions := Options + [dgMultiselect];
      Exit;
    end;

 inherited MouseDown(Button, Shift, X, Y);
end;

function TBitDBGrid.DoGetIconIndex(Column : TColumn):Integer;
begin
  Result := -1;
  if HasRecord then
   if Assigned(FOnGetIconIndex) then FOnGetIconIndex(Self, Column, Result);
end;

function TBitDBGrid.HasRecord : boolean;
begin
 result := (DataLink <> nil) and (DataLink.Active)
  and (DataLink.RecordCount > 0)
end;

function TBitDBGrid.SetMimimumWidth(Cell : TGridCoord; ReHeight : boolean) : boolean;
var Book : Longint;
    Col : TColumn;
    Loop, MaxW : integer;
begin
 Result := False;
 if not DataLink.Active then Exit;
 Book := DataLink.ActiveRecord;
 MaxW := Cell.X - IndicatorOffset;
 if (MaxW >= Columns.Count) or (MaxW < 0) then Exit;
 Col := Columns[MaxW];
 MaxW := 0;
 if (Col <> nil) and (Col.Field <> nil) then begin
   DataLink.DataSet.DisableControls;
   try
    for Loop := 0 to Pred(DataLink.BufferCount) do begin
      DataLink.ActiveRecord := Loop;
      MaxW := MaxInteger([MaxW, Canvas.TextWidth(Col.Field.DisplayText) + 2]);
     end;
   finally
    DataLink.ActiveRecord := Book;
    if StoreColumns and (cvTitleFont in Col.AssignedValues)
       then Canvas.Font := Col.Title.Font
      else Canvas.Font := RealTitleFont;
    if MultiCaption then
      for Loop := 1 to WordCount(Col.Title.Caption, [' ']) do
         MaxW := MaxInteger([MaxW, Canvas.TextWidth(ExtractWord(Loop, Col.Title.Caption, [' ']))])
       else MaxW := MaxInteger([MaxW, Canvas.TextWidth(Col.Title.Caption)]);
    if (ClientWidth > (Cell.X - Col.Width + MaxW)){ and FillFields} then begin
       with THackGrid(Self) do FGridState := gsColSizing;
       Col.Width := MaxW + 6;
       with THackGrid(Self) do FGridState := gsNormal;
       Result := True;
       if MultiCaption and ReHeight then UpdateTitlesHeight;
      end;
    DataLink.DataSet.EnableControls;
   end;
  end;
end;

procedure TBitDBGrid.SetFooterType(Value : TFooterType);
begin
 if Value <> FFooterType then begin
    FFooterType := Value;
    RecreateWnd;
  end;
end;

function TBitDBGrid.GetClientRect: TRect;
begin
 result := inherited GetClientRect;
 if FFooterType <> foNone then
   Result.Bottom := Result.Bottom - FFooterHeight;
end;

procedure TBitDBGrid.DrawFooter(Col : TBitColumn);
var ARect, R, RD : TRect;
    Loop, l2, AlFlag : integer;
begin
  ARect := GetClientRect;
  ARect.Top := ARect.Bottom;
  ARect.Bottom := ARect.Bottom + FFooterHeight;
  RD := ARect;
  if ReadOnly and DrawReadOnly then Canvas.Brush.Color := Color
   else Canvas.Brush.Color := FFooterColor;
  Canvas.Font := FFooterFont;
  if Col = nil then Canvas.FillRect(ARect);
  if FooterType = foStatic then begin
    ExtTextOut(Canvas.Handle, ARect.Left + 2, ARect.Top + 1, ETO_CLIPPED or
    ETO_OPAQUE, @ARect, PChar(FFooterString), Length(FFooterString), nil)
   end
  else
  for Loop := LeftCol - IndicatorOffset to LeftCol - IndicatorOffset + Pred(VisibleColCount) do
   if (Columns[Loop] is TBitColumn)
    and ((Col = nil) or (Col = Columns[Loop])) then
    with (Columns[Loop] as TBitColumn) do
      begin
       if Alignment = taRightJustify
         then Alflag := DT_RIGHT
         else if Alignment = taLeftJustify
                then Alflag := DT_LEFT
                else Alflag := DT_CENTER;
       R := CellRect(Loop + IndicatorOffset, Pred(RowCount));
       ARect.Left := R.Left;
       ARect.Right := R.Right;
       if Col <> nil then Canvas.FillRect(ARect);
       if FooterValue <> nil then begin
         if FFooterFont <> nil then Canvas.Font := FFooterFont;
         ARect.Bottom := RD.Top;
         ARect.Top := RD.Top - DefaultRowHeight;
         for L2 := 0 to Pred(FooterValue.Count) do begin
          ARect.Top := ARect.Top + DefaultRowHeight;
          ARect.Bottom := ARect.Bottom + DefaultRowHeight;
          if FooterValue[L2] <> '' then
            DrawText(Canvas.Handle, PChar(FooterValue[L2]),
            Length(FooterValue[L2]), ARect, DT_SINGLELINE + DT_TOP + AlFlag);
         end;
        end;
     end;
end;

procedure TBitDBGrid.SetFooterString(Value : TCaption);
begin
 if Value <> FFooterString then begin
   FFooterString := Value;
   if FFooterType <> foNone then DrawFooter(nil);
  end;
end;

procedure TBitDBGrid.TopLeftChanged;
begin
 inherited;
 DrawFooter(nil);
end;

procedure TBitDBGrid.SetFooterFont(Value : TFont);
begin
 FFooterFont.Assign(Value);
 DrawFooter(Nil);
end;

procedure TBitDBGrid.SetFooterColor(Value : TColor);
begin
 if FFooterColor <> Value then begin
   FFooterColor := Value;
   DrawFooter(Nil);
  end;
end;

procedure TBitDBGrid.ReCreateFooter(Col : TBitColumn);
var Loop : integer;
    NewFH : integer;
    OldH : integer;
begin
 OldH := FFooterHeight;
 NewFH := DefaultRowHeight;
 for Loop := 0 to Pred(Columns.Count) do
  if Columns[Loop] is TBitColumn then
    NewFH := Max(NewFH,
     (Columns[Loop] as TBitColumn).FFooterList.Count * DefaultRowHeight);
 if OldH <> NewFH then begin
   FFooterHeight := NewFH;
   RecreateWnd;
  end else DrawFooter(Col);
end;

function TBitDBGrid.ColumnByField(FieldName : string) : TColumn;
var Loop : integer;
begin
 Result := nil;
 for Loop := 0 to Pred(Columns.Count) do
  if {(Columns[Loop].Field <> nil)
     and }(UpperCase(Columns[Loop].{Field.}FieldName) = UpperCase(FieldName))
    then begin
      Result := Columns[Loop];
      Break;
     end;
end;

procedure TBitDBGrid.DrawEllipse(Rect : TRect; Text : string);
var WL : integer;
const Ellipse : string = '...';
begin
  WL := Canvas.TextWidth(Text);
  if (WL > (Rect.Right - Rect.Left))
   and (Canvas.TextWidth(Ellipse) < (Rect.Right - Rect.Left + 2))
   then begin
    wl := Canvas.TextWidth(Ellipse);
    Rect.Left := Rect.Right - Wl - 2;
    Canvas.Brush.Style := bsSolid;
    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left + 1, Rect.Top + 2, Ellipse);
   end;
end;

procedure TBitDBGrid.SetColumnFooter(Column : TColumn; Value : Variant);
begin
 if (Column <> nil) and (Column is TBitColumn)
   then
    with Column as TBitColumn do begin
     if FooterValue.Count <= 0
       then FooterValue.Add(Value)
       else FooterValue[0] := Value;
    end;
end;

procedure TBitDBGrid.BeginLayout;
begin
 inherited BeginLayout;
end;

procedure TBitDBGrid.EndLayout;
begin
 inherited EndLayout;
end;

procedure TBitDBGrid.SetTitleBtn(Value : TTitleBtnStyle);
begin
 FTitleBtn := Value;
 VarClear(FTitlesState);
 ReCreateVar;
 Repaint;
end;


procedure TBitDBGrid.CMHintShow(var Msg : TMessage);
var ACol, ARow : integer;
    OldActive: Integer;
begin
 if FShowCellHint then
   with PHintInfo(Msg.LParam)^  do try
    Msg.Result := 1;
    if not DataLink.Active then Exit;
    MouseToCell(CursorPos.X, CursorPos.Y, ACol, ARow);
    CursorRect := CellRect(ACol, ARow);
    ACol := ACol - IndicatorOffset;
    if (ACol < 0) then Exit;
    ARow := ARow - TitleOffset;
    HintPos := ClientToScreen(CursorRect.TopLeft);
    InflateRect(CursorRect, 1, 1);
    if (ARow = -1) then begin
       if (Columns[ACol] is TBitColumn) and
         ((Columns[ACol] as TBitColumn).Hint <> '') then
           HintStr := (Columns[ACol] as TBitColumn).Hint
         else begin
          HintStr := Columns[ACol].Title.Caption;
          if Canvas.TextWidth(HintStr) < Columns[ACol].Width
            then Exit;
         end;
       Msg.Result := 0;
       Exit;
      end;
      if ARow < 0 then exit;
      OldActive := DataLink.ActiveRecord;
      DataLink.ActiveRecord := ARow;
      if Columns[ACol].Field <> nil then
       HintStr := Columns[ACol].Field.DisplayText;
       DataLink.ActiveRecord := OldActive;
       if (((CursorRect.Right - CursorRect.Left) >=  Columns[ACol].Width)
         and (Canvas.TextWidth(HintStr) < Columns[ACol].Width))
            or
        ((Canvas.TextWidth(HintStr) < (CursorRect.Right - CursorRect.Left))
         and (Columns[ACol].Alignment = taLeftJustify)) then exit;
      Msg.Result := 0;
  except
   Msg.Result := 1;
  end;
end;

procedure TBitDBGrid.SetAllColumnsWidth;
var Loop : integer;
    Coord : TGridCoord;
begin
if DataLink.Active then
 with DataLink.DataSet do try
   DisableControls;
   for Loop := 0 to Pred(Columns.Count) do begin
    Coord.X := Loop + IndicatorOffset;
    Coord.Y := 0;
    if not SetMimimumWidth(Coord, True) then Break;
   end;
  if MultiCaption then UpdateTitlesHeight;
  finally
   EnableControls;
  end;
end;

procedure TBitDBGrid.EstablecerApariencia;
var i:integer;
begin
  for i:=0 to Columns.Count-1 do
  begin
    // Texto de la columna
    Columns.Items[i].Font.Size:=9;
    Columns.Items[i].Font.Color:=clBlack;
    Columns.Items[i].Font.Name:='Arial';

    // Texto del título
    Columns.Items[i].Title.Alignment:=taCenter;
    Columns.Items[i].Title.Font.Size:=10;
    Columns.Items[i].Title.Font.Color:=clMaroon;
    Columns.Items[i].Title.Font.Name:='MS Sans Serif';
  end;
end;

procedure Register;
begin
  RegisterComponents('Adicionales', [TBitDBGrid]);
//   RegisterComponentEditor(TBitDBGrid, TBitDBGridEditor);
end;

initialization
 DrawBitmap := TBitmap.Create;

finalization
 DrawBitmap.Free;

end.


