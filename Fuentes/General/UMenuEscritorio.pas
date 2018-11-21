unit UMenuEscritorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  dximctrl, ImgList;

type
  TFMenuEscritorio = class(TFUniversal)
    ILBAccesos: TdxImageListBox;
    PEliminarAcceso: TPanel;
    LEliminar: TLabel;
    ImageList1: TImageList;
    procedure ILBAccesosDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure ILBAccesosDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure ILBAccesosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ILBAccesosKeyPress(Sender: TObject; var Key: Char);
    procedure LEliminarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Item : Integer;
  public
    { Public declarations }
  end;

var
  FMenuEscritorio: TFMenuEscritorio;

implementation

uses UPrincipal, IniFiles, UTraduccion;

{$R *.dfm}

procedure TFMenuEscritorio.ILBAccesosDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
//  Accept := (Source = ListBox1);
//   showmessage(Source.ClassName);

 //   showmessage(source.ClassType.ClassName);
    //TDXdragObject
    Accept := (Source = TDragObject(Source));
{    if (Source.ClassNameIs('TDragObject')) then
      begin
        showmessage('todo liso');
        Accept:= true;
      end;}
         // ori:= TdxNavBarItem(TDragObject(Source));
          //TdxNavBarItemLink

//          showmessage(TdxNavBarItem(TDragObject(Source)).Caption);
{    If (Accept) then
      begin
        // showmessage(TDragObject(Source).ClassParent.ClassName);
         //ori:= TAction.Create(self);
         //ori.ActionList.Actions[0].:=TdxNavBarItem(Source).Action;
         //ori.ActionList.:= TAction(TdxNavBarItem(Source).Action);
         //showmessage(TdxNavBarItem(Source).Action.);
          // showmessage(TdxNavBarItemLink(TDragObject(Source)).Item.Caption);
           //showmessage(ori.Caption);
      end
     else
       ori:= nil;}
   // Accept := (Source = TdxDragObject(Source));
//    Accept := (Source is TdxNavBarItem);
 //   showmessage(BoolToStr(Accept));
end;

procedure TFMenuEscritorio.ILBAccesosDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var Ini : TiniFile;
    accion: TComponent;
begin
  inherited;       //TdxNavBarItem(Source).Action.
           // Showmessage(Inttostr(TdxNavBarItem(Source).Index));

  //Showmessage(TAction(TdxNavBarItem(Source).Action).Caption);
//  showmessage(dxIDeteccionCelo.Caption);
//Source.
//showmessage(Source.ClassType.ClassName);
//TdxDragObject(Source).
//showmessage(IntToStr(ori.Index))
       // TListBox(Sender).Items.Add(ori.Caption);
//showmessage((Source as TdxNavBarItem).Caption);
//showmessage(TdxNavBarItem(Source).Action.GetNamePath);
//showmessage(TdxNavBarItem(Source).Action.Name);
//  Showmessage(TdxNavBarItem(Source).Caption);

//Items.Move(ItemIndex,ItemAtPos(Point(x,y),True));
  Ini := TIniFile.Create (ExtractFilePath(Application.ExeName) + 'menuescritorio.ini');

  if (ini.ReadString(FPrincipal.OrigenDrag.Caption,'nameaction','') = '') then
    begin
      TdxImageListBox(Sender).AddItem(FPrincipal.OrigenDrag.Caption,0);
      Ini.WriteString(FPrincipal.OrigenDrag.Caption,'nameaction',FPrincipal.OrigenDrag.Action.GetNamePath);
      Ini.WriteString(FPrincipal.OrigenDrag.Caption,'namecaption',FPrincipal.OrigenDrag.Caption);  
    end;
  Ini.Free;

//  ori.Action.Execute;
  //showmessage(ori.Action.GetNamePath);
  //ori.Action.GetNamePath



  //ALUniversal.Actions.ActionList.
  //TBasicAction(ALUniversal.FindComponent(ori.Action.GetNamePath)).Execute;
 // ori.Free;



 // TListBox(Sender).Items.Add(TListBox(Source).Items.Strings[TListBox(Source).ItemIndex]);

end;

procedure TFMenuEscritorio.ILBAccesosClick(Sender: TObject);
var Ini : TiniFile;
    nombreAccion: String;
    accion: TComponent;
begin
  inherited;
  //esto es para saber que estoy clickeando
//  showmessage(IntToStr(dxImageListBox1.ItemIndex));
//  showmessage(TListBox(Sender).Items.Strings[TListBox(Sender).ItemIndex]);
  try
    Ini := TIniFile.Create (ExtractFilePath(Application.ExeName) + 'menuescritorio.ini');
    nombreAccion := ini.ReadString(TListBox(Sender).Items.Strings[TListBox(Sender).ItemIndex],'nameaction','');
    Item := TListBox(Sender).ItemIndex;
    accion := FPrincipal.FindComponent(nombreAccion);
    TBasicAction(accion).Execute;
  except
  end;

end;

procedure TFMenuEscritorio.FormShow(Sender: TObject);
begin
  inherited;
  FMenuEscritorio.Caption:= Traducir('Accesos directos');
  FMenuEscritorio.Top:= FPrincipal.Top + 50;
  FMenuEscritorio.Left:= FPrincipal.Width - FMenuEscritorio.Width;  
end;

procedure TFMenuEscritorio.ILBAccesosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key:= #0;
end;

procedure TFMenuEscritorio.LEliminarClick(Sender: TObject);
var
  Ini : TiniFile;
begin
  if Item <> -1 then
  begin
    try
      Ini := TiniFile.Create(ExtractFilePath(Application.ExeName)+'menuescritorio.ini');
      Ini.EraseSection(ILBAccesos.Items[Item]);
      ILBAccesos.DeleteSelected;
    except
    end;
  end;
end;

procedure TFMenuEscritorio.FormCreate(Sender: TObject);
begin
  inherited;
  Item := -1;
end;

end.
