unit _Busy;  // by jHackAll [Javier.Ferrari.T@gmail.com]

interface

uses Windows;

 function BusyStatus(lpWindowName: PChar; lpRect: PRect = nil): LongBool;
 function Continue: LongBool;
 function Terminar: Boolean;

implementation

uses Messages, Types;

type
 LongRec = packed record
  case Integer of
   0: (Lo, Hi: Word);
   1: (Words: array [0..1] of Word);
   2: (Bytes: array [0..3] of Byte);
 end;

var
 Rect: TRect;
 hWnd, HWNDPadre, Actually, proceso: Cardinal;
 Color: array [0..$F] of Cardinal;
 IncDec: Integer = 1;
 Terminate: LongBool;

procedure FillRect(hCanvas: Cardinal; Rect: TRect; Color: Cardinal);
var hBrush: Cardinal;
begin
 hBrush := CreateSolidBrush(Color);
 Windows.FillRect(hCanvas, Rect, hBrush);
 DeleteObject(hBrush);
end;

function WndProc(hWnd, Msg, wParam, lParam: Cardinal): Cardinal; stdcall;
var ps: TPaintStruct; Index: Cardinal;
begin
 Result := 0;
 case Msg of
  WM_PAINT: begin
             BeginPaint(hWnd, ps);
             FillRect(ps.hdc, Rect, 0);
             Index := High(Color) + 1;
             repeat Dec(Index);
              FillRect(ps.hdc, Types.Rect((Index * $F) + 5, 5, (Index * $0F) + $0F, $0A), Color[Index]);
             until Index = 0;
             EndPaint(hWnd, ps);
            end;
  WM_TIMER: begin
             Index := High(Color) + 1;
             repeat Dec(Index);
              with LongRec(Color[Index]) do
               begin
                if Index = Actually then
                 begin
                  if Bytes[1] < $F5 then
                   Inc(Bytes[1], $0F);
                 end
                else
                 if Bytes[1] <> 0 then
                  Dec(Bytes[1], 5);
               end;
             until Index = 0;
             SetForegroundWindow(hWnd);
             InvalidateRect(hWnd, nil, True);
             if LongRec(Color[Actually]).Bytes[1] >= $F5 then
              begin
               Actually := Actually + IncDec;
               if (Actually = 0) or (Actually = High(Color)) then
                IncDec := IncDec * -1;
               if Terminate or (WaitForInputIdle(GetCurrentProcess, 0) = 0) then
                begin
                 PostQuitMessage(0);
                 Terminate := False;
                end;
              end;
            end;
  WM_QUERYENDSESSION : Result := 0;
 else
  Result := DefWindowProc(hWnd, Msg, wParam, lParam);
 end
end;

var
 WndClass: TWndClass = (
  style: CS_NOCLOSE;
  lpfnWndProc: @WndProc;
  cbWndExtra: 4;
  lpszClassName: 'Busy');

function Thread(lpWindowName: PChar): Cardinal; stdcall;
var Msg: TMsg;
begin
 hWnd := CreateWindowEx(WS_EX_TOOLWINDOW, WndClass.lpszClassName, lpWindowName, WS_VISIBLE,
                        Rect.Left, Rect.Top, Rect.Right, Rect.Bottom, 0, 0, hInstance, nil);
 SetTimer(hWnd, 0, 10, nil);
 SetRect(Rect, 0, 0, $F5, $0F);
 repeat
  if not PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
   WaitMessage
  else
   if Msg.Message <> WM_QUIT then
    begin
     TranslateMessage(Msg);
     DispatchMessage(Msg);
    end;
 until Msg.Message = WM_QUIT;
 Terminate := False;
 MessageBeep(0);
 hWnd := 0;
end;

function BusyStatus(lpWindowName: PChar; lpRect: PRect): LongBool;
var Dummy: Cardinal;
begin
 Actually := 0;
 Result := hWnd = 0;
 if not Result then Exit;
 SetRect(Rect, 0, 0, $F5, $0F);
 AdjustWindowRectEx(Rect, WS_CAPTION, False, WS_EX_TOOLWINDOW);
 Rect.Right := Rect.Right - Rect.Left;
 Rect.Bottom := Rect.Bottom - Rect.Top;
 if not Assigned(lpRect) then
  begin
   Rect.Left := (GetSystemMetrics(SM_CXSCREEN) - Rect.Right) div 2;
   Rect.Top := (GetSystemMetrics(SM_CYSCREEN) - Rect.Bottom) div 2;
  end
 else
  begin
   Rect.Left := lpRect.Left + (((lpRect.Right - lpRect.Left) - Rect.Right) div 2);
   Rect.Top := lpRect.Top + (((lpRect.Bottom - lpRect.Top) - Rect.Bottom) div 2);
  end;
 CreateThread(nil, 0, @Thread, lpWindowName, 0, proceso);
end;

function Continue: LongBool;
begin
 Result := hWnd <> 0;
 if Result then
  Terminate := True;
end;

function Terminar: Boolean;
begin
    //DispatchMessage(WM_QUERYENDSESSION);
end;

begin
 WndClass.hInstance := System.MainInstance;
 RegisterClass(WndClass);
end.
